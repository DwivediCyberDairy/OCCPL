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
    
    public partial class OWL_StatusListMaster
    {
        public OWL_StatusListMaster()
        {
            this.OWL_BusinessPlanMaster = new HashSet<OWL_BusinessPlanMaster>();
            this.OWL_CareersMaster = new HashSet<OWL_CareersMaster>();
            this.OWL_ClientMaster = new HashSet<OWL_ClientMaster>();
            this.OWL_JobsPostMaster = new HashSet<OWL_JobsPostMaster>();
            this.OWL_PostsMaster = new HashSet<OWL_PostsMaster>();
            this.OWL_PostsMaster1 = new HashSet<OWL_PostsMaster>();
        }
    
        public int StatusId { get; set; }
        public string StatusValue { get; set; }
        public Nullable<bool> IsDel { get; set; }
    
        public virtual ICollection<OWL_BusinessPlanMaster> OWL_BusinessPlanMaster { get; set; }
        public virtual ICollection<OWL_CareersMaster> OWL_CareersMaster { get; set; }
        public virtual ICollection<OWL_ClientMaster> OWL_ClientMaster { get; set; }
        public virtual ICollection<OWL_JobsPostMaster> OWL_JobsPostMaster { get; set; }
        public virtual ICollection<OWL_PostsMaster> OWL_PostsMaster { get; set; }
        public virtual ICollection<OWL_PostsMaster> OWL_PostsMaster1 { get; set; }
    }
}
