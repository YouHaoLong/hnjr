<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String service = request.getParameter("service");
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>登录注册</title>

<!-- Bootstrap core CSS -->
<link href="<%=basePath%>views/GlyxWeb/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>views/GlyxWeb/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>views/GlyxWeb/css/login.css" />
<script src="<%=basePath%>views/GlyxWeb/js/jquery.min.js"></script>
<script src="<%=basePath%>views/GlyxWeb/js/bootstrap.min.js"></script>
</head>
<style>
.code {
	height: 37px;
	margin-left: 1px;
}

</style>

<body>
	<nav class="navbar navbar-fixed-top my-navbar" role="navigation">
		<div class="container">
			<div class="navbar-header">

				<img src="images/logo.png" style="height: 50px;" />
			</div>
			<div class="collapse navbar-collapse "
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navul">
					<!--<li class="active"><a href="#">首页 </a></li>
					<li><a href="#">挑战赛</a></li>
					<li><a href="#">优财交易</a></li>
					<li><a href="<%=basePath%>pcHome/homePage.htm">个人中心</a></li>-->
				</ul>
				<div class="retreat" style="float: right; margin-top: 13px;">
					<a href="#">登录</a>
				</div>

			</div>
		</div>
	</nav>


	<section class="index_c">
		<div class="container index_banner">
			<img src="images/banner_icon.png" class="banner_img" />
			<div class="index_bbright">
				<div class="col-md-9 margin">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" id="dengl" class="active"><a href="#login"
							aria-controls="home" role="tab" data-toggle="tab">登录</a></li>
						<li role="presentation" id="zhuc"><a href="#reg"
							aria-controls="profile" role="tab" data-toggle="tab">注册</a></li>

					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="login">
							<form>
								<div class="login_title">输入本人手机号码，即可登录/注册</div>
								<div class="login_input">
									<input id="tel" type="tel" placeholder="手机号码" />
								</div>
								<div class="login_input clearfix">
									<input id="verificat" type="text" placeholder="输入图形验证码"
										class="pull-left" />
									<div class="login_img pull-right">
										<!--<img src="images/dongtaima.jpg"/>-->
										<div class="mui-login-tcode">
											<img class="code" align="middle" src="captcha.jsp"
												onclick="this.src='captcha.jsp?time'+Math.random();"
												id="verifi">
										</div>
									</div>
								</div>
									<div class="login_input clearfix">
										<input id="code" type="text" placeholder="输入短信验证码"
											class="pull-left" />
										<div class="login_btn pull-right">
											<a href="#" id="yzm" onclick="obtain()">获取验证码</a>
										</div>
									</div>
									<div class="login_q">
										<a href="#" onclick="denglv()">登录</a>
									</div>
									<div class="login_bottom">
										<p>登录/注册视为已同意股林英雄用户服务协议</p>
									</div>
							</form>

						</div>
						<div role="tabpanel" class="tab-pane" id="reg">
							<form>
								<div class="reg_title">请输入您的手机号码，立即注册成功</div>
								<div class="login_input">
									<input id="tel1" type="tel" placeholder="手机号码" />
								</div>
								<div class="login_input clearfix">
									<input id="verificat1" type="text" placeholder="输入图形验证码"
										class="pull-left" />
									<div class="login_img pull-right">
										<!--<img src="images/dongtaima.jpg"/>-->

										<img class="code" align="middle" src="captcha.jsp"
											onclick="this.src='captcha.jsp?time'+Math.random();"
											id="verifi1">
									</div>
								</div>
								<div class="login_input clearfix">
									<input id="code1" type="text" placeholder="输入短信验证码"
										class="pull-left" />
									<div class="login_btn pull-right">
										<a href="#" id="yzm1" onclick="obtain1()">获取验证码</a>
									</div>
								</div>
								<div class="login_input">
									<input id="invitation" type="text" placeholder="邀请码"
										style="width: 100%;" />
								</div>
								<div class="reg_btn">
									<!-- 									<a href="#" >注册</a> -->
									<a href="#" onclick="registered()">注册</a>
								</div>
								<div class="reg_bottom">
									<p>登录/注册视为已同意股林英雄用户服务协议</p>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>

		</div>

	</section>
	<div class="container index_cc">
		<div class="container-fluid">
			<img src="images/index_img.jpg" />
		</div>
		<div class="col-md-4">
			<div class="index_ctitle col-md-offset-3">完善风控全透明</div>
			<div class="col-md-11 color1">股林英雄具备业内最权威的风控团队，为该款游戏提供最全面最完善的风控体系，并且，层层把控，公开透明，确保用户在实盘玩股期间的切身利益，及用户相关权益。</div>
		</div>
		<div class="col-md-4">
			<div class="index_ctitle col-md-offset-5 ">实盘交易多方式</div>
			<div class="col-md-11 color1 col-md-offset-1">旨在结合国内A股市场的设计及股市实时情景设定的一款寓教于乐的实盘炒股游戏，充值、投资、娱乐、资讯等应有尽有，致力为广大股市爱好者带来至上的玩股体验，全实盘操作，多方式挑战，一场与股为舞的大战，早已拉开序幕。
			</div>
		</div>
		<div class="col-md-4">
			<div class="index_ctitle col-md-offset-7">牛币基金倍赚钱</div>
			<div class="col-md-11 color1 col-md-offset-3">牛币基金是股林英雄游戏中一款仿真基金实盘游戏产品，所有用户需要参加晋级赛通过审核才能成为牛币基金操盘手，获得定向金额正式进入疯牛直播全国最佳操盘手大赛排行榜，全国竞技，名义双收。
			</div>
		</div>
	</div>
	<footer class="container">
		<div class="bottom_top">
			<p>用户服务协议</p>
			<p>隐私权声明</p>
			<p>免责声明</p>
		</div>
		<div class="bottom_b">Copyright © 2016-2017 深圳前海优财网络科技有限公司 All
			Rights Reserved 粤ICP备16034290号-2</div>
	</footer>

</body>
<script>
//	init()
//	function init(){
//		var str=location.href;
//		
//	}
	
	function GetQueryString(name){
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
	}
	var myurl = GetQueryString('recommendcode')
	if(myurl !=null && myurl.toString().length>1){
	   $("#invitation").val(myurl)
	   $("#zhuc").addClass('active')
	   $("#reg").addClass('active')
	   $("#dengl").removeClass('active')
	   $("#login").removeClass('active')
	}
	
	function obtain() {

		var telp = $("#tel").val();
		var captcha = $("#verificat").val();
		$.ajax({
			url :"<%=basePath%>WebSend",
// 				'http://192.168.8.8:8089/cas/WebSend', // 跳转到 action
			type : 'POST',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : "json", //返回结果格式
			data : {
				'telphone' : telp,
				'captcha' : captcha
			},
			success : function(data) {
				console.log(data)
				alert(data.msg)
				if (data.success==true) {
					timer()
				} 
				
			},
			error : function() {

			}
		});
	}
var i = 120;//120秒
function timer(){
    i--;
    if(i==0) {$("#yzm").html('获取验证码')}
    setTimeout(timer,1000);
    $("#yzm").html(i+'s后再次点击')
}
	function denglv() {
		var tel = $("#tel").val();
		var veri = $("#verificat").val();
		var code1 = $("#code").val();
		var ser1='<%=service %>';
		console.log(ser1)
		$.ajax({
			url : "<%=basePath%>WebLogin" ,
			type : 'POST',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : "json", //返回结果格式
			data : {
				'telphone' : tel,
				'captcha' : veri,
				'code' : code1,
 				'service' : ser1,
			},
			success : function(data) {
				console.log(data)
				if (data.success==true) {
					var dates=data.msg;
					console.log(dates)
					window.location.href=dates;
				} else{
					alert(data.msg)
				}
			},
			error : function() {
				alert(data.msg) 
			}
		});
	}
	function obtain1() {

		var tel = $("#tel1").val();
		var veri = $("#verificat1").val();
		$.ajax({
			url :  "<%=basePath%>WebSend",
				//'http://192.168.8.8:8089/cas/WebSend', // 跳转到 action
			type : 'POST',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : "json", //返回结果格式
			data : {
				'telphone' : tel,
				'captcha' : veri
			},
			success : function(data) {
				console.log(data)
				alert(data.msg)
				if (data.success==true) {
					timer1()
				} 
			},
			error : function() {
				alert(data.msg)
			}
		});
	}
var j = 120;//120秒
function timer1(){
    j--;
    if(j==0) {$("#yzm1").html('获取验证码')}
    setTimeout(timer1,1000);
    $("#yzm1").html(j+'s后再次点击')
}
	function registered() {
		var tel = $("#tel1").val();
		var veri = $("#verificat1").val();
		var code1 = $("#code1").val();
		var invitation1 = $("#invitation").val();
// 		var ser1 = "https://www.baidu.com/"
        var ser1='<%=service %>';
        console.log(ser1)
		$.ajax({
			url :  "<%=basePath%>WebAddUser",
			//'http://192.168.8.8:8089/cas/WebAddUser', // 跳转到 action
			type : 'POST',
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : "json", //返回结果格式
			data : {
				'telphone' : tel,
				'captcha' : veri,
				'code' : code1,
				'recommendcode' : invitation1,
				'service' : ser1
			},
			success : function(data) {
				console.log(data)
				if (data.success==true) {
					var dates=data.msg;
					window.location.href=dates;
				} else{
					alert(data.msg)
				}
			},
			error : function() {
				alert(data.msg)
			}
		});
	}
</script>

</html>