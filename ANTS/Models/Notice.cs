//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ANTS.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Notice
    {
        public int noticeid { get; set; }
        [Required]
        public int userid { get; set; }
        [Required]
        public string usertype { get; set; }
        [Required (ErrorMessage = "The Notice field is required.")]
        public string notice1 { get; set; }
        [Required]
        public System.DateTime createdat { get; set; }
        [Required]
        public string status { get; set; }

        public virtual User User { get; set; }
    }
}
