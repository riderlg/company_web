<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gonggao.aspx.cs" Inherits="WebApplication1.WebFront.gonggao" %>
<%@ Register Src="ASCX/header.ascx" TagName="header" TagPrefix="uc1" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
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
    <style type="text/css">
        .list_data ul {
			overflow: hidden;
			width: 580px;
			margin: 10px auto;
			padding: 5px;
		}

		.list_data a{
			color: #0086E3;
			text-decoration: none;
		}
		.list_data a:hover{
			color: #FFB95A;
			text-decoration: none;
		}

		.list_data ul li:first-child {
			margin: 0 0 10px 0;
		}

		.list_data ul li.unit{
			list-style: none;
			padding: 0 10px 10px 0;
			border-bottom: dotted 1px #ccc;
		}

		.unit .n_top{
			/*border-left: solid 5px #0086E3;*/
			padding: 0 0 5px 10px;
		}

		.unit .n_top h1.n_title{
			margin: 0px;
			padding: 5px 0;
			font-size: 18px;
			font-weight: bolder;
		}

		.unit .n_top span{
			margin: 0;
			display: block;
			color: #999;
			font-size: 13px;
		}
		
		.unit .n_top span em
		{
		    padding: 8px 12px;
		    font-style: normal;
		    width: 20px;
		    height: 20px;
		    line-height: 20px;
		    text-align: center;
		    background-color: #cde;
		    border-radius: 5px;
		    overflow: hidden;
		    color: #E7483E;
		}

		.list_data .n_body{
			margin: 3px;
			padding: 0 10px;
		}

		.list_data .n_body > div img{
			float: left;
			width: 180px;
		}

		.list_data .n_body p {
			text-indent: 2em;
			color: #666;
			max-height: 150px;
			overflow: hidden;
			font-size: 16px;
			line-height: 22px;
			margin: 0px;
		}

		.list_data .n_footer{
			clear: both;
		}

		.list_data .n_footer span.view_all{
			display: block;
			width: 100%;	
			text-align: right;
		}

		.list_data .pages{
			position: relative;
			float: left;
			clear: both;
			width: 100%;
			text-align: center;
			margin: 5px;
		}

		.pages a{
			color: #000;
		}
    </style>
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
                    <a id="j" name="j"></a><strong>公司公告</strong>
                </div>
                <div class="zallrcon jianjieh cl">
                    <!--公告列表-->
                <div class="list_data">
                    <ul>
                        <asp:Repeater ID="NewsPost" runat="server">
                            <ItemTemplate>                            
                                <li class="unit">
                                    <div class="n_top">
							            <span><em><%#Container.ItemIndex+1%></em> 发布时间：<%#string.Format("{0:yyyy-MM-dd HH:mm:ss}", Eval("datetime"))%></span>
						            </div>                                        
                                    <div class="n_body">	
							            <p>
								            <%#Eval("msg").ToString()%>
							            </p>
						            </div>
						            <div class="n_footer">
							            <span class="view_all"><a href='NewsInfo.aspx?type=0&ID=<%#Eval("UID").ToString()%>'>查看全文</a></span>
						            </div>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                    <div class="pages">
                        <webdiyer:AspNetPager ID="AspNetPager2" CssClass="paginator" runat="server" PageSize="15"
                            AlwaysShow="True" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页"
                            ShowCustomInfoSection="Left" ShowPageIndexBox="always" PageIndexBoxType="DropDownList"
                            UrlPaging="true" OnPageChanged="AspNetPager2_PageChanged" CurrentPageButtonClass="cpb">
                        </webdiyer:AspNetPager>
                    </div>
                </div>
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

