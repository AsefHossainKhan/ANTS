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
            User u = new User();
            u.createdat = DateTime.Now;
            return View(u);
        }

        [HttpPost]
        public ActionResult CreateManager(User u, String confirmpassword)
        {
            if (ModelState.IsValid)
            {
                if (u.password != confirmpassword)
                {
                    ViewBag.match = "Password did not match";
                    User p = new User();
                    p.createdat = DateTime.Now;
                    return View(p);
                }
                context.Users.Add(u);
                context.SaveChanges();
                return RedirectToAction("Index");
            }
            return View();
        }

        public ActionResult EditUser(int id)
        {
            var user = context.Users.FirstOrDefault(e => e.userid == id);
            return View(user);
        }

        [HttpPost]
        public ActionResult EditUser(User u)
        {
            var user = context.Users.FirstOrDefault(e => e.userid == u.userid);
            context.Entry(user).CurrentValues.SetValues(u);
            context.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult DeleteUser(int id)
        {
            var user = context.Users.FirstOrDefault(e => e.userid == id);
            return View(user);
        }

        [HttpPost]
        [ActionName("DeleteUser")]
        public ActionResult DeleteUserU(int id)
        {
            var user = context.Users.FirstOrDefault(e => e.userid == id);
            context.Users.Remove(user);
            context.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult CreateNotice()
        {
            Notice n = new Notice();
            //CHANGE WITH AUTHKEY
            n.userid = 1;
            n.createdat = DateTime.Now;
            n.status = "Active";
            return View(n);
        }

        [HttpPost]
        public ActionResult CreateNotice(Notice n)
        {
            if (ModelState.IsValid)
            {
                context.Notices.Add(n);
                context.SaveChanges();
                return RedirectToAction("ViewNotices");
            }
            return View();
        }

        public ActionResult ViewNotices()
        {
            var users = context.Notices.ToList();
            return View(users);
        }

        public ActionResult EditNotice(int id)
        {
            var notice = context.Notices.FirstOrDefault(e => e.noticeid == id);
            return View(notice);
        }

        [HttpPost]
        public ActionResult EditNotice(Notice n)
        {
            var notice = context.Notices.FirstOrDefault(e => e.noticeid == n.noticeid);
            context.Entry(notice).CurrentValues.SetValues(n);
            context.SaveChanges();
            return RedirectToAction("ViewNotices");
        }
    }
}