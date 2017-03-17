--====================================
--  Create database trigger template 
--====================================
--USE CoreDocDB
--GO

--IF EXISTS(
--  SELECT *
--    FROM sys.triggers
--   WHERE name = 'UpdateDocumentLog'
--     --AND parent_class_desc = N'DATABASE'
--)
--	DROP TRIGGER UpdateDocumentLog ON DATABASE
--GO

ALTER TRIGGER UpdateDocumentLog 
ON T_Document
AFTER INSERT, UPDATE  
AS  
	DECLARE @AuditLogId UNIQUEIDENTIFIER,@DocumentId UNIQUEIDENTIFIER, @UserId UNIQUEIDENTIFIER,@DocumentTypeId UNIQUEIDENTIFIER,
			@DocumentTypeName VARCHAR(50),@AuditDetails VARCHAR(MAX),@DocumentStatus CHAR(1);
	
	SELECT @AuditLogId=(SELECT NEWID());
	SELECT @DocumentId=I.DocumentId FROM INSERTED I;
	SELECT @DocumentTypeId=I.DocumentTypeId FROM INSERTED I;
	SELECT @UserId=I.CreatedById FROM INSERTED I;

	IF UPDATE(DocumentTypeId)
	BEGIN
		SELECT @DocumentTypeName=(SELECT DocumentTypeName FROM M_DocumentType WHERE DocumentTypeId=@DocumentTypeId)
		SELECT @AuditDetails='Document Type: ' + @DocumentTypeName;
	END
	IF UPDATE(PropertyName)
	BEGIN
		SELECT @AuditDetails=@AuditDetails + '|Property: ' + I.PropertyName FROM INSERTED I;
	END
	IF UPDATE(PropertyDescription)
	BEGIN
		SELECT @AuditDetails=@AuditDetails + '|Property Description: ' + I.PropertyDescription FROM INSERTED I;
	END
	IF LEN(@AuditDetails)=0
	BEGIN
		SELECT @AuditDetails='New Record Added';
	END
	SELECT @DocumentStatus=I.DocumentStatus FROM INSERTED I;

	INSERT INTO T_Document_AuditLog(AuditLogId,DocumentId,UserId,AuditDate,AuditDetails,DocumentStatus)
	VALUES(@AuditLogId,@DocumentId,@UserId,GETDATE(),@AuditDetails,@DocumentStatus);
GO  

