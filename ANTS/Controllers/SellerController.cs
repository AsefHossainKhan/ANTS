﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ANTS.Models;


namespace ANTS.Controllers
{
    public class SellerController : Controller
    {
        ANTSEntities context = new ANTSEntities();
        // GET: Seller
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Show()
        {
            var id = Convert.ToInt32(Session["id"].ToString());
            var list = (from p in context.Packages
                        where p.userid == id
                        select p).ToList();
            return View(list);
        }
        [HttpPost]
        public ActionResult Show(string searching)
        {
            var list = (from p in context.Packages
                        where p.packagename.Contains(searching)
                        select p).ToList();
            return View(list);
        }

        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Package p)
        {
            p.createdat = DateTime.Now;
            p.userid = Convert.ToInt32(Session["id"].ToString());
            context.Packages.Add(p);
            context.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Edit(int id)
        {

            var p = context.Packages.FirstOrDefault(e => e.packageid == id);
            return View(p);
        }
        [HttpPost]
        public ActionResult Edit(Package p)
        {
            var oldp = context.Packages.FirstOrDefault(e => e.packageid == p.packageid);
            oldp.packagename = p.packagename;
            oldp.price = p.price;
            oldp.category = p.category;
            oldp.discount = p.discount;
            oldp.details = p.details;
            oldp.location = p.location;
            oldp.advertisement = p.advertisement;

            //manually change
            // context.Entry(oldp).State = System.Data.Entity.EntityState.Modified;*/
            //context.Entry(oldp).CurrentValues.SetValues(p);
            context.SaveChanges();
            return RedirectToAction("Show");
        }
        public ActionResult Details(int id)
        {
            var p = context.Packages.FirstOrDefault(e => e.packageid == id);
            return View(p);
        }
        public ActionResult Delete(int id)
        {
            var p = context.Packages.FirstOrDefault(e => e.packageid == id);
            return View(p);
        }
        [HttpPost]
        [ActionName("Delete")]
        public ActionResult DeleteP(int id)
        {
            var pr = context.Packages.FirstOrDefault(e => e.packageid == id);
            context.Packages.Remove(pr);
            context.SaveChanges();
            return RedirectToAction("Show");
        }
        



    }
}