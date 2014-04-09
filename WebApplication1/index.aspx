<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication1.test" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Transdmin Light</title>

<!-- CSS -->
<link href="style/css/transdmin.css" rel="stylesheet" type="text/css" media="screen" />
<!--[if IE 6]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie6.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" media="screen" href="style/css/ie7.css" /><![endif]-->

<!-- JavaScripts-->
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.4/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.4/demo/demo.css">
    <script type="text/javascript" src="Scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../jquery.min.js"></script>
    <script type="text/javascript" src="../../jquery.easyui.min.js"></script>

    <style type="text/css">
    .row_height{ line-height:40px;}
    </style>

<script type="text/javascript">
    //弹出用户信息对话框
    function OpenUserInfoDlg()
    {
        $("#dlg_user_info #error").html("");
        $.ajax({
            type: "POST",
            url: "/logic/UserHandler.ashx",
            async: false,
            data: "method=GetUserInfo",
            dataType: "json",
            success: function (json) {
                if (json.state == "error")
                {
                    alert(json.error);
                }
                else
                {
                    $("#dlg_user_info #eamil").val(json.email);
                    $("#dlg_user_info #telephone").val(json.telephone);
                }
            }
        })
        $('#dlg_user_info').dialog('open');
    }

    //修改用户信息
    function ChangeUserInfo()
    {
        $.ajax({
            type: "POST",
            url: "/logic/UserHandler.ashx",
            async: false,
            data: "method=ChangeUserInfo&em=" + $("#dlg_user_info #eamil").val() + "&te=" + $("#dlg_user_info #telephone").val(),
            dataType: "json",
            success: function (json) {
                if (json.state == "error") {
                    alert(json.error);
                }
                else {
                    alert("用户信息修改成功");
                    $('#dlg_user_info').dialog('close');
                }
            }
        })
    }


    //弹出修改用户密码对话框
    function OpenChangePwdDlg()
    {
        $("#dlg_change_pwd #oldPwd").val("");
        $("#dlg_change_pwd #newPwd").val("");
        $("#dlg_change_pwd #newPwdVerify").val("");
        $("#dlg_change_pwd #error").html("");
        $('#dlg_change_pwd').dialog('open');
    }
   
    //修改用户密码
    function ChangePwd()
    {
        var oldPwd = $("#dlg_change_pwd #oldPwd").val();
        var newPwd = $("#dlg_change_pwd #newPwd").val();
        var newPwdVerify = $("#dlg_change_pwd #newPwdVerify").val();
        if (oldPwd.length == 0 || newPwd.length == 0 || newPwdVerify.length == 0)
        {
            $("#dlg_change_pwd #error").html("输入不能空");
            return;
        }
        if(newPwdVerify != newPwd)
        {
            $("#dlg_change_pwd #error").html("两次密码不一致");
            return;
        }
        $.ajax({
            type: "POST",
            url: "/logic/UserHandler.ashx",
            async: false,
            data: "method=ChangePwd&op=" + oldPwd + "&np=" + newPwd,
            success: function (data) {
                if (Number(data) == -1) {
                    $("#dlg_change_pwd #error").html("密码错误");
                }
                else if (Number(data) == 1){
                    alert("密码修改成功");
                    $('#dlg_change_pwd').dialog('close');
                }
                else
                {
                    alert(data);
                }
            },
            error: function (data) {
                alert("密码修改失败:" + data);
            }
        })
    }

    $(function () {
        //初始化
        $("#dlg_user_info").dialog('close');
        $("#dlg_change_pwd").dialog('close');

        //设置active
        $("#mainNav li a").click(function () {
            SetActive(this);
            var seqNO = $("#mainNav li a").index(this);
        })


        function SetActive(target)
        {
            (($(target).parent()).siblings()).children().removeAttr("class");
            $(target).attr("class", "active");
        }


        $("ul.sideNav li a").attr("href", "javascript:void(0);");
        //更改

        $("ul.sideNav li a").click(function () {
            SetActive(this);
            //当前点击的a, 在整个导航条中的序号
            var seqNO = $("ul.sideNav li a").index(this);
            switch(seqNO)
            {
                case 0:
                    targerURL = "Message_Control.aspx";
                    break;
                case 1:
                    targerURL = "ProductOrder_Control.aspx";
                    break;
                case 2:
                    targerURL = "Announcement_Control.aspx";
                    break;
                case 3:
                    targerURL = "News_Control.aspx";
                    break;
                case 4:
                    targerURL = "Product_Control.aspx";
                    break;
            }

            
     
            document.getElementById("ifmMain").src = targerURL;

            /*//方法3 -- no
            var iframeTPL = '<iframe id="ifmMain" name="ifmMain" src="'+targerURL+'" style="width: 735px; height:600px; " frameborder="0" scrolling="no"></iframe>';
            $("#c_main").empty();   //先清空上一次生成的IFRAME
            $("#c_main").append($(iframeTPL));*/

            //获取子页面中的元素的值  -- chrome - 只能在HTTP环境下测试
//             var subFrames = document.getElementById("ifmMain").contentWindow || document.frames["ifmMain"];
//             alert(subFrames.document.getElementsByTagName('h2').length); //

            return false;
        });
    });
</script>
</head>

<body>
	<div id="wrapper">
    	<!-- h1 tag stays for the logo, you can use the a tag for linking the index page -->
    	<h1><a href="#"><span>Transdmin Light</span></a></h1>
        
        <!-- You can name the links with lowercase, they will be transformed to uppercase by CSS, we prefered to name them with uppercase to have the same effect with disabled stylesheet -->
        <ul id="mainNav">
        	<li><a href="javascript:void(0)"  onclick="OpenUserInfoDlg()">用户信息</a></li>
        	<li><a href="javascript:void(0)" onclick="OpenChangePwdDlg()">修改密码</a></li>
        	<li class="logout"><a href="/logic/UserHandler.ashx?method=ExitUser">登出</a></li>
        </ul>
        <!-- // #end mainNav -->
        
        <div id="containerHolder">
			<div id="container">
        		<div id="sidebar">
                	<ul class="sideNav">
                    	<li><a href="#">留言箱</a></li>
                    	<li><a href="#" >客户订单</a></li>
                    	<li><a href="#">公告管理</a></li>
                    	<li><a href="#">新闻管理</a></li>
                    	<li><a href="#">产品管理</a></li>
                    </ul>
                    <!-- // .sideNav -->
                </div>    
                <!-- // #sidebar -->
                <div id="c_main">
                    <iframe id="ifmMain" name="ifmMain" src="" style="width: 735px; height:600px; " frameborder="0" scrolling="no"></iframe>
                </div>
                <div class="clear"></div>
            </div>
            <!-- // #container -->
        </div>	
        <!-- // #containerHolder -->
        
        <p id="footer">Feel free to use and customize it. </p>
    </div>
    <!-- // #wrapper -->


    <!-- 修改用户密码对话框-->
    <div id="dlg_change_pwd" class="easyui-dialog" title="修改密码" modal="true"  data-options="buttons: '#dlg_change_pwd_buttons'" style="margin:0 auto;height: 300px; width:400px">
        <form id="ff" action="form" method="post" >
        <table style="margin:0 auto;width:220px">
                <tr class="row_height">
                    <td>用户名:</td>
                    <td><%=UserName %></td>
                </tr>
                <tr  class="row_height">
                    <td>当前密码:</td>
                    <td><input class="easyui-validatebox" type="password" id="oldPwd" data-options="required:true"></input></td>
                </tr>
                <tr  class="row_height">
                    <td>设置新的密码:</td>
                    <td><input class="easyui-validatebox" type="password" id="newPwd" data-options="required:true"></input></td>
                </tr>
               <tr  class="row_height">
                    <td>重复新的密码:</td>
                    <td><input class="easyui-validatebox" type="password" id="newPwdVerify" data-options="required:true"></input></td>
              </tr>
            <tr class="row_height">
                <td colspan="2" id="error" style="text-align:center;color:red;font:100"></td>
            </tr>
        </table>

        </form>
        </div>
    <div id="dlg_change_pwd_buttons" style="text-align:center;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="ChangePwd()">Save</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#dlg_change_pwd').dialog('close')">Close</a>
    </div>
    <!-- // #修改用户密码对话框-->


     <!-- 用户信息对话框-->
    <div id="dlg_user_info" class="easyui-dialog" title="用户信息" modal="true"  data-options="buttons: '#dlg_user_info_buttons'" style="margin:0 auto;height: 300px; width:400px">
        <form id="Form1" action="form" method="post" >
        <table style="margin:0 auto;width:200px">
            <tr class="row_height">
                <td>用户名:</td>
                <td><%=UserName %></td>
            </tr>
            <tr  class="row_height">
                <td>邮箱:</td>
                <td><input class="easyui-validatebox" type="text" id="eamil""></input></td>
            </tr>
            <tr  class="row_height">
                <td>电话号码:</td>
                <td><input class="easyui-validatebox"  type="text" id="telephone""></input></td>
            </tr>
            <tr class="row_height">
                <td colspan="2" id="Td1" style="text-align:center;color:red;font:100"></td>
            </tr>
        </table>
        </form>
    </div>
    <div id="dlg_user_info_buttons" style="text-align:center;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="ChangeUserInfo()">Save</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#dlg_user_info').dialog('close')">Close</a>
    </div>
    <!-- // #用户信息对话框-->
</body>
</html>

