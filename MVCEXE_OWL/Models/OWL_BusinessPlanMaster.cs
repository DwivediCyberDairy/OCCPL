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
    
    public partial class OWL_BusinessPlanMaster
    {
        public OWL_BusinessPlanMaster()
        {
            this.OWL_ClientMaster = new HashSet<OWL_ClientMaster>();
        }
    
        public int PlanNo { get; set; }
        public string PlanName { get; set; }
        public Nullable<int> SectorType { get; set; }
        public string Services { get; set; }
        public string Advantage { get; set; }
        public string AdditionalFeatuer { get; set; }
        public Nullable<decimal> Cost { get; set; }
        public string CurrencyType { get; set; }
        public string Duration { get; set; }
        public Nullable<int> PostStatus { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreationDT { get; set; }
        public Nullable<System.DateTime> UpdatedON { get; set; }
        public Nullable<bool> IsDel { get; set; }
    
        public virtual OWL_EmployeeMaster OWL_EmployeeMaster { get; set; }
        public virtual OWL_SectorTypeMaster OWL_SectorTypeMaster { get; set; }
        public virtual OWL_StatusListMaster OWL_StatusListMaster { get; set; }
        public virtual ICollection<OWL_ClientMaster> OWL_ClientMaster { get; set; }
    }
}
