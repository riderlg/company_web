<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="News_Control.aspx.cs" Inherits="WebApplication1.News_Control" %>

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
    <style type="text/css">
    .row_height{ line-height:40px;}
    </style>
</head>
<body>
    <table id="dg" class="easyui-datagrid" style="width:735px;height:400px"
            title="新闻管理" singleSelect="true"
            rownumbers="true" pagination="true">
    </table>

    <div id="tb" style="padding:5px;height:auto">
        <a href="javascript:void(0)" onclick="OpenAddDlg()" class="easyui-linkbutton" iconCls="icon-add" plain="true"></a>
        <a href="javascript:void(0)" onclick="OpenEditDlg()" class="easyui-linkbutton" iconCls="icon-edit" plain="true"></a>
        <a href="javascript:void(0)" onclick="DelNews()" class="easyui-linkbutton" iconCls="icon-cut" plain="true"></a>
    </div>

    <div id="dg_mm" class="easyui-menu" style="width:120px;">
        <div onClick="OpenEditDlg()" data-options="iconCls:'icon-edit'">编辑</div>
        <div onClick="DelNews()" data-options="iconCls:'icon-remove'">删除</div>
    </div>


    <!-- add对话框-->
    <div id="dlg_add" class="easyui-dialog" title="添加新闻" modal="true"  data-options="buttons: '#dlg_add_buttons'" style="margin:0 auto;height: 300px; width:400px">
        <form id="Form1" action="form" method="post" >
        <table style="margin:0 auto;width:220">
            <tr  class="row_height">
                <td><a>日期:</a></td>
                <td><a id="datetime"></a></td>
            </tr>
            <tr  class="row_height" style="line-height:15px">
                <td><a>新闻标题:</a></td>
               <td><input class="easyui-validatebox"  id="title" ></input></td>
            </tr>
            <tr  class="row_height">
                <td><a>新闻:</a></td>
                <td><textarea id="message"   style="height:80px;"></textarea></td>
            </tr>
            <tr  class="row_height" style="line-height:15px">
                <td><a>新闻状态:</a></td>
                <td >
                <select id="status" class="easyui-combobox"  style="width:150px;">   
                <option value=0>隐藏</option>   
                <option value=1>显示</option>
                </select>     
                </td>
            </tr>
            <tr class="row_height">
                <td colspan="2" id="error" style="text-align:center;color:red;font:100"></td>
            </tr>
        </table>
        </form>
    </div>
    <div id="dlg_add_buttons" style="text-align:center;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="AddNews()">Save</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#dlg_add').dialog('close')">Close</a>
    </div>
    <!-- add对话框-->


    <!-- edit对话框-->
    <div id="dlg_edit" class="easyui-dialog" title="编辑新闻" modal="true"  data-options="buttons: '#dlg_edit_buttons'" style="margin:0 auto;height: 300px; width:400px">
        <form id="Form2" action="form" method="post" >
        <table style="margin:0 auto;width:220">
           <tr  class="row_height">
                <td><a>日期:</a></td>
                <td><a id="datetime"></a></td>
            </tr>
            <tr  class="row_height" style="line-height:15px">
                <td><a>新闻标题:</a></td>
               <td><input class="easyui-validatebox"  id="title" ></input></td>
            </tr>
            <tr  class="row_height">
                <td><a>新闻:</a></td>
                <td><textarea id="message"   style="height:80px;"></textarea></td>
            </tr>
            <tr  class="row_height" style="line-height:15px">
                <td><a>新闻状态:</a></td>
                <td>
                <select id="status" class="easyui-combobox"  style="width:200px;">   
                <option value=0>隐藏</option>   
                <option value=1>显示</option>
                </select>     
                </td>
            </tr>
            <tr class="row_height">
                <td colspan="2" id="error" style="text-align:center;color:red;font:100"></td>
            </tr>
        </table>
        </form>
    </div>
    <div id="dlg_edit_buttons" style="text-align:center;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="EditNews()">Save</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#dlg_edit').dialog('close')">Close</a>
    </div>
    <!-- edit对话框-->

    <script type="text/javascript">
        function timeStamp2String() {
            var datetime = new Date();
            // datetime.setTime(time); 
            var year = datetime.getFullYear();
            var month = datetime.getMonth() + 1 < 10 ?  (datetime.getMonth() + 1) : datetime.getMonth() + 1;
            var date = datetime.getDate() < 10 ? datetime.getDate() : datetime.getDate();
            var hour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime.getHours();
            var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
            var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
            return year + "/" + month + "/" + date + " " + hour + ":" + minute + ":" + second;
        }



        function OpenEditDlg() {
            var select = $('#dg').datagrid('getSelected');
            if (!(select))
                return;
            $("#dlg_edit #datetime").text(select.datetime);
            $("#dlg_edit #message").html(select.msg);
            $("#dlg_edit #title").val(select.title);
            $("#dlg_edit #status").combobox('setValue', select.status);
            $('#dlg_edit').dialog('open');
        }


        function OpenAddDlg() {
            var date = new Date();
            $("#dlg_add #datetime").text(timeStamp2String);
            $("#dlg_add #message").html("");
            var title = $("#dlg_add #title").val("");
            $('#dlg_add').dialog('open');
        }

        function AddNews() {
            var datetime = $("#dlg_add #datetime").text();
            var message = $("#dlg_add #message").val();
            var title = $("#dlg_add #title").val();
            if (message.length == 0 || title.length == 0) {
                $("#dlg_add #error").html("输入不能空");
                return;
            }
            var status = $("#dlg_add #status").combobox('getValue');
            if (status == null || status == "") {
                $("#dlg_add #error").html("选择新闻显示状态");
                return;
            }
            $.ajax({
                type: "POST",
                url: "/logic/NewsHandler.ashx",
                async: false,
                dataType: "json",
                data: "method=AddNews&msg=" + message +
                    "&title="+title+
                    "&datetime="+datetime+
                    "&status="+status,
                success: function (data) {
                    if (data.state == "error") {
                        alert(json.error);
                    }
                    else {
                        $('#dg').datagrid('insertRow', {
                            index: 0,
                            row: {
                                msg: message,
                                title: title,
                                datetime: datetime,
                                status: status,
                                statusStr: $("#dlg_add #status").combobox('getText'),
                                UID: data.UID
                            }
                        });
                        $('#dlg_add').dialog('close');
                    }
                }
            })
        }

        function EditNews() {
            var select = $('#dg').datagrid('getSelected');
            var UID = select.UID; 
            var datetime = $("#dlg_edit #datetime").text();
            var message = $("#dlg_edit #message").val();
            var title = $("#dlg_edit #title").val();
            if (message.length == 0 || title.length == 0) {
                $("#dlg_edit #error").html("输入不能空");
                return;
            }
            var status = $("#dlg_edit #status").combobox('getValue');
            if (status == null || status == "") {
                $("#dlg_edit #error").html("选择新闻显示状态");
                return;
            }
            $.ajax({
                type: "POST",
                url: "/logic/NewsHandler.ashx",
                async: false,
                dataType: "json",
                data: "method=EditNews&msg=" + message +
                    "&title=" + title +
                    "&datetime=" + datetime +
                    "&status=" + status +
                    "&UID=" + UID,
                success: function (data) {
                    if (data.state == "error") {
                        alert(json.error);
                    }
                    else {
                        var indexNum = $('#dg').datagrid('getRowIndex', select);
                         $('#dg').datagrid('updateRow', {
                            index: indexNum,
                            row: {
                                msg: message,
                                title: title,
                                datetime: datetime,
                                status: status,
                                statusStr: $("#dlg_edit #status").combobox('getText'),
                                UID: UID
                            }
                        });
                        $('#dlg_edit').dialog('close');
                    }
                }
            })
        }
        function DelNews() {
            if (!($('#dg').datagrid('getSelected')))
                return;
            $.ajax({
                type: "POST",
                url: "/logic/NewsHandler.ashx",
                async: false,
                dataType: "json",
                data: "method=DelNews&UID=" + $('#dg').datagrid('getSelected').UID,
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
            $('#dlg_add').dialog('close');
            $('#dlg_edit').dialog('close');

            $('#dg').datagrid({
                toolbar: '#tb',
                onRowContextMenu: onRowContextMenu,
                columns: [[
                    { field: 'datetime', width: 110, title: '日期' },
                    { field: 'title', width: 160, title: '新闻标题' },
                    { field: 'msg', width: 320, title: '新闻信息' },
                    { field: 'statusStr', width: 100, title: '显示新闻' },
                    { field: 'status', title: 'status', width: 0, hidden: true },
                    { field: 'UID', title: 'UID', width: 0, hidden: true }
                ]]
            });

            //添加右击菜单内容
            function onRowContextMenu(e, rowIndex, rowData) {
                e.preventDefault();
                var selected = $("#dg").datagrid('getRows'); //获取所有行集合对象
                $("#dg").datagrid('selectRow', rowIndex);
                $('#dg_mm').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
            }

            function LoadRecycleInfo() {
                $.ajax({
                    type: "POST",
                    url: "/logic/NewsHandler.ashx?method=LoadMessage",
                    cache: false,
                    async: false,
                    success: function (data) {
                        if (data != "false") {
                            var jdata = $.parseJSON(data);
                            $('#dg').datagrid({
                                data: jdata
                            })
                        }
                    }
                })

            }
            LoadRecycleInfo();
        });
    </script>
</body>
</html>