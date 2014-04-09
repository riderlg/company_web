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
    /// MessageHandler 的摘要说明
    /// </summary>
    public class MessageHandler : BaseHandler
    {

        protected static NLog.Logger Log
        {
            get { return NLog.LogManager.GetCurrentClassLogger(); }
        }

        public void DeleteMsg()
        {
            JObject json = new JObject(
                        new JProperty("state", "ok"),
                        new JProperty("error", null)
                    );
            try
            {
                var UID = BaseContext.Request["UID"];
                SqlParameter[] p = {
                    new SqlParameter("@UID", UID)
                };
                SqlHelper.ExecteNonQuery(CommandType.StoredProcedure, "DELETE_MSG", p);
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

        public void AddMessage()
        {
            JObject json = new JObject(
                        new JProperty("state", "ok"),
                        new JProperty("error", null)
                    );
            try
            {
                var UID = BaseContext.Request["UID"];
                SqlParameter[] p = {
                    new SqlParameter("@datetime", BaseContext.Request["datetime"]),
                    new SqlParameter("@email", BaseContext.Request["email"]),
                    new SqlParameter("@msg", BaseContext.Request["msg"])
                };
                SqlHelper.ExecteNonQuery(CommandType.StoredProcedure, "ADD_MSG", p);
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

        public void LoadMessage()
        {
            JArray data = new JArray();
            try
            {
                String strSql = "SELECT * FROM [dbo].[msg_content] ORDER BY [datetime] DESC";
                SqlDataReader sdr = SqlHelper.ExecuteReader(CommandType.Text, strSql);
                while (sdr.Read())
                {
                    data.Add(new JObject(
                        new JProperty("email", sdr["email"].ToString()),
                        new JProperty("msg", sdr["msg"].ToString()),
                       new JProperty("datetime", sdr["datetime"].ToString()),
                       new JProperty("UID", sdr["UID"].ToString())
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
    }
}