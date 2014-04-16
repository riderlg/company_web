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
   
    public partial class Prouduct : System.Web.UI.Page
    {
        public String productImg { get; set; }
        public String productInfo { get; set; }
        public String productName { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            rptRootUnit.DataSource = GetRootUnit();
            rptRootUnit.DataBind();
            GetProductInfo();
        }

        protected void GetProductInfo(int UID)
        {
            if (UID <= 0)
                return;
            String strsql = "select name,description,img from product where UID="+UID;
            DataSet data= SqlHelper.ExecuteDataSet(CommandType.Text, strsql);
            productName = data.Tables[0].Rows[0][0].ToString();
            productInfo = data.Tables[0].Rows[0][1].ToString();
            productImg = data.Tables[0].Rows[0][2].ToString();
        }

        protected void repeater_ItemDataBind(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem ||
                                   e.Item.ItemType == ListItemType.Item)
            {
                Repeater rpt = (Repeater)e.Item.FindControl("rptSubUnit");
                if (rpt != null && e.Item.DataItem != null)
                {

                    //获取父部门ID
                    DataRow itemRow = (e.Item.DataItem as DataRowView).Row;

                    rpt.DataSource = GetSubUnits(Convert.ToInt32(itemRow["UID"]));
                    rpt.DataBind();
                }
            }
        }

        //获取数据库
        private DataTable GetRootUnit()
        {
            return GetDataFromDB("select * from pro_category");
        }

        private DataTable GetSubUnits(int unitID)
        {
            return GetDataFromDB("select * from product where categoryUID = " + unitID);
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