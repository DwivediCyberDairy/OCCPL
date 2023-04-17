//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MVCEXE_OWL.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class OWL_ResourceMaster
    {
        public OWL_ResourceMaster()
        {
            this.OWL_ClientMaster = new HashSet<OWL_ClientMaster>();
        }
    
        public int ResourceId { get; set; }
        public string ResourceName { get; set; }
        public string ResourceUrl { get; set; }
        public string ResourceEmail { get; set; }
        public string AuthorizedPerson { get; set; }
        public string MobileNo { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
        public Nullable<bool> IsDel { get; set; }
    
        public virtual ICollection<OWL_ClientMaster> OWL_ClientMaster { get; set; }
        public virtual OWL_EmployeeMaster OWL_EmployeeMaster { get; set; }
    }
}
