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
    /// Announcement 的摘要说明
    /// </summary>
    public class AnnouncementHandler : BaseHandler
    {

        protected static NLog.Logger Log
        {
            get { return NLog.LogManager.GetCurrentClassLogger(); }
        }

        public void DeleteAnnouncement()
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
                SqlHelper.ExecteNonQuery(CommandType.StoredProcedure, "DELETE_ANNOUNCEMENT", p);
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

        public void EditAnnouncement()
        {
            JObject json = new JObject(
                        new JProperty("state", "ok"),
                        new JProperty("error", null)
                    );
            try
            {
                String strSql = "UPDATE  [dbo].[announcement] set datetime=@datetime, msg=@msg, status=@status WHERE UID=@UID";
                SqlParameter[] p = {
                    new SqlParameter("@datetime", BaseContext.Request["datetime"]),
                    new SqlParameter("@msg", BaseContext.Request["msg"]),
                    new SqlParameter("@status", BaseContext.Request["status"]),
                    new SqlParameter("@UID", BaseContext.Request["UID"])
                };
                SqlHelper.ExecteNonQuery(CommandType.Text, strSql, p);
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
        public void AddAnnouncement()
        {
            JObject json = new JObject(
                        new JProperty("state", "ok"),
                        new JProperty("error", null),
                        new JProperty("UID", -1)
                    );
            try
            {
                SqlParameter[] p = {
                    new SqlParameter("@datetime", BaseContext.Request["datetime"]),
                    new SqlParameter("@msg", BaseContext.Request["msg"]),
                    new SqlParameter("@status", BaseContext.Request["status"]),
                    new SqlParameter("@UID", SqlDbType.Int)
                };
                p[3].Direction = ParameterDirection.Output;
                SqlHelper.ExecteNonQuery(CommandType.StoredProcedure, "ADD_ANNOUNCEMENT", p);
                json["UID"] = Convert.ToInt32(p[3].Value);
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
        public void LoadAnnouncement()
        {
            JArray data = new JArray();
            try
            {
                String strSql = "SELECT * FROM [dbo].[announcement] ORDER BY [datetime] DESC";
                SqlDataReader sdr = SqlHelper.ExecuteReader(CommandType.Text, strSql);
                while (sdr.Read())
                {
                    int status = Convert.ToInt32(sdr["status"]);
                    data.Add(new JObject(
                        new JProperty("status", status),
                        new JProperty("statusStr", status == 1 ? "显示" : "隐藏"),
                        new JProperty("message", sdr["msg"].ToString()),
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
                BaseContext.Response.Write("error");
            }
        }
    }
}

