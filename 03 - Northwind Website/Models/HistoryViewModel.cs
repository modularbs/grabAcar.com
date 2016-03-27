using System.ComponentModel.DataAnnotations;

namespace CarRental
{
    public class HistoryViewModel
    {
        public int CarId { get; set; }

        [Display(Name = "Total Price")]
        public decimal Cost { get; set; }
    }
}