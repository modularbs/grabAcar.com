
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;

namespace CarRental
{
    /// <summary>
    /// Controller responsible to General Pages such as- Home,Contact.
    /// </summary>
    public class HomeController : Controller
    {
        #region General Pages

        /// <summary>
        /// Home/Landing Page
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// Contact Us Page
        /// </summary>
        /// <returns></returns>
        public ActionResult Contact()
        {
            return View();
        }
        //[HttpPost]
        //public ViewResult Contact(ContactViewModel model)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        MailMessage message = new MailMessage();
        //        message.From = new MailAddress("gil@modular-bs.com");
        //        message.To.Add(new MailAddress("gil@modular-bs.com"));

        //        message.Subject = "New Message from GrabAcar";
        //        message.Body = model.Message;
        //        message.IsBodyHtml = false;
        //        SmtpClient client = new SmtpClient();
        //         client.Host = "localhost";
        //         client.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis;
 
        //        //client.Host = "smtp.gmail.com";
        //        //client.Port = 587;
        //        //client.UseDefaultCredentials = false;
        //        //client.Credentials = new System.Net.NetworkCredential("shimrita100@gmail.com", "333222164tamar640reem");
        //        //client.EnableSsl = true;

        //        client.Send(message);
        //        message.Dispose();

        //        //MailMessage msg = new MailMessage(); 
        //        //msg.From = new MailAddress("no-reply@bobcravens.com", "Website Contact Form"); 
        //        //msg.To.Add("your_email_address@mail_server.com"); 
        //        //msg.Subject = emailModel.Subject; 
        //        //string body = "Name: " + emailModel.Name + "n" + "Email: " + emailModel.EmailAddress + "n" + "Website: " + emailModel.WebSite + "n" + "Phone: " + emailModel.Phone + "nn" + emailModel.Message; 
        //        //msg.Body = body; 
        //        //msg.IsBodyHtml = false; 
        //        //SmtpClient smtp = new SmtpClient("mailserver_url.net", 25); 
        //        //smtp.Send(msg); 
        //        //msg.Dispose();

        //        return View("Index");
        //    }
        //    else
        //    {
        //        return View();
        //    }
        //}
        #endregion
    }
}
