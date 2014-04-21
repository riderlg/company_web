<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductOrder.aspx.cs" Inherits="WebApplication1.WebFront.ProductOrder" %>

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
                    <strong>产品订单</strong><a name="c" id="c"></a>
                </div>
                <div class="zallrcon chanpinh cl" id="ProductForm">
                        <table style="margin:0 auto;width:220">
                        <tr  class="row_height">
                            <td><a>订单号:</a></td>
                            <td><p id="order_num"></p> </td>
                        </tr>
                        <tr  class="row_height">
                            <td><a>客户姓名:</a></td>
                            <td><input   id="name" ></input></td>
                        </tr>
                        <tr  class="row_height">
                            <td><a>预定产品:</a></td>
                            <td><input class="easyui-combobox"  id="product_uid"  data-options="valueField:'id',textField:'text'"></input></td>
                        </tr>
                        <tr  class="row_height">
                            <td><a>产品数量:</a></td>
                            <td><input class="easyui-numberbox"   id="product_amount"  data-options="min:0,max:10000,precision:0" ></input></td>
                        </tr>
                        <tr  class="row_height">
                            <td><a>邮箱:</a></td>
                            <td><input   id="email" ></input></td>
                        </tr>
                        <tr  class="row_height">
                            <td><a>电话:</a></td>
                            <td><input   id="telephone" ></input></td>
                        </tr>
                        <tr class="row_height">
                            <td colspan="2" id="error" style="text-align:center;color:red;font:100"></td>
                        </tr>
                        </table>
                        <a href="javascript:void(0)" onclick="AddProductOrder()">提交订单</a>
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


        function timeStamp2String(time) {
            var datetime = new Date();
            // datetime.setTime(time); 
            var year = datetime.getFullYear();
            var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
            var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
            var hour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime.getHours();
            var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
            var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
            return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
        }


        function LoadProduct()
        {
            $.ajax({
                type: "POST",
                url: "/logic/ProductHandler.ashx",
                async: false,
                data: "method=GetProductName",
                success: function (data) {
                    var jdata = $.parseJSON(data);
                    $("#ProductForm #product_uid").combobox({
                        data: jdata
                    });
                }
            });
        }
        LoadProduct();
        function AddProductOrder(){
            var datetime = timeStamp2String();
            var order_num = $("#ProductForm #order_num").html();
            var name = $("#ProductForm #order_num").val();
            var telephone = $("#ProductForm #order_num").val();
            var email = $("#ProductForm #email").val();
            var num = $("#ProductForm #email").val();
            var product_UID = $("#ProductForm #product_uid").combobox('getValue');
            if (order_num.length == 0 || name.length == 0 || telephone.length == 0 ||
                email.length == 0 || product_UID.length == 0) {
                $("#ProductForm #error").html("输入不能空");
                return;
            }
            $.ajax({
                type: "POST",
                url: "/logic/ProductOrderHandler.ashx",
                async: false,
                dataType: "json",
                data: "method=AddProductOrder&order_num=" + order_num +
                    "&datetime=" + datetime +
                    "&name=" + name +
                    "&telephone=" + telephone +
                    "&email=" + email +
                    "&product_UID=" + product_UID +
                    "&product_amount=" + num,
                success: function (data) {
                    if (data.state == "error") {
                        alert("订单提交失败.");
                    }
                    else {
                        alert("订单提交成功。您的订单号为：" + order_num + "，我们会尽快处理您的订单。");
                    }
                }
            })
        }

        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fa8b8e34c421c3648d83f5c5e91ae98b7' type='text/javascript'%3E%3C/script%3E"));
    </script>
</form>
</body>
</html>


