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
    
    public partial class OWL_JobModeMaster
    {
        public OWL_JobModeMaster()
        {
            this.OWL_JobsPostMaster = new HashSet<OWL_JobsPostMaster>();
        }
    
        public int ModeId { get; set; }
        public string JobMode { get; set; }
    
        public virtual ICollection<OWL_JobsPostMaster> OWL_JobsPostMaster { get; set; }
    }
}
