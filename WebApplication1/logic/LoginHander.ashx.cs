using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    /// <summary>
    /// UserLogin 的摘要说明
    /// </summary>
    public class LoginHander : IHttpHandler
    {
        protected static NLog.Logger Log
        {
            get { return NLog.LogManager.GetCurrentClassLogger(); }
        }

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                var name = context.Request["u"];
                var pwd = context.Request["p"];
                SqlConnection sqlConn = new SqlConnection("Data Source=.;Initial Catalog=BBSsys;Integrated Security=True");
                sqlConn.Open();
                String strSql;
                strSql = "SELECT username FROM t_user WHERE username= '" + name + "' and pwd= '" + pwd + "'";
                SqlCommand comm = new SqlCommand(strSql, sqlConn);
                string result = (string)comm.ExecuteScalar();
                if (result != null && result == name)
                {
                    context.Session["username"] = name;
                    context.Response.Write(1);
                    return;
                }
                context.Response.Write(0);
            }
            catch (System.Exception ex)
            {
                Log.Error(ex);
                context.Response.Write("0");
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