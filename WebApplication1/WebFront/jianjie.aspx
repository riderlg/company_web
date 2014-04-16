<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jianjie.aspx.cs" Inherits="WebApplication1.WebFront.jianjie" %>
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
                    <a id="j" name="j"></a><strong>公司简介</strong>
                </div>
                <div class="zallrcon jianjieh cl">
                    <p>
                        <strong>武汉百易时代信息技术有限公司</strong>（简称百易时代）位于武汉中心城-光谷。百易时代作为一家集研发、销售、服务为一体的规范化IT企业，拥有一批由高级软件工程师为核心的专业团队，全方位满足客户需求，为客户提供更及时、更便捷、更高效的技术服务支持。</p>
                    <p>
                        公司致力于信息安全方面的产品研发和销售，并开拓软件外包等新兴业务，承接大型企业定制系统。服务对象主要包括政府部门、国有企业、军工企业等各种企、事业单位。自主研发的“E时代安全电子邮件系统V2.0”和“E时代安全电子文档系统V2.0”具有行业领先地位，均已获得国家保密检测证书，并已广泛应用于多家军工企事业单位和政府部门，且取得了良好的市场反响。</p>
                    <p>
                        公司自成立以来，一贯坚持精益求精的原则，力求打造最安全的IT产品；坚持以人为本，科学严谨，共同发展的政策；在业务不断发展的基础上形成“善于学习，追求卓越”的企业文化；在不断的探索与追求中形成安全、持续、长久的发展与壮大。</p>
                    <p>
                        目前，百易时代已全面进入信息安全领域。随着公司业务的发展，我们期待更多优秀的IT精英的加盟。公司将为您提供全面的发展机会和优良的工作环境，让每位员工能够在一个充满生机和活力的环境中实现自己的人生价值。
                    </p>
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
