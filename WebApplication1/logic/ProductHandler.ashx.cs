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
    /// ProductHandler 的摘要说明
    /// </summary>
    public class ProductHandler : BaseHandler
    {

        protected static NLog.Logger Log
        {
            get { return NLog.LogManager.GetCurrentClassLogger(); }
        }

        public JObject Delete(string StoredProcedure, string UID)
        {
            JObject json = new JObject(
                        new JProperty("state", "ok"),
                        new JProperty("error", null)
                    );
            try
            {
                SqlParameter[] p = {
                    new SqlParameter("@UID", UID)
                };
                SqlHelper.ExecteNonQuery(CommandType.StoredProcedure, StoredProcedure, p);
                return json;
            }
            catch (System.Exception ex)
            {
                Log.Error(ex);
                json["state"] = "false";
                json["error"] = ex.ToString();
                return json;
            }
        }

        public void DelProduct()
        {
            string uid = BaseContext.Request["UID"];
            JObject json = Delete("DELETE_PRODUCT", uid);
            BaseContext.Response.Write(json);
        }

        public void DelProductCategory()
        {
            string uid = BaseContext.Request["UID"];
            JObject json = Delete("DELETE_PRO_CATEGORY", uid);
            BaseContext.Response.Write(json);
        }

        public void AddProductCategory()
        {
            JObject json = new JObject(
                        new JProperty("state", "ok"),
                        new JProperty("error", null),
                        new JProperty("UID", null),
                        new JProperty("category", null)
                    );
            try
            {
                SqlParameter[] p = {
                    new SqlParameter("@category", BaseContext.Request["category"]),
                    new SqlParameter("@UID", SqlDbType.Int)
                };
                p[1].Direction = ParameterDirection.Output;
                SqlHelper.ExecteNonQuery(CommandType.StoredProcedure, "ADD_PRODUCT_CATEGORY", p);
                json["UID"] = Convert.ToInt32(p[1].Value);
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

        public void EditProductCategory()
        {
            JObject json = new JObject(
                       new JProperty("state", "ok"),
                       new JProperty("error", null)
                   );
            try
            {
                SqlParameter[] p = {
                    new SqlParameter("@category", BaseContext.Request["category"]),
                    new SqlParameter("@UID", BaseContext.Request["UID"])
                };
                SqlHelper.ExecteNonQuery(CommandType.StoredProcedure, "EDIT_PRODUCT_CATEGORY", p);
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

        public void EditProduct()
        {
            JObject json = new JObject(
                       new JProperty("state", "ok"),
                       new JProperty("error", null)
                   );
            try
            {
                SqlParameter[] p = {
                    new SqlParameter("@img", BaseContext.Request["img"]),
                    new SqlParameter("@name", BaseContext.Request["name"]),
                    new SqlParameter("@categoryUID", BaseContext.Request["category"]),
                    new SqlParameter("@description", BaseContext.Request["description"]),
                    new SqlParameter("@UID", BaseContext.Request["UID"])
                };
                SqlHelper.ExecteNonQuery(CommandType.StoredProcedure, "EDIT_PRODUCT", p);
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

        public void AddProduct()
        {
            JObject json = new JObject(
                        new JProperty("state", "ok"),
                        new JProperty("error", null),
                        new JProperty("UID", null),
                        new JProperty("category", null)
                    );
            try
            {
                SqlParameter[] p = {
                    new SqlParameter("@img", BaseContext.Request["img"]),
                    new SqlParameter("@name", BaseContext.Request["name"]),
                    new SqlParameter("@categoryUID", BaseContext.Request["category"]),
                    new SqlParameter("@description", BaseContext.Request["description"]),
                    new SqlParameter("@UID", SqlDbType.Int)
                };
                p[4].Direction = ParameterDirection.Output;
                SqlHelper.ExecteNonQuery(CommandType.StoredProcedure, "ADD_PRODUCT", p);
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

        public void GetProductName()
        {
            JArray data = new JArray();
            try
            {
                String strSql = "SELECT UID,name  FROM [dbo].[product]";
                SqlDataReader sdr = SqlHelper.ExecuteReader(CommandType.Text, strSql);
                bool first = true;
                while (sdr.Read())
                {
                    if (first)
                    {
                        //"selected":true,
                        data.Add(new JObject(
                            new JProperty("id", sdr["UID"].ToString()),
                            new JProperty("text", sdr["name"].ToString()),
                            new JProperty("selected", true)
                            ));
                        first = false;
                        continue;
                    }
                    data.Add(new JObject(
                             new JProperty("id", sdr["UID"].ToString()),
                             new JProperty("text", sdr["name"].ToString())
                             ));
                }
                BaseContext.Response.Clear();
                BaseContext.Response.Write(data.ToString());
            }
            catch (System.Exception ex)
            {
                Log.Error(ex);
                BaseContext.Response.Write(data.ToString());
            }
        }

        public void LoadCategory()
        {
            JArray data = new JArray();
            try
            {
                String strSql = "SELECT *  FROM [dbo].[pro_category]";
                SqlDataReader sdr = SqlHelper.ExecuteReader(CommandType.Text, strSql);
                while (sdr.Read())
                {
                    data.Add(new JObject(
                        new JProperty("UID", sdr["UID"].ToString()),
                        new JProperty("category", sdr["category"].ToString())
                        ));
                }
                BaseContext.Response.Clear();
                BaseContext.Response.Write(data.ToString());
            }
            catch (System.Exception ex)
            {
                Log.Error(ex);
                BaseContext.Response.Write(data.ToString());
            }
        }

        public void GetCategory()
        {
            JArray data = new JArray();
            try
            {
                String strSql = "SELECT *  FROM [dbo].[pro_category]";
                SqlDataReader sdr = SqlHelper.ExecuteReader(CommandType.Text, strSql);
                bool first = true;
                while (sdr.Read())
                {
                    if (first)
                    {
                        //"selected":true,
                        data.Add(new JObject(
                            new JProperty("id", sdr["UID"].ToString()),
                            new JProperty("text", sdr["category"].ToString()),
                            new JProperty("selected", true)
                            ));
                        first = false;
                        continue;
                    }
                    data.Add(new JObject(
                             new JProperty("id", sdr["UID"].ToString()),
                             new JProperty("text", sdr["category"].ToString())
                             ));
                }
                BaseContext.Response.Clear();
                BaseContext.Response.Write(data.ToString());
            }
            catch (System.Exception ex)
            {
                Log.Error(ex);
                BaseContext.Response.Write(data.ToString());
            }
        }

        public void LoadMessage()
        {
            JArray data = new JArray();
            try
            {
                String strSql = "SELECT *  FROM [dbo].[View_Product_Info] WHERE categoryUID = @categoryUID";
                SqlParameter[] p = {
                    new SqlParameter("@categoryUID", BaseContext.Request["categoryUID"])
                                   };
                SqlDataReader sdr = SqlHelper.ExecuteReader(CommandType.Text, strSql, p);
                while (sdr.Read())
                {
                    data.Add(new JObject(
                        new JProperty("img", sdr["img"].ToString()),
                        new JProperty("name", sdr["name"].ToString()),
                        new JProperty("description", sdr["description"].ToString()),
                        new JProperty("category", sdr["category"].ToString()),
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