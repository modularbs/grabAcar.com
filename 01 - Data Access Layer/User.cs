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
    
    public partial class User
    {
        public User()
        {
            this.diaries = new HashSet<diary>();
            this.Roles = new HashSet<Role>();
        }
    
        public int UserID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public int is_active { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public Nullable<int> city_id { get; set; }
        public string region_name { get; set; }
        public string address { get; set; }
        public string id_number { get; set; }
        public Nullable<System.DateTime> date_of_birth { get; set; }
        public string gender { get; set; }
        public string email { get; set; }
        public byte[] display_picture { get; set; }
    
        public virtual ICollection<diary> diaries { get; set; }
        public virtual ICollection<Role> Roles { get; set; }
    }
}
