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
    
    public partial class M_DocumentType
    {
        public M_DocumentType()
        {
            this.T_Document = new HashSet<T_Document>();
        }
    
        public System.Guid DocumentTypeId { get; set; }
        public Nullable<int> ApplicationId { get; set; }
        public string DocumentTypeName { get; set; }
        public Nullable<System.Guid> CreatedById { get; set; }
        public Nullable<System.DateTimeOffset> CreatedByDate { get; set; }
        public Nullable<System.Guid> ModifiedById { get; set; }
        public Nullable<System.DateTimeOffset> ModifiedByDate { get; set; }
    
        public virtual M_Application M_Application { get; set; }
        public virtual M_User M_User { get; set; }
        public virtual M_User M_User1 { get; set; }
        public virtual ICollection<T_Document> T_Document { get; set; }
    }
}