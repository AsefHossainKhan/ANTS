using ANTS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ANTS.Authentication;
using System.Collections;
using System.Dynamic;
using System.Web.Routing;
using System.Data.Entity.SqlServer;

namespace ANTS.Controllers
{
    public class AdminController : Controller
    {
        ANTSEntities context = new ANTSEntities();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ViewUsers()
        {
            var users = context.Users.ToList();
            return View(users);
        }

        //[AdminAuthentication]
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
                return RedirectToAction("ViewUsers");
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
            return RedirectToAction("ViewUsers");
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
            var notices = context.Notices.ToList();
            var users = context.Users.ToList();

            var noticesAndNames = notices.Join(users,
                noticekey => noticekey.userid,
                namekey => namekey.userid,
                (noticekey, namekey) => new
                {
                    noticeid = noticekey.noticeid,
                    name = namekey.name,
                    usertype = noticekey.usertype,
                    notice = noticekey.notice1,
                    createdat = noticekey.createdat,
                    status = noticekey.status
                });
            //List<Notice> Lists = new List<Notice>();
            //foreach (var item in noticesAndNames)
            //{
            //    var x = new Notice();
            //    x.noticeid = item.noticeid;
            //    x.User = new User();
            //    x.User.name = item.name;
            //    x.usertype = item.usertype;
            //    x.notice1 = item.notice;
            //    x.createdat = item.createdat;
            //    x.status = item.status;
            //    Lists.Add(x);
            //}
            //return View(Lists);

            //var noticesAndNames = (from n in notices
            //                       join u in users on n.userid equals u.userid
            //                       select new
            //                       {
            //                           noticeid = n.noticeid,
            //                           name = u.name,
            //                           usertype = n.usertype,
            //                           notice = n.notice1,
            //                           createdat = n.createdat,
            //                           status = n.status
            //                       }).ToList();
            //ViewBag.myData = noticesAndNames;

            return View(noticesAndNames);
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

        public ActionResult DeleteNotice(int id)
        {
            var notice = context.Notices.FirstOrDefault(e => e.noticeid == id);
            return View(notice);
        }

        [HttpPost]
        [ActionName("DeleteNotice")]
        public ActionResult DeleteNoticeN(int id)
        {
            var notice = context.Notices.FirstOrDefault(e => e.noticeid == id);
            context.Notices.Remove(notice);
            context.SaveChanges();
            return RedirectToAction("ViewNotices");
        }

        public ActionResult Dashboard()
        {
            var prevMonth = DateTime.Now.AddMonths(-1);
            var nextMonth = DateTime.Now.AddMonths(1);

            var monthlyIncome = context.Orders.Where(x => x.status.Equals("sold") && x.createdat > prevMonth && x.createdat < nextMonth).Select(x => x.totalprice).Sum();

            var totalIncome = context.Orders.Where(x => x.status.Equals("sold")).Select(x => x.totalprice).Sum();
            ViewBag.monthlyIncome = monthlyIncome;
            ViewBag.totalIncome = totalIncome;
            return View();
        }
    }
}