using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using Newtonsoft.Json.Linq;

namespace WebApplication1
{
    /// <summary>
    /// UserHandler 的摘要说明
    /// </summary>
    /// 

    public class UserHandler : BaseHandler
    {

        protected static NLog.Logger Log
        {
            get { return NLog.LogManager.GetCurrentClassLogger(); }
        }

        public void ExitUser()
        {
            BaseContext.Session["UserName"] = null;
            BaseContext.Session.Clear();
            BaseContext.Session.Abandon();
            BaseContext.Response.Redirect("../Default.aspx");
        }



        public void GetUserInfo()
        {
            //初始化返回值
            JObject json = new JObject(
                        new JProperty("state", "ok"),
                        new JProperty("email", null),
                        new JProperty("telephone", null),
                        new JProperty("error", null)
                    );
            try
            {
                if (BaseContext.Session["UserName"] == null)
                {
                    json["state"] = "error";
                    json["error"] = "session获取失败";
                    BaseContext.Response.Write(json);
                    return;
                }
                var userName = BaseContext.Session["UserName"];
                String strSql = "SELECT * FROM users WHERE username= @userName";

                SqlParameter p = new SqlParameter("@userName", userName);
                SqlDataReader sdr = SqlHelper.ExecuteReader(CommandType.Text, strSql, p);
                while (sdr.Read())
                {
                    json["email"] = sdr["email"].ToString();
                    json["telephone"] = sdr["telephone"].ToString();
                }
                sdr.Close();
                BaseContext.Response.Write(json);
            }
            catch (System.Exception ex)
            {
                json["state"] = "error";
                json["error"] = ex.Message;
                Log.Error(ex);
                BaseContext.Response.Write(ex);
            }
  
        }

        public void ChangeUserInfo()
        {
            //初始化返回值
            JObject json = new JObject(
                        new JProperty("state", "ok"),
                        new JProperty("error", null)
                    );
            try
            {
                if (BaseContext.Session["UserName"] == null)
                {
                    BaseContext.Response.Write(0);
                    return;
                }
                var userName = BaseContext.Session["UserName"];
                var email = BaseContext.Request["em"];
                var telephone = BaseContext.Request["te"];
                string strSql = "UPDATE users SET email = @email, telephone = @telephone where username = @username";

                SqlParameter[] p = {
                    new SqlParameter("@email", email),
                    new SqlParameter("@telephone", telephone),
                    new SqlParameter("@username", userName)
                };
                SqlHelper.ExecteNonQuery(CommandType.Text, strSql, p);
                BaseContext.Response.Write(json);
            }
            catch (System.Exception ex)
            {
                json["state"] = "error";
                json["error"] = ex.Message;
                Log.Error(ex);
                BaseContext.Response.Write(json);
            }
        }

        public void ChangePwd()
        {
            try
            {
                if (BaseContext.Session["UserName"] == null)
                {
                    BaseContext.Response.Write(0);
                    return;
                }
                var userName = BaseContext.Session["UserName"];
                var oldPwd = BaseContext.Request["op"];
                var newPwd = BaseContext.Request["np"];
                
                String strSql = "SELECT username FROM users WHERE username= '" + userName + "' and pwd= '" + oldPwd + "'";
                string result = (string)SqlHelper.ExecuteScalar(CommandType.Text, strSql);
                if (result == null)
                {
                    BaseContext.Response.Write(-1);
                    return;
                }
                strSql = "UPDATE users SET pwd='" + newPwd + "'WHERE username= '" + userName + "' and pwd= '" + oldPwd + "'";
                SqlHelper.ExecteNonQuery(CommandType.Text, strSql);
                BaseContext.Response.Write(1);
            }
            catch (System.Exception ex)
            {
                Log.Error(ex);
                BaseContext.Response.Write(ex);
            }
        }
    }
}