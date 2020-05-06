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

	<title>银两充值</title>

	<!-- Bootstrap core CSS -->
	<link href="<%=basePath %>views/GlyxWeb/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/base.css"/>
	
	<link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/share.css"/>
	<script src="<%=basePath %>views/GlyxWeb/js/jquery.min.js"></script>
	<script src="<%=basePath %>views/GlyxWeb/js/bootstrap.min.js"></script>
</head>
<style>
.right{
	padding: 15px;
	background: #FFF;	
}
.mode{
	margin-left: 20px; width:145px ;height: 54px;border: 2px solid #E9811E;border-radius: 5px;line-height: 50px; text-align: center;display: inline-block;
}
</style>

<body>
	<jsp:include page="/views/GlyxWeb/menu.jsp" flush="true"></jsp:include>
	<div class="container" style="margin-top: 95px;">
		<div class="row">
			<jsp:include page="/views/GlyxWeb/left.jsp" flush="true"></jsp:include>
			<div class="col-md-9 pad7">
				<div class="right">
					<div class="lookup">
						<b class="title">银两充值</b>
					</div>
					<div class="withdlist">
						<span >手机号码：</span>
						<span class="col_7a7">13267465638</span>
					</div>
					<div class="withdlist">
						<span>账户余额：</span>
						<span class="col_11e">7861 6922 1335 6458</span>
					</div>
					<div class="withdlist">
						<span class="">提现金额：</span>
						<input class="ipt" type="text" placeholder="请输入你的提现金额" />
					</div>
					<hr />
					<div>
						<span>充值方式：</span>
						<div  class="mode">
							<img src="../images/bankCard1.png" />
							<span>银行卡支付</span>
						</div>
						<div class="mode">
							<img src="../images/weixin.png" />
							<span>微信支付</span>
						</div>
						<div class="mode">
							<img src="../images/alipay.png" />
							<span>支付宝支付</span>
						</div>
					</div>
					<button class="btn btn1">确定</button>
					
					
				</div>
				
			</div>
		</div>
	</div>

	</body>
<script>
	$(function(){
   $('.navbar-nav li').click(function(e){
       e.preventDefault();
       $(this).addClass('active').siblings().removeClass('active');
   });
});
</script>
</html>