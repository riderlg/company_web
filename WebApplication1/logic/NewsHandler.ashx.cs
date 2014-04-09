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
    /// NewsHandler 的摘要说明
    /// </summary>
    public class NewsHandler : BaseHandler
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
                String strSql = "SELECT * FROM [dbo].[news] ORDER BY [datetime] DESC";
                SqlDataReader sdr = SqlHelper.ExecuteReader(CommandType.Text, strSql);
                while (sdr.Read())
                {
                    data.Add(new JObject(
                        new JProperty("title", sdr["title"].ToString()),
                        new JProperty("msg", sdr["msg"].ToString()),
                       new JProperty("datetime", sdr["datetime"].ToString()),
                       new JProperty("statusStr", Convert.ToInt32(sdr["status"])==1?"显示":"隐藏"),
                       new JProperty("status", Convert.ToInt32(sdr["status"])),
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


        public void DelNews()
        {
            JObject json = new JObject(
                        new JProperty("state", "ok"),
                        new JProperty("error", null)
                    );
            try
            {
                SqlParameter[] p = {
                    new SqlParameter("@UID", BaseContext.Request["UID"])
                };
                SqlHelper.ExecteNonQuery(CommandType.StoredProcedure, "DELETE_NEWS", p);
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

        public void EditNews()
        {
            JObject json = new JObject(
                       new JProperty("state", "ok"),
                       new JProperty("error", null)
                   );
            try
            {
                SqlParameter[] p = {
                    new SqlParameter("@datetime", BaseContext.Request["datetime"]),
                    new SqlParameter("@msg", BaseContext.Request["msg"]),
                    new SqlParameter("@title", BaseContext.Request["title"]),
                    new SqlParameter("@status", BaseContext.Request["status"]),
                    new SqlParameter("@UID", BaseContext.Request["UID"])
                };
                SqlHelper.ExecteNonQuery(CommandType.StoredProcedure, "EDIT_NEWS", p);
                BaseContext.Response.Write(json);
            }
            catch (System.Exception ex)
            {
                Log.Error(ex);
                json["state"] = "error";
                json["error"] = ex.Message;
                BaseContext.Response.Write(json);
            }
        }

        public void AddNews()
        {
            JObject json = new JObject(
                        new JProperty("state", "ok"),
                        new JProperty("error", null),
                        new JProperty("UID", null)
                    );
            try
            {
                SqlParameter[] p = {
                    new SqlParameter("@datetime", BaseContext.Request["datetime"]),
                    new SqlParameter("@msg", BaseContext.Request["msg"]),
                    new SqlParameter("@title", BaseContext.Request["title"]),
                    new SqlParameter("@status", BaseContext.Request["status"]),
                    new SqlParameter("@UID", SqlDbType.Int)
                };
                p[4].Direction = ParameterDirection.Output;
                SqlHelper.ExecteNonQuery(CommandType.StoredProcedure, "ADD_NEWS", p);
                json["UID"] = Convert.ToInt32(p[4].Value);
                BaseContext.Response.Write(json);
            }
            catch (System.Exception ex)
            {
                Log.Error(ex);
                json["state"] = "error";
                json["error"] = ex.Message;
                BaseContext.Response.Write(json);
            }
        }
    }
}