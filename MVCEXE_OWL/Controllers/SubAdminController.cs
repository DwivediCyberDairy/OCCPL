using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCEXE_OWL.Models;
using MVCEXE_OWL.App_Code;
using MVCEXE_OWL.Controllers;
using System.Data;
using System.Data.SqlClient;


namespace MVCEXE_OWL.Controllers
{
    [AuthorizeUserSession]

    public class SubAdminController : Controller
    {
        string msg = "";
        OswalNextGenEntities db = new OswalNextGenEntities();

        [HttpGet]
        public ActionResult AddBusinessPlan()
        {
            ShowUserPicAndName();
            BindPostCatStatusAuthorsParentPageTagsCommentStatus();
            //List<OWL_ServicesCategoryMaster> LstBc = db.OWL_ServicesCategoryMaster.Where(bc => bc.IsDel !=true).ToList();
            List<OWL_BusinessServicesMaster> LstBs = db.OWL_BusinessServicesMaster.Where(bc => bc.IsDel != true).ToList();
            //DataSet ;
            return View(LstBs);
        }

        [HttpPost]
        public ActionResult AddBusinessPlan(OWL_BusinessPlanMaster bpm)
        {
            ShowUserPicAndName();
            BindPostCatStatusAuthorsParentPageTagsCommentStatus();
            return View();
        }

        [HttpGet]
        public ActionResult ShowBusinessPlan()
        {

            return View();
        }


        [HttpGet]
        public ActionResult RestoreFreqAskQuestion(int QuestionNo)
        {
            OWL_QuestionMaster faq = db.OWL_QuestionMaster.Find(QuestionNo);
            faq.IsDel = false;
            faq.UpdationDT = DateTime.Now;
            db.Entry(faq);
            db.SaveChanges();
            TempData["Message"] = "Record restored Successfully";
            ShowUserPicAndName();
            BindPostCatStatusAuthorsParentPageTagsCommentStatus();
            return RedirectToAction("FreqAskQuestion", "SubAdmin");
        }

        [HttpGet]
        public ActionResult DeleteFreqAskQuestion(int QuestionNo)
        {
            OWL_QuestionMaster faq = db.OWL_QuestionMaster.Find(QuestionNo);
            faq.IsDel = true;
            faq.UpdationDT = DateTime.Now;
            db.Entry(faq);
            db.SaveChanges();
            TempData["Message"] = "Record deleted Successfully";
            ShowUserPicAndName();
            BindPostCatStatusAuthorsParentPageTagsCommentStatus();
            return RedirectToAction("FreqAskQuestion", "SubAdmin");
        }

        [HttpPost]
        public ActionResult EditFreqAskQuestion(OWL_QuestionMaster faq)
        {
            OWL_QuestionMaster Getfaq = db.OWL_QuestionMaster.Find(faq.QuestionNo);
            try
            {
                Getfaq.SectorType = faq.SectorType;
                Getfaq.Question = faq.Question;
                Getfaq.Answer = faq.Answer;
                Getfaq.CreationDT = DateTime.Now;
                Getfaq.UpdationDT = DateTime.Now;
                Getfaq.CreatedBy = Session["subaid"].ToString();
                //Getfaq.IsDel = false;
                //db.OWL_ResourceMaster.Entry(Getrsm);
                db.Entry(Getfaq);
                db.SaveChanges();
                msg = "Question : " + Getfaq.Question + " Updated Successfully";
            }
            catch
            {
                msg = "Unable to save the record";
            }
            TempData["Message"] = msg;
            ShowUserPicAndName();
            BindPostCatStatusAuthorsParentPageTagsCommentStatus();
            return RedirectToAction("FreqAskQuestion", "SubAdmin");
        }

        [HttpPost]
        public ActionResult FreqAskQuestion(OWL_QuestionMaster faq)
        {
            //OWL_ResourceMaster rm = db.OWL_ResourceMaster.Find(rsm.ResourceName);
            OWL_QuestionMaster rm = db.OWL_QuestionMaster.SingleOrDefault(r => r.Question == faq.Question);
            if (rm == null)
            {
                try
                {
                    faq.CreationDT = DateTime.Now;
                    faq.UpdationDT = DateTime.Now;
                    faq.IsDel = false;
                    faq.CreatedBy = Session["subaid"].ToString();
                    db.OWL_QuestionMaster.Add(faq);
                    db.SaveChanges();
                    msg = "Question saved Successfully ";
                }
                catch
                {
                    msg = "Unable to saved detail";
                }
            }
            else
            {
                msg = "Question already exits ";
            }
            
            ShowUserPicAndName();
            BindPostCatStatusAuthorsParentPageTagsCommentStatus();
            ViewBag.Message = msg;
            List<OWL_QuestionMaster> LstQues = db.OWL_QuestionMaster.OrderByDescending(q => q.CreationDT).ToList();
            return View(LstQues);
        }

        [HttpGet]
        public ActionResult FreqAskQuestion()
        {
            List<OWL_QuestionMaster> LstQues = db.OWL_QuestionMaster.OrderByDescending(q => q.CreationDT).ToList();
            ShowUserPicAndName();
            BindPostCatStatusAuthorsParentPageTagsCommentStatus();
            return View(LstQues);
        }

       /* 
        [HttpGet]
        public ActionResult EditResource(int ResourceId)
        {
            OWL_ResourceMaster rsm = db.OWL_ResourceMaster.Find(ResourceId);
            ///List<OWL_ResourceMaster> LstRsm = db.OWL_ResourceMaster.OrderByDescending(r => r.CreatedOn).ToList();
            //json(rsm,JsonRequestBehavior.AllowGet)
            TempData["response"] = rsm;
            ShowUserPicAndName();
            return RedirectToAction("ResourceManager", "SubAdmin");
        }
        */
        [HttpPost]
        public ActionResult EditResource(OWL_ResourceMaster rsm)
        {
            OWL_ResourceMaster Getrsm = db.OWL_ResourceMaster.Find(rsm.ResourceId);
            try {  
            Getrsm.AuthorizedPerson = rsm.AuthorizedPerson;
            Getrsm.MobileNo = rsm.MobileNo;
            Getrsm.ResourceUrl = rsm.ResourceUrl;
            Getrsm.UpdatedOn = DateTime.Now;
            //db.OWL_ResourceMaster.Entry(Getrsm);
            db.Entry(Getrsm);
            db.SaveChanges();
            msg = "Resource : " + Getrsm.ResourceName + " Updated Successfully";
            }
            catch
            {
                msg = "Unable to save the record";
            }
            TempData["Message"] = msg;
            ShowUserPicAndName();
            return RedirectToAction("ResourceManager", "SubAdmin");
        }

       
        [HttpGet]
        public ActionResult RestoreResource(int ResourceId)
        {
            OWL_ResourceMaster rsm = db.OWL_ResourceMaster.Find(ResourceId);
            rsm.IsDel = false;
            rsm.UpdatedOn = DateTime.Now;
            db.Entry(rsm);
            db.SaveChanges();
            TempData["Message"] = "Record restored Successfully";
            ShowUserPicAndName();
            return RedirectToAction("ResourceManager", "SubAdmin");
        }

        [HttpGet]
        public ActionResult DeleteResource(int ResourceId)
        {
            OWL_ResourceMaster rsm = db.OWL_ResourceMaster.Find(ResourceId);
            rsm.IsDel = true;
            rsm.UpdatedOn = DateTime.Now;
            db.Entry(rsm);
            db.SaveChanges();
            TempData["Message"] = "Record deleted Successfully";
            ShowUserPicAndName();
            return RedirectToAction("ResourceManager", "SubAdmin");
        }

        [HttpGet]
        public ActionResult ResourceManager()
        {
            List<OWL_ResourceMaster> LstRsm = db.OWL_ResourceMaster.OrderByDescending(r => r.CreatedOn).ToList();
            ShowUserPicAndName();
            return View(LstRsm);
        }

        [HttpPost]
        public ActionResult ResourceManager(OWL_ResourceMaster rsm)
        {
            //OWL_ResourceMaster rm = db.OWL_ResourceMaster.Find(rsm.ResourceName);
            OWL_ResourceMaster rm = db.OWL_ResourceMaster.SingleOrDefault(r => r.ResourceName == rsm.ResourceName);
            if (rm == null)
            { 
                try
                {
                    rsm.CreatedOn = DateTime.Now;
                    rsm.UpdatedOn = DateTime.Now;
                    rsm.IsDel = false;
                    db.OWL_ResourceMaster.Add(rsm);
                    db.SaveChanges();
                    msg = "Resource saved Successfully ";
                }
                catch 
                {
                    msg = "Unable to saved detail";
                }
            }
            else
            {
                msg = "Resource name already exits ";
            }
            ViewBag.Message = msg;
            ShowUserPicAndName();
            return View();
        }

        [HttpGet]
        public ActionResult CompleteEnquiry()
        {
            ShowUserPicAndName();
            List<OWL_EnqueryMaster> LstEnqc = db.OWL_EnqueryMaster.OrderByDescending(e => e.EnqDate).Where(e => e.Remark.Length>0 && e.IsDel==false ).ToList();
            return View(LstEnqc);
        }

        [HttpGet]
        public ActionResult PendingEnquiry()
        {
            ShowUserPicAndName();
            List<OWL_EnqueryMaster> LstEnqp = db.OWL_EnqueryMaster.OrderByDescending(e => e.EnqDate).Where(e => e.Remark.Length<=0 && e.IsDel == false).ToList();
            return View(LstEnqp);
        }

        [HttpGet]
        public ActionResult DeleteEnquiry(int EnqId)
        {
           ShowUserPicAndName();
           OWL_EnqueryMaster em = db.OWL_EnqueryMaster.Find(EnqId);
           em.IsDel = true;
           db.Entry(em);
           db.SaveChanges();
           TempData["Message"] = "Record deleted Successfully";
           return RedirectToAction("ShowAllEnquiry", "SubAdmin");
        }

        [HttpGet]
        public ActionResult ShowAllEnquiry()
        {
            ShowUserPicAndName();
            List<OWL_EnqueryMaster> LstEnq = db.OWL_EnqueryMaster.OrderByDescending(e => e.EnqDate).Where(e => e.IsDel == false).ToList();
            return View(LstEnq);
        }

        [HttpGet]
        public ActionResult ShowAllJobPost()
        {
            ShowUserPicAndName();
            List<OWL_JobsPostMaster> LstJpm = db.OWL_JobsPostMaster.OrderByDescending(x => x.PublishedOn).Where(x => x.IsDel == false).ToList();
            return View(LstJpm);
        }

        [HttpGet]
        public ActionResult AddNewJobPost()
        {
            ShowUserPicAndName();
            JobTypeMode();
            BindCountryDocCategoryQualiCityAndJobDesignation();
            BindPostCatStatusAuthorsParentPageTagsCommentStatus();
            return View();
        }

        [HttpPost]
        public ActionResult AddNewJobPost(OWL_JobsPostMaster jpm, string JobTitle, string JobType, string JobLocation, string JobMode, string PostStatus, string PostAuthor)
        {

            if (JobTitle.Length !=0 && JobTitle.Length > 3 && JobType != "" && JobType != "--JobType--" && JobLocation != "" && JobLocation != "--JobLocation--" && PostStatus != "" && PostStatus != "--MarkStatus--")
                {
                    string userid = Session["subaid"].ToString();
                    try {
                        jpm.JobTitle = JobTitle.Replace(" ", "-");
                        jpm.JobType  = int.Parse(JobType);
                        jpm.JobLocation = int.Parse(JobLocation);
                        jpm.Status = int.Parse(PostStatus);
                       //db.OWL_JobsPostMaster.Add(jpm);
                       if (PostAuthor != "")
                        {
                            jpm.PublishedBy = PostAuthor;
                        }
                       else { jpm.PublishedBy = userid; }
                        
                        jpm.PublishedOn = DateTime.Now;
                        jpm.IsDel = false;
                        db.OWL_JobsPostMaster.Add(jpm);
                        db.SaveChanges();
                        msg = "Job post request saved successfully ";
                    } 
                    catch {
                        msg = "Unable to save your job request ";
                    }
                }
                else
                {
                    msg = "Required data missing like(Title,Type,Location,Mode,Status) of the Job";
                }

            ShowUserPicAndName();
            JobTypeMode();
            BindCountryDocCategoryQualiCityAndJobDesignation();
            BindPostCatStatusAuthorsParentPageTagsCommentStatus();
            ViewBag.Message = msg;
            return View();
        }

        [HttpGet]
        public ActionResult DeleteJobApplication(int ApplicationNo)
        {
            OWL_CareersMaster cm = db.OWL_CareersMaster.Find(ApplicationNo);
            cm.IsActive = false;
            db.Entry(cm);
            db.SaveChanges();
            ViewBag.Message = "Record deleted Successfully";
            return RedirectToAction("ShowReceivedJobApplication", "SubAdmin");
        }

        [HttpGet]
        public ActionResult ShowReceivedJobApplication()
        {
            ShowUserPicAndName();
            List<OWL_CareersMaster> LstCM = db.OWL_CareersMaster.OrderByDescending(x => x.RegDate).Where(x => x.IsActive == true).ToList();
            return View(LstCM);
        }

        [HttpGet]
        public ActionResult ShowAllTypePosts()
        { 
            ShowUserPicAndName();
            BindCountryDocCategoryQualiCityAndJobDesignation();
            BindPostCatStatusAuthorsParentPageTagsCommentStatus();
            List<OWL_PostsMaster> LstPM = db.OWL_PostsMaster.OrderByDescending(x => x.PostDate).ToList();
            return View(LstPM);
           
        }

        [HttpGet]
        public ActionResult AddNewPost()
        {
            ShowUserPicAndName();
            BindCountryDocCategoryQualiCityAndJobDesignation();
            BindPostCatStatusAuthorsParentPageTagsCommentStatus();
            return View();
        }

        [HttpPost]
        public ActionResult AddNewPost(OWL_PostsMaster pm, string PostTitle, string PostPassword, string PostAuthor, int CommentStatus)
        {
            string msgFImg = "", NameFImg = "", msgTImg = "", NameTImg="";
            try
            {
                if (PostTitle != " " && PostTitle != "")
                {
                    HttpPostedFileBase FeaturedFile = Request.Files["FeaturedImg"];
                    HttpPostedFileBase ThumbFile = Request.Files["ThumbImg"];
                    FileManager fm = new FileManager();
                    if (FeaturedFile.ContentLength != 0) 
                    {
                        fm.PostedFile = FeaturedFile;
                        fm.FolderName = "Posts_Uploaded_ContentFile";
                        fm.AllowedExtensions = new string[] { ".JPEG", ".png", ".jpg", ".gif" };
                        fm.MaxAllowedFileSizeInKB = 10000;
                        msgFImg = fm.UploadMyFile();
                        NameFImg = fm.FileName;
                    }
                    if (ThumbFile.ContentLength != 0)
                    {
                        fm.PostedFile = ThumbFile;
                        fm.FolderName = "Posts_Uploaded_ContentFile";
                        fm.AllowedExtensions = new string[] { ".JPEG", ".png", ".jpg", ".gif" };
                        fm.MaxAllowedFileSizeInKB = 10000;
                        msgTImg = fm.UploadMyFile();
                        NameTImg = fm.FileName;
                    }
                    if (msgFImg == "SUCCESS" && msgTImg == "SUCCESS" || msgFImg == "" && msgTImg == "" || msgFImg == "SUCCESS" && msgTImg == "" || msgFImg == "" && msgTImg == "SUCCESS")
                    {
                        pm.FeaturedImg = NameFImg;
                        pm.ThumbImg = NameTImg;
                    }
                    if (PostPassword.Length > 0) {
                        Cryptography cg = new Cryptography();
                        string EncryptedPostPass = cg.EncryptMyData(PostPassword);
                        pm.PostPassword = EncryptedPostPass;
                    }
                    if (PostAuthor == "" || PostAuthor == "--Select Author--")
                    {
                        pm.PostAuthor = Session["subaid"].ToString();
                    }
                    if (CommentStatus == 1) { pm.CommentCount = 5; }        /* There now we are passing Static count we will make it as per user selection */
                    pm.PostDate = DateTime.Now;
                    pm.PostTitle = PostTitle;
                    pm.FileFolderName = fm.FolderName;
                    pm.PostName = PostTitle.Replace(" ", "-").ToLower();
                    pm.PostUpdatedOn = DateTime.Now;                    
                    pm.IsDel = false;
                    db.OWL_PostsMaster.Add(pm);
                    db.SaveChanges();
                    msg = "Data Saved Successfully ";
                }
                else
                {
                    msg = "Enter title of Content, So we can manage future request";
                }
            }
            catch
            {
                msg = "Sorry! Unable to save your data, please try again";
            }
            ShowUserPicAndName();
            BindCountryDocCategoryQualiCityAndJobDesignation();
            BindPostCatStatusAuthorsParentPageTagsCommentStatus();
            ViewBag.Message = msg;
            return View();
        }

        [HttpGet]
        public ActionResult DocumentUpload()
        {
            ShowUserPicAndName();
            BindCountryDocCategoryQualiCityAndJobDesignation();
            return View();
        }

        [HttpPost]
        public ActionResult DocumentUpload(OWL_DocumentMaster dm)
        {           
           // string msg = "";
            try
            {
                HttpPostedFileBase assignFile = Request.Files["DocName"];
                FileManager fm = new FileManager();
                fm.PostedFile = assignFile;
                fm.FolderName = "Admin_Uploaded_Document";
                fm.AllowedExtensions = new string[] { ".JPEG", ".png", ".jpg", ".pdf", ".doc", ".docx", ".zip", ".rar" };
                fm.MaxAllowedFileSizeInKB = 10000;
                msg = fm.UploadMyFile();
                if (msg == "SUCCESS")
                {
                    dm.DocUploadedBy = Session["subaid"].ToString();
                    dm.DocUploadedOn = DateTime.Now;
                    dm.DocUpdatedOn = DateTime.Now;
                    dm.DocName = fm.FileName;
                    dm.FolderName = fm.FolderName;
                    dm.DocFileType = fm.FileExtension;
                    dm.DocFileSizeIn_KB = fm.FileSizeInKB;
                    dm.IsDel = false;
                    db.OWL_DocumentMaster.Add(dm);
                    db.SaveChanges();
                    msg = "Document uploaded successfully.";
                }
            }
            catch
            {
                msg = "Sorry! Unable to upload document.";
            }

            ShowUserPicAndName();
            BindCountryDocCategoryQualiCityAndJobDesignation();
            ViewBag.Message = msg;
            return View();
        }

        [HttpGet]
        public ActionResult DocumentDownload()
        {
            ShowUserPicAndName();
            List<OWL_DocumentMaster> LstDM = db.OWL_DocumentMaster.OrderByDescending(x => x.DocUploadedOn).ToList();
            return View(LstDM);
        }
        public FileResult Download(string FolderName, string FileName)
        {
            string path = Server.MapPath("~/Content/" + FolderName + "/" + FileName);
            byte[] bytes = System.IO.File.ReadAllBytes(path);
            return File(bytes, "application/octet-stream", FileName);
        }


        // GET: /SubAdmin/
        [HttpGet]
        public ActionResult Index()
        {
            ShowUserPicAndName();
            BindCountryDocCategoryQualiCityAndJobDesignation();
            return View();
        }

        [HttpGet]
        public ActionResult Dashboard()
        {
            ShowUserPicAndName();
            BindCountryDocCategoryQualiCityAndJobDesignation();
            return View();
        }

        [HttpGet]
        public ActionResult UserProfile()
        {
            string uid = Session["subaid"].ToString();
            OWL_EmployeeMaster em = db.OWL_EmployeeMaster.Find(uid);
            ShowUserPicAndName();
            BindCountryDocCategoryQualiCityAndJobDesignation();
            return View(em);
        }

        [HttpPost]
        public ActionResult UserProfile(OWL_EmployeeDetail emd)
        {
            string uid = Session["subaid"].ToString();

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
            BindCountryDocCategoryQualiCityAndJobDesignation();
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
            BindCountryDocCategoryQualiCityAndJobDesignation();
            return RedirectToAction("UserProfile", "SubAdmin");
        }

        [HttpPost]
        public ActionResult ChangePassword(string UserPassword, string NewUserPassword, string CnfNewUserPassword)
        {
            //string msg = "";
            if (NewUserPassword == CnfNewUserPassword)
            {
                string uid = Session["subaid"].ToString();

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
            BindCountryDocCategoryQualiCityAndJobDesignation();
            return RedirectToAction("UserProfile", "SubAdmin");
        }

        // After trigger this action we need to login again BCZ session has gone to distroy  
        public ActionResult Logout()
        {
            Session.Clear();
            Session.Remove("subaid");
            Session.Abandon();
            return RedirectToAction("/", "Home");
        }

        /* --------======= Non Action Methods Section Start =======---- */

        [NonAction]
        void ShowUserPicAndName()
        {
            string userid = Session["subaid"].ToString();
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
        void JobTypeMode()
        {
            string userid = Session["subaid"].ToString();
            OWL_JobsPostMaster jm = new OWL_JobsPostMaster();
            ViewBag.JobType = db.OWL_JobTypeMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.JobTypeId.ToString(),
                Text = x.JobType,
                Selected = x.JobTypeId == jm.JobType ? true : false
            });
            
            ViewBag.JobMode = db.OWL_JobModeMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.ModeId.ToString(),
                Text = x.JobMode,
                Selected = x.ModeId == jm.JobMode ? true : false

            });

        }

        [NonAction]
        void BindCountryDocCategoryQualiCityAndJobDesignation()
        {
            string userid = Session["subaid"].ToString();
            OWL_EmployeeMaster em = db.OWL_EmployeeMaster.Find(userid);
            OWL_JobsPostMaster jm = new  OWL_JobsPostMaster();
            //for country
            ViewBag.Country = db.OWL_CountryMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.CountryId.ToString(),
                Text = x.CountryName,
                Selected = x.CountryId == em.OWL_EmployeeDetail.Country ? true : false
            });

            ViewBag.JobLocation = db.OWL_CityMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.CityId.ToString(),
                Text = x.CityName,
                //Selected = x.CityId == jm.JobLocation ? true : false
            });
            
            ViewBag.JobDesignation = db.OWL_DesignationMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.DesignationId.ToString(),
                Text = x.DesignationName,
                Selected = x.DesignationId == em.OWL_EmployeeDetail.JobDesignation ? true : false

            });

            ViewBag.Qualification = db.OWL_QualificationMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.QualificationId.ToString(),
                Text = x.QualificationName,
                Selected = x.QualificationId == jm.Qualification ? true : false

            });

            ViewBag.DocCategoryName = db.OWL_DocCategoryMaster.ToList().Select(x => new SelectListItem() 
            {
                Value = x.DocCategoryNo.ToString(),
                Text = x.DocCategoryName,
                //Selected = x.DocCategoryNo == em.OWL_DocumentMaster.Doc ? true : false
                           
            });
       
         }

        [NonAction]
        void BindPostCatStatusAuthorsParentPageTagsCommentStatus()
        {
            string userid = Session["subaid"].ToString();
            OWL_EmployeeMaster em = db.OWL_EmployeeMaster.Find(userid);
            OWL_PostsMaster pm = new OWL_PostsMaster();
            OWL_QuestionMaster qusm = new OWL_QuestionMaster();
            //for PostAuther
            ViewBag.PostAuthor = db.OWL_EmployeeMaster.Where(x => x.UserType == em.UserType).ToList().Select(x => new SelectListItem()
            {
                Value = x.EmpEmail.ToString(),
                Text = x.EmpName,
                Selected = x.EmpEmail == pm.PostAuthor ? true : false
            });

            ViewBag.SectorType = db.OWL_SectorTypeMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.SectorTypeId.ToString(),
                Text = x.SectorType,
                Selected = x.SectorTypeId == qusm.SectorType  ? true : false
            });
            
            ViewBag.PostType = db.OWL_PostTypeMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.PostTypeId.ToString(),
                Text = x.PostType,
                Selected = x.PostTypeId == pm.PostType ? true : false
            });

            ViewBag.PostStatus = db.OWL_StatusListMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.StatusId.ToString(),
                Text = x.StatusValue,
                Selected = x.StatusId == pm.PostStatus ? true : false
            });

            ViewBag.PostParent = db.OWL_PostsMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.Id.ToString(),
                Text = x.PostName,
                Selected = x.Id == pm.Id ? true : false
            });

            ViewBag.CommentStatus = db.OWL_StatusListMaster.ToList().Select(x => new SelectListItem()
            {
                Value = x.StatusId.ToString(),
                Text = x.StatusValue,
                Selected = x.StatusId == pm.CommentStatus ? true : false
            });

            ViewBag.ToPingTags = db.OWL_TagsMaster.ToList().Select(x => new SelectListItem() 
            {
                Value = x.TagId.ToString(),
                Text = x.TagName,
                //Selected = x.TagId = pm.ToPingTags ? true : false 
            });
        }



    }
}
