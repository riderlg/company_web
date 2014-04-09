<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductOrder_Control.aspx.cs" Inherits="WebApplication1.ProductRoder_Control" %>

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
            title="订单管理" singleSelect="true"
            rownumbers="true" pagination="true">
    </table>

    <div id="dg_mm" class="easyui-menu" style="width:120px;">
        <div onClick="OpenCheckDlg()" data-options="iconCls:'icon-add'">查看</div>
        <div onClick="DelProductOrder()" data-options="iconCls:'icon-remove'">删除</div>
        <div id="status" onClick="SetProcessed()" data-options="iconCls:'icon-edit'">标记为已处理</div>
    </div>

    <div id="tb" style="height:auto">
        <select id="product_order_status" class="easyui-combobox"  style="width:150px;">   
                <option value=0>待处理</option>   
                <option value=1>已处理</option>
        </select>
        <a href="javascript:void(0)" onclick="LoadProductOrder()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">Load</a> 
    </div>

    <!-- check对话框-->
    <div id="dlg_check" class="easyui-dialog" title="查看订单" modal="true"  style="margin:0 auto;height: 500px; width:400px">
        <form id="Form2" action="form" method="post" >
        <table style="margin:0 auto;width:220">
            <tr  class="row_height">
                <td><a>订单号:</a></td>
                <td><input class="easyui-validatebox"  id="order_num" disabled="disabled" ></input></td>
            </tr>
            <tr  class="row_height">
                <td><a>日期:</a></td>
                <td><input class="easyui-validatebox"  id="datetime"  disabled="disabled"></input></td>
            </tr>
            <tr  class="row_height">
                <td><a>客户姓名:</a></td>
                <td><input class="easyui-validatebox"  id="name" disabled="disabled"></input></td>
            </tr>
            <tr  class="row_height">
                <td><a>预订产品:</a></td>
                <td><input class="easyui-validatebox"  id="product_name" disabled="disabled"></input></td>
            </tr>
            <tr  class="row_height">
                <td><a>产品数量:</a></td>
                <td><input class="easyui-validatebox"  id="product_amount" disabled="disabled"></input></td>
            </tr>
            <tr  class="row_height">
                <td><a>邮箱:</a></td>
                <td><input class="easyui-validatebox"  id="email" disabled="disabled"></input></td>
            </tr>
            <tr  class="row_height">
                <td><a>电话:</a></td>
                <td><input class="easyui-validatebox"  id="telephone" disabled="disabled"></input></td>
            </tr>
            <tr  class="row_height">
                <td><a>订单状态:</a></td>
                <td><input class="easyui-validatebox"  id="status" disabled="disabled"></input></td>
            </tr>
            <tr class="row_height">
                <td colspan="2" id="error" style="text-align:center;color:red;font:100"></td>
            </tr>
        </table>
        </form>
    </div>

    <!-- check对话框-->

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


        function OpenCheckDlg() {
            var select = $('#dg').datagrid('getSelected');
            if (!(select))
                return;
            $("#dlg_check #datetime").val(select.datetime);
            $("#dlg_check #name").val(select.name);
            $("#dlg_check #email").val(select.email);
            $("#dlg_check #product_name").val(select.product_name);
            $("#dlg_check #product_amount").val(select.product_amount);
            $("#dlg_check #telephone").val(select.telephone);
            $("#dlg_check #order_num").val(select.order_num);
            $("#dlg_check #status").val((select.status==0)?'待处理':'已处理');
            $('#dlg_check').dialog('open');
        }

        function SetProcessed()
        {
            if(!($('#dg').datagrid('getSelected')))
                return;
            $.ajax({
                type: "POST",
                url: "/logic/ProductOrderHandler.ashx",
                async: false,
                dataType: "json",
                data: "method=SetProcessed&order_num=" + $('#dg').datagrid('getSelected').order_num,
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
        
        function DelProductOrder() {
            if (!($('#dg').datagrid('getSelected')))
                return;
            $.ajax({
                type: "POST",
                url: "/logic/ProductOrderHandler.ashx",
                async: false,
                dataType: "json",
                data: "method=DelProductOrder&order_num=" + $('#dg').datagrid('getSelected').order_num,
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

        function LoadProductOrder()
        {
            $.ajax({
                type: "POST",
                url: "/logic/ProductOrderHandler.ashx",
                data: "method=LoadMessage&status=" + $('#product_order_status').combobox('getValue'),
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

        $(function () {
            $('#dlg_check').dialog('close');

            $('#dg').datagrid({
                toolbar: '#tb',
                onRowContextMenu: onRowContextMenu,
                columns: [[
                    { field: 'datetime', width: 120, title: '日期' },
                    { field: 'order_num', width: 120, title: '订单号' },
                    { field: 'name', width: 100, title: '客户姓名' },
                    { field: 'product_name', width: 100, title: '预订产品' },
                    { field: 'product_amount', width: 100, title: '产品数量' },
                    { field: 'telephone', title: 'telephone', width: 0, hidden: true },
                    { field: 'email', title: 'email', width: 0, hidden: true },
                    { field: 'product_UID', title: 'product_UID', width: 0, hidden: true },
                    { field: 'status', title: 'status', width: 0, hidden: true }
                ]]
            });
            //添加右击菜单内容
            function onRowContextMenu(e, rowIndex, rowData) {
                e.preventDefault();
                var selected = $("#dg").datagrid('getRows'); //获取所有行集合对象
                $("#dg").datagrid('selectRow', rowIndex);
                
                if (rowData.status == 1) {
                    $('#dg_mm #status').remove();
                }
                $('#dg_mm').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
            }
        });
    </script>
</body>
</html>
