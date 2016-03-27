using System.ComponentModel.DataAnnotations;

namespace CarRental
{
    public class CarManagerViewModel
    {
        [Display(Name = "Car Number")]
        [Required(ErrorMessage = "Missing car number")]
        [Range(0, int.MaxValue, ErrorMessage = "Please enter valid integer Number")]
        public int CarNumber { get; set; }

        [Display(Name = "Model")]
        [Required(ErrorMessage = "Missing car model")]
        [Range(0, int.MaxValue, ErrorMessage = "Please enter valid integer Number")]
        public int CarModelId { get; set; }

        [Display(Name = "Mileage")]
        [Required(ErrorMessage = "Missing Milage")]
        [Range(0, int.MaxValue, ErrorMessage = "Please enter valid integer Number")]
        public int Mileage { get; set; }

        [Display(Name = "Car Picture")]
        [Required(ErrorMessage = "Missing photo")]
        public string Photo { get; set; }

        [Display(Name = "Available for Rent?")]
        [Required(ErrorMessage = "Missing Rentable")]
        public bool Rentable { get; set; }
    }
}