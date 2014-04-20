using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.WebFront
{
    public partial class NewsInfo : System.Web.UI.Page
    {
        //protected int num = 0;
        protected String NewsContent;
        protected String NewsTitle;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Request["type"]) == 1)
                GetNewsInfo(Convert.ToInt32(Request["ID"])); 
            else
                GetAnnocementInfo(Convert.ToInt32(Request["ID"])); 
        }

        protected void GetAnnocementInfo(int UID)
        {
            if (UID <= 0)
                return;
            String strsql = "select datetime,msg from announcement where UID=" + UID;
            DataSet data = SqlHelper.ExecuteDataSet(CommandType.Text, strsql);
            //NewsTitle = data.Tables[0].Rows[0][0].ToString();
            NewsContent = data.Tables[0].Rows[0][1].ToString();
            NewsTitle = "公告信息";
        }

        protected void GetNewsInfo(int UID)
        {
            if (UID <= 0)
                return;
            String strsql = "select datetime,title,msg from news where UID=" + UID;
            DataSet data = SqlHelper.ExecuteDataSet(CommandType.Text, strsql);
            //NewsTitle = data.Tables[0].Rows[0][0].ToString();
            NewsTitle = data.Tables[0].Rows[0][1].ToString();
            NewsContent = data.Tables[0].Rows[0][2].ToString();
        }
    }
}