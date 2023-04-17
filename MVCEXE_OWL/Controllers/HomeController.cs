using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Web.Mvc;
using MVCEXE_OWL.Controllers;
using MVCEXE_OWL.App_Code;
using MVCEXE_OWL.Models;
using System.IO;
using System.Data;

namespace MVCEXE_OWL.Controllers
{
    public class HomeController : Controller
    {
        static HumenDetection.CaptchaDetails cd;
        HumenDetection hd = new HumenDetection();

        string msg = "";
        OswalNextGenEntities db = new OswalNextGenEntities();

        //AuthenticateNetworkConnectionAttribute anc;

        [NonAction]
        public void GetFreqAskQuestion()
        {
            List<OWL_QuestionMaster> LstFaqQM = db.OWL_QuestionMaster.Where(q => q.IsDel !=true).ToList();
            //db.OWL_QuestionMaster.Where(q => q.IsDel != true).ToList().SelectMany(q => new IList(OWL_QuestionMaster) {
            
            //});
        }

        [HttpGet]
        public ActionResult CareersOpening()
        {
            DeptListBindInDdl();
            QualificationAndDesignationListBindInDdl();
            GetCityListBindInDdl();
            GenerateCaptcha();
            List<OWL_JobsPostMaster> Lstjpm = db.OWL_JobsPostMaster.Where(x => x.Status == 1 && x.IsDel == false ).ToList();
            return View(Lstjpm);
        }

        [HttpPost]
        public ActionResult CareersOpening(string ApplicaintName, string ApplicaintEmail, string Gender, string ApplicaintMobile, string DOB, string ApplicaintAddress, string ApplicaintLocation, string ApplicaintPreferedLocation, string Qualification, string DesignationName, string DepartmentName)
        {
            OWL_CareersMaster cm = new  OWL_CareersMaster();
            // Checking no of files injected in Request object  
            if (Request.Files.Count > 0 && ApplicaintEmail != "" && ApplicaintName != "")
            {
                try
                {
                    //  Get all files from Request object  
                    HttpFileCollectionBase files = Request.Files;
                    FileManager fm = new FileManager();
                    //string fname="";
                    for (int i = 0; i < files.Count; i++)
                    {
                        //string path = AppDomain.CurrentDomain.BaseDirectory + "Uploads/";  
                        //string filename = Path.GetFileName(Request.Files[i].FileName);  
                        HttpPostedFileBase resumefile = files[i];
                        fm.PostedFile = resumefile;
                        fm.FolderName = "CareersApplicationResumes";
                        fm.AllowedExtensions = new string[] { ".pdf", ".doc", ".docx", ".zip" };
                        fm.MaxAllowedFileSizeInKB = 5000;
                        msg = fm.UploadMyFile();
                        // Checking for Internet Explorer  
                       /** if (Request.Browser.Browser.ToUpper() == "IE" || Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                        {
                            string[] testfiles = resumefile.FileName.Split(new char[] { '\\' });
                            fname = testfiles[testfiles.Length - 1];
                        }
                        else
                        {
                            fname = resumefile.FileName;
                        }

                        // Get the complete folder path and store the file inside it.  
                        fname = Path.Combine(Server.MapPath("~/Content/CareersApplicationResumes/"), fname);
                        resumefile.SaveAs(fname);
                        * */
                    }

                    if (msg == "SUCCESS")
                    {
                        cm.ApplicaintName = ApplicaintName;
                        cm.Gender = Gender;
                        cm.ApplicaintEmail = ApplicaintEmail;
                        cm.ApplicaintMobile = ApplicaintMobile;
                        //cm.DOB = Convert.ToString(DOB).ToString();
                        cm.ApplicaintAddress = ApplicaintAddress;
                        cm.ApplicaintLocation = int.Parse(ApplicaintLocation);
                        cm.ApplicaintPreferedLocation = int.Parse(ApplicaintPreferedLocation);
                        cm.Qualification = int.Parse(Qualification);
                        cm.DesignationName = int.Parse(DesignationName);
                        cm.DepartmentName = int.Parse(DepartmentName);
                        cm.AttachmentFolderName = fm.FolderName;
                        cm.AttachedResume = fm.FileName;
                        cm.AttachmentExtension = fm.FileExtension;
                        cm.BusinessName = "OCCPL";
                        cm.RegDate = DateTime.Now;
                        cm.Status = 1;
                        cm.IsActive = true;
                        db.OWL_CareersMaster.Add(cm);
                        db.SaveChanges();
                        // Returns message that successfully uploaded  
                        msg = "Resume Uploaded Successfully!";
                    }
                }
                catch (Exception ex)
                {
                    msg = "Error occurred. Error details: " + ex.Message ;
                }
            }
            else
            {
                msg = "No file selected & Some Other required detail are blank";
            }

            return Json(msg, JsonRequestBehavior.AllowGet);
        }
  

        [HttpGet]
        public ActionResult Registration()
        {
            UserTypeBindInDdl();
            DeptListBindInDdl(); 
            QualificationAndDesignationListBindInDdl();
            GetCityListBindInDdl();
            GenerateCaptcha();
            return View();
        }

        [HttpPost]
        public ActionResult Registration(OWL_EmployeeMaster em, string UserPassword, string UserConfPassword, string CaptchaCode)
        {
            try
            {
                if (cd.CaptchaCode == CaptchaCode)
                {
                    if (UserPassword.Length >= 3 && UserPassword == UserConfPassword)
                    {
                        //To validate file
                       /* HttpPostedFileBase userfile = Request.Files["UserPic"];
                        FileManager fm = new FileManager();
                        fm.PostedFile = userfile;
                        fm.AllowedExtensions = new string[] { ".jpg", ".png", ".jpeg", ".jfif" };
                        fm.FolderName = "User_Profile_Pics";
                        msg = fm.UploadMyFile(); //validate & upload
                        if (msg == "SUCCESS" || msg == "Please choose a file.")
                        {
                            */
                        Cryptography cg = new Cryptography();
                        string EncryptedPass = cg.EncryptMyData(UserPassword);
                            //database code
                            em.AddedOn = DateTime.Now;
                            em.UpdatedOn = DateTime.Now;
                            em.UserPassword = EncryptedPass;
                            em.IsDel = false;
                            /*if (msg == "SUCCESS")
                                um.Picture_File_Name = fm.FileName;
                             */
                            db.OWL_EmployeeMaster.Add(em);
                            //setting login info
                            OWL_LoginMaster lm = new OWL_LoginMaster();
                            lm.UserId = em.EmpEmail;//PK of tbl
                            lm.UserPassword = EncryptedPass;
                            lm.UserStatus = true;      //ye humko false karna h
                            lm.LoginCount = 0;
                            lm.UserType = em.UserType;    //"ADMIN" or "Affilate kux kis zone se kar rahe h registration tab esa karna h."
                            db.OWL_LoginMaster.Add(lm);
                            OWL_EmployeeDetail emd = new OWL_EmployeeDetail();
                            emd.EmpEmail = em.EmpEmail; //PK of tbl
                            emd.UpdatedOn = DateTime.Now;
                            db.OWL_EmployeeDetail.Add(emd);
                            db.SaveChanges();
                            msg = "Congratulatuions! you are registered successfully.";
                            //To send Email Alert
                            MyEmailSender es = new MyEmailSender();
                            es.SendTo = em.EmpEmail;
                            es.Subject = "Welcome to OSWAL COMPUTERS & CONSULTAINTS";
                            es.Message = "Hello " + em.EmpName + ",\n\n Welcome to OCCPL. You are successfully registerd in our web portal. \nYour user id is: <u>" + em.EmpEmail + "</u> and \nPassword is: <u>" + UserPassword + "</u>\n\nRegrads\n Team OCCPL - Tech";
                            es.SendEmail();

                        /*} */
                    }
                    else
                    {
                        msg = "Password and confirm password must be same.";
                    }
                }
                else
                {
                    msg = "Invalid Captcha Code. Please try again.";
                }
            }
            catch
            {
                msg = "Due to some technical issue; we are unable to create your account right now.";
            }

            UserTypeBindInDdl();
            DeptListBindInDdl();
            QualificationAndDesignationListBindInDdl();
            GetCityListBindInDdl();
            GenerateCaptcha();
            ViewBag.Message = msg;
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            UserTypeBindInDdl();
            return View();
        }

        [HttpPost]
        public ActionResult Login(OWL_LoginMaster lm)
        {
            /*LoginMaster lmdb = db.LoginMasters.Find(lm.UserId);
            if (lmdb!=null)
            {
                if(lmdb.User_Password==lm.User_Password)
                {
                    if(lmdb.User_Type==lm.User_Type)
                    {
                        return RedirectToAction("Dashboard", "User");
                    }
                    else
                    {
                        msg = "Invalid User Type. Please try again.";
                    }
                }
                else
                {
                    msg = "Invalid Password please try again.";
                }
            }
            else
            {
                msg = "Invalid User Id. Please try again.";
            }
            ViewBag.Message = msg; For Single Record ke liye.*/
            //LoginMaster lmdb = db.LoginMasters.SingleOrDefault(x => x.UserId == lm.UserId && x.User_Password == lm.User_Password && x.User_Type == lm.User_Type);
            OWL_LoginMaster lmdb = db.OWL_LoginMaster.SingleOrDefault(x => x.UserId == lm.UserId && x.UserType == lm.UserType);
            if (lmdb != null)
            {
                Cryptography cg = new Cryptography();
                string DecryptedPass = cg.DecryptMyData(lmdb.UserPassword);
                if (lm.UserPassword == DecryptedPass)
                {
                    if (lmdb.UserStatus == true)
                    {
                        //Create log of login in table
                        lmdb.LastLogin_DT = DateTime.Now;
                        lmdb.LoginCount = lmdb.LoginCount + 1;
                        db.Entry(lmdb);
                        db.SaveChanges();
                        if (lmdb.UserType == 1)
                        {
                            Session["eid"] = lmdb.UserId;//pk
                            return RedirectToAction("Dashboard", "Employee");
                        }
                        else if (lmdb.UserType == 2)
                        {
                            Session["affid"] = lmdb.UserId;//pk
                            return RedirectToAction("Dashboard", "Affilate");
                        }
                        else if (lmdb.UserType == 3)
                        {
                            Session["consultid"] = lmdb.UserId;//pk
                            return RedirectToAction("Dashboard", "Consultaint");
                        }
                        else if (lmdb.UserType == 6)
                        {
                            Session["subaid"] = lmdb.UserId;//pk
                            return RedirectToAction("Dashboard", "SubAdmin");
                        }
                        else
                        {
                            Session["guestid"] = lmdb.UserId;//pk
                            return RedirectToAction("Dashboard", "Guest");
                        }

                    }
                    else
                    {
                        msg = "Sorry! Your account is suspended.";
                    }
                }
                else
                    msg = "Invalid Password. please try again.";
            }
            else
            {
                //msg = "Invalid UserId or password.";
                msg = "Invalid UserId or User Type.";
            }
            
            UserTypeBindInDdl();
            ViewBag.Message = msg;
            return View();
        }


        // GET: /Home/

        public ActionResult Index()
        {

            //GetCountryListBindInDdl();
            List<OWL_QuestionMaster> LstFaqQM = db.OWL_QuestionMaster.Where(q => q.IsDel != true).ToList();
            GetFreqAskQuestion();
            return View(LstFaqQM);
        }

        public ActionResult Blog()
        {   
            return View();
        }

        public ActionResult BlogDetail()
        {

            return View();
        }

        public ActionResult PortfolioDetails()
        {
            return View();
        }

        public ActionResult InnerPage()
        {
            return View();
        }

        public ActionResult Services()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Enquiry()
        {
            //GetCountryListBindInDdl();
            return View();
        }

        /* [HttpPost]
         public ActionResult Enquiry(OWL_EnqueryMaster em)
         {
             DateTime curTime = DateTime.Now;
             try
             {
                 em.EnqDate = curTime;
                 db.OWL_EnqueryMaster.Add(em);
                 db.SaveChanges();
                 msg = "Okay";
             }
             catch
             {
                 msg = "Enquery not saved , please try after some time";
             }
             ViewBag.Message = msg;
             return View();
         }

         */


        /*------======= AJAX Methods Section Start =======------*/

        public JsonResult SaveEnquiryByAjax(OWL_EnqueryMaster em)
        {
            DateTime curTime = DateTime.Now;
            //OWL_EnqueryMaster em = new OWL_EnqueryMaster();
            if(em.Name != "" && em.Email != "" && em.Subject != "")
            { 
                try
                {
                    em.EnqDate = curTime;
                    em.IsDel = false;
                    db.OWL_EnqueryMaster.Add(em);
                    db.SaveChanges();
                    msg = "Request Saved successfully";
                }
                catch
                {
                    msg = "Record Not Saved";
                }
            }
            else
            { 
                msg = "Provide Required Details"; 
            }
            ViewBag.Message = msg;
            return Json(msg, JsonRequestBehavior.AllowGet);
        }

        /*------======= AJAX Methods Section End =======------*/ 


        /*-------=======  Non Action Method Section code Start =======------- */
        
        [NonAction]
        void UserTypeBindInDdl()
        {
            ViewBag.UserType = db.OWL_UserMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.UserTypeId.ToString(),
                Text = x.UserTypeName
            });
        }

        [NonAction]
        void DeptListBindInDdl()
        {
            ViewBag.EmpDept = db.OWL_DepartmentMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.DepartmentId.ToString(),
                Text = x.DepartmentName
            });
        }
       
        [NonAction]
        void QualificationAndDesignationListBindInDdl()
        {
            ViewBag.Qualification = db.OWL_QualificationMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.QualificationId.ToString(),
                Text = x.QualificationName
            });

            ViewBag.DesignationName = db.OWL_DesignationMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.DesignationId.ToString(),
                Text = x.DesignationName
            });
        }
         
        [NonAction]
        void GetCityListBindInDdl()
        {
            ViewBag.City = db.OWL_CityMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.CityId.ToString(),
                Text = x.CityName
            });
        }

        [NonAction]
        void GetCountryListBindInDdl()
        {
            ViewBag.CountryId = db.OWL_CountryMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.CountryId.ToString(),
                Text = x.CountryName
            });
        }


        [NonAction]
        void GenerateCaptcha()
        {
            cd = hd.GenerateNewCaptcha();
            ViewBag.Img = cd.FolderName + "/" + cd.CaptchaImageName;
        }
        //to get new captcha image using Ajax
        public JsonResult GetnewCaptchaImage()
        {
            GenerateCaptcha();
            string s = "/Content/" + cd.FolderName + "/" + cd.CaptchaImageName;
            return Json(s, JsonRequestBehavior.AllowGet);
        }

        /*  Non Action Method Section code End */
    }
}
