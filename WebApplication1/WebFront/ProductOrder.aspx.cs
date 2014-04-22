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
    public partial class ProductOrder : System.Web.UI.Page
    {
        
        public static string GetOrderNumber()
        {
            string Number = DateTime.Now.ToString("yyMMddHHmmss");//yyyyMMddHHmmssms
            return Number + Next(1000, 1).ToString();
        }

        private static int Next(int numSeeds, int length)
        {
            // Create a byte array to hold the random value.  
            byte[] buffer = new byte[length];
            // Create a new instance of the RNGCryptoServiceProvider.  
            System.Security.Cryptography.RNGCryptoServiceProvider Gen = new System.Security.Cryptography.RNGCryptoServiceProvider();
            // Fill the array with a random value.  
            Gen.GetBytes(buffer);
            // Convert the byte to an uint value to make the modulus operation easier.  
            uint randomResult = 0x0;//这里用uint作为生成的随机数  
            for (int i = 0; i < length; i++)
            {
                randomResult |= ((uint)buffer[i] << ((length - 1 - i) * 8));
            }
            // Return the random number mod the number  
            // of sides. The possible values are zero-based  
            return (int)(randomResult % numSeeds);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            rptRootUnit.DataSource = GetRootUnit();
            rptRootUnit.DataBind();
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