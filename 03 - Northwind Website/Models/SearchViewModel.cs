using Foolproof;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace CarRental
{
    public class SearchViewModel
    {
        [Display(Name = "Rental Start")]
        [Required(ErrorMessage = "Missing Date Range")]
        public DateTime DateStart { get; set; }

        [Required(ErrorMessage = "Missing Date Range")]
        [Display(Name = "Rental End")]
        public DateTime DateEnd { get; set; }

        public int? CarId { get; set; }

        [Display(Name = "Model")]
        public int? CarModelId { get; set; }

        [Display(Name = "Manufacturer")]
        public int? ManufacturerId { get; set; }

        [Display(Name = "Transmission Type")]
        public int? TransmissionId { get; set; }
        
        [Display(Name = "Year")]
        [StringLength(4,MinimumLength=4, ErrorMessage = "Year not valid!")]
        [Range(2000, 2020, ErrorMessage = "Year not valid!")]
        public int? ManufactureYear { get; set; }

        [Display(Name = "Wildcard Search")]
        public string freeText { get; set; }

    }
}