using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.UI;

namespace CarRental
{
    /// <summary>
    /// Controller responsible to Pages for Users such as- Login, Register, Etc.
    /// </summary>
    public class AccountController : Controller
    {
        private UsersLogic logic = new UsersLogic();

        #region Register Pages

        /// <summary>
        /// Register.
        /// </summary>
        /// <returns></returns>
        public ActionResult Register()
        {
            CitiesLogic cityList = new CitiesLogic();
            List<city> cities = cityList.GetCityList();
            ViewBag.CityId = new SelectList(cities, "city_id", "city_name");
            return View();
        }

        /// <summary>
        /// Register. (Receiving new user Information).
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Register(RegisterViewModel model)
        {
            try
            {
                CitiesLogic cityList = new CitiesLogic();
                List<city> cities = cityList.GetCityList();
                ViewBag.CityId = new SelectList(cities, "city_id", "city_name");

                if (!ModelState.IsValid)
                    return View();

                if (logic.IsUsernameTaken(model.Username))
                {
                    ViewBag.ErrorMessage = "Username exist already";
                    return View();
                }
                User user = new User()
                {
                    Username = model.Username,
                    Password = model.Password,
                    address = model.Address,
                    city_id = model.CityId,
                    date_of_birth = model.DateOfBirth,
                    email = model.Email,
                    display_picture = model.DisplayPicture,
                    first_name = model.FirstName,
                    gender = model.Gender,
                    last_name = model.LastName,
                    id_number = model.IdNumber,
                    region_name = model.RegionName,
                    is_active = 1
                };
                Session["UserId"] = logic.Register(user);
                // Logged-In הגדרה שהמשתמש הינו
                FormsAuthentication.SetAuthCookie(model.Username, false);

                return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = ex.Message;
                return View();
            }
        }
       
        #endregion

        #region Login Pages

        /// <summary>
        /// Login Page.
        /// </summary>
        /// <returns></returns>
        public ActionResult Login()
        {
            try
            {
                TempData["UrlReferrer"] = Request.UrlReferrer;
                return View();
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = ex.Message;
                return View();
            }
        }
        
        /// <summary>
        /// Login Page (Receiving Username and Password).
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Login(LoginViewModel model)
        {
            try
            {
                if (!ModelState.IsValid)
                    return View();

                User user = logic.IsUserExist(model.Username, model.Password);
                if (user != null)
                {
                    Session["UserId"] = user.UserID;
                    FormsAuthentication.RedirectFromLoginPage(model.Username, model.RememberMe);
                }

                ViewBag.ErrorMessage = "Incorrect Username or Password";

                if (TempData["UrlReferrer"] != null)
                    return Redirect(TempData["UrlReferrer"].ToString());
                return View();
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = ex.Message;
                return View();
            }
        }
        
        #endregion

        #region Logout Page

        /// <summary>
        /// Logout Page.
        /// </summary>
        /// <returns></returns>
        public ActionResult Logout()
        {
            try
            {
                FormsAuthentication.SignOut();
                return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = ex.Message;
                return View();
            }
        }

        #endregion

        #region Helper Method
        public JsonResult IsUserNameTaken(string userName)
        {
            if (logic.IsUsernameTaken(userName))
                return Json("Username already taken", JsonRequestBehavior.AllowGet);
            return Json(true, JsonRequestBehavior.AllowGet);
        }
        #endregion
        #region Dispose

        /// <summary>
        /// Discposee method.
        /// </summary>
        /// <param name="disposing"></param>
        protected override void Dispose(bool disposing)
        {
            logic.Dispose();
            base.Dispose(disposing);
        }

        #endregion

    }
}
