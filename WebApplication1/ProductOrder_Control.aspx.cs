using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ProductRoder_Control : BasePage
    {
        public string CreateProductOrder()
        {
            Random ro = new Random();//得到随机数 
            string OdNo = System.DateTime.Now.Year.ToString()
            + System.DateTime.Now.Month.ToString()
            + System.DateTime.Now.Day.ToString()
            + System.DateTime.Now.Hour.ToString()
            + System.DateTime.Now.Minute.ToString()
            + System.DateTime.Now.Second.ToString()
            + ro.Next(10000).ToString();//订单号(年月日时分妙随机数10000)
            return OdNo;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}