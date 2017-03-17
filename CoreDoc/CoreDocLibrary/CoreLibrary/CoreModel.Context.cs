﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CoreLibrary
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class CoreDocDBEntities : DbContext
    {
        public CoreDocDBEntities()
            : base("name=CoreDocDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<M_Application> M_Application { get; set; }
        public virtual DbSet<M_ChildLink> M_ChildLink { get; set; }
        public virtual DbSet<M_DocumentType> M_DocumentType { get; set; }
        public virtual DbSet<M_ParentLink> M_ParentLink { get; set; }
        public virtual DbSet<M_User> M_User { get; set; }
        public virtual DbSet<T_Document> T_Document { get; set; }
        public virtual DbSet<T_Document_AuditLog> T_Document_AuditLog { get; set; }
        public virtual DbSet<T_User_Application_Map> T_User_Application_Map { get; set; }
    
        public virtual ObjectResult<GetMasterData_Result> GetMasterData(Nullable<int> key, string searchValue)
        {
            var keyParameter = key.HasValue ?
                new ObjectParameter("key", key) :
                new ObjectParameter("key", typeof(int));
    
            var searchValueParameter = searchValue != null ?
                new ObjectParameter("searchValue", searchValue) :
                new ObjectParameter("searchValue", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetMasterData_Result>("GetMasterData", keyParameter, searchValueParameter);
        }
    
        public virtual int SaveChildLink(string tag, Nullable<System.Guid> childLinkId, Nullable<System.Guid> parentLinkId, string childLinkName, Nullable<System.Guid> userId)
        {
            var tagParameter = tag != null ?
                new ObjectParameter("Tag", tag) :
                new ObjectParameter("Tag", typeof(string));
    
            var childLinkIdParameter = childLinkId.HasValue ?
                new ObjectParameter("ChildLinkId", childLinkId) :
                new ObjectParameter("ChildLinkId", typeof(System.Guid));
    
            var parentLinkIdParameter = parentLinkId.HasValue ?
                new ObjectParameter("ParentLinkId", parentLinkId) :
                new ObjectParameter("ParentLinkId", typeof(System.Guid));
    
            var childLinkNameParameter = childLinkName != null ?
                new ObjectParameter("ChildLinkName", childLinkName) :
                new ObjectParameter("ChildLinkName", typeof(string));
    
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(System.Guid));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SaveChildLink", tagParameter, childLinkIdParameter, parentLinkIdParameter, childLinkNameParameter, userIdParameter);
        }
    
        public virtual int SaveDocument(Nullable<System.Guid> documentId, Nullable<System.Guid> documentTypeId, Nullable<System.Guid> parentLinkId, Nullable<System.Guid> childLinkId, string tab, string section, string operation, string viewModel, string xAMLFileName, string commandName, string propertyName, string propertyDescription, string serviceFileName, string serviceMethodName, string procedureName, string comments, string documentStatus, Nullable<System.Guid> userId)
        {
            var documentIdParameter = documentId.HasValue ?
                new ObjectParameter("DocumentId", documentId) :
                new ObjectParameter("DocumentId", typeof(System.Guid));
    
            var documentTypeIdParameter = documentTypeId.HasValue ?
                new ObjectParameter("DocumentTypeId", documentTypeId) :
                new ObjectParameter("DocumentTypeId", typeof(System.Guid));
    
            var parentLinkIdParameter = parentLinkId.HasValue ?
                new ObjectParameter("ParentLinkId", parentLinkId) :
                new ObjectParameter("ParentLinkId", typeof(System.Guid));
    
            var childLinkIdParameter = childLinkId.HasValue ?
                new ObjectParameter("ChildLinkId", childLinkId) :
                new ObjectParameter("ChildLinkId", typeof(System.Guid));
    
            var tabParameter = tab != null ?
                new ObjectParameter("Tab", tab) :
                new ObjectParameter("Tab", typeof(string));
    
            var sectionParameter = section != null ?
                new ObjectParameter("Section", section) :
                new ObjectParameter("Section", typeof(string));
    
            var operationParameter = operation != null ?
                new ObjectParameter("Operation", operation) :
                new ObjectParameter("Operation", typeof(string));
    
            var viewModelParameter = viewModel != null ?
                new ObjectParameter("ViewModel", viewModel) :
                new ObjectParameter("ViewModel", typeof(string));
    
            var xAMLFileNameParameter = xAMLFileName != null ?
                new ObjectParameter("XAMLFileName", xAMLFileName) :
                new ObjectParameter("XAMLFileName", typeof(string));
    
            var commandNameParameter = commandName != null ?
                new ObjectParameter("CommandName", commandName) :
                new ObjectParameter("CommandName", typeof(string));
    
            var propertyNameParameter = propertyName != null ?
                new ObjectParameter("PropertyName", propertyName) :
                new ObjectParameter("PropertyName", typeof(string));
    
            var propertyDescriptionParameter = propertyDescription != null ?
                new ObjectParameter("PropertyDescription", propertyDescription) :
                new ObjectParameter("PropertyDescription", typeof(string));
    
            var serviceFileNameParameter = serviceFileName != null ?
                new ObjectParameter("ServiceFileName", serviceFileName) :
                new ObjectParameter("ServiceFileName", typeof(string));
    
            var serviceMethodNameParameter = serviceMethodName != null ?
                new ObjectParameter("ServiceMethodName", serviceMethodName) :
                new ObjectParameter("ServiceMethodName", typeof(string));
    
            var procedureNameParameter = procedureName != null ?
                new ObjectParameter("ProcedureName", procedureName) :
                new ObjectParameter("ProcedureName", typeof(string));
    
            var commentsParameter = comments != null ?
                new ObjectParameter("Comments", comments) :
                new ObjectParameter("Comments", typeof(string));
    
            var documentStatusParameter = documentStatus != null ?
                new ObjectParameter("DocumentStatus", documentStatus) :
                new ObjectParameter("DocumentStatus", typeof(string));
    
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(System.Guid));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SaveDocument", documentIdParameter, documentTypeIdParameter, parentLinkIdParameter, childLinkIdParameter, tabParameter, sectionParameter, operationParameter, viewModelParameter, xAMLFileNameParameter, commandNameParameter, propertyNameParameter, propertyDescriptionParameter, serviceFileNameParameter, serviceMethodNameParameter, procedureNameParameter, commentsParameter, documentStatusParameter, userIdParameter);
        }
    
        public virtual int SaveDocumentType(string tag, Nullable<System.Guid> documentTypeId, Nullable<int> applicationId, string documentTypeName, Nullable<System.Guid> userId)
        {
            var tagParameter = tag != null ?
                new ObjectParameter("Tag", tag) :
                new ObjectParameter("Tag", typeof(string));
    
            var documentTypeIdParameter = documentTypeId.HasValue ?
                new ObjectParameter("DocumentTypeId", documentTypeId) :
                new ObjectParameter("DocumentTypeId", typeof(System.Guid));
    
            var applicationIdParameter = applicationId.HasValue ?
                new ObjectParameter("ApplicationId", applicationId) :
                new ObjectParameter("ApplicationId", typeof(int));
    
            var documentTypeNameParameter = documentTypeName != null ?
                new ObjectParameter("DocumentTypeName", documentTypeName) :
                new ObjectParameter("DocumentTypeName", typeof(string));
    
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(System.Guid));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SaveDocumentType", tagParameter, documentTypeIdParameter, applicationIdParameter, documentTypeNameParameter, userIdParameter);
        }
    
        public virtual int SaveParentLink(string tag, Nullable<System.Guid> parentLinkId, string parentLinkName, Nullable<System.Guid> userId)
        {
            var tagParameter = tag != null ?
                new ObjectParameter("Tag", tag) :
                new ObjectParameter("Tag", typeof(string));
    
            var parentLinkIdParameter = parentLinkId.HasValue ?
                new ObjectParameter("ParentLinkId", parentLinkId) :
                new ObjectParameter("ParentLinkId", typeof(System.Guid));
    
            var parentLinkNameParameter = parentLinkName != null ?
                new ObjectParameter("ParentLinkName", parentLinkName) :
                new ObjectParameter("ParentLinkName", typeof(string));
    
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(System.Guid));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SaveParentLink", tagParameter, parentLinkIdParameter, parentLinkNameParameter, userIdParameter);
        }
    
        public virtual int SaveUserApplicationMap(Nullable<System.Guid> userId, Nullable<int> applicationId, string status)
        {
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(System.Guid));
    
            var applicationIdParameter = applicationId.HasValue ?
                new ObjectParameter("ApplicationId", applicationId) :
                new ObjectParameter("ApplicationId", typeof(int));
    
            var statusParameter = status != null ?
                new ObjectParameter("Status", status) :
                new ObjectParameter("Status", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SaveUserApplicationMap", userIdParameter, applicationIdParameter, statusParameter);
        }
    
        public virtual int SaveUserInfo(string tag, Nullable<System.Guid> userId, string userName, string userFullName, string userPassword)
        {
            var tagParameter = tag != null ?
                new ObjectParameter("Tag", tag) :
                new ObjectParameter("Tag", typeof(string));
    
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(System.Guid));
    
            var userNameParameter = userName != null ?
                new ObjectParameter("UserName", userName) :
                new ObjectParameter("UserName", typeof(string));
    
            var userFullNameParameter = userFullName != null ?
                new ObjectParameter("UserFullName", userFullName) :
                new ObjectParameter("UserFullName", typeof(string));
    
            var userPasswordParameter = userPassword != null ?
                new ObjectParameter("UserPassword", userPassword) :
                new ObjectParameter("UserPassword", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SaveUserInfo", tagParameter, userIdParameter, userNameParameter, userFullNameParameter, userPasswordParameter);
        }
    
        public virtual int SaveApplication(string tag, Nullable<int> applicationId, string applicationName)
        {
            var tagParameter = tag != null ?
                new ObjectParameter("Tag", tag) :
                new ObjectParameter("Tag", typeof(string));
    
            var applicationIdParameter = applicationId.HasValue ?
                new ObjectParameter("ApplicationId", applicationId) :
                new ObjectParameter("ApplicationId", typeof(int));
    
            var applicationNameParameter = applicationName != null ?
                new ObjectParameter("ApplicationName", applicationName) :
                new ObjectParameter("ApplicationName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SaveApplication", tagParameter, applicationIdParameter, applicationNameParameter);
        }
    
        public virtual ObjectResult<GetDocumentData_Result> GetDocumentData(Nullable<System.Guid> documentId)
        {
            var documentIdParameter = documentId.HasValue ?
                new ObjectParameter("DocumentId", documentId) :
                new ObjectParameter("DocumentId", typeof(System.Guid));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetDocumentData_Result>("GetDocumentData", documentIdParameter);
        }
    }
}
