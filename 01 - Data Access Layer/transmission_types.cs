//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CarRental
{
    using System;
    using System.Collections.Generic;
    
    public partial class transmission_types
    {
        public transmission_types()
        {
            this.car_models = new HashSet<car_models>();
        }
    
        public int transmission_id { get; set; }
        public string transmission_name { get; set; }
    
        public virtual ICollection<car_models> car_models { get; set; }
    }
}