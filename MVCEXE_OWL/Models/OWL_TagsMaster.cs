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
    
    public partial class OWL_TagsMaster
    {
        public int TagId { get; set; }
        public string TagName { get; set; }
        public Nullable<int> TagReleatedSector { get; set; }
        public Nullable<bool> IsDel { get; set; }
    
        public virtual OWL_SectorTypeMaster OWL_SectorTypeMaster { get; set; }
    }
}