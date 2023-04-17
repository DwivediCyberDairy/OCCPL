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
    
    public partial class OWL_EmployeeMaster
    {
        public OWL_EmployeeMaster()
        {
            this.OWL_BusinessPlanMaster = new HashSet<OWL_BusinessPlanMaster>();
            this.OWL_DocumentMaster = new HashSet<OWL_DocumentMaster>();
            this.OWL_EnqueryMaster = new HashSet<OWL_EnqueryMaster>();
            this.OWL_JobsPostMaster = new HashSet<OWL_JobsPostMaster>();
            this.OWL_PostsMaster = new HashSet<OWL_PostsMaster>();
            this.OWL_QuestionMaster = new HashSet<OWL_QuestionMaster>();
            this.OWL_ResourceMaster = new HashSet<OWL_ResourceMaster>();
        }
    
        public int EmpId { get; set; }
        public Nullable<int> UserType { get; set; }
        public string EmpName { get; set; }
        public string EmpEmail { get; set; }
        public string Gender { get; set; }
        public Nullable<int> EmpDept { get; set; }
        public Nullable<int> Qualification { get; set; }
        public Nullable<int> City { get; set; }
        public string UserPassword { get; set; }
        public Nullable<System.DateTime> AddedOn { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
        public Nullable<bool> IsDel { get; set; }
    
        public virtual ICollection<OWL_BusinessPlanMaster> OWL_BusinessPlanMaster { get; set; }
        public virtual OWL_CityMaster OWL_CityMaster { get; set; }
        public virtual OWL_DepartmentMaster OWL_DepartmentMaster { get; set; }
        public virtual ICollection<OWL_DocumentMaster> OWL_DocumentMaster { get; set; }
        public virtual OWL_EmployeeDetail OWL_EmployeeDetail { get; set; }
        public virtual OWL_UserMaster OWL_UserMaster { get; set; }
        public virtual OWL_QualificationMaster OWL_QualificationMaster { get; set; }
        public virtual ICollection<OWL_EnqueryMaster> OWL_EnqueryMaster { get; set; }
        public virtual ICollection<OWL_JobsPostMaster> OWL_JobsPostMaster { get; set; }
        public virtual OWL_LoginMaster OWL_LoginMaster { get; set; }
        public virtual ICollection<OWL_PostsMaster> OWL_PostsMaster { get; set; }
        public virtual ICollection<OWL_QuestionMaster> OWL_QuestionMaster { get; set; }
        public virtual ICollection<OWL_ResourceMaster> OWL_ResourceMaster { get; set; }
    }
}