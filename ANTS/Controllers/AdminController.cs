using ANTS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ANTS.Controllers
{
    public class AdminController : Controller
    {
        ANTSEntities context = new ANTSEntities();
        // GET: Admin
        public ActionResult Index()
        {
            var users = context.Users.ToList();
            return View(users);
        }

        public ActionResult CreateManager()
        {
            return View();
        }
    }
}