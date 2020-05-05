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

		<title>角色</title>

		<!-- Bootstrap core CSS -->
		<link href="<%=product_host%>static/view/css/bootstrap.min.css" rel="stylesheet">

		<link href="<%=product_host%>static/view/css/dashboard.css" rel="stylesheet">
		<link href="<%=product_host%>static/view/css/index.css" rel="stylesheet">
		<script src="<%=product_host%>static/view/js/jquery.min.js"></script>

		<script src="<%=product_host%>static/view/js/bootstrap.min.js"></script>
		<script src="<%=product_host%>static/view/js/bootstrap-table.js"></script>
		<script src="<%=product_host%>static/view/js/bootstrap-table-zh-CN.min.js"></script>

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
										<a class="btn btn-default" href="javascript:add();" role="button">添加</a>
									</div>

								</div>

							</form>

						</div>
						<div class="panel-body">

							<table class="table table-bordered table-striped" data-height="350">
								<thead>
									<tr>
										<th>id</th>
										<th>名称</th>
										<th>排序号</th>
										<th>描述</th>
										<th>状态</th>

										<th>操作</th>
									</tr>
								</thead>
								<tbody id="mytab"></tbody>
							</table>
							<input type="hidden" id="now" value="" />
							<nav aria-label="Page navigation">
								<div class="col-md-2">
									<div class="input-group" style="margin: 20px 0;">
										<span class="input-group-addon">显示条数</span>
										<select class="form-control" id="ChangChart">
											<option value="10">10</option>
											<option value="20">20</option>
										</select>
									</div>
								</div>
								<ul class="pagination" id="page">
									<input type="hidden" id="pagess" value="" />
									<li>
										<a href="javascript:fenye()" aria-label="Previous">
											<span aria-hidden="true">上一页</span>
										</a>
									</li>

									<li id="last">
										<a href="#" aria-label="Next">
											<span aria-hidden="true">下一页</span>
										</a>
									</li>
								</ul>
							</nav>

							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">添加</h4>
										</div>
										<div class="modal-body">
											<form class="form-horizontal">
												<div class="row">
													<div class="col-md-6">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label" for="formGroupInputSmall">角色</label>
															<div class="col-sm-9">
																<input class="form-control" type="text" id="addname" placeholder="请输入角色名称">
															</div>
														</div>
													</div>
												</div>
												<div class="row">

													<div class="col-md-6">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label" for="formGroupInputSmall">排序</label>
															<div class="col-sm-9">
																<input class="form-control" type="text" id="addnum" placeholder="序号">
															</div>
														</div>
													</div>

												</div>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label" for="formGroupInputSmall">状态</label>
															<div class="col-sm-9">
																<select class="form-control" id="addstats">
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
																<input class="form-control" type="text" id="addcom" placeholder="">
															</div>
														</div>
													</div>
												</div>

											</form>
										</div>
										<div class="modal-footer">
											<!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
											<button type="button" class="btn btn-primary" onclick="addcon()">添加</button>
										</div>
									</div>
								</div>
							</div>

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

										<iframe id="edit" src="" width="600" height="350" frameborder="0"></iframe>
									</div>
								</div>
							</div>
							
							<div class="modal fade" id="myModalsot" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document" style="background: none;">

									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">授权</h4>
										</div>

										<iframe id="sot" src="" width="600" height="500" frameborder="0"></iframe>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
	</body>
	<script src="<%=product_host%>static/view/js/rolelist.js"></script>
	<script>
		var clas = $('#ChangChart option:selected').attr('value');

		listload(1, clas);
	</script>

</html>