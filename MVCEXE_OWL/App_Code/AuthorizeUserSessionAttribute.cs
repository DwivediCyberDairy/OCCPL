using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace MVCEXE_OWL.App_Code
{
    public class AuthorizeUserSessionAttribute:AuthorizeAttribute
    {
        //To check that the user is valid or not
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            bool status;
            if (httpContext.Session["eid"] == null)
                status = false;
            if (httpContext.Session["subaid"] == null)
                status = false;     
            else
                status = true;
            return status;
        }

        //To handle unauthorize user
        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            /*filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary()
            {
                {"action","Login" },
                {"controller","General" },
            });*/
            filterContext.Result = new RedirectResult("/Home/Login");
        }
    }
}