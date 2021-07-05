using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using ANTS.Models;

namespace ANTS.Controllers
{
    public class LoginController : Controller
    {

        ANTSEntities context = new ANTSEntities();
        // GET: Login
        public ActionResult Index()
        {
            
            return View();
        }

        [HttpPost]
        public ActionResult Index(User u, string returnUrl)
        {
            var usercheck = context.Users.FirstOrDefault(e => e.email == u.email);
            
            if ( usercheck.password == u.password && u.password != null)
            {

                FormsAuthentication.SetAuthCookie(usercheck.userid.ToString(), true);
                Session["id"] = usercheck.userid.ToString();
                Session["user_type"] = usercheck.usertype;
                //return Content(usercheck.usertype);
                if (usercheck.usertype == "admin")
                {
                    return RedirectToAction("Index", "Admin");
                }
                else if (usercheck.usertype == "manager")
                {
                    return RedirectToAction("Index", "Manager");
                }
                else if (usercheck.usertype == "seller")
                {
                    return RedirectToAction("Index", "Seller");
                }
                else if (usercheck.usertype == "customer")
                {
                    return RedirectToAction("Index", "Customer");
                }
                
            }
            TempData["ErrorMessage"] = "Incorrect Username/Password";
            return View();
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            return Redirect("/Home");
        }
    }
}