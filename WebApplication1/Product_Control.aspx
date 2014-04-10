<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product_Control.aspx.cs" Inherits="WebApplication1.Product_Control" %>

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
    <body class="easyui-layout" >
        <div data-options="region:'west',collapsed:true,split:true,title:'&amp;nbsp;'" style="height:380px;width:150px;">
            <table id="global_category" class="easyui-datagrid"  style="width:700px;width:140px;padding:2px"
                singleSelect="true">
            </table>
        </div>
        <div data-options="region:'center'">
            <table id="dg" class="easyui-datagrid"  style="width:700px;height:380px"
                    title="产品管理" singleSelect="true"
                    rownumbers="true" pagination="true">
            </table>
      </div>
        <div id="dg_mm" class="easyui-menu" style="width:120px;">
        <div onClick="OpenEditDlg()" data-options="iconCls:'icon-edit'">编辑</div>
        <div onClick="DelProduct()" data-options="iconCls:'icon-remove'">删除</div>
        </div>


        <div id="global_category_header_mm" class="easyui-menu" style="width:120px;">
        <div onClick="OpenAddProductCategoryDlg()" data-options="iconCls:'icon-add'">新增</div>
        </div>

        <div id="global_category_mm" class="easyui-menu" style="width:120px;">
        <div onClick="OpenAddProductCategoryDlg()" data-options="iconCls:'icon-add'">新增</div>
        <div onClick="OpenEditProductCategoryDlg()" data-options="iconCls:'icon-edit'">编辑</div>
        <div onClick="DelProductCategory()" data-options="iconCls:'icon-remove'">删除</div>
        </div>


    <div id="tb" style="height:auto">
       <div>
            <input class="easyui-combobox" id="global_category_combobox" style="line-height:15px" data-options="valueField:'id',textField:'text'">
            <a href="javascript:void(0)" onclick="LoadProduct()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">Load</a> 
       </div>
        <div>
            <a href="javascript:void(0)" onclick="OpenAddDlg()" class="easyui-linkbutton" iconCls="icon-add" plain="true"></a>
            <a href="javascript:void(0)" onclick="OpenEditDlg()" class="easyui-linkbutton" iconCls="icon-edit" plain="true"></a>
            <a href="javascript:void(0)" onclick="DelProduct()" class="easyui-linkbutton" iconCls="icon-cut" plain="true"></a>
        </div>
    </div>

    <!-- add产品类别对话框-->
    <div id="dlg_category_add" class="easyui-dialog" title="添加产品类别" modal="true"  data-options="buttons: '#dlg_category_add_buttons'" style="margin:0 auto;height: 150px; width:350px">
        <form id="Form3" action="form" method="post" >
        <table style="margin:0 auto;width:250px">
            <tr  class="row_height" style="line-height:15px">
                <td><a>产品类别:</a></td>
               <td><input class="easyui-validatebox"  id="category" ></input></td>
            </tr>
            <tr class="row_height">
                <td colspan="2" id="error" style="text-align:center;color:red;font:100"></td>
            </tr>
        </table>
        </form>
    </div>
    <div id="dlg_category_add_buttons" style="text-align:center;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="AddProductCategory()">Save</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#dlg_category_add').dialog('close')">Close</a>
    </div>
    <!-- add产品类别对话框-->

    <!-- edit产品类别对话框-->
    <div id="dlg_category_edit" class="easyui-dialog" title="添加产品类别" modal="true"  data-options="buttons: '#dlg_category_edit_buttons'" style="margin:0 auto;height: 150px; width:350px">
        <form id="Form4" action="form" method="post" >
        <table style="margin:0 auto;width:250px">
            <tr  class="row_height" style="line-height:15px">
                <td><a>旧的产品类别:</a></td>
               <td><input class="easyui-validatebox"  id="oldcategory" disabled="disabled"></input></td>
            </tr>
            <tr  class="row_height" style="line-height:15px">
                <td><a>新的产品类别:</a></td>
               <td><input class="easyui-validatebox"  id="category" ></input></td>
            </tr>
            <tr class="row_height">
                <td colspan="2" id="error" style="text-align:center;color:red;font:100"></td>
            </tr>
        </table>
        </form>
    </div>
    <div id="dlg_category_edit_buttons" style="text-align:center;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="EditProductCategory()">Save</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#dlg_category_edit').dialog('close')">Close</a>
    </div>
    <!-- edit产品类别对话框-->



    <!-- add产品对话框-->
    <div id="dlg_add" class="easyui-dialog" title=添加产品" modal="true"  data-options="buttons: '#dlg_add_buttons'" style="margin:0 auto;height: 350px; width:400px">
        <form id="Form1" action="form" method="post" >
        <table style="margin:0 auto;width:250px">
            <tr  class="row_height" style="line-height:15px">
                <td><a>产品类别:</a></td>
                <td><input class="easyui-combobox" id="category" style="line-height:15px" data-options="valueField:'id',textField:'text'"></td>
            </tr>
            <tr  class="row_height">
                <td><a>产品名称:</a></td>
                <td><input class="easyui-validatebox"  id="name" ></input></td>
            </tr>
            <tr  class="row_height">
                <td><a>产品描述:</a></td>
                <td><textarea id="description"   style="height:80px;"></textarea></td>
            </tr>
            <tr  class="row_height">
                <td><a>产品图片:</a></td>
                <td><input class="easyui-validatebox"  id="img" ></input></td>
            </tr>
            <tr class="row_height">
                <td colspan="2" id="error" style="text-align:center;color:red;font:100"></td>
            </tr>
        </table>
        </form>
    </div>
    <div id="dlg_add_buttons" style="text-align:center;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="AddProduct()">Save</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#dlg_add').dialog('close')">Close</a>
    </div>
    <!-- add产品对话框-->


    <!-- edit产品对话框-->
    <div id="dlg_edit" class="easyui-dialog" title="编辑产品" modal="true"  data-options="buttons: '#dlg_edit_buttons'" style="margin:0 auto;height: 350px; width:400px">
        <form id="Form2" action="form" method="post" >
        <table style="margin:0 auto;width:250px">
            <tr  class="row_height" style="line-height:15px">
                <td><a>产品类别:</a></td>
                <td><input class="easyui-combobox" id="category" style="line-height:15px" data-options="valueField:'id',textField:'text'"></td>
            </tr>
            <tr  class="row_height">
                <td><a>产品名称:</a></td>
                <td><input class="easyui-validatebox"  id="name" ></input></td>
            </tr>
            <tr  class="row_height">
                <td><a>产品描述:</a></td>
                <td><textarea id="description"   style="height:80px;"></textarea></td>
            </tr>
            <tr  class="row_height">
                <td><a>产品图片:</a></td>
                <td><input class="easyui-validatebox"  id="img" ></input></td>
            </tr>
            <tr class="row_height">
                <td colspan="2" id="Td1" style="text-align:center;color:red;font:100"></td>
            </tr>
        </table>
        </form>
    </div>
    <div id="dlg_edit_buttons" style="text-align:center;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="EditProduct()">Save</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#dlg_edit').dialog('close')">Close</a>
    </div>
    <!-- edit产品对话框-->

    <script type="text/javascript">

        function GetCategory() {
            var json;
            $.ajax({
                type: "POST",
                url: "/logic/ProductHandler.ashx",
                async: false,
                data: "method=GetCategory",
                success: function (data) {
                    json = data;
                }
            });
            return json;
        }

        function OpenAddProductCategoryDlg(){
            $("#dlg_category_add #categroy").val("");
            $('#dlg_category_add').dialog('open');
        }
        function OpenEditProductCategoryDlg() {
            var select = $('#global_category').datagrid('getSelected');
            if (!(select))
                return;
            $("#dlg_category_edit #oldcategory").val(select.category);
            $("#dlg_category_edit #categroy").val("");
            $('#dlg_category_edit').dialog('open');
        }

        function OpenEditDlg() {
            var select = $('#dg').datagrid('getSelected');
            if (!(select))
                return;
            $("#dlg_edit #name").val(select.name);
            $("#dlg_edit #img").val(select.img);
            $("#dlg_edit #description").html(select.description);
            var jdata = $.parseJSON(GetCategory());
            $("#dlg_edit #category").combobox({
                data: jdata
            });
            $("#dlg_edit #category").combobox("setText", select.category);
            $('#dlg_edit').dialog('open');
        }
        

        function OpenAddDlg() {
            var jdata = $.parseJSON(GetCategory());
             $("#dlg_add #category").combobox({
                            data: jdata
                        });
            $("#dlg_add #name").val("");
            $("#dlg_add #img").val("");
            $("#dlg_add #description").val("");
            $('#dlg_add').dialog('open');

        }

        //添加产品类型
        function AddProductCategory(){
            var category = $("#dlg_category_add #category").val();
            if (category.length == 0) {
                $("#dlg_category_add #error").html("输入不能空.");
                return;
            }
            $.ajax({
                type: "POST",
                url: "/logic/ProductHandler.ashx",
                async: false,
                dataType: "json",
                data: "method=AddProductCategory&category=" + category,
                success: function (data) {
                    if (data.state == "error") {
                        $('#dlg_add').dialog('close');
                        alert(json.error);
                    }
                    else {
                        $('#global_category').datagrid('insertRow', {
                            index: 0,
                            row: {
                                category: category,
                                UID: data.UID
                            }
                        });
                        var msg = '{ "text":"' + category + '","id":' + data.UID + '}';
                        var temp = $.parseJSON(msg);
                        var json = $('#global_category_combobox').combobox('getData');
                        json[json.length] = temp;
                        var json = $('#global_category_combobox').combobox('loadData', json);
                        $('#dlg_category_add').dialog('close');
                    }
                }
            })
        }

        //添加产品
        function AddProduct() {
            var description = $("#dlg_add #description").val();
            var img = $("#dlg_add #img").val();
            var name = $("#dlg_add #name").val();
            if (description.length == 0 || img.length == 0 || name.length == 0) {
                $("#dlg_add #error").html("输入不能空.");
                return;
            }
            var category = $("#dlg_add #category").combobox('getValue');
            if (category == null || category == ""){
                $("#dlg_add #error").html("请选择产品类型.");
                return;
            }
            $.ajax({
                type: "POST",
                url: "/logic/ProductHandler.ashx",
                async: false,
                dataType: "json",
                data: "method=AddProduct&description=" +description+
                    "&img=" + img +
                    "&name=" + name+
                    "&category=" + category,
                success: function (data) {
                    if (data.state == "error") {
                        $('#dlg_add').dialog('close');
                        alert(json.error);
                    }
                    else {
                        $('#dg').datagrid('insertRow', {
                            index: 0,
                            row: {
                                img: img,
                                name: name,
                                category: $("#dlg_add #category").combobox('getText'),
                                description: description,
                                UID: data.UID
                            }
                        });
                        $('#dlg_add').dialog('close');
                    }
                }
            })
        }

        //编辑产品类型
        function EditProductCategory() {
            var select = $('#global_category').datagrid('getSelected');
            var category = $("#dlg_category_edit #category").val();
 
            if (category.length == 0) {
                $("#dlg_category_edit #error").html("输入不能空.");
                return;
            }
            var UID = select.UID;
            $.ajax({
                type: "POST",
                url: "/logic/ProductHandler.ashx",
                async: false,
                dataType: "json",
                data: "method=EditProductCategory&UID=" + UID+
                    "&category="+category,
                success: function (data) {
                    if (data.state == "error") {
                        $('#dlg_category_edit').dialog('close');
                        alert(json.error);
                    }
                    else {
                        var indexNum = $('#global_category').datagrid('getRowIndex', select);
                        $('#global_category').datagrid('updateRow', {
                            index: indexNum,
                            row: {
                                category: category,
                                UID: UID
                            }
                        });
                        LoadCategoryCombobox();
                        $('#dlg_category_edit').dialog('close');
                    }
                }
            })
        }

        //编辑产品
        function EditProduct() {
            var select = $('#dg').datagrid('getSelected');
            var description = $("#dlg_edit #description").val();
            var img = $("#dlg_edit #img").val();
            var name = $("#dlg_edit #name").val();
            if (description.length == 0 || img.length == 0 || name.length == 0) {
                $("#dlg_edit #error").html("输入不能空.");
                return;
            }
            var category = $("#dlg_edit #category").combobox('getValue');
            var UID = select.UID;
            $.ajax({
                type: "POST",
                url: "/logic/ProductHandler.ashx",
                async: false,
                dataType: "json",
                data: "method=EditProduct&description=" + description +
                    "&img=" + img +
                    "&name=" + name +
                    "&category=" + category +
                    "&UID=" + UID,
                success: function (data) {
                    if (data.state == "error") {
                        $('#dlg_edit').dialog('close');
                        alert(json.error);
                    }
                    else {
                        
                        var indexNum = $('#dg').datagrid('getRowIndex', select);
                        $('#dg').datagrid('updateRow', {
                            index: indexNum,
                            row: {
                                img: img,
                                name: name,
                                category: $("#dlg_edit #category").combobox('getText'),
                                description: description,
                                UID: data.UID
                            }
                        });
                        $('#dlg_edit').dialog('close');
                    }
                }
            })
        }

        //删除产品类型
        function DelProductCategory()
        {
            if (!($('#global_category').datagrid('getSelected')))
                return;
            $.ajax({
                type: "POST",
                url: "/logic/ProductHandler.ashx",
                async: false,
                dataType: "json",
                data: "method=DelProductCategory&UID=" + $('#global_category').datagrid('getSelected').UID,
                success: function (data) {
                    if (data.state == "error") {
                        alert(json.error);
                    }
                    else {
                        var row = $('#global_category').datagrid('getSelected');
                        var index = $('#global_category').datagrid('getRowIndex', row);
                        $('#global_category').datagrid('deleteRow', index);
                        LoadCategoryCombobox();
                    }
                }
            })
        }

        ///删除产品
        function DelProduct() {
            if (!($('#dg').datagrid('getSelected')))
                return;
            $.ajax({
                type: "POST",
                url: "/logic/ProductHandler.ashx",
                async: false,
                dataType: "json",
                data: "method=DelProduct&UID=" + $('#dg').datagrid('getSelected').UID,
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
        function LoadCategoryCombobox() {
            var jdata = $.parseJSON(GetCategory());
            $("#global_category_combobox").combobox({
                data: jdata
            });
        }

        function LoadProduct() {
            var UID = $("#global_category_combobox").combobox('getValue');
            if (UID == null || UID.length == 0)
                return;
                $.ajax({
                    type: "POST",
                    url: "/logic/ProductHandler.ashx",
                    data: "method=LoadMessage&categoryUID=" + UID,
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
            $('#dlg_add').dialog('close');
            $('#dlg_edit').dialog('close'); 
            $('#dlg_category_add').dialog('close'); 
            $('#dlg_category_edit').dialog('close');

            $('#global_category').datagrid({
                singleSelect: true,
                onRowContextMenu: onCategoryRowContextMenu,
                onHeaderContextMenu: function(e, field){  
                    e.preventDefault();  
                    $('#global_category_header_mm').menu('show', {  
                        left:e.pageX,  
                        top:e.pageY });
                }, 
                columns: [[
                   { field: 'category', width: 137, title: '产品类别' },
                   { field: 'UID', title: 'UID', width: 0, hidden: true }
                ]]
            });

            //添加右击菜单内容
            function onCategoryRowContextMenu(e, rowIndex, rowData) {
                e.preventDefault();
                var selected = $("#global_category").datagrid('getRows'); //获取所有行集合对象
                $("#global_category").datagrid('selectRow', rowIndex);
                $('#global_category_mm').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
            }

            $('#dg').datagrid({
                toolbar: '#tb',
                onRowContextMenu: onMenu,
                singleSelect: true,
                columns: [[
                    { field: 'category', width: 100, title: '产品类别' },
                    { field: 'name', width: 100, title: '产品名称' },
                    { field: 'description', width: 340, title: '产品描述' },
                    { field: 'img', width: 120, title: '产品图片' },
                    { field: 'UID', title: 'UID', width: 0, hidden: true }
                ]]
            });
            //添加右击菜单内容
            function onMenu(e, rowIndex, rowData) {
                e.preventDefault();
                $("#dg").datagrid('selectRow', rowIndex);
                $('#dg_mm').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
            }

            

            function LoadRecycleInfo() {
                LoadCategoryCombobox();
                $.ajax({
                    type: "POST",
                    url: "/logic/ProductHandler.ashx?method=LoadCategory",
                    cache: false,
                    async: false,
                    success: function (data) {
                        if (data != "false") {
                            var jdata = $.parseJSON(data);
                            $('#global_category').datagrid({
                                data: jdata
                            })
                        }
                    }
                })
            }
            LoadRecycleInfo();
            LoadProduct()
        });
    </script>
</body>
</html>