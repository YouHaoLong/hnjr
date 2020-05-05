<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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

		<title>部门管理</title>

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
		.table>tbody>tr>td {
		line-height: 2.42857143;
	    }
	</style>

	<body>

			<jsp:include page="/static/view/top.jsp" flush="true"></jsp:include>


		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3 col-md-2 sidebar">

					<jsp:include page="/static/view/left.jsp" flush="true"></jsp:include>

				</div>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

					<div class="panel panel-default" style="margin-top: 20px;">
						<div class="panel-heading">

							<form method="get" class="form-horizontal form-inline">
								<div class="row">
									<div class="col-md-2" style="width: 11%; padding-right: 0;">
										<a class="btn btn-default" href="#" role="button" data-toggle="modal" onclick="add()">添加</a>
									</div>

								</div>

							</form>

						</div>
						<div class="panel-body">

							<table id="tree_table2" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>编号</th>
										<th>部门名称</th>
										<th>排序</th>
										<th>图标</th>
										<th>创建时间</th>
										<th>地址</th>
										<th>操作</th>

									</tr>
								</thead>
								<tbody id="tablecon"></tbody>
							</table>

						</div>

						<!-- Modal -->
						<div class="modal fade" id="del" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">删除</h4>
										</div>
										<div class="modal-body">
											你确定要删除这条记录？
										</div>
										<div class="modal-footer" id="delcon">
											
											
										</div>
									</div>
								</div>
							</div>
							
							
							<div class="modal fade" id="myModaledit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document" style="background: none;">

									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">编辑</h4>
										</div>

										<iframe id="edit" src="" width="600" height="420" frameborder="0"></iframe>
									</div>
								</div>
							</div>
							
						
						
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document" style="background: none;">

									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">添加</h4>
										</div>

										<iframe id="id_iframe" src="<%=product_host%>/organization/addPage" width="600" height="380" frameborder="0"></iframe>
									</div>
								</div>
							</div>
							
					</div>
				</div>
			</div>
	</body>
	<link href="<%=product_host%>static/view/tabletree/css/jquery.treeTable.css" rel="stylesheet" type="text/css" />
	<!--<script src="<%=product_host%>static/view/tabletree/javascripts/jquery.js" type="text/javascript"></script>-->
	<script src="<%=product_host%>static/view/tabletree/javascripts/jquery.treeTable.js" type="text/javascript"></script>
	<script src="<%=product_host%>static/view/js/department.js"></script>
	<script>
		function add() {

			$('#myModal').modal('show')
		}
	</script>

</html>