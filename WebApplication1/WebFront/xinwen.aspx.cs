using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.WebFront
{
    public partial class xinwen : System.Web.UI.Page
    {
        protected int num = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
        }
        private void BindData()
        {
            int page = 1;


            if (HttpContext.Current.Request.QueryString["page"] == "" || HttpContext.Current.Request.QueryString["page"] == null)
            {
                page = 1;
            }
            else
            {
                page = int.Parse(HttpContext.Current.Request.QueryString["page"]);
            }


           this.AspNetPager2.RecordCount = GetCount();
            this.NewsPost.DataSource = GetNews(page);
            this.NewsPost.DataBind();

            this.AspNetPager2.CustomInfoHTML = string.Format("", AspNetPager2.CurrentPageIndex, AspNetPager2.PageCount, AspNetPager2.RecordCount, AspNetPager2.PageSize);
        }
        protected void AspNetPager2_PageChanged(object sender, EventArgs e)
        { 
            BindData();
        }

        /// <summary>
        /// </summary>
        /// <param name="n"></param>
        /// <returns></returns>
        public int getNum(int n)
        {
            int Nums = n + num;
            return Nums;
        }

        private DataTable GetNews(int page)
        {
            String sqlStr = "select top " + AspNetPager2.PageSize + " * from news where status = 1 and UID not in (select top " + AspNetPager2.PageSize * (page - 1) + " UID from news where status = 1 order by datetime DESC) order by datetime DESC ";
            return GetDataFromDB(sqlStr);
        }

        private int GetCount()
        {
            int counte;
            String sqlStr = "select COUNT(*) from news where status = 1";
            string strConn = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strConn);
            counte = Convert.ToInt32(SqlHelper.ExecuteScalar(CommandType.Text, sqlStr, null));
            return counte;
        }


        private DataTable GetDataFromDB(string query)
        {
            DataTable table = new DataTable();

            string strConn = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(table);
            return table;
        }
    }
}