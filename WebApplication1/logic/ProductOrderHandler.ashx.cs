using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Newtonsoft.Json.Linq;

namespace WebApplication1
{
    /// <summary>
    /// ProductOrderHandler 的摘要说明
    /// </summary>
    public class ProductOrderHandler : BaseHandler
    {
        protected static NLog.Logger Log
        {
            get { return NLog.LogManager.GetCurrentClassLogger(); }
        }
       
        public void LoadMessage()
        {
            JArray data = new JArray();
            try
            {
                String strSql = "SELECT *  FROM [dbo].[View_Product_Order_Info] WHERE status = @status ORDER BY [datetime] DESC";
                SqlParameter[] p = {
                    new SqlParameter("@status", BaseContext.Request["status"])
                                   };
                SqlDataReader sdr = SqlHelper.ExecuteReader(CommandType.Text, strSql, p);
                while (sdr.Read())
                {
                    data.Add(new JObject(
                        new JProperty("datetime", sdr["datetime"].ToString()),
                        new JProperty("order_num", sdr["order_num"].ToString()),
                        new JProperty("name", sdr["name"].ToString()),
                        new JProperty("product_name", sdr["product_name"].ToString()),
                         new JProperty("telephone", sdr["telephone"].ToString()),
                        new JProperty("email", sdr["email"].ToString()),
                        new JProperty("product_amount", Convert.ToInt32(sdr["product_amount"])),
                        new JProperty("product_UID", Convert.ToInt32(sdr["product_UID"])),
                        new JProperty("status", Convert.ToInt32(sdr["status"]))
                        ));
                }
                BaseContext.Response.Clear();
                BaseContext.Response.Write(data.ToString());
            }
            catch (System.Exception ex)
            {
                Log.Error(ex);
                BaseContext.Response.Write(ex);
            }
        }

        public void SetProcessed()
        {
            JObject json = new JObject(
                           new JProperty("state", "ok"),
                           new JProperty("error", null)
                       );
            try
            {
                SqlParameter[] p = {
                    new SqlParameter("@order_num", BaseContext.Request["order_num"])
                };
                SqlHelper.ExecteNonQuery(CommandType.StoredProcedure, "SET_PRO_ORDER_PROCESSED", p);
                BaseContext.Response.Write(json);
            }
            catch (System.Exception ex)
            {
                Log.Error(ex);
                json["state"] = "error";
                json["error"] = ex.ToString();
                BaseContext.Response.Write(json);
            }
        }

        public void AddProductOrder()
        {
            JObject json = new JObject(
                           new JProperty("state", "ok"),
                           new JProperty("error", null)
                       );
            try
            {
                String strSql = "INSERT INTO [dbo].[pro_order] (" +
                "datetime, order_num, name,product_UID,telephone,email,product_amount,status) VALUES (" +
                "@datetime, @order_num, @name,@product_UID,@telephone, @email, @product_amount, @status)";
             
                SqlParameter[] p = {
                    new SqlParameter("@datetime", BaseContext.Request["datetime"]),
                    new SqlParameter("@order_num", BaseContext.Request["order_num"]),
                    new SqlParameter("@name", BaseContext.Request["name"]),
                    new SqlParameter("@product_UID", BaseContext.Request["product_UID"]),
                    new SqlParameter("@telephone", BaseContext.Request["telephone"]),
                    new SqlParameter("@email", BaseContext.Request["email"]),
                    new SqlParameter("@product_amount", BaseContext.Request["product_amount"]),
                    new SqlParameter("@status", Convert.ToInt32(0))
                 };
                SqlHelper.ExecteNonQuery(CommandType.Text, strSql, p);
                BaseContext.Response.Write(json);
            }
            catch (System.Exception ex)
            {
                Log.Error(ex);
                json["state"] = "error";
                json["error"] = ex.ToString();
                BaseContext.Response.Write(json);
            }
        }

        public void DelProductOrder()
        {
            JObject json = new JObject(
                        new JProperty("state", "ok"),
                        new JProperty("error", null)
                    );
            try
            {
                SqlParameter[] p = {
                    new SqlParameter("@order_num", BaseContext.Request["order_num"])
                };
                SqlHelper.ExecteNonQuery(CommandType.StoredProcedure, "DELETE_PRO_ORDER", p);
                BaseContext.Response.Write(json);
            }
            catch (System.Exception ex)
            {
                Log.Error(ex);
                json["state"] = "error";
                json["error"] = ex.ToString();
                BaseContext.Response.Write(json);
            }
        }
    }
}