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
    
    public partial class diary
    {
        public int line_code { get; set; }
        public int is_active { get; set; }
        public Nullable<int> car_id { get; set; }
        public System.DateTime create_time { get; set; }
        public int customer_id { get; set; }
        public System.DateTime date_start { get; set; }
        public System.DateTime date_end { get; set; }
        public System.TimeSpan time_start { get; set; }
        public System.TimeSpan time_end { get; set; }
        public Nullable<System.DateTime> actual_date_start { get; set; }
        public Nullable<System.DateTime> actual_date_end { get; set; }
        public Nullable<System.TimeSpan> actual_time_start { get; set; }
        public Nullable<System.TimeSpan> actual_time_end { get; set; }
    
        public virtual car car { get; set; }
        public virtual User User { get; set; }
    }
}