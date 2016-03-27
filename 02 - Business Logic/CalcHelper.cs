using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarRental
{
    public static class CalcHelper
    {
        /// <summary>
        /// Price per Basic Reservation
        /// </summary>
        /// <param name="dailyRate"></param>
        /// <param name="dayLateRate"></param>
        /// <param name="dateStart"></param>
        /// <param name="dateEnd"></param>
        /// <param name="actualDateEnd"></param>
        /// <returns></returns>
        public static decimal CalcCarRetalPriceWithLate(decimal dailyRate, decimal dayLateRate, DateTime dateStart, DateTime dateEnd, DateTime? actualDateEnd)
        {
            return (dailyRate * Convert.ToDecimal((dateEnd.AddDays(1) - dateStart).TotalDays) + dayLateRate * ((actualDateEnd == null) ? 0 : Convert.ToDecimal((Convert.ToDateTime(actualDateEnd) - dateEnd).TotalDays)));
        }

        /// <summary>
        /// Price per Reservation include Late Days.
        /// </summary>
        /// <param name="dailyRate"></param>
        /// <param name="dateStart"></param>
        /// <param name="dateEnd"></param>
        /// <returns></returns>
        public static decimal CalcCarRetalPrice(decimal dailyRate, DateTime dateStart, DateTime dateEnd)
        {
            return dailyRate * Convert.ToDecimal((dateEnd.AddDays(1) - dateStart).TotalDays);
        }
    }
}
