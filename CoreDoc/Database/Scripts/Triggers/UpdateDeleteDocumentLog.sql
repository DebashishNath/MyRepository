ALTER TRIGGER UpdateDeleteDocumentLog 
ON T_Document
AFTER DELETE
AS  
	DECLARE @AuditLogId UNIQUEIDENTIFIER,@DocumentId UNIQUEIDENTIFIER, @UserId UNIQUEIDENTIFIER,@AuditDetails VARCHAR(MAX);
	
	SELECT @AuditLogId=(SELECT NEWID());
	SELECT @DocumentId=D.DocumentId FROM DELETED D;
	SELECT @UserId=D.CreatedById FROM DELETED D;
	SELECT @AuditDetails=D.PropertyDescription FROM DELETED D;

	INSERT INTO T_Document_AuditLog(AuditLogId,DocumentId,UserId,AuditDate,AuditDetails,DocumentStatus)
	VALUES(@AuditLogId,@DocumentId,@UserId,GETDATE(),@AuditDetails,'I');
GO  