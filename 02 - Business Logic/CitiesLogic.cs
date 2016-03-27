using System.Collections.Generic;
using System.Linq;

namespace CarRental
{
    /// <summary>
    /// Cities Logic.
    /// </summary>
    public class CitiesLogic : BaseLogic
    {
        /// <summary>
        /// Get Cities List.
        /// </summary>
        /// <returns></returns>
        public List<city> GetCityList()
        {
            return DB.cities.ToList();
        }
    }
}
