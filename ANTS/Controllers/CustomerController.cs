using ANTS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ANTS.Controllers
{
    public class CustomerController : Controller
    {
        
        // GET: Customer
        ANTSEntities context = new ANTSEntities();
        public ActionResult Index()
        {
            var packages = (from p in context.Packages
                        where p.approvestatus == "active"
                        select p).ToList();

            return View(packages);
        }

        [HttpPost]
        public ActionResult Index(string searching)
        {
            var list = (from p in context.Packages
                        where p.packagename.Contains(searching)
                        select p).ToList();
            return View(list);
        }

        public ActionResult PackageDetails(int id)
        {
            var p = context.Packages.FirstOrDefault(e => e.packageid == id);
            return View(p);
        }

        public ActionResult BuyPackage(int id)
        {
            var p = context.Packages.FirstOrDefault(e => e.packageid == id);
            return View(p);
        }
        [HttpPost]
        public ActionResult BuyPackage(Package pk, string phone, string paytype, int quantity, string address)
        {
            var id = Convert.ToInt32(Session["id"]);
            var p = context.Packages.FirstOrDefault(e => e.packageid == pk.packageid);
            Order o = new Order();
            o.sellerid = p.userid;
            o.customerid = id;
            o.customerphone = phone;
            o.customeraddress = address;
            o.packageid = p.packageid;
            o.ordername = p.packagename;
            o.paytype = paytype;
            o.quantity = quantity;
            var v = quantity * p.price;
            o.totalprice = v;
            o.createdat = DateTime.Now;
            o.status = "pending";
            context.Orders.Add(o);
            context.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult CustomerProfile()
        {
            var id = Convert.ToInt32(Session["id"]);
            var user = context.Users.FirstOrDefault(e => e.userid == id);

            return View(user);
        }

        public ActionResult EditProfile(int id)
        {
            var user = context.Users.FirstOrDefault(e => e.userid == id);
            return View(user);
        }

        [HttpPost]
        public ActionResult EditProfile(User u)
        {
            var user = context.Users.FirstOrDefault(e => e.userid == u.userid);
            context.Entry(user).CurrentValues.SetValues(u);
            context.SaveChanges();
            return RedirectToAction("CustomerProfile");
        }

        public ActionResult Notices()
        {
            var users = context.Notices.ToList();
            return View(users);
        }

        public ActionResult Transactions()
        {
            var id = Convert.ToInt32(Session["id"]);
            var transaction = (from a in context.Accounts
                            where a.userid == id
                            orderby a.createdat descending
                            select a).ToList();
            return View(transaction);
        }

        public ActionResult TransactionDetails(int id)
        {
            var transaction = context.Accounts.FirstOrDefault(e => e.accountid == id);
            return View(transaction);
        }

        public ActionResult Orderhistory()
        {
            var id = Convert.ToInt32(Session["id"]);
            var orders = (from o in context.Orders
                          where o.customerid == id
                          orderby o.createdat descending
                          select o).ToList();
            return View(orders);

        }

        [HttpPost]
        public ActionResult Orderhistory(string searching)
        {
            var list = (from o in context.Orders
                        where o.ordername.Contains(searching)
                        select o).ToList();
            return View(list);
        }

        public ActionResult Orderdetails(int id)
        {
            var orders = context.Orders.FirstOrDefault(e => e.orderid == id);
            return View(orders);

        }

        public ActionResult GiveRating()
        {
            return View();

        }
    }
}