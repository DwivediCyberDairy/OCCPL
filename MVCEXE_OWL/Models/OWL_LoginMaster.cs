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
    
    public partial class OWL_LoginMaster
    {
        public string UserId { get; set; }
        public string UserPassword { get; set; }
        public Nullable<int> UserType { get; set; }
        public Nullable<bool> UserStatus { get; set; }
        public Nullable<int> LoginCount { get; set; }
        public Nullable<System.DateTime> LastLogin_DT { get; set; }
        public string LastLogin_IP { get; set; }
    
        public virtual OWL_EmployeeMaster OWL_EmployeeMaster { get; set; }
    }
}