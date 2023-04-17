using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCEXE_OWL.App_Code;
using MVCEXE_OWL.Models;
using MVCEXE_OWL.Controllers;

namespace MVCEXE_OWL.Controllers
{
    [AuthorizeUserSession]

    public class EmployeeController : Controller
    {
        string msg = "";
        OswalNextGenEntities db = new OswalNextGenEntities();
        //
        // GET: /Employee/
        public ActionResult Index()
        {
            ShowUserPicAndName();
            BindCountryAndJobDesignation();
            return View();
        }

        
        [HttpGet]
        public ActionResult Dashboard()
        {
            ShowUserPicAndName();
            BindCountryAndJobDesignation();
            return View();
        }

        [HttpGet]
        public ActionResult UserProfile()
        {
            string uid = Session["eid"].ToString();
            OWL_EmployeeMaster em = db.OWL_EmployeeMaster.Find(uid);
            ShowUserPicAndName();
            BindCountryAndJobDesignation();
            return View(em);
        }

        [HttpPost]
        public ActionResult UserProfile(OWL_EmployeeDetail emd)
        {
            string uid = Session["eid"].ToString();
            
                HttpPostedFileBase NewImageFile = Request.Files["ProfilePic"];
                FileManager fm = new FileManager();
                fm.AllowedExtensions = new string[] { ".jpg", ".png", ".jpeg", ".jfif" };
                fm.FolderName = "User_Profile_Pics";
                fm.MaxAllowedFileSizeInKB = 150;
                fm.PostedFile = NewImageFile;
                string msg = fm.UploadMyFile();
                OWL_EmployeeDetail emddb = db.OWL_EmployeeDetail.Find(emd.EmpEmail);
                OWL_EmployeeMaster emdb = db.OWL_EmployeeMaster.Find(uid);
                if (msg == "SUCCESS")
                {
                    emdb.OWL_EmployeeDetail.ProfilePic = fm.FileName;

                }
                if (msg == "Please choose a file." || msg == "SUCCESS")
                {
                    //emdb.EmpName = emd.OWL_EmployeeMaster.EmpName;
                    //emdb.Gender = emd.OWL_EmployeeMaster.Gender;
                    //emdb.UpdatedOn = DateTime.Now;
                    //db.Entry(emdb);
                    

                    emdb.OWL_EmployeeDetail.Address = emd.Address;
                    emdb.OWL_EmployeeDetail.About = emd.About;
                    emdb.OWL_EmployeeDetail.CompanyName = emd.CompanyName;
                    emdb.OWL_EmployeeDetail.JobDesignation = emd.JobDesignation;
                    emdb.OWL_EmployeeDetail.Country = emd.Country;
                    emdb.OWL_EmployeeDetail.Phone = emd.Phone;
                    emdb.OWL_EmployeeDetail.TwitterProfileUrl = emd.TwitterProfileUrl;
                    emdb.OWL_EmployeeDetail.FacebookProfileUrl = emd.FacebookProfileUrl;
                    emdb.OWL_EmployeeDetail.InstagramProfileUrl = emd.InstagramProfileUrl;
                    emdb.OWL_EmployeeDetail.LinkedinProfileUrl = emd.LinkedinProfileUrl;
                    emdb.OWL_EmployeeDetail.UpdatedOn = DateTime.Now;
                    db.Entry(emdb);
                    db.SaveChanges();
                    msg = "Your profile updated successfully.";
                }
            ShowUserPicAndName();
            BindCountryAndJobDesignation();
            ViewBag.Message = msg;
            /* string uid = Session["eid"].ToString();
            OWL_EmployeeMaster em = db.OWL_EmployeeMaster.Find(uid); */
            OWL_EmployeeMaster umNew = db.OWL_EmployeeMaster.Find(uid);
            return View(umNew);
            
        }


        [HttpGet]
        public ActionResult ChangePassword()
        {
            ShowUserPicAndName();
            BindCountryAndJobDesignation();
            return RedirectToAction("UserProfile", "Employee");
        }

        [HttpPost]
        public ActionResult ChangePassword(string UserPassword, string NewUserPassword, string CnfNewUserPassword)
        {
            //string msg = "";
            if (NewUserPassword == CnfNewUserPassword)
            {
                string uid = Session["eid"].ToString();
               
                OWL_LoginMaster lm = db.OWL_LoginMaster.Find(uid);
                Cryptography cg = new Cryptography();
                string DecrPass = cg.DecryptMyData(lm.UserPassword);
                if (UserPassword == DecrPass)
                {
                    string EncrPass = cg.EncryptMyData(NewUserPassword);
                    lm.UserPassword = EncrPass;
                    db.Entry(lm);
                    //save pass in master record 
                    OWL_EmployeeMaster em = db.OWL_EmployeeMaster.Find(uid);
                    em.UserPassword = EncrPass;
                    db.SaveChanges();
                    msg = "Password Changed Successfully";
                }
            }
            else
            {
                msg = "New password and confirm new pass must be same";
            }
            ViewBag.Message = msg;

            ShowUserPicAndName();
            BindCountryAndJobDesignation();
            return RedirectToAction("UserProfile", "Employee");
        }

     // After trigger this action we need to login again BCZ session has gone to distroy  
        public ActionResult Logout()
        {
            Session.Clear();
            Session.Remove("eid");
            Session.Abandon();
            return RedirectToAction("/","Home");
        }


        /* --------======= Non Action Methods Section Start =======---- */ 

        [NonAction]
        void ShowUserPicAndName()
        {
            string userid = Session["eid"].ToString();
            OWL_EmployeeMaster em = db.OWL_EmployeeMaster.Find(userid);
            if (em.OWL_EmployeeDetail.ProfilePic != null)    //null nahi h to anader aayega yani ki kux na kus h. null hoga to else id ke pass jayega.
                ViewBag.UserPicName = em.OWL_EmployeeDetail.ProfilePic;
                
            else if (em.Gender.ToUpper() == "MALE")
                ViewBag.UserPicName = "male.png";
            else
                ViewBag.UserPicName = "female.png";
            ViewBag.UserName = em.EmpName;
            //ViewBag.JobDesignationSP = em.OWL_EmployeeDetail.JobDesignation;
            ViewBag.JobDesignationSP = db.OWL_DesignationMaster.Where(x => x.DesignationId == em.OWL_EmployeeDetail.JobDesignation).ToList().SingleOrDefault();
            
             
        }



        [NonAction]
        void BindCountryAndJobDesignation()
        {
            string userid = Session["eid"].ToString();
            OWL_EmployeeMaster em = db.OWL_EmployeeMaster.Find(userid);
            //for city
            ViewBag.Country = db.OWL_CountryMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.CountryId.ToString(),
                Text = x.CountryName,
                Selected = x.CountryId == em.OWL_EmployeeDetail.Country ? true : false
            });
            //for area /*  Where(x => x.DesignationId == em.OWL_EmployeeDetail.JobDesignation ). before ToList we can apply condition if we have any relation mapping */
            ViewBag.JobDesignation = db.OWL_DesignationMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.DesignationId.ToString(),
                Text = x.DesignationName,
                Selected = x.DesignationId == em.OWL_EmployeeDetail.JobDesignation ? true : false

            });
        }
        /*
        public JsonResult GetAreaUsingAJAX(int CityId)
        {
            db.Configuration.ProxyCreationEnabled = false; //yaha pr data banta rahata h use rokne ke liye hun confifuration ki ProxyCreationEnabled ko false karna padta h jisse bar bar data nahi banega or table me add ho jayega jayada data aane pr ye nahi add kara pata h bar bar data aane pr. Dropdown karte time ye jaruri h
            List<AreaMaster> LstArea = db.AreaMasters.Where(am => am.Related_City_Id == CityId).ToList();
            return Json(LstArea, JsonRequestBehavior.AllowGet);
        }
        */

        /* --------======= Non Action Methods Section End =======---- */ 
        
    }
}
