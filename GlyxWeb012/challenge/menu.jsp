<%@ page language="java" contentType="text/html; charset=UTF-8"
			 pageEncoding="UTF-8"%>
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
	

		<nav class="navbar navbar-fixed-top my-navbar" role="navigation">
	    	<div class="container">
		    <div class="navbar-header">
		      
	  		<img src="<%=basePath%>mobile/apply/images/challenge/logo.png" style="height: 50px;"/>
		    </div>
		    <div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1">
		      	<ul class="nav navbar-nav navul">
			        <li class="active"><a href="#">首页 </a></li>
			        <li><a href="<%=basePath%>program/toInitiatePC.htm">挑战赛</a></li>
			        <li><a href="#">优财交易</a></li>
			        <li><a href="http://192.168.7.97:8081/pcHome/homePage.htm">个人中心</a></li>
		      	</ul>
		      	<div class="retreat" style="float: right; margin-top: 13px;"><a href="http://192.168.7.97:8081/logout/logout.html">退出</a></div>
		      	<div style="padding-left: 15px; float: right;" >
		      		<span class="glyphicon glyphicon-bell navbar-right" aria-hidden="true">
		      		<span class="badge navbar-right">1</span>
		      		</span>
		      	</div>
		      	<div style="padding:0 15px;" class="navbar-right clearfix">
		      		<div class="top_img pull-left">
		      			<img src="" id="userimg"/>
		      		</div>
		      		
		      		<span style="margin-top: 5px;" class="pull-left">您已登录成功,<span id="Username"></span></span>
		      		
		      	</div>
		      	
		    </div>
		  </div>
		</nav>
		<script>
				$.ajax({
					url: 'http://192.168.7.97:8081/pcHome/pcGetBaseInfoForOut.htm', // 跳转到 action
					type: 'POST',
					async: false,
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType: "jsonp", //返回结果格式
					success: function(data) {
		     			 console.log(data);
		     			 var img=data.photo_image;
		     			 console.log(img);
		     			 $('#userimg').attr('src', data.obj.photo_image);
		     			 var phone = data.obj.telphone;
						var mphone = phone.substr(0, 3) + '****' + phone.substr(7);
						$('#Username').html(mphone);
					},
					error: function() {
		
					}
				});
		</script>