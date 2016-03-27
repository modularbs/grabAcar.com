using System;
using System.ComponentModel.DataAnnotations;

namespace CarRental
{
    public class ContactViewModel
    {
        [Display(Name = "Subject")]
        [Required(ErrorMessage = "Missing Subject")]
        public string Subject { get; set; }

        [Display(Name = "Message")]
        [Required(ErrorMessage = "Missing Message")]
        public string Message { get; set; }
    }
}