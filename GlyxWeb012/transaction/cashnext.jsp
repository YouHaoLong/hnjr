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

		<title>账户提现</title>

		<!-- Bootstrap core CSS -->
		<link href="<%=basePath %>views/GlyxWeb/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/base.css" />

		<link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/share.css" />
		<script src="<%=basePath %>views/GlyxWeb/js/jquery.min.js"></script>
		<script src="<%=basePath %>views/GlyxWeb/js/bootstrap.min.js"></script>
		<script src="<%=basePath %>views/GlyxWeb/js/withdrawals.js"></script>
		
	</head>
	<style>
		.right {
			padding: 15px;
			background: #FFF;
		}
		.wid84{
			width: 80px;
			display: inline-block;
		}
	</style>

	<body>
		<jsp:include page="/views/GlyxWeb/menu.jsp" flush="true"></jsp:include>
		<div class="container" style="margin-top: 95px;">
			<div class="row">
				<jsp:include page="/views/GlyxWeb/left.jsp" flush="true"></jsp:include>
				<div class="col-md-9 pad7">
					<input type="hidden" name="token" id="token" value="${token}" />
					<div class="right">
						<div class="lookup">
							<b class="title">账户提现</b>
							<span class="navbar-right col_7a7">安全提示：充值/提现</span>
						</div>
						<div class="withdlist">
							<span class="col_11e">注：</span>
							<span class="col_7a7">提示：每笔提现手续费为1元，每笔提现不可低于2元，到账时间为T+1。</span>
						</div>
						<div class="withdlist">
							<span class="wid84">可提金额：</span>
							<span id="money" class="col_11e"></span>
						</div>
						<div class="withdlist">
							<span class="wid84">手机号码：</span>
							<span id="telphone" class="col_7a7"></span>
						</div>
						<div class="withdlist">
							<span class="wid84">银行卡号：</span>
							<span id="cardno" class="col_7a7"></span>
						</div>
						<div class="withdlist">
							<span class="wid84">提现金额：</span>
							<input class="ipt" type="text" placeholder="请输入你的提现金额" id="Money" />
						</div>

						<div class="withdlist ">
							<span class="withdipt">手机验证码：</span>
							<div id="" style="display: inline-block;width: 300px;">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="请输入手机验证码" aria-describedby="basic-addon2" id="Code">
									<span class="input-group-addon" id="basic-addon2" onclick="getPhoneCode(this)">发送验证码</span>
								</div>
							</div>
						</div>
						
						<div class="withdlist">
							<span class="wid84">支付密码：</span>
							<input class="ipt" type="password" placeholder="请输入你的支付密码" id="Password" />
						</div>
						<button class="btn btn1" onclick="queren()">确定</button>

					</div>

				</div>
			</div>
		</div>
		<div class="modal fade bs-example-modal-sm" id="profit" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" data-backdrop="static">
			<div class="modal-dialog modal-sm" role="document"  style="margin-top: 10%;">
				<div class="modal-content">
					<div class="modal-header">

						<h4 class="modal-title" id="gridSystemModalLabel" style="text-align: center;">提示</h4>
					</div>
					<div class="modal-body col_11e" style="text-align: center;" >
						提现前需实名认证，点击下面
按钮立即实名认证
					</div>
					<div class="modal-footer" style="text-align: center;">

						<button type="button" class="btn btn-primary" onclick="window.location.href='<%=basePath %>pcUserSetting/converPcBasicDocument.htm'">实名认证</button>
					</div>
				</div>
			</div>
		</div>

	</body>
	<script>
		init();

		$("#main-nav li").eq(0).addClass("active");
		$('#leftzc').attr('src','<%=basePath %>views/GlyxWeb/images/Property.png')
	
	</script>

</html>