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
<style type="text/css">
			body{
				font-family: "宋体",Arial;
				font-size: 12px;
			}
			/*居中*/
			#ProductForm{
				width: 550px;
				border: dotted 2px #cde;
				margin: 0 auto;
				padding: 10px;
			}
			#ProductForm tr{
				height: 30px;
				line-height: 30px;
			}

			#ProductForm td.tdLeft{
				width: 180px;
				text-align: right;
				padding-right: 15px;
				color: #069;
			}

			#ProductForm td.tdRight{
				width: 350px;
			}

			#ProductForm input.vldset {
				border-style: solid;
				border-width: 1px;
				border-radius: 3px;
				height: 21px;
				line-height: 21px;
				width: 160px;
			}

			#ProductForm button{
				color: #fff;				
				border-radius: 3px;				
				width: 80px;
				height: 30px;
				line-height: 28px;
				letter-spacing: 5px;
				margin-left: 35px;
			}
			.remark{
				color: red;
				margin: 0 3px;				
			}
			.error_tip{
				color: #f00;
				margin-left: 5px;
				font-size: 11px;
			}
			
			/*重新定义下拉框样式*/
			.easyui-combobox
			{
			    width: 156px;			    			    
			}
			#ProductForm .combo
			{
			    border: solid 1px RGB(78, 189, 251);
			    line-height: 21px;
			    height: 21px;
			    border-radius: 3px;
			}
			input.normal{
				border-color: RGB(78, 189, 251);
			}
			input.invalid{
				border-color: RGB(236, 90, 75);
			}
			button.normal{
				background-color: RGB(78, 189, 251);
				border: solid 1px RGB(60, 191, 249);
				cursor: pointer;
			}
			button.disabled{
				background-color: #9999A1;
				border: solid 1px RGB(235, 235, 235);
				cursor: default;
			}			
		</style>
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
                <div class="zallrcon chanpinh cl">
                    <div id="ProductForm">
			            <table>
				            <tr>
					            <td class="tdLeft">
						            <span class="remark">*</span>客户姓名：</td>
					            <td class="tdRight">						
						            <input id="name" type="text" class="normal vldset" />
						            <span class="error_tip"></span>
					            </td>
				            </tr>
                            <tr>
                                <td class="tdLeft">预定产品:</td>
                                <td><input class="easyui-combobox"  id="product_uid"  data-options="valueField:'id',textField:'text'" /></td>
                                <td class="error_tip"></td>
                            </tr>
				            <tr>
					            <td class="tdLeft">
						            <span class="remark">*</span>产品数量：</td>
					            <td class="tdRight">
						            <input id="product_amount" type="text" class="normal vldset"/>
						            <span class="error_tip"></span>
					            </td>
				            </tr>
				            <tr>
					            <td class="tdLeft">
						            <span class="remark">*</span>邮箱：</td>
					            <td class="tdRight">
						            <input id="email" type="text" class="normal vldset"/>
						            <span class="error_tip"></span>
					            </td>
				            </tr>
				            <tr>
					            <td class="tdLeft">
						            <span class="remark">*</span>电话：</td>
					            <td class="tdRight">
						            <input id="telephone" type="text" class="normal vldset"/>
						            <span class="error_tip"></span>
					            </td>
				            </tr>
				            <tr>
					            <td></td>
					            <td><button id="btnSubmitOrder">提交</button></td>
				            </tr>
			            </table>
		            </div>
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
    $(function () {
        //未填写表单，禁用按钮
        setButtonStatus();

        //表单验证
        $("input.vldset").bind({
            blur: function () {
                var thisEL = $(this);
                var posIndex = thisEL.index(".vldset");
                var inputValue = thisEL.val();

                var checkedResult = true;
                if (inputValue.length == 0) {
                    makeInvalid(thisEL, "输入不能为空!");
                    checkedResult = false;
                }

                // 对应索引的正则来判断输入内容的合法与否
                var checker = validator[posIndex];
                if (checkedResult && checker.regex.test(inputValue) == false) {
                    makeInvalid(thisEL, checker.invalidText);
                    checkedResult = false;
                }

                checkedArray[posIndex] = checkedResult;
                if (checkedResult == false) {
                    //更改按钮状态
                    setButtonStatus(null, false);
                }
                else {
                    clearInalid(thisEL);
                    //更改按钮状态
                    setButtonStatus();
                }
                return checkedResult;
            },
            keypress: function (evtObj) {
                var charCode = evtObj.which;
                switch (this.id) {
                    case "productAmount":
                    case "telephone":
                        if (charCode < 48 || charCode > 58)
                            return false;
                        break;
                }
            }
        });

        //提交表单
        $("#btnSubmitOrder").click(function () {
            // 根据按钮的状态，不用再次执行表单验证
            if (this.className.indexOf("disabled") == -1) {
                var datetime = timeStamp2String();
                var order_num = "<%=GetOrderNumber() %>";
                var name = $("#ProductForm #name").val();
                 var telephone = $("#ProductForm #telephone").val();
                 var email = $("#ProductForm #email").val();
                 var num = $("#ProductForm #product_amount").val();
                 var product_UID = $("#ProductForm #product_uid").combobox('getValue');
                 if (order_num.length == 0 || name.length == 0 || telephone.length == 0 ||
                     email.length == 0 || product_UID.length == 0) {
                     return;
                 }
                 $("#ProductForm #error").closest("tr").hide();
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
            else {
                return false;
            }
        });
    });

    //每个输入项的验证状态： 未输入数据，默认不合法
    var checkedArray = [false, false, false, false];

    //表单验证规则
    var validator = [   
    { type: "name", regex: /^\w{2,10}$/i, invalidText: "姓名长度限定为5-10个字符!" }, //验证用户名
    { type: "amount", regex: /^[1-9]\d?$/, invalidText: "产品数量允许范围为1-99!" }, //验证产品数量
    { type: "email", regex: /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/, invalidText: "邮箱格式为aaaaa@163.com!" }, //验证邮箱
    { type: "telephone", regex: /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/, invalidText: "请输入正确格式的手机号码!" } //验证电话
    ];

    //输入框的状态
    function makeInvalid(inputEL, message) {
        inputEL.removeClass("normal").addClass("invalid").next(".error_tip").html(message);
    }
    function clearInalid(inputEL) {
        inputEL.removeClass("invalid").addClass("normal").next(".error_tip").html("");
    }

    //按钮状态
    function setButtonStatus(buttonEL, status) {
        buttonEL = buttonEL || $("#btnSubmitOrder");
        status = status || checkedArray.join(",").indexOf("false") == -1;
        if (status) {
            buttonEL.removeClass("disabled").addClass("normal");
        }
        else {
            buttonEL.removeClass("normal").addClass("disabled");
        }
    }
</script>


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


        function LoadProduct() {
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
  

        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fa8b8e34c421c3648d83f5c5e91ae98b7' type='text/javascript'%3E%3C/script%3E"));
    </script>
</form>
</body>
</html>


