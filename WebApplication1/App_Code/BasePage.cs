using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace WebApplication1
{
    public class BasePage : Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}