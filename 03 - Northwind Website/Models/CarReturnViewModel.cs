using System.ComponentModel.DataAnnotations;

namespace CarRental
{
    public class CarReturnViewModel
    {

        public int? CarId { get; set; }

        [Display(Name = "Car Plate Number")]
        [Range(0, int.MaxValue, ErrorMessage = "Please enter valid integer Number")]
        public int? CarNumber { get; set; }

        [Display(Name = "Reservation Number")]
        [Range(0, int.MaxValue, ErrorMessage = "Please enter valid integer Number")]
        public int? ReservationId { get; set; }

        [Display(Name = "Customer Id")]
        [Range(0, int.MaxValue, ErrorMessage = "Please enter valid integer Number")]
        public int? CustomerId { get; set; }

        [Display(Name = "Id Number")]
        public string CustomerIdentity { get; set; }

        [Display(Name = "First Name")]
        public string CustomerFirstName { get; set; }

        [Display(Name = "Last Name")]
        public string CustomerLastName { get; set; }
        
    }
}