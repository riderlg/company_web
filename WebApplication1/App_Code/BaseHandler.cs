using System;
using System.Web;
using System.Web.SessionState;
using System.Reflection;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Web.Services;

namespace WebApplication1
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class BaseHandler : IHttpHandler, IRequiresSessionState
    {
        public virtual HttpContext BaseContext { get; private set; }
        public virtual HttpRequest BaseRequest { get; private set; }
        public virtual HttpResponse BaseResponse { get; private set; }
        public virtual HttpServerUtility BaseServer { get; private set; }
        public virtual HttpSessionState BaseSession { get; private set; }
        public virtual NLog.Logger BaseLogger { get; private set; }

        public virtual void ProcessRequest(HttpContext context)
        {
            InitContext(context);
            Init();
            CallMethod();
        }

        //子类的初始化信息
        public virtual void Init() { }


        //初始化 上下文信息
        private void InitContext(HttpContext context)
        {
            this.BaseContext = context;
            this.BaseRequest = context.Request;
            this.BaseResponse = context.Response;
            this.BaseServer = context.Server;
            this.BaseSession = context.Session;
            this.BaseLogger = NLog.LogManager.GetCurrentClassLogger();
        }

        //调用方法
        private void CallMethod()
        {
            try
            {
                //实际执行的Handler的类型
                Type handlerType = this.GetType();

                // 根据方法参数，动态调用方法
                string methodName = BaseRequest.Params["method"];

                MethodInfo method = handlerType.GetMethod(methodName);
                ParameterInfo[] allParamInfos = method.GetParameters();
                int paramCount = allParamInfos.Length;
                //实参
                object[] realParams = new object[paramCount];
                for (int i = 0; i < paramCount; i++)
                {
                    string paramName = allParamInfos[i].Name;
                    string value = HttpUtility.UrlDecode(BaseRequest.Params[paramName]);    //参数解码
                    Type objType = allParamInfos[i].ParameterType;

                    if (objType == typeof(JObject))
                    {
                        realParams[i] = JsonConvert.DeserializeObject(value);
                    }
                    else
                    {
                        // 创建具体类型的参数
                        realParams[i] = Convert.ChangeType(value, objType);
                    }
                }

                //返回值
                if (method.ReturnType != typeof(void))
                {
                    var returnValue = method.Invoke(this, realParams);
                    if (method.ReturnType == typeof(JObject))
                    {
                        // returnValue = JsonConvert.SerializeObject(returnValue);  //不可这样使用， 类型不一致
                        BaseResponse.Write(JsonConvert.SerializeObject(returnValue));
                    }
                    else
                    {
                        BaseResponse.Write(returnValue);
                    }
                }
                else
                {
                    method.Invoke(this, realParams);
                }
            }
            catch (Exception ex)
            {
                BaseLogger.Error("Base - Handler: " + ex.Message);
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
