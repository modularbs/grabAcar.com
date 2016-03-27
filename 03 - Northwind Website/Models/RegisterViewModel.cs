using System;
using System.ComponentModel.DataAnnotations;

namespace CarRental
{
    public class RegisterViewModel
    {
        [Display(Name = "Username")]
        [Required(ErrorMessage = "Missing Username")]
        [System.Web.Mvc.Remote("IsUserNameTaken", "Account")]
        [StringLength(50, MinimumLength = 4, ErrorMessage = "Username must be between 4 to 50 characters!")]
        public string Username { get; set; }

        [Display(Name = "Password")]
        [Required(ErrorMessage = "Missing Password")]
        [StringLength(50, MinimumLength=4, ErrorMessage = "Password must be between 4 to 50 characters!")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Display(Name = "Confirm Password")]
        [Required(ErrorMessage = "Missing Confirm Password")]
        [Compare("Password", ErrorMessage = "Passwords do not match")]
        [StringLength(50, ErrorMessage = "Password too long!")]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }

        [Display(Name = "First Name")]
        [Required(ErrorMessage = "Missing First Name")]
        [StringLength(25, ErrorMessage = "Name too long!")]
        public string FirstName { get; set; }

        [Display(Name = "Last Name")]
        [Required(ErrorMessage = "Missing Last Name")]
        [StringLength(25, ErrorMessage = "Name too long!")]
        public string LastName { get; set; }

        [Display(Name = "City")]
        public int? CityId { get; set; }

        [Display(Name = "Region")]
        [StringLength(50, ErrorMessage = "Region too long!")]
        public string RegionName { get; set; }

        [Display(Name = "Address")]
        [StringLength(200, ErrorMessage = "Address too long!")]
        public string Address { get; set; }

        [Display(Name = "Id Number")]
        [Required(ErrorMessage = "Missing Id Number")]
        public string IdNumber { get; set; }

        [Display(Name = "Date of Birth")]
        [DataType(DataType.Date)]
        [System.Web.Mvc.Remote("IsUserDateBirthValid", "Validation")]
        public DateTime? DateOfBirth { get; set; }

        [Display(Name = "Gender")]
        [StringLength(25, ErrorMessage = "Gender too long!")]
        public string Gender { get; set; }

        [Display(Name = "Email")]
        [Required(ErrorMessage = "Missing Email")]
        [StringLength(50, ErrorMessage = "Email too long!")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [Display(Name = "Picture")]
        [DataType(DataType.ImageUrl)]
        public byte[] DisplayPicture { get; set; }

    }
}