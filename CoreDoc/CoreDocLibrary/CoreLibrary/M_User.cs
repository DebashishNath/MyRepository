//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class M_User
    {
        public M_User()
        {
            this.M_ChildLink = new HashSet<M_ChildLink>();
            this.M_ChildLink1 = new HashSet<M_ChildLink>();
            this.M_DocumentType = new HashSet<M_DocumentType>();
            this.M_DocumentType1 = new HashSet<M_DocumentType>();
            this.M_ParentLink = new HashSet<M_ParentLink>();
            this.M_ParentLink1 = new HashSet<M_ParentLink>();
            this.T_Document_AuditLog = new HashSet<T_Document_AuditLog>();
            this.T_Document = new HashSet<T_Document>();
            this.T_Document1 = new HashSet<T_Document>();
            this.T_User_Application_Map = new HashSet<T_User_Application_Map>();
        }
    
        public System.Guid UserId { get; set; }
        public string UserName { get; set; }
        public string UserFullName { get; set; }
        public string UserPassword { get; set; }
    
        public virtual ICollection<M_ChildLink> M_ChildLink { get; set; }
        public virtual ICollection<M_ChildLink> M_ChildLink1 { get; set; }
        public virtual ICollection<M_DocumentType> M_DocumentType { get; set; }
        public virtual ICollection<M_DocumentType> M_DocumentType1 { get; set; }
        public virtual ICollection<M_ParentLink> M_ParentLink { get; set; }
        public virtual ICollection<M_ParentLink> M_ParentLink1 { get; set; }
        public virtual ICollection<T_Document_AuditLog> T_Document_AuditLog { get; set; }
        public virtual ICollection<T_Document> T_Document { get; set; }
        public virtual ICollection<T_Document> T_Document1 { get; set; }
        public virtual ICollection<T_User_Application_Map> T_User_Application_Map { get; set; }
    }
}
