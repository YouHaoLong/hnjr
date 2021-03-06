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

	<body style="background: none; width: 600px; height:350px;padding-top: 0;">

		<div class="modal-body">
			<form class="form-horizontal">
				<div class="row">
					<div class="col-md-6" style="width: 50%; float: left;">
						<input type="hidden" id="id" value="${role.id}" />
						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left; width: 30%; display: block; font-size: 14px;">角色名称</label>
							<div class="col-sm-9" style="float: left;">
								<input class="form-control" type="text" id="name" value="${role.name}">
							</div>
						</div>
					</div>

				</div>

				<div class="row">
					<div class="col-md-6" style="width: 50%; float: left;">
						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label" for="formGroupInputSmall" style="float: left; width: 30%; display: block;">排序</label>
							<div class="col-sm-9" style="float: left;">
								<input class="form-control" type="text" id="seq" value="${role.seq}">
							</div>
						</div>
					</div>

				</div>

				<div class="row">

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

					<div class="col-md-6">
						<div class="form-group form-group-sm">
							<label class="col-sm-3 control-label" for="formGroupInputSmall">备注</label>

						</div>
					</div>
					<div class="col-md-10">
						<div class="form-group form-group-sm" style="margin-left: 0; margin-right: 0;">
							<div class="col-sm-11">
								<input class="form-control" type="text" id="addcom" placeholder="" value="${role.description}">
							</div>
						</div>
					</div>
				</div>

			</form>
		</div>
		<div class="modal-footer" style="position: fixed; left: 0; bottom: 0; width: 100%;">
			<!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
			<button type="button" class="btn btn-primary" onclick="window.parent.editcon()">修改</button>
		</div>

	</body>

</html>