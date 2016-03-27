using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarRental
{
    /// <summary>
    /// Class Represents Year from Manufacture
    /// </summary>
    public class Year
    {
        /// <summary>
        /// Return Year from Manufacture Year
        /// </summary>
        public int ManufactureYear { get; set; }

        public Year(int year)
        {
            ManufactureYear = year;
        }
    }
}
