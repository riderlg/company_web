using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class test : BasePage
    {
        public String UserName { get; set; }
        public String UserEmail { get; set; }
        public String UserTelephone { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            UserName = (String)Session["UserName"];
        }
    }
}