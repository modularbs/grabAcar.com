using System;
using System.Collections.Generic;
using System.Net;
using System.Web.Mvc;

namespace CarRental
{
    /// <summary>
    /// Controller responsible to Pages such as- Rental,Different Reports,Car Managment, Etc.
    /// </summary>
    public class CarController : Controller
    {

        #region Search Pages

        /// <summary>
        /// Search For Cars.
        /// </summary>
        /// <returns></returns>
        public ActionResult Search()
        {
            try
            {
                InitialilizeDropDownLists();
                return View();
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.InternalServerError, ex.Message);
            }
        }

        /// <summary>
        /// Search For Cars. With Parameters.
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Search(SearchViewModel model)
        {
            try
            {
                if (!ModelState.IsValid)
                    return View();

                CarLogic carLogic = new CarLogic();

                var cars = carLogic.Search(model.CarModelId, model.ManufacturerId, model.TransmissionId, model.ManufactureYear, model.freeText, model.DateStart, model.DateEnd);
                
                if (cars == null)
                    return HttpNotFound("No Such Cars!");

                return Json(cars, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.InternalServerError, ex.Message);
            }
        }

        #endregion

        #region Reservation Pages

        /// <summary>
        /// Start a Reservation based on Car, Start Date, End Date.
        /// </summary>
        /// <param name="carId"></param>
        /// <param name="startDate"></param>
        /// <param name="endDate"></param>
        /// <returns></returns>
        [Authorize(Roles = "Customer")]
        public ActionResult Reservation(int carId, DateTime startDate, DateTime endDate)
        {
            try
            {
                if (!User.Identity.IsAuthenticated)
                    return RedirectToAction("Login", "Account");

                ReservationViewModel model = new ReservationViewModel();
                
                model.CarId = carId;
                
                CarLogic carLogic = new CarLogic();
                
                car_models carModel = carLogic.GetCarModel(carId);
                
                if (carModel == null)
                    return HttpNotFound("No Such Car!");

                model.DailyRate = carModel.daily_rate;
                model.DayLateRate = carModel.day_late_rate;
                model.CarModelName = carModel.model_name;
                model.DateStart = startDate;
                model.DateEnd = endDate;
                return View(model);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.InternalServerError, ex.Message);
            }
        }

        /// <summary>
        /// Create the Reservation based on Car, Start Date, End Date. And then- Populate Reservesion Number.
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        /// 
        [HttpPost]
        [Authorize(Roles = "Customer")]
        public ActionResult Reservation(ReservationViewModel model)
        {
            try
            {
                if (!ModelState.IsValid)
                    return View();

                CarLogic carLogic = new CarLogic();

                int reservationId = carLogic.SaveReservation(model.CarId, model.DateStart, model.DateEnd, Convert.ToInt32(Session["UserId"]), new TimeSpan(0, 0, 0), new TimeSpan(0, 0, 0));
                
                return Json(reservationId, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.InternalServerError, ex.Message);
            }
        }

        #endregion

        #region Car Return Pages

        /// <summary>
        /// Car Return Page.
        /// </summary>
        /// <returns></returns>
        [Authorize(Roles = "Employee")]
        public ActionResult CarReturn()
        {
            return View();
        }

        /// <summary>
        /// Car Return based on one or more parameters.
        /// </summary>
        /// <param name="car"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult CarReturn(CarReturnViewModel car)
        {
            try
            {
                CarLogic carLogic = new CarLogic();

                var cars = carLogic.SearchForCarReturn(car.CarNumber, car.ReservationId, car.CustomerId, car.CustomerIdentity, car.CustomerFirstName, car.CustomerLastName);

                if (cars == null)
                    return HttpNotFound("No Such Cars!");

                return Json(cars, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.InternalServerError, ex.Message);
            }
        }

        /// <summary>
        /// Return car by Reservation Number.
        /// </summary>
        /// <param name="line_code"></param>
        /// <returns></returns>
        [Authorize(Roles = "Employee")]
        public ActionResult ReturnSpecificCar(int line_code)
        {
            try
            {
                CarLogic carLogic = new CarLogic();
                var price = carLogic.CarReturn(line_code);
                return Json(price, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.InternalServerError, ex.Message);
            }
        }

        #endregion

        #region Historic Reservation & Reports Pages

        /// <summary>
        /// Get Reservations for User.
        /// </summary>
        /// <returns></returns>
        /// 
        [Authorize(Roles = "Customer")]
        public ActionResult History()
        {
            try
            {
                int userId = 0;
                if (Session["UserId"] == null || !int.TryParse(Session["UserId"].ToString(), out userId))
                    return RedirectToAction("Login", "Account");

                CarLogic carLogic = new CarLogic();
                var hisoryList = carLogic.GetUserHistoryReservation(userId);

                if (hisoryList == null)
                {
                    return HttpNotFound("No Such Reservation History!");
                }

                ViewBag.ReservationList = hisoryList;
                return View();
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = ex.Message;
                return View();
            }
        }

        /// <summary>
        /// Get Reservations for All User.
        /// </summary>
        [Authorize(Roles = "Manager")]
        /// <returns></returns>
        public ActionResult CustomersHistory()
        {
            try
            {
                CarLogic carLogic = new CarLogic();
                var hisoryList = carLogic.GetAllUserHistoryReservation();
                if (hisoryList == null)
                {
                    return HttpNotFound("No Such Customers Reservation History!");
                }
                ViewBag.ReservationList = hisoryList;

                return View();
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = ex.Message;
                return View();
            }
        }

        #endregion

        #region Car Management Pages

        /// <summary>
        /// Gets a list of all active cars.
        /// </summary>
        /// <returns></returns>
        
        public ActionResult CarManage()
        {
            try
            {
                CarLogic carLogic = new CarLogic();

                var cars = carLogic.GetCars();
                
                if (cars == null)
                    return HttpNotFound("No Such Cars!");
                
                ViewBag.CarsList = cars;

                List<car_models> models = carLogic.GetAllModelList();
                
                if (models == null)
                    return HttpNotFound("No Such Cars Models!");
                
                ViewBag.CarModelId = new SelectList(models, "car_model_id", "model_name");

                return View();
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = ex.Message;
                return View();
            }
        }
        [Authorize(Roles = "Administrator")]
        /// <summary>
        /// Delete Car by Car Id.
        /// </summary>
        /// <param name="carId"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult DeleteCar(int carId)
        {
            try
            {
                CarLogic carLogic = new CarLogic();
                bool canDeleteCar = carLogic.DeleteCar(carId);
                return Json(canDeleteCar, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.InternalServerError, ex.Message);
            }
        }

        /// <summary>
        /// Add Car with Information Entered.
        /// </summary>
        /// <param name="carNumber"></param>
        /// <param name="carModelId"></param>
        /// <param name="mileage"></param>
        /// <param name="photo"></param>
        /// <param name="rentable"></param>
        /// <returns></returns>
        [HttpPost]
        [Authorize(Roles = "Administrator")]
        public ActionResult AddCar(int carNumber, int carModelId, int mileage, string photo, bool rentable)
        {
            try
            {
                car car = new car() { car_number = carNumber, car_model_id = carModelId, mileage = mileage, photo = photo, rentable = rentable, owner_branch = 1 };
                CarLogic carLogic = new CarLogic();
                int carId = carLogic.AddCar(car);
                return Json(carId, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.InternalServerError, ex.Message);
            }
        }

        /// <summary>
        /// Update car with specific information.
        /// </summary>
        /// <param name="carId"></param>
        /// <param name="carNumber"></param>
        /// <param name="carModelId"></param>
        /// <param name="mileage"></param>
        /// <param name="photo"></param>
        /// <param name="rentable"></param>
        /// <param name="isActive"></param>
        /// <returns></returns>
        [HttpPost]
        [Authorize(Roles = "Administrator")]
        public ActionResult UpdateCar(int carId, int carNumber, int carModelId, int mileage, string photo, bool rentable, int isActive)
        {
            try
            {
                car car = new car() { car_id = carId, car_number = carNumber, car_model_id = carModelId, mileage = mileage, photo = photo, rentable = rentable, owner_branch = 1, is_active = isActive };
                CarLogic carLogic = new CarLogic();
                carLogic.UpdateCar(car);
                return Json(carId, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(HttpStatusCode.InternalServerError, ex.Message);
            }
        }

        #endregion

        #region Helper Methods
        /// <summary>
        /// Load Drop Downs with specific lists.
        /// </summary>
        private void InitialilizeDropDownLists()
        {
            CarLogic carLogic = new CarLogic();

            List<car_models> models = carLogic.GetModelList();
            ViewBag.CarModelId = new SelectList(models, "car_model_id", "model_name");

            List<transmission_types> transmission = carLogic.GetTransmissionList();
            ViewBag.TransmissionId = new SelectList(transmission, "transmission_id", "transmission_name");

            List<Year> year = carLogic.GetYearList();
            ViewBag.ManufactureYear = new SelectList(year, "ManufactureYear", "ManufactureYear");

            List<manufacturer> manufacturer = carLogic.GetManufacturersList();
            ViewBag.ManufacturerId = new SelectList(manufacturer, "manufacturer_id", "manufacturer_name");
        }

        #endregion

    }
}