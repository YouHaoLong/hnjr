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
		<meta name="description" content="">
		<meta name="author" content="">

		<title>首页</title>

		<!-- Bootstrap core CSS -->
		<link href="<%=basePath %>views/GlyxWeb/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/base.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/login.css"/>
		<script src="<%=basePath %>views/GlyxWeb/js/jquery.min.js"></script>
		<script src="<%=basePath %>views/GlyxWeb/js/bootstrap.min.js"></script>
	</head>
	<style>

	</style>

	<body>
		<jsp:include page="/views/GlyxWeb/menu.jsp" flush="true"></jsp:include>
		<section class="index_c">
			<div class="container index_banner">
				<img src="<%=basePath %>views/GlyxWeb/images/banner_icon.png" class="banner_img" />
				<div class="index_bbright">
					<div class="col-md-11 margin">
						<div class="banner_title">尊敬的用户，您好</div>
						<div class="banner_lo"><img src="" id="userimg1"/></div>
						<div class="banner_iphone" id="Username1"></div>
						<div class="col-md-9 margin"><a href="#" class="banner_btn1">进入优财交易</a></div>
						<div class="col-md-9 margin"><a href="<%=basePath %>pcHome/homePage.htm" class="banner_btn2">进入个人中心</a></div>
					</div>
				</div>
				
			</div>
			
		</section>
		<div class="container index_cc">
			<div class="container-fluid">
				<img src="<%=basePath %>views/GlyxWeb/images/index_img.jpg" />
			</div>
			<div class="col-md-4">
				<div class="index_ctitle col-md-offset-3">完善风控全透明</div>
				<div class="col-md-11 color1" >股林英雄具备业内最权威的风控团队，为该款游戏提供最全面最完善的风控体系，并且，层层把控，公开透明，确保用户在实盘玩股期间的切身利益，及用户相关权益。</div>
			</div>
			<div class="col-md-4">
				<div class="index_ctitle col-md-offset-5 ">实盘交易多方式</div>
				<div class="col-md-11 color1 col-md-offset-1" >旨在结合国内A股市场的设计及股市实时情景设定的一款寓教于乐的实盘炒股游戏，充值、投资、娱乐、资讯等应有尽有，致力为广大股市爱好者带来至上的玩股体验，全实盘操作，多方式挑战，一场与股为舞的大战，早已拉开序幕。
</div>
			</div>
			<div class="col-md-4">
				<div class="index_ctitle col-md-offset-7">牛币基金倍赚钱</div>
				<div class="col-md-11 color1 col-md-offset-3" >牛币基金是股林英雄游戏中一款仿真基金实盘游戏产品，所有用户需要参加晋级赛通过审核才能成为牛币基金操盘手，获得定向金额正式进入疯牛直播全国最佳操盘手大赛排行榜，全国竞技，名义双收。
</div>
			</div>
		</div>
			<jsp:include page="/views/GlyxWeb/bottom.jsp" flush="true"></jsp:include>
	
	</body>
	<script>
		$(".navul li").eq(0).addClass("active");
		$.ajax({
					url: '<%=basePath %>pcHome/pcGetBaseInfo.htm', // 跳转到 action
					type: 'POST',
					async: false,
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					
					dataType: "json", //返回结果格式
					success: function(data) {
		     			
		     			 $('#userimg1').attr('src', data.obj.imgUrl);
		     			 var phone = data.obj.telphone;
						var mphone = phone.substr(0, 3) + '****' + phone.substr(7);
						$('#Username1').html(mphone);
					},
					error: function() {
		
						// view("异常！");
						//				$.alert("异常！");
					}
				});
				
	</script>

</html>