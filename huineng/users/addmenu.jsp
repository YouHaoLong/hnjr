<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String product_host = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>添加</title>

		<!-- Bootstrap core CSS -->
		<link href="<%=product_host%>static/view/css/bootstrap.min.css" rel="stylesheet">

		<link href="<%=product_host%>static/view/css/dashboard.css" rel="stylesheet">
		<link href="<%=product_host%>static/view/css/index.css" rel="stylesheet">

		<link rel="stylesheet" href="<%=product_host%>static/view/css/style.css">

		<script src="<%=product_host%>static/view/js/jquery.min.js"></script>
		<script src="<%=product_host%>static/view/js/bootstrap-table.js"></script>
		<script src="<%=product_host%>static/view/js/bootstrap.min.js"></script>
		<script src="<%=product_host%>static/view/js/modernizr.js"></script>

		<script type="text/javascript" src="<%=product_host%>static/view/js/My97DatePicker/WdatePicker.js"></script>
	</head>
	<style>

	</style>

	<body style="background: none; width: 600px; height: 420px;">

		<div class="modal-body">
			<form class="form-horizontal">
				<div class="row">
					<div class="col-md-6" style="width: 50%; float: left;">
						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left; width: 30%; display: block; font-size: 14px;">资源名称</label>
							<div class="col-sm-9" style="float: left;">
								<input class="form-control" type="text" id="name" placeholder="请输入资源名称">
							</div>
						</div>
					</div>
					<div class="col-md-6" style="width: 50%; float: left;">
						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left; width: 30%; display: block;">资源类型</label>
							<div class="col-sm-9" style="float: left;">
								<select class="form-control" id="resourcetype">
																	<option value="0">菜单</option>
																	<option value="1">按钮</option>
																</select>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6" style="width: 50%; float: left;">
						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left; width: 30%; display: block;">资源路径</label>
							<div class="col-sm-9" style="float: left;">
								<input class="form-control" type="text" id="url" placeholder="请输入资源路径">
							</div>
						</div>
					</div>
					<div class="col-md-6" style="width: 50%; float: left;">
						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left; width: 30%; display: block;">排序</label>
							<div class="col-sm-9" style="float: left;">
								<input class="form-control" type="text" id="seq" value="0">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6" style="width: 50%; float: left;">
						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left;width: 30%; display: block;">菜单图标</label>
							<div class="col-sm-9" style="float: left;">
								<input class="form-control" type="text" id="icon" placeholder="请输入菜单图标">
							</div>
						</div>
					</div>
					<div class="col-md-6" style="width: 50%; float: left;">
						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left;width: 30%; display: block;">状态</label>
							<div class="col-sm-9" style="float: left;">
								
								<select class="form-control" id="status">
																	<option value="0">正常</option>
																	<option value="1">停用</option>
																</select>
							</div>
						</div>
					</div>
				</div>

				<div class="row">

					<div class="col-md-6" style="width: 70%; float: left;">

						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left;width: 25%; display: block; margin-right: 0;padding-right: 0;">上级资源</label>
							<div class="col-sm-9" style="float: left; width: 70%;">
								<input id="citySel" type="text" class="form-control" value="" onclick="showMenu(); return false;" style="float: left; width: 80%; margin-right: 5px;" />
								<button class="btn btn-default btn-sm" style="float: left;" >清空</button></div>
								<input type="hidden" id="pid" value="" />
						</div>
					</div>

				</div>

				<div id="menuContent" class="menuContent" style="display:none; position:fixed; z-index: 10;">
					<ul id="treeDemo" class="ztree" style="margin-top:0; width:200px;"></ul>

			</form>
			</div>
			<div class="modal-footer" style="position: fixed; left: 0; bottom: 0; width: 100%;">
				<!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
				<button type="button" class="btn btn-primary" onclick="window.parent.addcon()">添加</button>
			</div>

	</body>

	<link rel="stylesheet" href="<%=product_host%>static/view/tree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" href="<%=product_host%>static/view/tree/css/demo.css" type="text/css">
	<script type="text/javascript" src="<%=product_host%>static/view/tree/js/jquery.ztree.core.js"></script>

	<script>
		
	</script>

	<SCRIPT type="text/javascript">
		var setting = {
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				//				beforeClick: beforeClick,
				onClick: onClick
			}
		};

		var zNodes = [];
		//		function beforeClick(treeId, treeNode) {
		//			var check = (treeNode && !treeNode.isParent);
		//			if (!check) alert("只能选择城市...");
		//			return check;
		//		}
		//		
		function onClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
				nodes = zTree.getSelectedNodes(),
				v = "";
				p="";
			nodes.sort(function compare(a, b) {
				return a.id - b.id;
			});
			for(var i = 0, l = nodes.length; i < l; i++) {
				v += nodes[i].name + ",";
				p+=nodes[i].id;
			}
			if(v.length > 0) v = v.substring(0, v.length - 1);
			var cityObj = $("#citySel");
			cityObj.attr("value", v);
			var pid=$('#pid');
			pid.attr("value",p);
			hideMenu();
		}

		function showMenu() {
			var cityObj = $("#citySel");
			var cityOffset = $("#citySel").offset();
			$("#menuContent").css({
				left: cityOffset.left + "px",
				top: "0px"
			}).slideDown("fast");

			$("body").bind("mousedown", onBodyDown);
		}

		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}

		function onBodyDown(event) {
			if(!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
				hideMenu();
			}
		}

		$(document).ready(function() {
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});

		$.ajax({
			url: '/resource/tree', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',

			dataType: "json", //返回结果格式
			success: function(data) {

				for(var i = 0; i < data.length; i++) {
					var value = {
						name: data[i].text,
						id: data[i].id,
						open: true,
						isParent: true,
					}
					value.children = [];
					if(data[i].children != null) {
						for(var j = 0; j < data[i].children.length; j++) {
							var childrenItem = {
								name: data[i].children[j].text,
								id: data[i].children[j].id
							}
							value.children.push(childrenItem);
						}
					}
					zNodes.push(value);
					$.fn.zTree.init($("#treeDemo"), setting, zNodes);

				}

			},
			error: function() {

				// view("异常！");
				//				$.alert("异常！");
			}
		});

		//-->
	</SCRIPT>

</html>