<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Message_Control.aspx.cs" Inherits="WebApplication1.Info" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Complex DataGrid - jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.4/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.4/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.4/demo/demo.css">
	<script type="text/javascript" src="Scripts/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="jquery-easyui-1.3.4/plugins/datagrid-detailview.js"></script>
</head>
<body>
    <table id="dg" class="easyui-datagrid" style="width:735px;height:400px"
            title="客户留言" singleSelect="true"
            rownumbers="true" pagination="true">

    </table>

    <div id="dg_mm" class="easyui-menu" style="width:120px;">
        <div onClick="DeleteMsg()" data-options="iconCls:'icon-remove'">删除</div>
    </div>

    <script type="text/javascript">
        function DeleteMsg() {
            if (!($('#dg').datagrid('getSelected')))
                return;
            $.ajax({
                type: "POST",
                url: "/logic/MessageHandler.ashx",
                async: false,
                dataType: "json",
                data: "method=DeleteMsg&UID=" + $('#dg').datagrid('getSelected').UID,
                success: function (data) {
                    if (data.state == "error") {
                        alert(json.error);
                    }
                    else {
                        var row = $('#dg').datagrid('getSelected');
                        var index = $('#dg').datagrid('getRowIndex', row);
                        $('#dg').datagrid('deleteRow', index);
                    }
                }
            })
        }
        $(function () {

            //添加右击菜单内容
            function onRowContextMenu(e, rowIndex, rowData) {
                e.preventDefault();
                $("#dg").datagrid('selectRow', rowIndex);
                $('#dg_mm').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
            }

            function LoadRecycleInfo() {
                $.ajax({
                    type: "POST",
                    url: "/logic/MessageHandler.ashx?method=LoadMessage",
                    cache: false,
                    async: false,
                    success: function (data) {
                        var jdata = $.parseJSON(data);
                        $('#dg').datagrid({
                            onRowContextMenu: onRowContextMenu,
                            columns: [[
                                { field: 'datetime', width: 120, title: '日期' },
                                { field: 'email', width: 120, title: '邮箱' },
                                { field: 'msg', width: 340, title: '留言' },
		                        {field: 'UID',title: 'UID', width: 0,hidden: true}
                            ]],
                            view: detailview,
                            data: jdata,
                            detailFormatter: function (index, row) {
                                return '<div class="ddv"   title="Basic Panel" style="padding:5px 1">' +
                                    ' <table width=200px style="border:0">' +
                                    '<tr><td>datetime:</td><td>' + row.datetime + '</td></tr>' +
                                    '<tr><td>email:</td><td>' + row.email + '</td></tr>' +
                                    '<tr><td>Message:</td><td><textarea name="message"  disabled="disabled"  style="height:60px;">' + row.msg + '</textarea></td></tr>' +
                                        '</table >' +
                                '</div>';
                            }
                        }) 
                    }
                })

            }

            LoadRecycleInfo();
        });
    </script>
</body>
</html>