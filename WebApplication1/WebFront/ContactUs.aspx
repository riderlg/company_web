<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="WebApplication1.WebFront.ContactUs" %>
<%@ Register Src="ASCX/header.ascx" TagName="header" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>武汉百易时代信息技术有限公司</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <meta name="keywords" content="百易时代、安全电子邮件系统、武汉百易时代信息技术有限公司、E时代安全邮件、E时代安全电子邮件、邮件服务器、中软防火墙" />
    <meta name="description" content="武汉百易时代信息技术有限公司专业的邮件、统一消息领域的产品与解决方案提供商，为多家厂商提供安全邮件系统，在政府、军工、大型企业级邮件市场的占有率一直遥遥领先。" />


   <link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.4/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.4/demo/demo.css">
    <script src="js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript" src="../jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
    

    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <link href="css/cn.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href="Css/cn.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <!--头部-->
    <uc1:header ID="header" runat="server" />
    <!--头部-->

    <div class="zall cl">
        <div class="zalltop cl">
            <strong>当前位置：<a href="index.htm">首页</a>>>联系我们</strong>
        </div>
        <div class="allz cl">
            <div class="allztop cl">
                <strong>联系我们</strong>
            </div>
            <div class="allzcon cl">
                <p>
                    <span><strong>服务方式包含： </strong></span>
                </p>
                <p>
                    <strong>电话热线服务</strong></p>
                <p>
                    <strong>远程服务</strong></p>
                <p>
                    <strong>运行维护服务</strong></p>
                <p>
                    <strong>现场安装调试服务</strong></p>
                <p>
                    <strong>定期寻访服务</strong>
                </p>
                <p>
                    <strong>地 址：</strong>武汉市东湖新技术开发区光谷步行街</p>
                <p>
                    <strong>电 话：</strong>027-87514985 &nbsp;&nbsp;18971527406</p>
                <p>
                    <strong>Email：</strong>BaiyiTimes@126.com</p>
            </div>
            <div id="msg_form" class="easyui-panel" title="留言" style="width:230px;padding:10px;">
                    <table>
                        <tr>
                            <td>邮箱:</td>
                            <td><input id="email" type="text"></input></td>
                        </tr>
                        <tr>
                            <td>留言:</td>
                            <td><textarea id="msg"   style="height:80px;"></textarea></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" onclick="LeaveMessage()" value="提交"></input></td>
                        </tr>
                        <tr class="row_height">
                            <td colspan="2" id="error" style="text-align:center;color:red;font:100"></td>
                       </tr>
                    </table>
            </div>
        </div>
    </div>
    <div class="bottom cl">
        <div class="botcon cl">
            Copyright © 2010-2013 Baiyi Times. All Rights Reserved. 武汉百易时代信息技术有限公司 版权所有<br />
            鄂ICP备11019898号 地址：湖北省武汉市光谷步行街，电话：027-87514985 &nbsp;&nbsp;18971527406
        </div>
    </div>
    <noscript>
        <iframe src="*.htm"></iframe>
    </noscript>

    <script language="javascript">  <!--  if (window.Event)  document.captureEvents(Event.MOUSEUP);  function nocontextmenu(){  event.cancelBubble = true  event.returnValue = false;  return false;  }   function norightclick(e){  if (window.Event){  if (e.which == 2 || e.which == 3)  return false;  }  else  if (event.button == 2 || event.button == 3){  event.cancelBubble = true  event.returnValue = false;  return false;  }  }   document.oncontextmenu = nocontextmenu; // for IE5+  document.onmousedown = norightclick; // for all others  //-->  </script>

    <script type="text/javascript">
        function timeStamp2String() {
            var datetime = new Date();
            // datetime.setTime(time); 
            var year = datetime.getFullYear();
            var month = datetime.getMonth() + 1 < 10 ? (datetime.getMonth() + 1) : datetime.getMonth() + 1;
            var date = datetime.getDate() < 10 ? datetime.getDate() : datetime.getDate();
            var hour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime.getHours();
            var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
            var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
            return year + "/" + month + "/" + date + " " + hour + ":" + minute + ":" + second;
        }

        function LeaveMessage()
        {
            var datetime = timeStamp2String();
            var email = $("#msg_form #email").val();
            var msg = $("#msg_form #msg").val();
            if (email.length == 0 || msg.length == 0) {
                $("#msg_form #error").html("输入不能空");
                return;
            }
            $.ajax({
                type: "POST",
                url: "../logic/MessageHandler.ashx",
                async: false,
                dataType: "json",
                data: "method=LeaveMessage&msg=" + msg +
                    "&datetime=" + datetime +
                    "&email=" + email,
                success: function (data) {
                    if (data.state == "error") {
                        alert("留言失败.");
                    }
                    else {
                        alert("谢谢您的留言。我们会尽快回复您，请查看您的邮箱！");
                    }
                }
            })
        }

        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fa8b8e34c421c3648d83f5c5e91ae98b7' type='text/javascript'%3E%3C/script%3E"));
    </script>

</body>
</html>

