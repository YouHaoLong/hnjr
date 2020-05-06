<%@ page language="java" contentType="text/html; charset=UTF-8"
			 pageEncoding="UTF-8"%>
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="renderer" content="webkit">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>银两记录</title>

	<!-- Bootstrap core CSS -->
	<link href="<%=basePath %>views/GlyxWeb/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/base.css"/>
	<link rel="stylesheet" href="<%=basePath %>views/GlyxWeb/css/capitalRecord.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/share.css"/>
	<script src="<%=basePath %>views/GlyxWeb/js/jquery.min.js"></script>
	<script src="<%=basePath %>views/GlyxWeb/js/bootstrap.min.js"></script>
	<script src="<%=basePath %>views/GlyxWeb/js/capitalRecord.js"></script>
</head>
<style>

</style>
<body>
	<jsp:include page="/views/GlyxWeb/menu.jsp" flush="true"></jsp:include>
	<div class="container" style="margin-top: 95px;">
		<div class="row">
			<jsp:include page="/views/GlyxWeb/left.jsp" flush="true"></jsp:include>
			<div class="col-md-9 pad7">
				<div class="right">
					<div>
					<div class="panel-default">
						<div style="padding: 15px 0;">
							<b class="title pad15">资金记录</b>
							
						</div>
						<ul class="nav navbar-nav nav_ul pad15" id="nav-tabs">
							<li class="active">
								<a class="padleft0" href="<%=basePath %>pcTransation/converPcYlRecord.htm" >银两记录</a>
							</li>
							<li>
								<a href="<%=basePath %>pcTransation/converPcnbRecord.htm" >牛币记录</a>
							</li>
							<li>
								<a href="<%=basePath %>pcTransation/converPcCapitalRecord.htm" >提现记录</a>
							</li>
							
						</ul>
						
						<div class="tab-content">
							<!--银两记录-->
							<div class="tab-pane fade in active" id="t-tael">
							<div class="panel-body" style="padding: 0;">
								<table class="table" style="word-break:break-all; word-wrap:break-all;">
									<thead>
										<tr>
											<th class="padleft">订单号</th>
											<th>金额</th>
											<th>类型</th>
											<th>状态</th>
											<th>日期</th>
										</tr>
									</thead>
									<tbody id="mypayment">
										<tr>
											<td class="padleft">1234545</td>
											<td class="col_e4b">-3025</td>
											<td>角斗场消费</td>
											<td class="col_11e">已完成</td>
											<td>2017-12-19 16:06:20</td>
										</tr>
										<tr>
											<td class="padleft">1234545</td>
											<td class="col_c0c">+3025</td>
											<td>签到奖励</td>
											<td class="col_11e">已完成</td>
											<td>2017-12-19 16:06:20</td>
										</tr>
									</tbody>
								</table>
								<nav class="paging">
									<input class="btn" style="background: #c2c2c2;" type="button" value="上一页" onclick="P_page(1)" />
									<input id="pages" class="ipt" type="text" value="1" />
									<input class="btn under" type="button" value="下一页" onclick="N_page(1)" />
									<div class="padtop">
										<span class="col_7a7">共<span id="allshu">120</span>条，<span id="danyeshu">1</span>页记录</span>
									</div>
								</nav>
							</div>
							</div>
						
							
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</body>
	<script>
		var  nowpage=$('#pages').val();
		
		ylRecord(nowpage,10);
		$("#main-nav li").eq(0).addClass("active");
		$('#leftzc').attr('src','<%=basePath %>views/GlyxWeb/images/Property.png')
	
	</script>
</html>