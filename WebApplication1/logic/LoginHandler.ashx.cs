using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Data;

namespace WebApplication1
{
    /// <summary>
    /// LoginHandler 的摘要说明
    /// </summary>
    public class LoginHandler : IHttpHandler, IRequiresSessionState
    {

        protected static NLog.Logger Log
        {
            get { return NLog.LogManager.GetCurrentClassLogger(); }
        }

        public void ProcessRequest(HttpContext context)
        {
            
            var name = context.Request["u"];
            var pwd = context.Request["p"];
            try
            {
                String strSql;
                strSql = "SELECT username FROM users WHERE username= '" + name + "' and pwd= '" + pwd + "'";
                string result = (string)SqlHelper.ExecuteScalar(CommandType.Text, strSql);
                if (result != null)
                {
                    context.Session["UserName"] = name;
                    context.Response.Write(1);
                    return;
                }
                context.Response.Write(0);
            }
            catch (System.Exception ex)
            {
                Log.Error(ex);
                context.Response.Write(ex);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}