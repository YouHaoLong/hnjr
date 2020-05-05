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

		<title>产品管理</title>

		<!-- Bootstrap core CSS -->
		<link href="<%=product_host%>static/view/css/bootstrap.min.css" rel="stylesheet">
		<link href="<%=product_host%>static/view/css/dashboard.css" rel="stylesheet">
		<link href="<%=product_host%>static/view/css/index.css" rel="stylesheet">
		<link href="<%=product_host%>static/view/css/popup.css" rel="stylesheet" />
		<script src="<%=product_host%>static/view/js/jquery.min.js"></script>
		<script src="<%=product_host%>static/view/js/jquery-form.js"></script>
		<script src="<%=product_host%>static/view/js/bootstrap.min.js"></script>
	</head>
	<style>
		.modal-dialog {
			width: 80%;
		}
		.btn1 {
			background: #eee;
			padding: 3px 15px;
			color: #000;
		}
		.form-control{
		    height: 30px;
			padding: 3px;
		}
		.form-group-sm .form-control {
		    padding: 3px;
		}
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
							<div class="row">

								<div class="col-md-3">
									<shiro:hasPermission name="/project/addProduct">
									<a class="btn btn-default" href="#" role="button" data-toggle="modal" onclick="add()">添加产品</a>
									</shiro:hasPermission>
								</div>

							</div>
						</div>
						<div class="panel-body">
							<table class="table table-bordered table-striped" data-height="350">
								<thead>
									<tr>
										<th>#</th>
										<th>产品名称</th>
										<th>类型</th>
										<th>发行时间</th>
										<th>绑定项目</th>
										<th>募集目标</th>
										<th>已募集金额</th>
										<th>募集进度</th>
										<th>收益方式</th>
										<th>产品经理</th>

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
						</div>

						<!--弹窗 wj-->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="chongz()"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="myModalLabel">添加产品详情页</h4>
									</div>
									<div class="modal-body">
										<form class="form-horizontal" method="post" enctype="multipart/form-data"  id="form1" action="/product/insertProduct">
											<div>
												<div style="margin-bottom: 15px;">
													<b class="popup_tit">关联项目信息</b>
												</div>
												<div class="row">
													<div class="col-md-3">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label popup_tet" for="formGroupInputSmall">项目名称</label>
															<div class="col-sm-6" style="display: inline-block;">
																<input class="form-control" type="text" id="prjname" placeholder="选择查询" readonly="">
															</div>
															<button type="button" class="popup_btn" onclick="sut()">选择</button>
														</div>

													</div>
													<div class="col-md-3">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label popup_tet" for="formGroupInputSmall">项目ID</label>
															<div class="col-sm-6">
																<input class="form-control" type="text" id="prjid" placeholder="自动带出" readonly="">
																<input type="hidden" name="projectId" id="prjid1" value=""  />
															</div>
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-3">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label popup_tet" for="formGroupInputSmall">融资方</label>
															<div class="col-sm-6">
																<input class="form-control" type="text" id="prj1" placeholder="自动带出" name="financing" readonly="">
															</div>
														</div>
													</div>
													<div class="col-md-3">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label popup_tet" for="formGroupInputSmall">对接人</label>
															<div class="col-sm-6">
																<input class="form-control" type="text" id="prj2" placeholder="自动带出" readonly="">
																<input type="hidden" name="userId" id="userId" />
															</div>
														</div>
													</div>
													<div class="col-md-3">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label popup_tet" for="formGroupInputSmall">对接人联系方式</label>
															<div class="col-sm-6">
																<input class="form-control" type="text" id="prj3" placeholder="自动带出"  name="dockingPhone" readonly="">
															</div>
														</div>
													</div>
												</div>

											</div>

											<div>
												<div style="margin-bottom: 15px;">
													<b class="popup_tit">产品信息</b>
												</div>

												<div class="row">
													<div class="col-md-3">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label popup_tet" for="formGroupInputSmall">产品ID</label>
															<div class="col-sm-6">
																<input class="form-control" type="text" id="podid" placeholder="自动生成" name="productIdNum" readonly="">
															</div>
														</div>
													</div>
													<div class="col-md-3">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label popup_tet" for="formGroupInputSmall">产品代码</label>
															<div class="col-sm-6">
																<input class="form-control" type="text" id="pod1" placeholder="手动输入" name="productCode">
															</div>
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-3">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label popup_tet" for="formGroupInputSmall">产品名称</label>
															<div class="col-sm-6">
																<input class="form-control" type="text" id="pod2" placeholder="手动输入" name="name">
															</div>
														</div>
													</div>
													<div class="col-md-3">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label popup_tet" for="formGroupInputSmall">产品类型</label>
															<div class="col-sm-6">
															
																<select name="type" class="form-control">
																	<option value="1">股权型</option>
																	<option value="2">债券型</option>
																	<!--<option value="3">债券型</option>
																	<option value="4">债券型</option>
																	<option value="5">债券型</option>
																	<option value="6">债券型</option>
																	<option value="7">债券型</option>
																	<option value="8">债券型</option>
																	<option value="9">债券型</option>
																	-->
																</select>
															</div>
														</div>
													</div>

												</div>

												<div class="row">
													<div class="col-md-3">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label popup_tet" for="formGroupInputSmall">预期融资金额</label>
															<div class="col-sm-6">
																<input class="form-control" type="text" id="pod4" placeholder="手动输入" name="expectMoney">
															</div>
														</div>
													</div>
													<div class="col-md-3">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label popup_tet" for="formGroupInputSmall">期限（月）</label>
															<div class="col-sm-6">
																<!--<input class="form-control" type="text"  placeholder="下拉选择">-->
																<select id="pod5" name="term" class="form-control">
																	<option value="1">1</option>
																	<option value="2">2</option>
																	<option value="3">3</option>
																	<option value="4">4</option>
																	<option value="5">5</option>
																	<option value="6">6</option>
																	<option value="7">7</option>
																	<option value="8">8</option>
																	<option value="9">9</option>
																	<option value="10">10</option>
																	<option value="11">11</option>
																	<option value="12">12</option>
																</select>
															</div>
														</div>
													</div>
													<div class="col-md-3">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label popup_tet" for="formGroupInputSmall">是否分期</label>
															<div class="col-sm-6">
																
																<select name="whetherStaging" class="form-control">
																	<option value="1">是</option>
																	<option value="2">否</option>
																</select>
															</div>
														</div>
													</div>

												</div>
												<div class="row">
													<div class="col-md-3">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label popup_tet" for="formGroupInputSmall">托管银行</label>
															<div class="col-sm-6">
																<input class="form-control" type="text" id="pod7" placeholder="下拉选择" value="建设银行" name="trusteeshipBank" readonly="">
															</div>
														</div>
													</div>
													<div class="col-md-3">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label popup_tet" for="formGroupInputSmall">委贷银行</label>
															<div class="col-sm-6">
																<input class="form-control" type="text" id="pod8" placeholder="下拉选择" name="entrustBank" value="建设银行" readonly="">
															</div>
														</div>
													</div>
													<div class="col-md-3">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label popup_tet" for="formGroupInputSmall">付息方式</label>
															<div class="col-sm-6">
																<input class="form-control" type="text" id="pod9" placeholder="下拉选择" value="固定付息" >
																<input type="hidden" name="payingInterest" value="2" />
															</div>
														</div>
													</div>
													<div class="col-md-3">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label popup_tet" for="formGroupInputSmall">产品收益类型</label>
															<div class="col-sm-6">
																<select name="profiTypet" class="form-control">
																	<option value="1">固定收益</option>
																	<option value="2">浮动收益</option>
																	<option value="3">固定+浮动收益</option>
																</select>
															</div>
														</div>
													</div>

												</div>

												<div class="row">
													<div class="col-md-3">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label popup_tet" for="formGroupInputSmall">产品经理</label>
															<div class="col-sm-6" style="display: inline-block;">
																<input class="form-control" type="text" id="formGroupInputSmall" placeholder="选择查询" readonly="">
																<input type="hidden" value="" id="employeeId" name="employeeId" />
															</div>
															<button type="button" class="popup_btn" onclick="chanpian()">选择</button>
														</div>

													</div>
													<div class="col-md-3">
														<div class="form-group form-group-sm">
															<label class="col-sm-3 control-label popup_tet" for="formGroupInputSmall">产品经理联系方式</label>
															<div class="col-sm-6">
																<input class="form-control" type="text" id="xxiphone" placeholder="自动带出" name="managePhone" readonly="">
															</div>
														</div>
														<input type="hidden" name="createEmpId" value="1"/>
													</div>
												</div>

											</div>
											 <button style="display: none;" type="reset" class="reset">重置</button>
										</form>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn " id="sub">确认添加</button>
										<button type="button" class="btn " data-dismiss="modal" aria-label="Close" onclick="chongz()" >取消</button>
									</div>
								</div>
							</div>
						</div>

						<div class="modal fade" id="sutup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="myModalLabel">项目选择</h4>
									</div>
									<div class="modal-body" style="height: 600px; overflow-y: scroll;">
										<form class="form-horizontal">
											<div class="row" style="margin-bottom: 15px;">
												
												<span class="col-xs-2"><span class="col-xs-3" style="padding: 0 5px 0 0;">名称</span> <input class="col-xs-6 form-control" style=" width: 70%;" /></span>
												<span class="col-xs-2"><span class="col-xs-3"style="padding: 0 5px 0 0;">类型</span>
												<select id="xmlx" class=" form-control" style=" width: 70%;" >
													<option>选择类型</option>
													<option value="1">股票型</option>
													<option value="2">货币型</option>
													<option value="3">偏股型</option>
													<option value="4">股债平衡型</option>
													<option value="5">偏债型</option>
													<option value="6">债券型</option>
													<option value="7">保本型</option>
													<option value="8">指数型</option>
													<option value="9">短债型</option>
												</select>
												</select>
												</span>
												<span class="col-xs-2"><span class="col-xs-3"style="padding: 0 5px 0 0;">状态</span> 
													<select id="xmzt" class=" form-control" style=" width: 70%;">
													<option>选择状态</option>
													<option value="1">立项</option>
													<option value="2">立项审核</option>
													<option value="3">立项尽职调查</option>
													<option value="4">项目评审</option>
													<option value="5">项目小组跟进</option>
													<option value="6">申请出款</option>
													<option value="7">财务放款</option>
													<option value="8">清算</option>
													<option value="9">结束</option>
												</select>
												</span>

												<span class=" col-xs-2"><a class="btn btn1" href="#" role="button" data-toggle="modal" onclick="">查询</a></span>
											</div>
											<table class="table table-bordered table-striped tab_td">
												<thead>
													<tr>
														<td class=" col-xs-1">项目名称</td>
														<td class=" col-xs-1">类型</td>
														<td class=" col-xs-1">发行时间</td>
														<td class=" col-xs-2">关联产品</td>
														<td class=" col-xs-1">项目进度</td>
														<td class=" col-xs-1">项目经理</td>
														
														<td class=" col-xs-1">操作</td>
													</tr>
												</thead>
												<tbody id="addxmxz">
														
													
												</tbody>
											
											</table>

										</form>
									</div>
									
								</div>
							</div>
						</div>
						
						
						
							<div class="modal fade" id="sutup1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="myModalLabel">项目经理</h4>
									</div>
									<div class="modal-body" style="height: 600px; overflow-y: scroll;">
										<form class="form-horizontal">
											<div class="row" style="margin-bottom: 15px;">
												
												<span class="col-xs-2"><span class="col-xs-3" style="padding: 0 5px 0 0;">名称</span> <input class="col-xs-6 form-control" style=" width: 70%;" /></span>
												<span class="col-xs-2"><span class="col-xs-3"style="padding: 0 5px 0 0;">手机</span><input class="col-xs-6 form-control" style=" width: 70%;" />
											
												</span>
												<span class="col-xs-2"><span class="col-xs-3"style="padding: 0 5px 0 0;">部门</span> 
												<input class="col-xs-6 form-control" style=" width: 70%;" />
													
												</span>

												<span class=" col-xs-2"><a class="btn btn1" href="#" role="button" data-toggle="modal" onclick="">查询</a></span>
											</div>
											<table class="table table-bordered table-striped tab_td">
												<thead>
													<tr>
														<td class=" col-xs-1">姓名</td>
														<td class=" col-xs-1">电话</td>
														<td class=" col-xs-1">部门</td>
														<td class=" col-xs-2">角色</td>
													
														<td class=" col-xs-1">操作</td>
													</tr>
												</thead>
												<tbody id="addxmxz1">
														
													
												</tbody>
											
											</table>

										</form>
									</div>
									
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</body>
	<script src="<%=product_host%>static/view/js/main.js"></script>
	<script src="<%=product_host%>static/view/js/product.js"></script>
	<script>
		var clas = $('#ChangChart option:selected').attr('value');

		listload(1, clas);
		
		
		$("#sub").click(function () {
		var clas = $('#ChangChart option:selected').attr('value');
		    $("#form1").ajaxSubmit({
		    dataType: "json", //数据类型
		    success: function (data) {
		          if(data.success==true){
		         	alert(data.msg);
		         	$('#myModal').modal('hide');
		         	listload(1, clas);
		         }else{
		         	alert(data.msg);
		         }
		         $('.reset').trigger('click');
//		         add();
		    }
		    });
		});
		
		function listload(page, rows) {
	$('#page').html('');
	$('#mytab').html('');
	$('#now').val(page);
	$.ajax({
		url: '/product/findProductList', // 跳转到 action
		type: 'POST',
		data: {
			"page": page,
			'pagesize': rows,

		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {

			var allList = data.obj.list;

			for(var i = 0; i < allList.length; i++) {

				if(allList[i].type == 1) {
					var type = '债券型';
				} else if(allList[i].type == 2) {
					var type = '股权型';
				} 

				if(allList[i].profiTypet == 1) {
					var profiTypet = '固定';
				} else if(allList[i].profiTypet == 2) {
					var profiTypet = '浮动';

				} else if(allList[i].profiTypet == 3) {
					var profiTypet = '浮动加固定';

				}

			    if(allList[i].collectionSchedule==''||allList[i].collectionSchedule==null){
			    	var collection = allList[i].collectionSchedule;
			    }else{
			    var collection = allList[i].collectionSchedule+'%';
				}

				var html = '';

				html += '<tr><td scope="row">' + allList[i].id + '</td><td>' + allList[i].name + '</td><td>' + type + '</td><td>' + allList[i].grantTime + '</td><td>' + allList[i].projectName + '</td><td>' + allList[i].expectMoney + '</td><td>' + allList[i].paidSumMoney + '</td><td>' + collection + '</td><td>' + profiTypet + '</td><td>' + allList[i].employeeName + '</td><td><shiro:hasPermission name="/project/ckProduct"><a href="/product/productDetail?productId='+allList[i].id+'" class="btn btn-default btn-sm">查看</a></shiro:hasPermission></td></tr>';

				$('#mytab').append(html);

			}

			var page = '';
			page += '<input type="hidden" id="pagess" value="" /><li><a href="javascript:fenye1(1)" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li><li id="last"><a href="javascript:fenye1(2)" aria-label="Next"><span aria-hidden="true">下一页</span></a></li>';
			$('#page').append(page);
			$('#pagess').val(data.obj.total);
			pagess();

		},
		error: function() {

		}
	});

}
		
		function chongz(){
			 $('.reset').trigger('click');
		}
	</script>

</html>