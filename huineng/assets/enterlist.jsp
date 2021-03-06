<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ tagli b prefix="shiro" uri="http://shiro.apache.org/tags" %>
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

		<title>入账</title>

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
		.row_tit,.row_tit1{
			font-size:16px ;
			margin-bottom: 15px;
			margin-left:15px ;
		}
		.row_tit1{
			color: #0000FF;
		}
		.row{
			margin-left: 0;
		}
		.pad{
			padding: 0;
			width: 84px;
		}
		.margin{
			margin-bottom: 15px;
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
		.tab_td,.tab_td tr{
			margin-top: 15px;
		}
		
		.tab_td td{
			padding: 0;
			margin-right:5px ;
			
		}
	
		#record .row,#check .row{
			margin-bottom: 15px;
		}
		
		.mytab_td .col-sm-2{
			padding: 0px;
	
		}
		input[type=file] {
		    display: inline-block;
		}
		th,td{
			text-align: center;
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
					<div class="panel-default" style="margin-top: 20px;">
						<ul class="nav nav-tabs chanpintab" id="nav-tabs">
							<li class="active">
								<a href="#t-purchase" data-toggle="tab"onclick="listload(1, clas);">用户申购</a>
							</li>
							<li>
								<a href="#t-payment" data-toggle="tab" onclick="payment(1,clas)">项目回款</a>
							</li>
							
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade in active" id="t-purchase">
								<div class="panel panel-default" style="margin-top: 20px;">
						<div class="panel-heading">

										<form method="get" class="form-horizontal form-inline">
											<div class="row">
												<div class="col-md-2" style="width: 11%; padding-right: 0;">
												
														<shiro:hasPermission name="/enterlist/addSubscription">
															<a class="btn btn-default" href="#" role="button" onclick="purchase()">添加申购记录</a>
														</shiro:hasPermission>
												
												</div>
												
												

												<div class="col-xs-5 padding">

													<input type="text" class="form-control Wdate" style="height:34px;" id="calendarStart" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,onpicked:function(){calendarEnd.focus();}})"> -
													<input type="text" class="form-control Wdate" style="height:34px;" id="calendarEnd" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
												</div>
												

											</div>
											<div class="row totalbtn">
												<div class="col-xs-2">
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
												<div class="clo-md-1 padding">
													<button type="button" class="btn btn-primary">查询</button>
												</div>
												
											</div>

										</form>

									</div>
						<div class="panel-body">
							
								<table class="table table-bordered   table-striped" style="word-break:break-all; word-wrap:break-all;" data-height="350">
									<thead>
										<tr>
											<th>编号</th>
											<th>用户</th>
											<th>手机</th>
											<th>申购日期</th>
											<th>入款日期</th>
											<th>所属产品</th>
											<th>所属部门</th>
											<th>理财经理</th>
											<th>到期日期</th>
											<th>状态</th>
											<th>付款银行</th>
											<th>付款账号</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="mytbody">
										<tr>
											<td>黄志良</td>
											<td>131XXXX1313</td>
											<td>2017-8-13</td>
											<td>2017-8-13</td>
											<td>汇能一号</td>
											<td>业务一部</td>
											<td>zoe</td>
											<td>2017-8-12</td>
											<td>待确认</td>
											<td>建设银行</td>
											<td>6220*******1234</td>
											<td>
												<button type="button" class="btn btn-primary btn-sm" onclick="append()">付款</button>
											</td>
										</tr>
										
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
												<a href="javascript:fenye1()" aria-label="Previous">
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
								<!--添加申购记录弹窗-->
								<div class="modal fade" id="purchase" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document" style="width: 65%;">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">添加申购记录</h4>
										</div>
										<div class="modal-body">
											<form class="form-horizontal"  method="post" enctype="multipart/form-data"  id="form1" action="/product/insertProductOrder">
												<div class="row_tit">
													<b>用户信息</b>
												</div>
												<div class="row">
													<div class="row margin">
													<div class="col-xs-6 col-sm-4">
														<b>用户：</b>
														<span id="user_name"></span>
														<a class="btn btn1" href="#" role="button" data-toggle="modal" onclick="user()" style="padding: 0 12px;">设置</a>
													</div>
													<div class="col-xs-6 col-sm-4"><b>手机号：</b><span id="user_mobile"></span></div>
													<div class="col-xs-6 col-sm-4"><b>创建日期：</b><span id="user_time"></span></div>
													
												</div>
												<div class="row margin">
													<div class="col-xs-6 col-sm-4"><b>推荐人：</b><span id="user_referee"></span></div>
													<div class="col-xs-6 col-sm-4"><b>部门：</b><span id="user_department"></span></div>
													
												</div>
												
												<div class="row margin">
													<div class="col-xs-6 col-sm-4"><b>开户行：</b><span id="user_deposit"></span></div>
													<div class="col-xs-6 col-sm-6"><b>银行卡号：</b><span id="user_code"></span></div>
													
												</div>
												</div>
												<hr />
												<div style="margin-bottom: 15px;">
													<b class="row_tit1">购买信息</b>
												</div>
												<div class="row">
													<div class="row margin">
													<div class="col-xs-6 col-sm-4">
														<b>购买产品：</b><span id="projectname"></span>
														<a class="btn btn1" href="#" role="button" data-toggle="modal" style="padding: 0 5px;" onclick="buy()">设置</a>													
													</div>
													<div class="col-xs-6 col-sm-4"><b>发行日期：</b><span id="productcode"></span></div>
													<input type="hidden" name="productId" value="" id="productid"/>
													<div class="col-xs-6 col-sm-4"><b>产品类型：</b><span id="type"></span></div>
													
												</div>
												<div class="row margin">
													<div class="col-xs-6 col-sm-4">
														<b>申购金额：</b>
														<input type="text" class="form-control" style="width:50%" id="applymoney" name="applyMoney">															
													</div>
													<div class="col-xs-6 col-sm-4">
														<b>申购期限：</b>
														<!--<input type="text" class="form-control" style="width:50%" id="applytime" name="applyTime">-->															
															<select class="form-control" style="width:50%" id="applytime" name="applyTime">
																<option value="3">3个月</option>
																<option value="6">6个月</option>
																<option value="12">12个月</option>
															</select>
													</div>
													<div class="col-xs-6 col-sm-4">
														<b>是否分期：</b>
														<select id="sgfq" class="form-control" style="width:50%" name="periodization">
															<option value="0">否</option>
															<option value="1">是</option>
														</select>											
													</div>
												</div>
												<div class="row margin">
													<input type="hidden" value="1" name="creareID" />
													<input type="hidden"  value='' name="userId" id="userId" />
													<div class="col-xs-6 col-sm-4">
														<b>付息方式：</b>
														<select  class="form-control" style="width:50%" name="payingInterest">
															<option value="1">定期</option>
															<optin value="2">不定期</optin>
														</select>
														<!--<input type="text" class="form-control" style="width:50%" id="payinginterest" name="payingInterest">	-->														
													</div>
													<div class="col-xs-6 col-sm-4">
														<b>产品收益类型：</b>
														<select  class="form-control" style="width:35%" name="incomeType">
																		<option value="1">固定</option>
																		<option value="2">浮动</option>
																		<option value="3">浮动加固定</option>
																	</select>					
													</div>
													<div class="col-xs-6 col-sm-4">
														<b>附件：</b>
														<input id="fileupload" type="file" name="file" style="width: 60%;">		
													</div>
												</div>
												
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn" id="add_btn">确认</button>
											<button type="button" class="btn" onclick="hidepurchase()">取消</button>
										</div>
									</div>
								</div>
							</div>
								<!--用户设置-->
								<div class="modal fade" id="user_settings" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document" style="width: 65%;">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel">用户选择</h4>
												</div>
												<div class="modal-body" style="height: 500px; overflow-y: scroll;">
													<form class="form-horizontal">
														<div class="row" style="margin-bottom: 15px;">
															<b class="col-xs-2" >用户信息</b>
															<span class="col-xs-4"><span class="col-xs-3" style="padding: 5px 10px;">姓名</span> <input  class="form-control" style="width: 50%;"/></span>
															<span class="col-xs-4"><span class="col-xs-4"style="padding:  5px 10px;">手机号</span> <input  class="form-control" style="width: 50%;"/></span>
															
														 <span class=" col-xs-2"><a class="btn btn1" href="#" role="button" data-toggle="modal" onclick="">查询</a></span>	
														</div>
														<table class="table table-bordered table-striped">
															<thead>
																<tr>
																<td class=" col-xs-1">编号</td>
																<td class=" col-xs-1">称呼</td>
																<td class=" col-xs-1">性别</td>
																<td class=" col-xs-2">联系电话</td>
																<td class=" col-xs-1">类别</td>
																<td class=" col-xs-1">业务员</td>
																<td class=" col-xs-2">创建日期</td>
																<td class=" col-xs-1">操作</td>
															</tr>
															</tdead>
															<tbody id="user_tbody">
															</tbody>
														</table>
														
													</form>
												</div>
												<div class="modal-footer">
													<!--<button type="button" class="btn" data-dismiss="modal" aria-label="Close">确认</button>-->
													<button type="button" class="btn" data-dismiss="modal" aria-label="Close">取消</button>
												</div>
											</div>
										</div>
									</div>		
								<!--购买设置-->
								<div class="modal fade" id="buy_settings" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document" style="width: 65%;">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel">申购产品查询信息</h4>
												</div>
												<div class="modal-body" style="height: 500px; overflow-y: scroll;">
													<form class="form-horizontal">
														<table class="table table-bordered table-striped">
														<tdead>
															<tr>
																<td class=" col-xs-1">产品名称</td>
																<td class=" col-xs-1">产品类型</td>
																<td class=" col-xs-1">发行日期</td>
																<td class=" col-xs-2">状态</td>
																<td class=" col-xs-1">产品经理</td>
																<td class=" col-xs-1">操作</td>
															</tr>
														</thead>	
														<tbody id="buy_tbody">
															
														</tbody>	
															
														</table>
														
													</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"  data-dismiss="modal" aria-label="Close">关闭</button>
												</div>
											</div>
										</div>
									</div>		
								
									
								<!--付款记录-->
								<div class="modal fade" id="append" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document" style="width: 735px;">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">付款记录</h4>
										</div>
										<div class="modal-body" style="height: 500px; overflow-y: scroll;">
											<form class="form-horizontal">
												<table class="table table-bordered table-striped tab_td">
														<thead>
															<tr>
																<th class="col-sm-2">付款金额</th>
																<th class="col-sm-2">添加时间</th>
																<th class="col-sm-2">添加人</th>
																<th class="col-sm-2">确认时间</th>
																<th class="col-sm-1">确认人</th>
																<th class="col-sm-3">操作</th>
															</tr>
															
														</thead>	
														<tbody id="apend_tbody">
															
														</tbody>
												</table>	
												<table class="tab_td mytab_td">
													<tr>
														<td class="col-sm-2">
															<input class="form-control" style="width: 80%;" type="text" name="" id="pay_money" placeholder="手动输入"/>
														</td>
														<td class="col-sm-2"></td>
														<td class="col-sm-2"></td>
														<td class="col-sm-2"></td>
														<td class="col-sm-2">
															<shiro:hasPermission name="/enterlist/apply/addPaymentRecord">
																<a class="btn btn1" href="#" role="button" data-toggle="modal" onclick="record()">添加付款记录</a></td>
															</shiro:hasPermission>
													</tr>
												</table>			
														
												</div>
											</form>
										<div class="modal-footer">
											<button type="button" class="btn " onclick="queding()">确定</button>
											<shiro:hasPermission name="/enterlist/apply/paymentComplete">
											<button type="button" class="btn " onclick="pay_complete()">付款完成</button>
											</shiro:hasPermission>
										</div>
										</div>
										
									</div>
								</div>
							<!--删除-->
							<div class="modal fade" id="del" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">删除</h4>
										</div>
										<div class="modal-body">你确定要删除这条记录？</div>
										<div class="modal-footer" id="delcon">
											<!--<button type="button" class="btn btn-default" data-dismiss="modal">否</button>
											<button type="button" class="btn btn-primary" >是</button>-->
										</div>
									</div>
								</div>
							
							</div>
							
							<!--申购记录详情页-->
								<div class="modal fade" id="details" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">申购记录详情页</h4>
										</div>
										<div class="modal-body">
											<form class="form-horizontal"  method="post" enctype="multipart/form-data"  id="form1" action="/product/insertProductOrder">
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
													<div class="col-xs-6 col-sm-4"><b>创建日期：</b><span id="create_date"></span></div>
													
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
													<b class="row_tit1">购买信息</b>
												</div>
												<div class="row">
													<div class="row margin">
													<div class="col-xs-6 col-sm-4">
														<b>购买产品：</b><span id="productName"></span>
																										
													</div>
													<div class="col-xs-6 col-sm-4"><b>产品ID：</b><span id="productIdNum"></span></div>
													
													<div class="col-xs-6 col-sm-4"><b>产品类型：</b><span id="profiTypet"></span></div>
													
												</div>
												<div class="row margin">
													<div class="col-xs-6 col-sm-4">
														<b>申购金额：</b>
														<span id="applyMoney"></span>												
													</div>
													<div class="col-xs-6 col-sm-4">
														<b>申购期限：</b>
														<span id="applyTime"></span>																
													</div>
													<div class="col-xs-6 col-sm-4">
														<b>是否分期：</b>
														<span id="periodization"></span>											
													</div>
												</div>
												<div class="row margin">
													<div class="col-xs-6 col-sm-4">
														<b>付息方式：</b>
														<span id="payingInterest"></span>									
													</div>
													<div class="col-xs-6 col-sm-4">
														<b>产品收益类型：</b>
														<span id="incomeType"></span>				
													</div>
													<div class="col-xs-6 col-sm-4">
														<b>附件：</b>
														<shiro:hasPermission name="/enterlist/apply/download">
														<a href="" id="fileUrl" download="filename">下载附件</a>		
														</shiro:hasPermission>
													</div>
												</div>
												
												</div>
											</form>
										</div>
										<div class="modal-footer" id="tail_print">
											<shiro:hasPermission name="/enterlist/apply/printFinancialAdvice">
											<button type="button" class="btn btn-primary" onclick="
finance()">打印合伙人财务通知书</button>
											</shiro:hasPermission>
											<shiro:hasPermission name="/enterlist/apply/printInvestmentConfirmation">
											<button type="button" class="btn btn-primary" onclick="print()">打印出资确认书</button>
											</shiro:hasPermission>
											
											<button type="submit" class="btn" onclick="deta()">确认</button>
											
										</div>
									</div>
								</div>
							</div>
								
							
							
							
							</div>
						
							<div class="tab-pane fade " id="t-payment">
								<div class="panel panel-default" style="margin-top: 20px;">
						<div class="panel-heading">

										<form method="get" class="form-horizontal form-inline">
											<div class="row">
												<div class="col-md-2" style="width: 11%; padding-right: 0;">
											
														<shiro:hasPermission name="/enterlist/addPayment">
															<a class="btn btn-default" href="#" role="button" onclick="payment1()">添加回款记录</a>
														</shiro:hasPermission>
												
													
												</div>
												<div class="col-xs-5 padding">
													<input type="text" class="form-control Wdate" style="height:34px;" id="calendarStart" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,onpicked:function(){calendarEnd.focus();}})"> -
													<input type="text" class="form-control Wdate" style="height:34px;" id="calendarEnd" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
												</div>
											</div>
											<div class="row totalbtn">
												<div class="col-xs-2">
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
												<div class="clo-md-1 padding">
													<button type="button" class="btn btn-primary">查询</button>
												</div>
												
											</div>

										</form>

									</div>
						<div class="panel-body">
										<table class="table table-bordered  table-striped" style="word-break:break-all; word-wrap:break-all;" data-height="350">
											<thead>
												<tr>

													<th>单位名称</th>
													<th>所属项目</th>
													<th>对接人</th>
													<th>联系方式</th>
													<th>项目经理</th>
													<th>回款类型</th>
													<th>回款金额</th>
													<th>回款日期</th>
													<th>银行</th>
													<th>账号</th>
													<th>状态</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody id="pay_tbody">
												<!--<tr>
													<td>黄志良</td>
													<td>131XXXX1313</td>
													<td>2017-8-13</td>
													<td>2017-8-13</td>
													<td>汇能一号</td>
													<td>业务一部</td>
													<td>zoe</td>
													<td>2017-8-12</td>
													<td>待确认</td>
													<td>建设银行</td>
													<td>6220*******1234</td>
													<td>
														<button type="button" class="btn btn-default btn-sm">查看</button>
													</td>
												</tr>-->
											</tbody>
										</table>
										<input type="hidden" id="now1" value="" />
										<nav aria-label="Page navigation">
											<div class="col-md-2">
												<div class="input-group" style="margin: 20px 0;">
													<span class="input-group-addon">显示条数</span>
													<select class="form-control" id="ChangChart1">
														<option value="10">10</option>
														<option value="20">20</option>
													</select>
												</div>
											</div>
											<ul class="pagination" id="page1">
												<input type="hidden" id="pagess1" value="" />
												<li>
													<a href="javascript:fen1()" aria-label="Previous">
														<span aria-hidden="true">上一页</span>
													</a>
												</li>

												<li id="last1">
													<a href="#" aria-label="Next">
														<span aria-hidden="true">下一页</span>
													</a>
												</li>
											</ul>
										</nav>
									</div>
							</div>
								<!--添加回款记录弹窗-->
								<div class="modal fade" id="payment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel">添加回款记录详情页</h4>
												</div>
												<div class="modal-body">
													<form class="form-horizontal"  method="post" enctype="multipart/form-data"  id="form2" action="/project/addProjectLoanRecord"> 
														<div class="row_tit">
															<b>用户信息</b>
														</div>
														<div class="row">
															<div class="row margin">
																<input type="hidden" name="type" value="2" />
														<input type="hidden" name="id" value="" id="projectId1"/>
															<div class="col-xs-6 col-sm-4">
																<b>用户：</b>
																<span id="hktk1"></span>
															</div>
															<div class="col-xs-6 col-sm-4"><b>手机号：</b><span id="hktk2"></span></div>
															<div class="col-xs-6 col-sm-4"><b>创建日期：</b><span id="hktk3"></span></div>
															
														</div>
														<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>推荐人：</b><span id="hktk4"></span></div>
															<div class="col-xs-6 col-sm-4"><b>部门：</b><span id="hktk5"></span></div>
															
														</div>
														
														<div class="row margin">
															<div class="col-xs-6 col-sm-4"><b>开户行：</b><span id="hktk6"></span></div>
															<div class="col-xs-6 col-sm-6"><b>银行卡号：</b><span id="hktk7"></span></div>
															<input type="hidden" name="bankId" id="bankId1" value="">
															<input type="hidden" name="number" id="number1" value="">
														</div>
														</div>
														<hr />
														<div style="margin-bottom: 15px;">
															<b class="row_tit1">放款信息</b>
														</div>
														<div class="row">
															<div class="row margin">
															<div class="col-xs-6 col-sm-4">
																<b>项目名称：</b>
																<span id="hktk8"></span>
																<a class="btn btn1" href="#" role="button" data-toggle="modal" onclick="hksut()" style="padding: 0 12px;">设置</a>
															</div>
															<div class="col-xs-6 col-sm-4"><b>项目ID：</b><span id="hktk9"></span></div>
															<div class="col-xs-6 col-sm-4"><b>项目类型：</b><span id="hktk10"></span></div>
															
														</div>
														<div class="row margin">
															<div class="col-xs-6 col-sm-4">
																<b>回款金额：</b>
																<input type="text" class="form-control" style="width: 50%;" name="money" id="mon1">															
															</div>
															
															<div class="col-xs-6 col-sm-4">
																<b>支付类型：</b>
																<select name="payType" class="form-control" style="width: 50%;">
																	<option value="1">银行代付</option>
																	<option value="2">企业打款</option>
																</select>														
															</div>
															<div class="col-xs-6 col-sm-4">
																<b>回款类型：</b>
																<select name="paymentType" class="form-control" style="width: 50%;">
																	<option value="1">利息</option>
																	<option value="2">本金</option>
																	<option value="3">本息</option>
																</select>														
															</div>
														</div>
														<div class="row margin">
															<div class="col-xs-6 col-sm-4">
																<b>附件：</b>
																<input id="fileupload1" type="file" name="file" style="width: 70%;">													
															</div>
														</div>
														
														</div>
														<button style="display: none;" type="reset" class="reset">重置</button>
												
													</form>
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn " id="sub1">确认</button>
													<button type="button" class="btn" onclick="payme()">取消</button>
												</div>
											</div>
										</div>
									</div>
								<!--设置-->
								<div class="modal fade" id="sutup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document" style="width: 60%;">
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
								<!--确认-->
								<div class="modal fade in" id="queren" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
											<h4 class="modal-title" id="myModalLabel">提示</h4>
										</div>
										<div class="modal-body">
											已和用户确认此笔款项已到账？
										</div>
										<div class="modal-footer" id="delc">
											
										</div>
									</div>
								</div>
							</div>	
								<!--回款记录详情页-->
								<div class="modal fade" id="payment_deta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">回款记录详情页</h4>
										</div>
										<div class="modal-body">
											<form class="form-horizontal"  method="post" enctype="multipart/form-data"  id="form1" action="/product/insertProductOrder">
												<div class="row_tit">
													<b>用户信息</b>
												</div>
												<div class="row">
													<div class="row margin">
													<div class="col-xs-6 col-sm-4">
														<b>用户：</b>
														<span id="paymt1"></span>
													</div>
													<div class="col-xs-6 col-sm-4"><b>手机号：</b><span id="paymt2"></span></div>
													<div class="col-xs-6 col-sm-4"><b>创建日期：</b><span id="paymt3"></span></div>
													
												</div>
												<div class="row margin">
													<div class="col-xs-6 col-sm-4"><b>推荐人：</b><span id="paymt4"></span></div>
													<div class="col-xs-6 col-sm-4"><b>部门：</b><span id="paymt5"></span></div>
													
												</div>
												
												<div class="row margin">
													<div class="col-xs-6 col-sm-4"><b>开户行：</b><span id="paymt6"></span></div>
													<div class="col-xs-6 col-sm-6"><b>银行卡号：</b><span id="paymt7"></span></div>
													
												</div>
												</div>
												<hr />
												<div style="margin-bottom: 15px;">
													<b class="row_tit1">放款信息</b>
												</div>
												<div class="row">
													<div class="row margin">
													<div class="col-xs-6 col-sm-4">
														<b>项目名称：</b><span id="paymt8"></span>
																										
													</div>
													<div class="col-xs-6 col-sm-4"><b>项目ID：</b><span id="paymt9"></span></div>
													
													<div class="col-xs-6 col-sm-4"><b>项目类型：</b><span id="paymt10"></span></div>
													
												</div>
												<div class="row margin">
													<div class="col-xs-6 col-sm-4">
														<b>回款金额：</b>
														<span id="paymt11"></span>												
													</div>
													<div class="col-xs-6 col-sm-4">
														<b>回款日期：</b>
														<span id="paymt12"></span>																
													</div>
													<div class="col-xs-6 col-sm-4">
														<b>支付类型：</b>
														<span id="paymt13"></span>											
													</div>
												</div>
												<div class="row margin">
													<div class="col-xs-6 col-sm-4">
														<b>回款类型：</b>
														<span id="paymt14"></span>									
													</div>
													<div class="col-xs-6 col-sm-4">
														<b>附件：</b>
														<shiro:hasPermission name="/enterlist/payment/download">
														<a href="" id="paymt15" download="filename">下载附件</a>	
														</shiro:hasPermission>
														<p id="paymt16"></p>
													</div>
												</div>
												
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn" onclick="pmt()">确认</button>
											
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
							
							</div>
						</div>
					</div>
				</div>
			</div>
</div>
	</body>
	<script type="text/javascript" src="<%=product_host%>static/view/js/enterlistr.js" ></script>
	<script>
		
	var clas = $('#ChangChart option:selected').attr('value');
		listload(1, clas);
		$("#add_btn").click(function () {
		var clas = $('#ChangChart option:selected').attr('value');
		    $("#form1").ajaxSubmit({
		    dataType: "json",
		    success: function (data) {
		          if(data.success==true){
		         	alert(data.msg);
		         	$('#buylist').modal('hide');
		         	hidepurchase()
		         	listload(1, clas, ${productId});
		         }else{
		         	alert(data.msg);
		         }
		    }
		    });
		});
		$("#sub1").click(function () {
		    $("#form2").ajaxSubmit({
		    dataType:'json',
		    success:function (data) {
	    		if(data.success==true){
		         	alert(data.msg);
		         	$('#payment').modal('hide');
		         	payment(1,clas)
		         }else{
		         	alert(data.msg);
		         	$('#payment').modal('hide');
		         }
		      } 
		    });
		});
		
	//用户申购
function listload(page, pagesize) {
	$('#page').html('');
	$('#mytbody').html('');
	$('#now').val(page);
	$.ajax({
		url: '/product/getAllUserProductOrder', // 跳转到 action
		type: 'POST',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data:{
			'page':page,
			'pagesize':pagesize
		},
		dataType: "json", //返回结果格式
		success: function(data) {
			console.log(data)
			
			var allList = data.obj.list;
			for(var i = 0; i < allList.length; i++) {
				var html = '';
				if(allList[i].state==1){
					state='未审核'
				}else if(allList[i].state==2){
					state='已审核'
				}else if(allList[i].state==3){
					state='审核不通过'
				}else if(allList[i].state==4){
					state='付款完成'
				}
				if(allList[i].state==4){
					html += '<tr><td>'+allList[i].orderId+'</td><td>'+allList[i].name+'</td><td>'+allList[i].mobile_one+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].updateTime+'</td><td>'+allList[i].productName+'</td><td>'+allList[i].organization_name+'</td><td>'+allList[i].employee_name+'</td><td>'+allList[i].endTime+'</td><td>'+state+'</td><td>'+allList[i].bank_deposit+'</td><td>'+allList[i].bank_code+'</td><td><shiro:hasPermission name="/enterlist/apply/see"><button type="button" class="btn btn-default btn-sm" onclick="details('+allList[i].id+','+allList[i].productId+')">查看</button></shiro:hasPermission></td></tr>';
				}else{
					html += '<tr><td>'+allList[i].orderId+'</td><td>'+allList[i].name+'</td><td>'+allList[i].mobile_one+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].updateTime+'</td><td>'+allList[i].productName+'</td><td>'+allList[i].organization_name+'</td><td>'+allList[i].employee_name+'</td><td>'+allList[i].endTime+'</td><td>'+state+'</td><td>'+allList[i].bank_deposit+'</td><td>'+allList[i].bank_code+'</td><td><shiro:hasPermission name="/enterlist/apply/payment"><button type="button" class="btn btn-default btn-sm" onclick="append('+allList[i].id+','+allList[i].userId+')">付款</button></shiro:hasPermission><shiro:hasPermission name="/enterlist/apply/see"><button type="button" class="btn btn-default btn-sm" onclick="details('+allList[i].id+','+allList[i].productId+')">查看</button></shiro:hasPermission></td></tr>';
				}
				
				$('#mytbody').append(html);
			}
			
			var page = '';
			page += '<input type="hidden" id="pagess" value="" /><li><a href="javascript:fenye1(1)" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li><li id="last"><a href="javascript:fenye1(2)" aria-label="Next"><span aria-hidden="true">下一页</span></a></li>';
			$('#page').append(page);
            $('#pagess').val(data.obj.total);
			pagess();
		},
		error: function() {
			console.log('请求失败')
		}
	});
}	
var id = ''
var useId = ''
function append(orderId,useid) {
	id = orderId;
	useId = useid;
	console.log(useId)
	$('#apend_tbody').html('');
	
	$.ajax({
			url: '/product/getPaymentRecordList', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'orderId':orderId,
			},
			dataType: "json", //返回结果格式
			success: function(data) {
			$('#append').modal('show')	
			console.log(data)
			var allList = data.obj;
			for(var i = 0; i < allList.length; i++) {
				var html = '';
				if(allList[i].state==2){
						
				html += '<tr><td class="col-sm-2">'+allList[i].money+'</td><td class="col-sm-2">'+allList[i].createTime+'</td><td class="col-sm-2">'+allList[i].createName+'</td><td class="col-sm-2">'+allList[i].endTime+'</td><td class="col-sm-1">'+allList[i].name+'</td><td class="col-sm-3"></td></tr>';
				}else{
				
				html += '<tr><td class="col-sm-2">'+allList[i].money+'</td><td class="col-sm-2">'+allList[i].createTime+'</td><td class="col-sm-2">'+allList[i].createName+'</td><td class="col-sm-2">'+allList[i].endTime+'</td><td class="col-sm-1">'+allList[i].name+'</td><td class="col-sm-3"><shiro:hasPermission name="/enterlist/apply/confirmToParagraph"><a class="btn btn1" href="#" role="button" data-toggle="modal" onclick="confirm('+allList[i].id+','+allList[i].orderId+')" style="margin-right: 5px;">确认到款</a></shiro:hasPermission><shiro:hasPermission name="/enterlist/apply/delete"><a id = "btn_cle"class="btn btn1" href="#" role="button" data-toggle="modal" onclick="del('+allList[i].id+','+useid+')">删除</a></shiro:hasPermission></td></tr>';}
				$('#apend_tbody').append(html);
			}
			},
			error: function() {
				console.log('请求失败')
			}
		});
}
function payment(page, pagesize) {
	$('#page1').html('');
	$('#pay_tbody').html('');
	$('#now1').val(page);
	$.ajax({
		url: '/project/findProjectLoanRecord', // 跳转到 action
		type: 'POST',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data:{
			'page':page,
			'pagesize':pagesize,
			'type':2
		},
		dataType: "json", //返回结果格式
		success: function(data) {
			console.log(data)
			var allList = data.obj.list;
			for(var i = 0; i < allList.length; i++) {
				if(allList[i].paymentType==1){
					paymentType = '利息'
				}else if(allList[i].paymentType==2){
					paymentType = '本金'
				}else if(allList[i].paymentType==3){
					paymentType = '本息'
				}
			
				var html = '';
				if(allList[i].state==1){
					state = '已支付，待确定';
					html += '<tr><td>'+allList[i].financing+'</td><td>'+allList[i].projectName+'</td><td>'+allList[i].userName+'</td><td>'+allList[i].dockingcontact+'</td><td>'+allList[i].manageName+'</td><td>'+paymentType+'</td><td>'+allList[i].money+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].bankName+'</td><td>'+allList[i].accountNumber+'</td><td>'+state+'</td><td><shiro:hasPermission name="/enterlist/payment/arrivalConfirmation"><button type="button" class="btn btn-default btn-sm" onclick="dzqr('+allList[i].id+')">到账确认</button></shiro:hasPermission><shiro:hasPermission name="/enterlist/payment/see"><button type="button" class="btn btn-default btn-sm" onclick="pmt_deta('+allList[i].projectId+','+allList[i].id+')">查看</button></shiro:hasPermission><shiro:hasPermission name="/enterlist/payment/Projectfksc"><button type="button" class="btn btn-default btn-sm" onclick="shanchu('+allList[i].id+',1)">删除</button></shiro:hasPermission></td></tr>';
				}else if(allList[i].state==2){
					state = '转账成功'
					html += '<tr><td>'+allList[i].financing+'</td><td>'+allList[i].projectName+'</td><td>'+allList[i].userName+'</td><td>'+allList[i].dockingcontact+'</td><td>'+allList[i].manageName+'</td><td>'+paymentType+'</td><td>'+allList[i].money+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].bankName+'</td><td>'+allList[i].accountNumber+'</td><td>'+state+'</td><td><shiro:hasPermission name="/enterlist/payment/see"><button type="button" class="btn btn-default btn-sm" onclick="pmt_deta('+allList[i].projectId+','+allList[i].id+')">查看</td></shiro:hasPermission></tr>';
				}
				
				
				
				$('#pay_tbody').append(html);
			}
			
			var page = '';
			page += '<input type="hidden" id="pagess1" value="" /><li><a href="javascript:fen1(1)" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li><li id="last1"><a href="javascript:fen1(2)" aria-label="Next"><span aria-hidden="true">下一页</span></a></li>';
			$('#page1').append(page);
			$('#pagess1').val(data.obj.total);
			pagess1();
		},
		error: function() {
			console.log('请求失败')
		}
	});

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

			payment(1, clas)


		},
		error: function() {
			// view("异常！");
			//				$.alert("异常！");
		}
	});

}
	</script>

</html>