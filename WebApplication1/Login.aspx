<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1._Default" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title></title>
    <script  type="text/javascript" src="Scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript">
        function SetError(data) {
            $("#pwd").val("");
            $("#name").val("");
            $("#result").html(data).show(500);
        }
        function btnlogin() {
            if ($("#pwd").val() == "" || $("#name").val() == "") {
                SetError("账号密码不能为空");
                return false;
            }
            $("#result").val("");
            $.ajax({
                type: "POST",
                url: "/logic/LoginHandler.ashx",
                cache: false,
                async: false,
                data: "u=" + encodeURIComponent($("#name").val()) + "&p=" + encodeURIComponent($("#pwd").val()),
                beforeSend: function () {

                },
                complete: function () {

                },
                success: function (data) {
                    if (Number(data) == 1) {
                        window.location.href = "index.aspx";
                    }
                    else if (Number(data) == 0) {
                        SetError("账户或密码错误");
                    }
                    else
                    {
                        alert(data);
                    }
                },
                error: function (data) {
                    alert("登录失败:" + data);
            }
            });
            return true;
        }
    </script>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
    <form id="form1" class="login" runat="server">
        <h1>COMPANY</h1>
        <input id="name" type="text" class="login-input" placeholder="UserName" />
        <input id="pwd" type="password" class="login-input" placeholder="Password"/>
        <input id="login" type="button" class="login-submit" onclick="btnlogin()" value=" 登&nbsp;&nbsp;录"/>
        <p id="result" class="login-help"></p>
    </form>
</body>
</html>

