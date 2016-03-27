using System.ComponentModel.DataAnnotations;

namespace CarRental
{
    public class LoginViewModel
    {
        [Required(ErrorMessage = "Missing Username")]
        [StringLength(50, ErrorMessage = "Username too long!")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Missing Password")]
        [StringLength(50, ErrorMessage = "Password too long!")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Display(Name = "Remember Password")]
        public bool RememberMe { get; set; }
    }
}