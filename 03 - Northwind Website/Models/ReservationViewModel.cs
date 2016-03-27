using System;
using System.ComponentModel.DataAnnotations;

namespace CarRental
{
    public class ReservationViewModel
    {
        public int CarId { get; set; }

        public int CarModelId { get; set; }

        [Display(Name = "Model")]
        public string CarModelName { get; set; }

        [Display(Name = "Daily Rate")]
        public decimal DailyRate { get; set; }

        [Display(Name = "Day-Late Rate")]
        public decimal DayLateRate { get; set; }

        [Display(Name = "Rental Start")]
        public DateTime DateStart { get; set; }

        [Display(Name = "Rental End")]
        public DateTime DateEnd { get; set; }
      
    }
}