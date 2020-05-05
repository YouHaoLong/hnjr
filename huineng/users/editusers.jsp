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

		<title>修改</title>

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
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left; width: 30%; display: block; font-size: 14px;">登录名</label>
							<div class="col-sm-9" style="float: left;">
								<input class="form-control" type="text" id="code" placeholder="请输入登录名" value="${user.loginname}">
							</div>
						</div>
					</div>
					<div class="col-md-6" style="width: 50%; float: left;">
						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left; width: 30%; display: block;">姓名</label>
							<div class="col-sm-9" style="float: left;">
								<input class="form-control" type="text" id="name" placeholder="请输入姓名" value="${user.name}">
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					
					<div class="col-md-6" style="width: 50%; float: left;">
						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left; width: 30%; display: block;">密码</label>
							<div class="col-sm-9" style="float: left;">
								<input class="form-control" type="password" id="pwd" value="">
							</div>
						</div>
					</div>
					<div class="col-md-6" style="width: 50%; float: left;">
						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left;width: 30%; display: block;">性别</label>
							<div class="col-sm-9" style="float: left;">
								
								<select id="sex">
									<option value="0">男</option>
									<option value="1">女</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					
					<div class="col-md-6" style="width: 50%; float: left;">
						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left;width: 30%; display: block;">年龄</label>
							<div class="col-sm-9" style="float: left;">
								<input class="form-control" type="text" id="address" placeholder="请输入年龄" value="${user.age}">
							</div>
						</div>
					</div>
					
					<div class="col-md-6" style="width: 50%; float: left;">
						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left;width: 30%; display: block;">用户类型</label>
							<div class="col-sm-9" style="float: left;">
								<select id="lx">
									<option value="1">用户</option>
									<option value="2">管理员</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					
					<div class="col-md-6" style="width: 50%; float: left;">
						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left;width: 30%; display: block;">电话</label>
							<div class="col-sm-9" style="float: left;">
								<input class="form-control" type="text" id="iphone" placeholder="请输入电话" value="${user.phone}">
							</div>
						</div>
					</div>
					
					<div class="col-md-6" style="width: 50%; float: left;">
						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left;width: 30%; display: block;">用户状态</label>
							<div class="col-sm-9" style="float: left;">
								<select id="state">
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
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left;width: 20%; display: block;">部门</label>
							<div class="col-sm-9" style="float: left; width: 70%;">
								<input id="citySel" type="text" class="form-control" value="${user.organizationName}" onclick="showMenu(); return false;" style="float: left; width: 58%; margin-right: 5px;" />
								<button class="btn btn-sm" style="float: left;" >清空</button></div>
								<input type="hidden" id="pid" value="${user.organizationId}" />
						</div>
					</div>
					

				</div>
				<div class="row">

					<div class="col-md-6" style="width: 70%; float: left;">

						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left;width: 20%; display: block;">角色</label>
							<div class="col-sm-9" style="float: left; width: 70%;">
							<input id="citySel1" type="text" class="form-control" value="" onclick="showMenu1(); return false;" style="float: left; width: 58%; margin-right: 5px;" />
								<button class="btn" style="float: left;" onclick="qink()" >清空</button></div>
								<input type="hidden" id="pid1" value="" />
						
					</div>
					</div>

				</div>

				<div id="menuContent1" class="menuContent" style="display:none; position:fixed; z-index: 10;">
					<ul id="treeDemo1" class="ztree" style="margin-top:0; width:200px;"></ul>
				</div>
				<div id="menuContent" class="menuContent" style="display:none; position:fixed; z-index: 10;">
					<ul id="treeDemo" class="ztree" style="margin-top:0; width:200px;"></ul>
				</div>
				
				
			</form>
			</div>
			<div class="modal-footer" style="position: fixed; left: 0; bottom: 0; width: 100%;">
				<!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
				<button type="button" class="btn btn-primary" onclick="addcon()">修改</button>
			</div>

	</body>

	<link rel="stylesheet" href="<%=product_host%>static/view/tree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" href="<%=product_host%>static/view/tree/css/demo.css" type="text/css">
	<script type="text/javascript" src="<%=product_host%>static/view/tree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=product_host%>static/view/tree/js/jquery.ztree.excheck.js"></script>


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



		$.ajax({
			url: '/organization/tree', // 跳转到 action
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

	<SCRIPT type="text/javascript">
		<!--
		var setting1 = {
			check: {
				enable: true,
				chkboxType: {"Y":"", "N":""}
			},
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				
				onCheck: onCheck1
			}
		};

		var zNodes1 =[];

	
		function onCheck1(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo1"),
			nodes = zTree.getCheckedNodes(true),
			v = "";
			z=""
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
				z +=nodes[i].id + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			if (z.length > 0 ) z = z.substring(0, z.length-1);
			var cityObj = $("#citySel1");
			cityObj.attr("value", v);
			var cityid=$("#pid1");
			cityid.attr('value',z);
		}

		function showMenu1() {
			var cityObj = $("#citySel1");
			var cityOffset = $("#citySel1").offset();
			$("#menuContent1").css({left:cityOffset.left + "px",top: "0px"}).slideDown("fast");

			$("body").bind("mousedown", onBodyDown1);
		}
		function hideMenu1() {
			$("#menuContent1").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown1);
		}
		function onBodyDown1(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "citySel1" || event.target.id == "menuContent1" || $(event.target).parents("#menuContent1").length>0)) {
				hideMenu1();
			}
		}

//		$(document).ready(function(){
//			$.fn.zTree.init($("#treeDemo1"), setting1, zNodes1);
//		});
		
		
		
		$.ajax({
			url: '/user/findTreeUse', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:{'id':${user.id}},
			dataType: "json", //返回结果格式
			success: function(data) {
				var arr=""
				for(var i = 0; i < data.obj.length; i++) {
					if(data.obj[i].resourceId==null || data.obj[i].resourceId==''){
						var checked = 'false';
					}else{
						var checked = 'true';
						arr+=data.obj[i].id+",";
					}
					var value = {
						name: data.obj[i].text,
						id: data.obj[i].id,
						checked:checked,
//						open: true,
//						isParent: true,
					}
					
					zNodes1.push(value);
					$.fn.zTree.init($("#treeDemo1"), setting1, zNodes1);

				}
				if (arr.length > 0 ) arr = arr.substring(0, arr.length-1);
				$('#pid1').val(arr)

			},
			error: function() {

				// view("异常！");
				//				$.alert("异常！");
			}
		});
		//-->
	</SCRIPT>
	<script>
		function addcon(){
			var loginname=$('#code').val();
			var name=$('#name').val();
			var password=$('#pwd').val();
			var sex= $('#sex option:selected').attr('value');
			var age=$('#address').val();
			var usertype=1;
			var organizationId=$('#pid').val();
			var roleIds=$('#pid1').val();
			var phone=$('#iphone').val();
			var status=$('#state option:selected').attr('value');
			
			$.ajax({
			url: '/user/edit', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:{'loginname':loginname,'name':name,'password':password,'sex':sex,'age':age,'usertype':usertype,'organizationId':organizationId,'roleIds':roleIds,'phone':phone,'status':status,'id':${user.id}},
			dataType: "json", //返回结果格式
			success: function(data) {
				alert(data.msg)
			 if(data.success==true){
			 	parent.location.reload();
			 }

			},
			error: function() {

				// view("异常！");
				//				$.alert("异常！");
			}
		});
		}
	</script>

</html>