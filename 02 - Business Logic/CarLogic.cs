using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace CarRental
{
    /// <summary>
    /// Car Logic Class.
    /// </summary>
    public class CarLogic : BaseLogic
    {
        #region Get Lists for Searching Car Drop Downs

        /// <summary>
        /// Get Model List from Database from Active Cars..
        /// </summary>
        /// <returns></returns>
        public List<car_models> GetModelList()
        {
            return DB.car_models.Where(m => m.is_active == 1 && m.cars.Where(c => c.car_model_id == m.car_model_id && c.is_active == 1).Count() > 0).ToList();
        }

        /// <summary>
        /// Get Model List from Database from all Cars.
        /// </summary>
        /// <returns></returns>
        public List<car_models> GetAllModelList()
        {
            return DB.car_models.ToList();
        }

        /// <summary>
        /// Get Model Transmission from Database.
        /// </summary>
        /// <returns></returns>
        public List<transmission_types> GetTransmissionList()
        {
            return DB.transmission_types.ToList();
        }

        /// <summary>
        /// Get Manufacture List from Database.
        /// </summary>
        /// <returns></returns>
        public List<manufacturer> GetManufacturersList()
        {
            return DB.manufacturers.ToList();
        }

        /// <summary>
        /// Get Year List.
        /// </summary>
        /// <returns></returns>
        public List<Year> GetYearList()
        {
            List<Year> years = new List<Year>();

            for (int i = 0; i < 7; i++)
            {
                years.Add(new Year(DateTime.Now.Year - i));
            }

            return years;
        }

        #endregion

        /// <summary>
        /// Search Cars with specifications given in parameters.
        /// </summary>
        /// <param name="carModelId"></param>
        /// <param name="manufacturerId"></param>
        /// <param name="transmissionId"></param>
        /// <param name="manufactureYear"></param>
        /// <param name="freeText"></param>
        /// <param name="dateFrom"></param>
        /// <param name="dateTo"></param>
        /// <returns></returns>
        public IEnumerable Search(int? carModelId, int? manufacturerId, int? transmissionId, int? manufactureYear, string freeText, DateTime dateFrom, DateTime dateTo)
        {
            var ids = DB.diaries.Where(d => ((dateFrom >= d.date_start && dateFrom <= d.date_end) || (dateTo >= d.date_start && dateTo <= d.date_end)) && d.actual_date_end == null).Select(d => d.car_id);

            return
                DB.cars
                  .Where(m => (carModelId == null || m.car_model_id == carModelId) &&
                              (manufactureYear == null || m.car_models.manufacture_year == manufactureYear) &&
                              (manufacturerId == null || m.car_models.manufacturer_id == manufacturerId) &&
                              (freeText == null || m.car_models.model_name.Contains(freeText)
                                                || m.car_models.manufacturer.manufacturer_name.Contains(freeText)
                                                || m.car_models.transmission_types.transmission_name.Contains(freeText)) &&
                              (transmissionId == null || m.car_models.transmission_id == transmissionId) &&
                              (m.is_active == 1) &&
                               (m.rentable) &&
                              (!ids.Contains(m.car_id)))
                  .Select(c => new
                  {
                      c.car_id,
                      c.car_model_id,
                      c.car_models.model_name,
                      c.car_models.manufacturer_id,
                      c.car_models.manufacturer.manufacturer_name
                  }
                         ).OrderBy(c => c.manufacturer_name).ThenBy(c => c.model_name);
        }

        /// <summary>
        /// Get car model of specific car given carId.
        /// </summary>
        /// <param name="carId"></param>
        /// <returns></returns>
        public car_models GetCarModel(int carId)
        {
            return DB.cars.FirstOrDefault(c => c.car_id == carId).car_models;
        }

        /// <summary>
        /// Save Reservation given required reservation information.
        /// </summary>
        /// <param name="carId"></param>
        /// <param name="dateStart"></param>
        /// <param name="dateEnd"></param>
        /// <param name="customerId"></param>
        /// <param name="time_start"></param>
        /// <param name="time_end"></param>
        /// <returns></returns>
        public int SaveReservation(int carId, DateTime dateStart, DateTime dateEnd, int customerId, TimeSpan time_start, TimeSpan time_end)
        {
            diary diaryNew = new diary();

            diaryNew.car_id = carId;
            diaryNew.create_time = DateTime.Now;
            diaryNew.date_start = dateStart;
            diaryNew.date_end = dateEnd;
            diaryNew.is_active = 1;
            diaryNew.customer_id = customerId;
            diaryNew.time_start = time_start;
            diaryNew.time_end = time_end;

            DB.diaries.Add(diaryNew);
            DB.SaveChanges();
            return diaryNew.line_code;
        }

        /// <summary>
        /// Get cars that are ordered, that has same specific information.
        /// </summary>
        /// <param name="carNumber"></param>
        /// <param name="lineCode"></param>
        /// <param name="customerId"></param>
        /// <param name="customerIdentity"></param>
        /// <param name="customerFirstName"></param>
        /// <param name="customerLastName"></param>
        /// <returns></returns>
        public IEnumerable SearchForCarReturn(int? carNumber, int? lineCode, int? customerId, string customerIdentity, string customerFirstName, string customerLastName)
        {


            var cars = DB.diaries
                 .Where(m => (carNumber == null || m.car.car_number == carNumber) &&
                             (lineCode == null || m.line_code == lineCode) &&
                             (customerId == null || m.customer_id == customerId) &&
                             (customerIdentity == null || customerIdentity == string.Empty || m.User.id_number == customerIdentity) &&
                             (customerFirstName == null || customerFirstName == string.Empty || m.User.first_name == customerFirstName) &&
                             (customerLastName == null || customerLastName == string.Empty || m.User.last_name == customerLastName) &&
                             (m.actual_date_end == null) &&
                             (m.date_start <= DateTime.Now))
                 .Select(d => new
                 {
                     d.car_id,
                     d.car.car_number,
                     d.line_code,
                     d.customer_id,
                     date_start = (d.actual_date_start == null ? d.date_start : d.actual_date_start),
                     d.date_end,
                     d.User.first_name,
                     d.User.last_name,
                     d.User.id_number,
                     d.car.car_models.model_name,
                     d.create_time
                 }
                        );
            return cars;
        }

        /// <summary>
        /// Return a car.
        /// </summary>
        /// <param name="line_code"></param>
        /// <returns></returns>
        public decimal CarReturn(int line_code)
        {
            var diary = DB.diaries.FirstOrDefault(d => d.line_code == line_code);
            DateTime dateReturn = DateTime.Now;
            diary.actual_date_end = dateReturn;
            DB.SaveChanges();
            return CalcHelper.CalcCarRetalPriceWithLate(diary.car.car_models.daily_rate, diary.car.car_models.day_late_rate, diary.date_start, diary.date_end, dateReturn);
        }

        /// <summary>
        /// Get a list of all reservations of a specific user.
        /// </summary>
        /// <param name="customerId"></param>
        /// <returns></returns>
        public IEnumerable GetUserHistoryReservation(int? customerId)
        {
            var reservations = DB.diaries
                 .Where(m => m.customer_id == customerId);
            return reservations;
        }

        /// <summary>
        /// Get a list of all reservations made ever sorted by Last,First names.
        /// </summary>
        /// <returns></returns>
        public IEnumerable GetAllUserHistoryReservation()
        {
            var reservations = DB.diaries.OrderBy(d => d.User.last_name).ThenBy(d => d.User.first_name);
            return reservations;
        }

        /// <summary>
        /// Get a List of active cars.
        /// </summary>
        /// <returns></returns>
        public IEnumerable GetCars()
        {
            var cars = DB.cars.Where(c => c.is_active == 1);
            return cars;
        }

        /// <summary>
        /// Delete (Deactivate) a Car.
        /// </summary>
        /// <param name="carId"></param>
        /// <returns></returns>
        public bool DeleteCar(int carId)
        {
            car car = DB.cars.FirstOrDefault(c => c.car_id == carId);
            var diary = car.diaries.Where(d => d.car_id == carId && d.date_end > DateTime.Now);
            if (diary != null && diary.Count() > 0)
                return false;

            car.is_active = 0;
            DB.SaveChanges();
            return true;
        }

        /// <summary>
        /// Add New Car.
        /// </summary>
        /// <param name="car"></param>
        /// <returns></returns>
        public int AddCar(car car)
        {
            car.is_active = 1;
            DB.cars.Add(car);
            DB.SaveChanges();
            return car.car_id;
        }

        /// <summary>
        /// Update cars with changed information.
        /// </summary>
        /// <param name="car"></param>
        public void UpdateCar(car car)
        {
            DB.Entry(car).State = EntityState.Modified;
            DB.SaveChanges();
        }
       
    }
}
