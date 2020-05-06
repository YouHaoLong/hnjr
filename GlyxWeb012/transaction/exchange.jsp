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

	<title>牛币兑换</title>

	<!-- Bootstrap core CSS -->
	<link href="<%=basePath %>views/GlyxWeb/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/base.css"/>
	
	<link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/share.css"/>
	<script src="<%=basePath %>views/GlyxWeb/js/jquery.min.js"></script>
	<script src="<%=basePath %>views/GlyxWeb/js/bootstrap.min.js"></script>
</head>
<style>
.right{ padding: 15px; background: #FFF; }
.withdlist{padding-top: 40px;}
.rate{ width: 150px;height: 200px;border: 2px solid #999;border-radius: 5px;text-align: center;padding-top: 20px; }
.rateimg{ height: 78px; }
.ratenb{ margin: 25px 0 15px; }
.rateyl{ width: 100%;height: 40px;background: #999;border-radius: 0 0 5px 5px;color: #fff;line-height: 40px;border: none; }
.active .rate{
	border-color: #E9811E;	
}
.active .rateyl{
	background: #E9811E;
	outline: none;
}

.active .ratenb{
	color: #E9811E;
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
						<b class="title">牛币兑换</b>
					</div>
					<div class="withdlist" style="text-align: center;">
						<div class="dis navbar-left">
							<span class="col_11e">我的银两：</span>
							<span class="col_7a7" id="wdyl">206银两</span>
							<button class="btn" style="margin-left: 30px;margin-right: -30px;" onclick="alert('功能待开发')" >充值</button>
						</div>
						<div class="dis">
							<span class="col_11e">牛币余额：</span>
							<span class="col_7a7" id="nbye">0牛币</span>
						</div>
						<div class="dis navbar-right">
							<button class="btn" onclick="duihuan()">确定兑换</button>
						</div>
						
					</div>
					
					<div class="withdlist">
							<span>兑换说明：</span>
							<span class="col_7a7">【银两】【牛币】为股林英雄游戏币称谓，可以在游戏中购买、使用等；银两与人民币汇率是1:1，所以可以进行直接兑换，铜币只存在于股林英雄游戏世界中交易流通。</span>
					</div>
					<ul class="withdlist" style="margin: auto;">
						<li class="dis" style="width: 24%;margin: auto;">
							<div class="rate">
							<img class="rateimg" src="<%=basePath %>views/GlyxWeb/images/8.png"/>
							<div class="ratenb">10000牛币</div>
							<button class="rateyl">需要<span>1000</span>银两</button>
							</div>
						</li>
						<li class="dis" style="width: 24%;text-align: center;">
							<div class="rate">
							<img class="rateimg" src="<%=basePath %>views/GlyxWeb/images/8.png"/>
							<div class="ratenb">5000牛币</div>
							<button class="rateyl">需要<span>500</span>银两</button>
							</div>
						</li>
						<li class="dis" style="width: 24%;text-align: center;">
							<div class="rate">
							<img class="rateimg" src="<%=basePath %>views/GlyxWeb/images/7.png"/>
							<div class="ratenb">1000牛币</div>
							<button class="rateyl">需要<span>100</span>银两</button>
							</div>
						</li>
						<li class="dis" style="width: 24%;text-align: center;">
							<div class="rate">
							<img class="rateimg" src="<%=basePath %>views/GlyxWeb/images/6.png"/>
							<div class="ratenb">500牛币</div>
							<button class="rateyl">需要<span>50</span>银两</button>
							</div>
						</li>
						
					
						<li class="dis" style="width: 24%;margin: 15px auto;">
							<div class="rate">
							<img class="rateimg" src="<%=basePath %>views/GlyxWeb/images/6.png"/>
							<div class="ratenb">100牛币</div>
							<button class="rateyl">需要<span>10</span>银两</button>
							</div>
						</li>
						<li class="dis" style="width: 24%;margin: 15px auto;">
							<div class="rate">
							<img class="rateimg" src="<%=basePath %>views/GlyxWeb/images/1.png"/>
							<div class="ratenb">10牛币</div>
							<button class="rateyl">需要<span>1</span>银两</button>
							</div>
						</li>
						
						
					</ul>					
					
					
				</div>
				
			</div>
		</div>
	</div>

	</body>
<script>
	$(function(){
	   $('.n avbar-nav li').click(function(e){
	       e.preventDefault();
	       $(this).addClass('active').siblings().removeClass('active');
	   });
	   $("#main-nav li").eq(0).addClass("active");
			$('#leftzc').attr('src','<%=basePath %>views/GlyxWeb/images/Property.png')
		
});
init()
function init(){
	$.ajax( {
		url:'/account/getAccount.htm',// 跳转到 action
		type:'post',
		cache:false,
		dataType : "json",//返回结果格式
		success:function(data) {
			console.log(data);
			if(data.success==true){
				$("#wdyl").html(data.obj.balance)
				$("#nbye").html(data.obj.totalBalance)
			}else{
				alert(data.msg);
			}
		},
		error : function() {
		}
	});
}
var money = ''
$(function(){
	   $('.withdlist li').click(function(e){
	       e.preventDefault();
	       $(this).addClass('active').siblings().removeClass('active');
	       money = $(this).children().children().children().html()
	       console.log(money)
	   });
});
function duihuan(){
	console.log(11)
	$.ajax( {
		url:'/money/exchangeMoney.htm',// 跳转到 action
		type:'post',
		cache:false,
		data:{
			'sliverMoney':money
		},
		dataType : "json",//返回结果格式
		success:function(data) {
			console.log(data);
			if (data.success==true) {
				alert('兑换成功');
				init()
			}
		},
		error : function() {
		}
	});
}


</script>
</html>