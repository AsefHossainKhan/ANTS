using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ANTS.Controllers
{
    public class CustomerController : Controller
    {
        [Authorize]
        // GET: Customer
        public ActionResult Index()
        {
            return View();
        }
    }
}