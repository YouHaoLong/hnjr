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

		<title>出账</title>

		<!-- Bootstrap core CSS -->
		<link href="<%=product_host%>static/view/css/bootstrap.min.css" rel="stylesheet">
		<link href="<%=product_host%>static/view/css/dashboard.css" rel="stylesheet">
		<link href="<%=product_host%>static/view/css/index.css" rel="stylesheet">
		<script src="<%=product_host%>static/view/js/jquery.min.js"></script>
			<script src="<%=product_host%>static/view/js/jquery-form.js"></script>
		<script src="<%=product_host%>static/view/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=product_host%>static/view/js/My97DatePicker/WdatePicker.js"></script>
	</head>
	<style>
		.margin{
			margin-bottom: 15px;
		}
		.pad{
			padding: 0;
		}
		.form-control{
			display: inline-block;
			height: 30px;
  			padding: 3px;
		}
		.btn1 {
		    background: #eee;
		    padding: 3px 15px;
		    color: #000;
		    text-align: center;
		}
		th,td{
			text-align: center;
		}
		input[type=file] {
		    display: inline-block;
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

					
						<div class="chanpinmarrgin">
						<ul class="nav nav-tabs chanpintab" id="nav-tabs">
							<li class="active">
								<a href="#t-state" data-toggle="tab">用户本息支付</a>
							</li>
							<!--<li>
								<a href="#t-profit" data-toggle="tab">项目进度</a>
							</li>-->
							<li>
								<a href="#t-buylist" data-toggle="tab">项目放款记录</a>
							</li>
							
						</ul>
						<div class="tab-content">
							
							<div class="tab-pane fade in active" id="t-state">
									<div class="panel panel-default" style="margin-top: 20px;">
									<div class="panel-heading">

										<form method="get" class="form-horizontal form-inline">
											<div class="row">
												<div class="col-md-2" style="width: 11%; padding-right: 0;">
													<div class="col-md-3">
														<shiro:hasPermission name="/outlist/batchConfirmation">
															<a class="btn btn-default" href="javascript:duopay()">批量确认</a>
														</shiro:hasPermission>	
													</div>
													
												</div>
												<div class="col-xs-2 padding">
													<div class="input-group">
														<span class="input-group-addon">用户姓名</span>
														<input type="text" class="form-control" name="title" value="" placeholder="用户姓名">
													</div>
												</div>
												<div class="col-md-2 padding">
													<div class="input-group">
														<span class="input-group-addon">手机号</span>
														<input type="text" class="form-control" name="title" value="" placeholder="手机号">
													</div>
												</div>
												<div class="col-md-2 padding">
													<div class="input-group">
														<span class="input-group-addon">理财经理</span>
														<input type="text" class="form-control" name="title" value="" placeholder="理财经理">
													</div>
												</div>
												<div class="col-md-2 padding">
													<div class="input-group">
														<span class="input-group-addon">状态</span>
														<input type="text" class="form-control" name="title" value="" placeholder="状态">
													</div>
												</div>

											</div>
											<div class="row totalbtn">
												<div class="col-md-2" style="width: 11%; padding-right: 0;"></div>

												<div class="col-xs-5 padding">

													<input type="text" class="form-control Wdate" style="height:34px;" id="calendarStart1" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,onpicked:function(){calendarEnd.focus();}})"> -
													<input type="text" class="form-control Wdate" style="height:34px;" id="calendarEnd1" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
												</div>
												<div class="clo-md-1 padding">
													<button type="button" class="btn btn-primary">查询</button>
												</div>
											</div>

										</form>

									</div>
									<div class="panel-body">
										<table class="table table-bordered table-striped">
											<thead>
												<tr>
													<th></th>
													<th>编号</th>
													<th>用户</th>
													<th>手机</th>
													<th>申购日期</th>
													<th>到期日期</th>
													<th>所属产品</th>
													<th>本金</th>
													<th>年息</th>
													<th>还息</th>
													<th>发放时间</th>
													<th>状态</th>
													<th>开户行</th>
													<th>付款账号</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody id="mypayment"></tbody>
											
										</table>
										<input type="hidden" id="now2" value="" />
										<nav aria-label="Page navigation">
											<div class="col-md-2">
												<div class="input-group" style="margin: 20px 0;">
													<span class="input-group-addon">显示条数</span>
													<select class="form-control" id="ChangChart2">
														<option value="10">10</option>
														<option value="20">20</option>
													</select>
												</div>
											</div>
											<ul class="pagination" id="page2">
												<input type="hidden" id="pagess2" value="" />
												<li>
													<a href="javascript:fenpay()" aria-label="Previous">
														<span aria-hidden="true">上一页</span>
													</a>
												</li>

												<li id="last2">
													<a href="#" aria-label="Next">
														<span aria-hidden="true">下一页</span>
													</a>
												</li>
											</ul>
										</nav>
									
									</div>
									<!--查看-->
									<div class="modal fade" id="look_over" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												<h4 class="modal-title" id="myModalLabel">查看详细页</h4>
											</div>
											<div class="modal-body">
												<form class="form-horizontal"  method="post" enctype="multipart/form-data"  id="form2" action="/product/insertProductOrder">
													<div class="row_tit">
														<b>用户信息</b>
													</div>
													<div class="row">
														<div class="row margin">
														<div class="col-xs-6 col-sm-4">
															<b>用户：</b>
															<span id="userName"></span>
														</div>
														<div class="col-xs-6 col-sm-4"><b>手机号：</b><span id="mobile_one"></span></div>
													</div>
													<div class="row margin">
														<div class="col-xs-6 col-sm-4"><b>推荐人：</b><span id="employeeName"></span></div>
														<div class="col-xs-6 col-sm-4"><b>部门：</b><span id="organizationName"></span></div>
														
													</div>
													
													<div class="row margin">
														<div class="col-xs-6 col-sm-4"><b>开户行：</b><span id="bankName"></span></div>
														<div class="col-xs-6 col-sm-6"><b>银行卡号：</b><span id="bank_code"></span></div>
														
													</div>
													</div>
													<hr />
													<div style="margin-bottom: 15px;">
														<b class="row_tit1">产品信息</b>
													</div>
													<div class="row">
														<div class="row margin">
														<div class="col-xs-6 col-sm-4">
															<b>购买产品：</b><span id="productName"></span>
																											
														</div>
														<div class="col-xs-6 col-sm-4"><b>产品ID：</b><span id="productIdNum"></span></div>
														
														<div class="col-xs-6 col-sm-4"><b>产品类型：</b><span id="type"></span></div>
														
													</div>
													<div class="row margin">
														<div class="col-xs-6 col-sm-4">
															<b >申购日期：</b>
															<span id="createTime"></span>												
														</div>
														<div class="col-xs-6 col-sm-4">
															<b>到期日期：</b>
															<span id="endTime"></span>																
														</div>
													</div>
													<div class="row margin">
														<div class="col-xs-6 col-sm-4">
															<b >申购金额：</b>
															<span id="applyMoney"></span>									
														</div>
														<div class="col-xs-6 col-sm-4">
															<b>年化收益：</b>
															<span id="yield"></span>				
														</div>
														
													</div>
													<div class="row margin">
														<div class="col-xs-6 col-sm-4">
															<b >本次期数：</b>
															<span id="applyTime"></span>									
														</div>
														<div class="col-xs-6 col-sm-4">
															<b>已还期数：</b>
															<span id="existingNum"></span>				
														</div>
														<div class="col-xs-6 col-sm-4">
															<b>待还期数：</b>
															<span id="hlxuNum"></span>				
														</div>
														
													</div>
													<div class="row margin">
														<div class="col-xs-6 col-sm-4">
															<b >本期还息：</b>
															<span id="incomeMoney"></span>									
														</div>
														<div class="col-xs-6 col-sm-4">
															<b>已还利息：</b>
															<span id="existing"></span>				
														</div>
														<div class="col-xs-6 col-sm-4">
															<b>待还还息：</b>
															<span id="hlxu"></span>				
														</div>
														
													</div>
													
													</div>
												</form>
											</div>
											<div class="modal-footer" id="tail_print">
												
											
												<button type="button" class="btn" onclick="call_off()">确定</button>
												
											</div>
										</div>
									</div>
								</div>
							
							</div>
								
								
								<div class="modal fade" id="payqueren" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">付款</h4>
										</div>
										<div class="modal-body">
											确认已经给用户已经打款？
										</div>
										<div class="modal-footer" id="delpaycon">
											
											
										</div>
									</div>
								</div>
							</div>

							</div>

							

							<div class="tab-pane fade " id="t-buylist">
								<div class="panel panel-default" style="margin-top: 20px;">
									<div class="panel-heading">

										<form method="get" class="form-horizontal form-inline">
											<div class="row">
												<div class="col-md-2" style="width: 11%; padding-right: 0;">
													<div class="col-xs-3">
														<shiro:hasPermission name="/outlist/addLoan">
															<a class="btn btn-default" href="#" role="button" data-toggle="modal" onclick="list()">添加放款记录</a>
														</shiro:hasPermission>	
													</div>
													
												</div>
											</div>
										</form>

									</div>
									<div class="panel-body">
										<table class="table table-bordered table-striped">
											<thead>
												<tr>

													<th>单位名称</th>
													<th>对接人</th>
													<th>联系方式</th>
													<th>项目经理</th>
													<th>支付类型</th>
													<th>放款金额</th>
													<th>放款日期</th>
													<th>银行</th>
													<th>账号</th>
													<th>状态</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody id="mytab">
												
											</tbody>
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

								</div>
								<!--添加放款记录弹窗-->
								<div class="modal fade" id="queding1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">提示</h4>
										</div>
										<div class="modal-body">
											已和用户确认此笔款项已到账？
										</div>
										<div class="modal-footer" id="delcon">
											
											
										</div>
									</div>
								</div>
							</div>
								
								<div class="modal fade" id="buylist" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document" style="width: 60%;">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="chongz()" ><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel">添加放款记录详情页</h4>
												</div>
												<div class="modal-body">
													<form class="form-horizontal"  method="post" enctype="multipart/form-data"  id="form1" action="/project/addProjectLoanRecord"  >
														<input type="hidden" name="type" value="1" />
														<input type="hidden" name="id" value="" id="projectId"/>
														<div class="row_tit">
															<b>用户信息</b>
														</div>
														<div class="row">
															<div class="row margin">
															<div class="col-xs-6 col-sm-4">
																<b>用户：</b>
																<span id="tcxx1"></span>
															</div>
															<div class="col-xs-6 col-sm-4"><b>手机号：</b><span id="tcxx2"></span></div>
															<div class="col-xs-6 col-sm-4"><b>创建日期：</b><span id="tcxx3"></span></div>
															
														</div>
														<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>推荐人：</b><span  id="tcxx4"></span></div>
															<div class="col-xs-6 col-sm-4"><b>部门：</b><span  id="tcxx5"></span></div>
															
														</div>
														
														<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>开户行：</b><span id="tcxx6"></span></div>
															<div class="col-xs-6 col-sm-6"><b>银行卡号：</b><span id="tcxx7"></span></div>
															<input type="hidden" name="bankId" id="bankId" />
															<input type="hidden" name="number" id="number" />
														</div>
														</div>
														<hr />
														<div style="margin-bottom: 15px;">
															<b class="row_tit1">放款信息</b>
														</div>
														<div class="row">
															<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>项目名称：</b><span id="tcxx8"></span><a class="btn btn1" href="#" role="button" data-toggle="modal" onclick="sut()" style="padding: 0 12px;">设置</a></div>
															<div class="col-xs-6 col-sm-4"><b>项目ID：</b><span  id="tcxx9"></span></div>
															<div class="col-xs-6 col-sm-4"><b>项目类型：</b><span  id="tcxx10"></span></div>
															
														</div>
														<div class="row margin">
															<div class="col-xs-6 col-sm-4">
																<b>放款金额：</b>
																<input type="text" class="form-control" style="width: 50%;" name="money">															
															</div>
															
															<div class="col-xs-6 col-sm-4">
																<b>支付类型：</b>
																<select  name="payType" class="form-control" style="width: 50%;">
																	<option value="1">银行代付</option>
																	<option value="2">企业打款</option>
																</select>															
															</div>
															<div class="col-xs-6 col-sm-4 ">
																<b>附件：</b>
																
																<input id="fileupload" type="file" name="file" style="width: 60%;">
															</div>
														</div>
														<!--<div class="row margin">
															
														</div>-->
														
														</div>
														<button style="display: none;" type="reset" class="reset">重置</button>
													</form>
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn " id="sub">确认</button>
													<button type="button" class="btn " data-dismiss="modal" aria-label="Close" onclick="chongz()"  >取消</button>
												</div>
											</div>
										</div>
									</div>
									
									<div class="modal fade" id="buylistcon" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel">放款记录详情页</h4>
												</div>
												<div class="modal-body">
													<form class="form-horizontal"  >
														
														<div class="row_tit">
															<b>用户信息</b>
														</div>
														<div class="row">
															<div class="row margin">
															<div class="col-xs-6 col-sm-4">
																<b>用户：</b>
																<span id="buyc1"></span>
															</div>
															<div class="col-xs-6 col-sm-4"><b>手机号：</b><span id="buyc2"></span></div>
															<div class="col-xs-6 col-sm-4"><b>创建日期：</b><span id="buyc3"></span></div>
															
														</div>
														<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>推荐人：</b><span  id="buyc4"></span></div>
															<div class="col-xs-6 col-sm-4"><b>部门：</b><span  id="buyc5"></span></div>
															
														</div>
														
														<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>开户行：</b><span id="buyc6"></span></div>
															<div class="col-xs-6 col-sm-6"><b>银行卡号：</b><span id="buyc7"></span></div>
														
														</div>
														</div>
														<hr />
														<div style="margin-bottom: 15px;">
															<b class="row_tit1">放款信息</b>
														</div>
														<div class="row">
															<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>项目名称：</b><span id="buyc8"></span></div>
															<div class="col-xs-6 col-sm-4"><b>项目ID：</b><span  id="buyc9"></span></div>
															<div class="col-xs-6 col-sm-4"><b>项目类型：</b><span  id="buyc10"></span></div>
															
														</div>
														<div class="row margin">
															
																<div class="col-xs-6 col-sm-4"><b>放款金额：</b><span  id="buyc11"></span></div>
																										
															
															
															<div class="col-xs-6 col-sm-4">
																<b >放款日期：</b>
																<span  id="buyc12"></span></div>													
															</div>
															<div class="col-xs-6 col-sm-4">
																<b class="col-sm-4 pad">附件：</b>
																<shiro:hasPermission name="/outlist/loan/download">
																	<a href="#"  id="xiazai"  target="_self">下载附件</a>
																</shiro:hasPermission>
															</div>
														</div>
														<!--<div class="row margin">
															
														</div>-->
														
													
													</form>
												</div>
												<div class="modal-footer">
													
													<button type="button" class="btn " onclick="colfan()">关闭</button>
												</div>
											</div>
										
										</div>
									</div>
									<!--删除-->
								<div class="modal fade" id="dellist" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">提示</h4>
										</div>
										<div class="modal-body">
											是否删除此条记录？
										</div>
										<div class="modal-footer" id="dellistcon">
											
											
										</div>
									</div>
								</div>
							</div>
									<div class="modal fade" id="sutup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document" style="width: 75%;">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="myModalLabel">项目选择</h4>
									</div>
									<div class="modal-body" style="height: 500px; overflow-y: scroll;">
										<form class="form-horizontal">
											<div class="row" style="margin-bottom: 15px;">
												
												<span class="col-xs-3"><span class="col-xs-3" style="padding: 0 5px 0 0;">名称</span> <input class="form-control" style=" width: 70%;" /></span>
												<span class="col-xs-3"><span class="col-xs-4"style="padding: 0 5px 0 0;">类型</span>
												<select id="xmlx" class="form-control" style=" width: 60%;">
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
												<span class="col-xs-3"><span class="col-xs-3"style="padding: 0 5px 0 0;">状态</span> 
													<select id="xmzt" class="form-control" style=" width: 70%;" >
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

												<span class=" col-xs-3"><a class="btn btn1" href="#" role="button" data-toggle="modal" onclick="">查询</a></span>
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
									
							</div>
							
						</div>

					</div>

					</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="<%=product_host%>static/view/js/outlist.js" ></script>
	<script>
			$('#nav-tabs li a[href="#t-buylist"]').click(function(e) {
			
			var clas = $('#ChangChart option:selected').attr('value');

			listload(1, clas, 1);
		});
		
		$("#sub").click(function () {
		var clas = $('#ChangChart option:selected').attr('value');
		    $("#form1").ajaxSubmit({
		    dataType: "json", //数据类型
		    success: function (data) {
		          if(data.success==true){
		         	alert(data.msg);
		         	$('#buylist').modal('hide');
		         	listload(1, clas,1);
		         	
		         }else{
		         	alert(data.msg);
		         }
		         
		          $('.reset').trigger('click');
		          $('#tcxx1').html('');
		          $('#tcxx2').html('');
		          $('#tcxx3').html('');
		          $('#tcxx4').html('');
		          $('#tcxx5').html('');
		          $('#tcxx6').html('');
		          $('#tcxx7').html('');
		          $('#tcxx8').html('');
		          $('#tcxx9').html('');
		          $('#tcxx10').html('');
		    }
		    });
		});
		$('#nav-tabs li a[href="#t-state"]').click(function(e) {

			var clas = $('#ChangChart2 option:selected').attr('value');

			listload2(1, clas);
		});
var clas = $('#ChangChart2 option:selected').attr('value');

		listload2(1, clas);
		function listload2(page, rows) {
	
	$('#page2').html('');
	$('#mypayment').html('');
	$('#now2').val(page);
	$.ajax({
		url: '/product/getAllPaymentPrincipalUser', // 跳转到 action
		type: 'POST',
		data: {
			"page": page,
			'pagesize': rows,
//			"productId":id
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {

			var allList = data.obj.list;

			for(var i = 0; i < allList.length; i++) {
				if(allList[i].payingInterest==1){
					var payingInterest='本息';
				}else if(allList[i].payingInterest==2){
					var payingInterest='本金';
				}else if(allList[i].payingInterest==3){
					var payingInterest='到期本息';
				}
				var html = '';
				if(allList[i].state == 0) {
					var state = '未付款';
				html += '<tr><th scope="row"><input type="checkbox" name="infoID" class="infoID" value="'+allList[i].id+'"></th><td>'+allList[i].orderId+'</td><td>'+allList[i].userName+'</td><td>'+allList[i].mobile_one+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].endTime+'</td><td>'+allList[i].produtName+'</td><td>'+allList[i].applyMoney+'</td><td>'+allList[i].yield+'</td><td>'+allList[i].income_money+'</td><td>'+allList[i].settle_date+'</td><td>'+state+'</td><td>'+allList[i].bankName+'</td><td>'+allList[i].bank_code+'</td><td><shiro:hasPermission name="/outlist/principal/payment"><button type="button" class="btn btn-default btn-sm" onclick="paysuccess('+allList[i].id+')">付款</button></shiro:hasPermission><shiro:hasPermission name="/outlist/Principal/see"><button type="button" class="btn btn-default btn-sm" onclick="look_over('+allList[i].id+')">查看</button></shiro:hasPermission></td></tr>';

				} else if(allList[i].state ==1) {
					var state = '审核中';
				html += '<tr><th scope="row"><input type="checkbox" name="infoID" class="infoID" value="'+allList[i].id+'"></th><td>'+allList[i].orderId+'</td><td>'+allList[i].userName+'</td><td>'+allList[i].mobile_one+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].endTime+'</td><td>'+allList[i].produtName+'</td><td>'+allList[i].applyMoney+'</td><td>'+allList[i].yield+'</td><td>'+allList[i].income_money+'</td><td>'+allList[i].settle_date+'</td><td>'+state+'</td><td>'+allList[i].bankName+'</td><td>'+allList[i].bank_code+'</td><td><shiro:hasPermission name="/outlist/principal/payment"><button type="button" class="btn btn-default btn-sm" onclick="paysuccess('+allList[i].id+')">付款</button></shiro:hasPermission><shiro:hasPermission name="/outlist/Principal/see"><button type="button" class="btn btn-default btn-sm" onclick="look_over('+allList[i].id+')">查看</button></shiro:hasPermission></td></tr>';
				} else if(allList[i].state == 2) {
					var state = '已付款';
				html += '<tr><th scope="row"><input type="checkbox" name="infoID" class="infoID" value="'+allList[i].id+'"></th><td>'+allList[i].orderId+'</td><td>'+allList[i].userName+'</td><td>'+allList[i].mobile_one+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].endTime+'</td><td>'+allList[i].produtName+'</td><td>'+allList[i].applyMoney+'</td><td>'+allList[i].yield+'</td><td>'+allList[i].income_money+'</td><td>'+allList[i].settle_date+'</td><td>'+state+'</td><td>'+allList[i].bankName+'</td><td>'+allList[i].bank_code+'</td><td><shiro:hasPermission name="/outlist/Principal/see"><button type="button" class="btn btn-default btn-sm" onclick="look_over('+allList[i].id+')">查看</button></shiro:hasPermission></td></tr>';
				}
                 console.log(html);
				$('#mypayment').append(html);
				}
			var page = '';
			page += '<input type="hidden" id="pagess2" value="" /><li><a href="javascript:fenpay(1)" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li><li id="last2"><a href="javascript:fenpay(2)" aria-label="Next"><span aria-hidden="true">下一页</span></a></li>';
			$('#page2').append(page);
			$('#pagess2').val(data.obj.total);
			pagess2();
			},
		error: function() {

		}
	});
}
function listload(page, rows, type) {
	$('#page').html('');
	$('#mytab').html('');
	$('#now').val(page);
	
	$.ajax({
		url: '/project/findProjectLoanRecord', // 跳转到 action
		type: 'POST',
		data: {
			"page": page,
			'pagesize': rows,
			'type':type
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			var allList = data.obj.list;
			for(var i = 0; i < allList.length; i++) {
				if(allList[i].payType==1){
					var payType='银行代付'
				}else if(allList[i].payType==2){
					var payType='企业打款'
				}
				var html = '';
				if(allList[i].state==1){
					var state='已支付,待确定';
					html += '<tr><td>'+allList[i].financing+'</td><td>'+allList[i].userName+'</td><td>'+allList[i].dockingcontact+'</td><td>'+allList[i].manageName+'</td><td>'+payType+'</td><td>'+allList[i].money+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].bankName+'</td><td>'+allList[i].accountNumber+'</td><td>'+state+'</td><td><shiro:hasPermission name="/outlist/loan/arrivalConfirmation"><button type="button" class="btn btn-default btn-sm" onclick="append('+allList[i].id+')">到账确认</button></shiro:hasPermission><shiro:hasPermission name="/outlist/loan/see"><button type="button" class="btn btn-default btn-sm" onclick="fankan('+allList[i].id+','+allList[i].projectId+')">查看</button></shiro:hasPermission><shiro:hasPermission name="/outlist/loan/Projectfksc"><button type="button" class="btn btn-default btn-sm" onclick="shanchu('+allList[i].id+',1)">删除</button></shiro:hasPermission></td></tr>';
				}else if(allList[i].state==2){
					var state='转账成功';
					html += '<tr><td>'+allList[i].financing+'</td><td>'+allList[i].userName+'</td><td>'+allList[i].dockingcontact+'</td><td>'+allList[i].manageName+'</td><td>'+payType+'</td><td>'+allList[i].money+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].bankName+'</td><td>'+allList[i].accountNumber+'</td><td>'+state+'</td><td><shiro:hasPermission name="/outlist/loan/see"><button type="button" class="btn btn-default btn-sm" onclick="fankan('+allList[i].id+','+allList[i].projectId+')">查看</button></shiro:hasPermission></td></tr>';
				}
				$('#mytab').append(html);

			}

			var page = '';
			page += '<input type="hidden" id="pagess" value="" /><li><a href="javascript:fenye1(1)" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li><li id="last"><a href="javascript:fenye1(2)" aria-label="Next"><span aria-hidden="true">下一页</span></a></li>';
			$('#page').append(page);
			$('#pagess').val(data.total);
			pagess();

		},
		error: function() {

		}
	});

}

function pagess() {

	var pagess = $('#pagess').val();
	var clas = $('#ChangChart option:selected').attr('value');
	pagess = pagess / clas;
	var page = parseInt(pagess + 1);
	for(var i = 1; i <= page; i++) {
		var oTest = document.getElementById("page");
		var newNode = document.createElement("li");
		var reforeNode = document.getElementById("last");

		newNode.innerHTML = "<a href='javascript:fenye(" + i + ");'>" + i + "</a>";
		oTest.insertBefore(newNode, reforeNode);
	}

}


function chongz(){
  $('.reset').trigger('click');
  $('#tcxx1').html('');
  $('#tcxx2').html('');
  $('#tcxx3').html('');
  $('#tcxx4').html('');
  $('#tcxx5').html('');
  $('#tcxx6').html('');
  $('#tcxx7').html('');
  $('#tcxx8').html('');
  $('#tcxx9').html('');
  $('#tcxx10').html('');
}
function shanchu(index,num) {
//	alert(num);
	$('#dellistcon').html('');
	$('#dellist').modal('show');
	var html = '';
	html += '<button type="button" class="btn" onclick="shanchucon(' + index + ','+num+')">是</button><button type="button" class="btn" data-dismiss="modal">否</button>';
	$('#dellistcon').append(html);
}

function shanchucon(index,num) {
	
	$.ajax({
		url: '/project/deleteProjectPayment', // 跳转到 action
		type: 'POST',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data: {
			'projectLoanRecordId': index,
			
		},
		dataType: "json", //返回结果格式
		success: function(data) {

			alert(data.msg);
			$('#dellist').modal('hide');

			var clas = $('#ChangChart option:selected').attr('value');

			listload(1, clas,1)


		},
		error: function() {
			
		}
	});

}		
	</script>	
		
</html>