using System;
using System.Net;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace MVCEXE_OWL.App_Code
{
    public class AuthenticateNetworkConnectionAttribute
    {
        protected static void NetworkAuthentication(object sender, EventArgs e)
        {
            bool status;
            WebClient client = new WebClient();
            byte[] datasize = null;
            try
            {
                datasize = client.DownloadData("http://www.google.com");
            }
            catch (Exception ex)
            {
            }
            if (datasize != null && datasize.Length > 0)
            {  //lbltxt.Text = "Internet Connection Available.";
                status = true;
            }
            else
            {
                //lbltxt.Text = "Internet Connection Not Available.";
                status = false;
            }
        }


    }
}