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
    
    public partial class Order
    {
        public int orderid { get; set; }
        public int sellerid { get; set; }
        public int customerid { get; set; }
        public string customerphone { get; set; }
        public string customeraddress { get; set; }
        public int packageid { get; set; }
        public string ordername { get; set; }
        public string paytype { get; set; }
        public int quantity { get; set; }
        public double totalprice { get; set; }
        public System.DateTime createdat { get; set; }
        public string status { get; set; }
    
        public virtual User User { get; set; }
        public virtual User User1 { get; set; }
    }
}
