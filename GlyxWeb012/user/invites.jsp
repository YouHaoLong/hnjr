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

	<title>推荐好友</title>

	<!-- Bootstrap core CSS -->
	<link href="<%=basePath %>views/GlyxWeb/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/base.css"/>
	
	<link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/share.css"/>
	<script src="<%=basePath %>views/GlyxWeb/js/jquery.min.js"></script>
	<script src="<%=basePath %>views/GlyxWeb/js/bootstrap.min.js"></script>
</head>
<style>
.right{ padding: 15px; background: #FFF; }
.rate{ width: 150px;height: 200px;border: 2px solid #999;border-radius: 5px;text-align: center;padding-top: 20px; }
.rateimg{ height: 78px; }
.ratenb{ margin: 25px 0 15px; }
.rateyl{ width: 100%;height: 40px;background: #999;border-radius: 0 0 5px 5px;color: #fff;line-height: 40px; }

li.parent_li>ul>li {display: none}
.bdsharebuttonbox{width:880px;margin:20px auto;text-align:center;}
.bdsharebuttonbox ul li{float:left;width:90px;height:120px;margin:0 40px;}
.bdsharebuttonbox ul li:nth-child(5){margin-right:0;}
.bdsharebuttonbox ul>li+li+li+li+li{margin-right:0;}
.bdsharebuttonbox a{color:#ff5850;}
.wrapper_main_page .page_top_bottom{width:832px;margin-top:30px;margin:0 auto;padding:30px 0;font-size:14px;}
.bdsharebuttonbox ul li span{cursor:default;}
</style>
<script>
	window._bd_share_config = {
		"common" : {
			"bdSnsKey" : {},
			"bdText" : "股林英雄”由深圳前海优财网络科技有限公司打造的一款集充值、投资、娱乐、资讯等为一体的手机炒股平台软件，专业为股民提供金融服务。",
			"bdDesc" : "股林英雄”由深圳前海优财网络科技有限公司打造的一款集充值、投资、娱乐、资讯等为一体的手机炒股平台软件，专业为股民提供金融服务。",
			"bdUrl" : "${url }",
			"bdPic" : "http://www.ucai100.com/images/banner1.jpg",
			//"bdComment":false,
			//"searchPic":false,
			"bdMini" : "2",
			"bdMiniList" : false,
			"bdStyle" : "0",
			"bdSize" : "32"
		},
		"share" : {
			"bdSize" : 16
		},
		"image" : {
			"viewList" : [ "qzone", "tsina", "tqq", "renren", "weixin" ],
			"viewText" : "分享到：",
			"viewSize" : "32"
		},
		"selectShare" : {
			"bdContainerClass" : null,
			"bdSelectMiniList" : [ "qzone", "tsina", "tqq", "renren", "weixin" ]
		}
	};
	with (document)
		0[(getElementsByTagName('head')[0] || body)
				.appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='
				+ ~(-new Date() / 36e5)];
</script>
<body>
	<jsp:include page="/views/GlyxWeb/menu.jsp" flush="true"></jsp:include>
	<div class="container" style="margin-top: 95px;">
		<div class="row">
			<jsp:include page="/views/GlyxWeb/left.jsp" flush="true"></jsp:include>
			<div class="col-md-9 pad7">
				<div class="right">
					<div class="lookup">
						<b class="title">推荐好友</b>
					</div>
					<div class="withdlist" style="text-align: center;">
						<div class="dis navbar-left">
							<span class="">已邀请：</span>
							<span class="col_11e">${recount}人</span>
						</div>
						<div class="dis">
							<span class="">已投资：</span>
							<span class="col_11e">${rebuycount}人</span>
						</div>
						<div class="dis navbar-right">
							<span class="">推荐操盘手：</span>
							<a class="col_11e" href="<%=basePath %>pcRecommend/converPcRecommendGeneral.htm">${optorCount}人 <b>>></b></a>
						</div>
					</div>
					<hr />
					<div class="withdlist ">
						<span class="">你的推荐码：</span>
						<span class="col_11e">${reid}</span>
					</div>
					<div class="withdlist">
						<span class="">推荐链接：</span>
<%-- 						<a  id="txt_links" class="">${recomepath}</a> --%>
						<input type="text" value="${recomepath}" id="txt_links" style="border:none;width: 450px;" readonly="readonly"/>
						<button class="btn mgleft" onclick="copyinput()" >复制</button>
					</div>
					<div class="withdlist">
						<span class="col_7a7">复制您的“邀请链接”、“推广码”或通过QQ、微信、微博等方式发送给好友，邀请好友投资收益，赶快行动吧。</span>
					</div>
					<div class="bdsharebuttonbox">
						<ul>
							<li style="list-style-type:none;">
								<a href="javascript:void(0);" data-cmd="weixin"
								class="top_share_wechat top_share_icon"
								style="width: 90px; height: 90px; background: url(<%=basePath %>views/GlyxWeb/images/nnw_share1.png) no-repeat 1px -25px !important; line-height: 210px; padding-left: 0; font-size: 16px">
							</a> <span>微信好友</span>
							</li>
							<li style="list-style-type:none;">
								<a href="#" data-cmd="sqq"
								class="top_share_wechat top_share_icon"
								style="width: 90px; height: 90px; background: url(<%=basePath %>views/GlyxWeb/images/nnw_share1.png) no-repeat -90px -25px !important; line-height: 210px; padding-left: 0; font-size: 16px">
							</a> <span>QQ好友</span></li>
							<li style="list-style-type:none;">
								<a href="#" data-cmd="tsina"
								class="top_share_wechat top_share_icon"
								style="width: 90px; height: 90px; background: url(<%=basePath %>views/GlyxWeb/images/nnw_share1.png) no-repeat -180px -28px !important; line-height: 210px; padding-left: 0; font-size: 16px">
							</a> <span>新浪微博</span></li>
						</ul>
						<div class="clear"></div>
<%-- 						<img src="<%=basePath %>views/GlyxWeb/images/qq.png"/> --%>
<%-- 						<img src="<%=basePath %>views/GlyxWeb/images/weibo.png" class="mgleft"/> --%>
<%-- 						<img src="<%=basePath %>views/GlyxWeb/images/weixin1.png" class="mgleft"/> --%>
					</div>
					
					
				</div>
				
			</div>
		</div>
	</div>

	</body>
<script>
$(function() {
$('.tree li:has(ul)').addClass('parent_li').find(
		' > span').attr('title',
		'Collapse this branch');
$('.tree li.parent_li > p').on(
		'click',
		function(e) {
			var children = $(this).parent(
					'li.parent_li').find(
					' > ul > li');
			if (children.is(":visible")) {
				children.hide('fast');
				$(this).attr('title',
						'Collapse this branch')
						.find(' > i').addClass(
								'icon-plus-sign')
						.removeClass(
								'icon-minus-sign');
			} else {
				children.show('fast');

				$(this).attr('title',
						'Expand this branch').find(
						' > i').addClass(
						'icon-minus-sign')
						.removeClass(
								'icon-plus-sign');
				}
				e.stopPropagation();
			});
});	
$("#main-nav li").eq(1).addClass("active");
		$('#lefttj').attr('src','<%=basePath %>views/GlyxWeb/images/Friends1.png')
		
		
		function copyinput() {
			var input = document.getElementById("txt_links");  //input的ID值
			input.select(); //选择对象
			document.execCommand("Copy"); //执行浏览器复制命令
			alert('复制成功');

		}		


</script>
</html>