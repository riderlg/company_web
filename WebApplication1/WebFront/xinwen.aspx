<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="xinwen.aspx.cs" Inherits="WebApplication1.WebFront.xinwen" %>

<%@ Register Src="ASCX/header.ascx" TagName="header" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>武汉百易时代信息技术有限公司</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <meta name="keywords" content="百易时代、安全电子邮件系统、武汉百易时代信息技术有限公司、E时代安全邮件、E时代安全电子邮件、邮件服务器、中软防火墙" />
    <meta name="description" content="武汉百易时代信息技术有限公司专业的邮件、统一消息领域的产品与解决方案提供商，为多家厂商提供安全邮件系统，在政府、军工、大型企业级邮件市场的占有率一直遥遥领先。" />

    <script src="js/jquery.js" type="text/javascript"></script>

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
            <strong>当前位置：<a href="index.htm">首页</a>>>关于百易</strong>
        </div>
        <div class="allz cl">
            <div class="zalll fl">
                <div class="zallltop cl">
                    <strong>关于百易</strong>
                </div>
                <div class="zalllcon cl">
                    <ul>
                        <li><a class="on" href="jianjie.aspx">公司简介</a></li>
                        <li><a class="on" href="gonggao.aspx">公司公告</a></li>
                        <li><a class="on" href="xinwen.aspx">公司新闻</a></li>
                    </ul>
                </div>
            </div>
            <div class="zallr fl">
                <div class="zallrtop cl">
                    <a id="j" name="j"></a><strong>公司新闻</strong>
                </div>
                <div class="zallrcon jianjieh cl">
                  
                </div>
            </div>
        </div>
    </div>
    <div class="bottom cl">
        <div class="botcon cl">
            Copyright © 2010-2012 Baiyi Times. All Rights Reserved. 武汉百易时代信息技术有限公司 版权所有<br />
            鄂ICP备11019898号 地址：湖北省武汉市光谷步行街，电话：027-87514985&nbsp;&nbsp;18971527406
        </div>
    </div>
    <!-- <script language="javascript">function click() {alert('禁止你的左键复制！') }function click1() {if (event.button==2) {alert('禁止右键点击~！') }}function CtrlKeyDown(){if (event.ctrlKey) {alert('不当的拷贝将损害您的系统！') }}document.onkeydown=CtrlKeyDown;document.onselectstart=click;document.onmousedown=click1;</script> //-->
    <noscript>
        <iframe src="*.htm"></iframe>
    </noscript>

    <script language="javascript">  <!--  if (window.Event)  document.captureEvents(Event.MOUSEUP);  function nocontextmenu(){  event.cancelBubble = true  event.returnValue = false;  return false;  }   function norightclick(e){  if (window.Event){  if (e.which == 2 || e.which == 3)  return false;  }  else  if (event.button == 2 || event.button == 3){  event.cancelBubble = true  event.returnValue = false;  return false;  }  }   document.oncontextmenu = nocontextmenu; // for IE5+  document.onmousedown = norightclick; // for all others  //-->  </script>

    <script type="text/javascript">
        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fa8b8e34c421c3648d83f5c5e91ae98b7' type='text/javascript'%3E%3C/script%3E"));
    </script>

</body>
</html>
