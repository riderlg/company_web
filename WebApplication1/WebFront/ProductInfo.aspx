<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductInfo.aspx.cs" Inherits="WebApplication1.WebFront.ProductInfo" %>
<%@ Register Src="ASCX/header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    
<head>
    <script type="text/javascript" src="../Scripts/jquery-1.7.1.min.js"></script>
        <style type="text/css">

           
         ul.nostyle
        {
           list-style: none;
           margin: 0;
           padding: 0;
        }
        
        .li_item
        {
            width:227px;
            line-height: 40px;
            background: url("img/p06.jpg") no-repeat;
        }

        .li_sub_item
        {
            height: 28px;
            line-height: 28px;  
             list-style-type: circle;  
        }

        .zalllcons ul li.li_sub_item a{
            display: inline;
        }
        
        .product_name
        {
            margin: 30px 0 0 30px;
            color: #f00;
        }
         </style>
    
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
    <form id="form1" runat="server">
   <!--头部-->
    <uc1:header ID="header" runat="server" />
    <!--头部-->
    <div class="zall cl">
        <div class="zalltop cl">
            <strong>当前位置：<a href="index.htm">首页</a>>>产品中心</strong>
        </div>
        <div class="allz cl">
            <div class="zalll fl">
                <div class="zallltop cl">
                    <strong>产品中心</strong>
                </div>
                <div class="zalllcons cl">
                    <asp:Repeater ID="rptRootUnit" runat="server" OnItemDataBound="repeater_ItemDataBind">
                                <HeaderTemplate>
                                    <ul class="nostyle">
                                </HeaderTemplate>
                                    <ItemTemplate>
                                        <li class="li_item">
                                            <span class="product_name" ><%# Eval("category") %></span>
                                            <asp:Repeater ID="rptSubUnit" runat="server">
                                                <HeaderTemplate><ul></HeaderTemplate>
                                                <ItemTemplate>
                                                    <li class="li_sub_item">
                                                        <asp:LinkButton ID="lbtnNav" PostBackUrl='<%# Eval("UID", "ProductInfo.aspx?id={0}") %>' runat="server"><%# Eval("name") %></asp:LinkButton>
                                                    </li>
                                                </ItemTemplate>
                                                <FooterTemplate></ul></FooterTemplate>
                                            </asp:Repeater>
                                        </li>
                                    </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </FooterTemplate>
                   </asp:Repeater>
                </div>
            </div>
            <div class="zallr fl">
                <div class="zallrtops cl">
                    <strong><%=productName %></strong><a name="c" id="c"></a>
                </div>
                <div class="zallrcon chanpinh cl">
                    <p>
                        <strong>产品概述</strong>
                    </p>
                    <div>
                        <img src="<%=productImg %>" width="175" height="100" alt="" />
                    </div>
                    <p>
                        <%=productInfo %>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="bottom cl">
        <div class="botcon cl">
            Copyright © 2010-2013 Baiyi Times. All Rights Reserved. 武汉百易时代信息技术有限公司 版权所有<br />
            鄂ICP备11019898号 地址：湖北省武汉市光谷步行街，电话：027-87514985&nbsp;&nbsp;18971527406
        </div>
    </div>
    <noscript>
        <iframe src="*.htm"></iframe>
    </noscript>


    <script type="text/javascript">
        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fa8b8e34c421c3648d83f5c5e91ae98b7' type='text/javascript'%3E%3C/script%3E"));
    </script>
</form>
</body>
</html>

