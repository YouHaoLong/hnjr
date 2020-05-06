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

	<title>个人设置</title>

	<!-- Bootstrap core CSS -->
	<link href="<%=basePath %>views/GlyxWeb/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/base.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/share.css"/>
	<link rel="stylesheet" href="<%=basePath %>views/GlyxWeb/css/settings.css" />
	<script src="<%=basePath %>views/GlyxWeb/js/jquery.min.js"></script>
	<script src="<%=basePath %>views/GlyxWeb/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>views/GlyxWeb/js/jquery.cityselect.js" ></script>
	<script type="text/javascript" src="<%=basePath %>views/GlyxWeb/js/settings.js" ></script>
	<script src="<%=basePath %>views/js/ajaxfileupload.js"></script>
	
</head>
<style>
.user-file-img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    opacity: 0;
}
.modal{
	top: 20%;
}
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
						<input type="hidden" id="token" value="${token}"/>
						<div class="bg">
							<div class="lookup">
								<b class="title">个人设置</b>
							</div>
							<ul class="nav navbar-nav nav_ul " id="nav-tabs">
								<li class="active">
									<a href="#t-data" data-toggle="tab">基本资料</a>
								</li>
								<li>
									<a href="#t-setUp" data-toggle="tab" onclick="bbb()">安全设置</a>
								</li>
								<li id="realname">
									<a href="#t-realName" data-toggle="tab">实名认证</a>
								</li>
								
							</ul>
						</div>
						<div class="tab-content">
							<!--基本资料-->
							<div class="tab-pane fade in active" id="t-data">
								<div class="">
								<div class="panel-body">
									<div class="data_top" >
										<div class="data_left" id="localImag">
											<img id="preview" src="${imgUrl}" style="width: 120px;height: 120px;"  id="preview" />
											<div style="margin-top: 5px;">当前图像</div>
										</div>
										<div class="data_right">
											
											<button class="btn" style="margin-bottom: 15px; position: relative;">修改图像<input type="file" class="user-file-img" name="userimg" id="file_head" onchange="javascript:setImagePreview();"  /></button>
											<div class="col_7a7">您可以通过修改用户头像来展示自己!</div>
											<div class="col_7a7">上传图片时不要小于<span class="col_11e">200*200</span>像素，不要大于<span>512KB</span>!</div>
										</div>
									</div>
									</div>
								<div class="data_bot">
									<div class="lookup">
										<b class="title">账户信息</b>
									</div>
									<div class="withdlist">
										<span class="topic">注册手机：</span>
										<span class="col_7a7">${telphone}</span>
										<span class="col_11e" onclick="modif()">修改</span>
									</div>
									<div class="withdlist">
										<span class="topic">用户名：</span>
										<input class="ipt" type="text" placeholder="请输入用户名" value="${userName}" id="uname" />
										<div class="topic1 col_7a7">目前名称是“明天更好”，需要修改？不能超过<span class="col_11e">12</span>个字符</div>
									</div>
									
									
									<div class="withdlist">
										<span class="topic">性别：</span>
										<div class="radio dis">
										  <label>
										    <input type="radio" name="optionsRadios" id="optionsRadios1" value="0" >
										  	男
										  </label>
										</div>
										<div class="radio dis" style="margin-left: 20px;">
										  <label>
										    <input type="radio" name="optionsRadios" id="optionsRadios2" value="1" >
										  	女
										  </label>
										</div>
									</div>
									
									<button class="btn btn1" onclick="baocun()">保存</button>
									</div>
									<!--修改手机号-->
									<div class="modal fade bs-example-modal-sm" id="modifyPhone" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
										<div class="modal-dialog" role="document" style="width: 400px;">
											<div class="modal-content" >
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
													<div class="center">
														<h4 class="modal-title" id="myModalLabel">修改手机号</h4>
													</div>
												</div>
												<div class="modal-body center"id="xgsj1"  >
													<div class="withdlist">
														<input class="ipt width3" type="text" placeholder="请输入原手机号码" readonly="" value="${telphone}" />
													</div>
													
													<div class="withdlist ">
														<div id="" class="dis width3">
															<div class="input-group">
															 	<input type="text" class="form-control" placeholder="请输入手机验证码" aria-describedby="basic-addon2" id="icode1">
															  	<span class="input-group-addon" id="basic-addon2" onclick="getPhoneCode(this)">发送验证码</span>
															</div>
														</div>
													</div>
													<button class="btn btn1 width3" onclick="iphonenext()">下一步</button>
												
												</div>
												<div class="modal-body center" id="xgsj2" style="display: none;" >
													<div class="withdlist">
														<input class="ipt width3" type="text" placeholder="请输入新手机号码" id="newiphone"  />
													</div>
													
													<div class="withdlist ">
														<div id="" class="dis width3">
															<div class="input-group">
															 	<input type="text" class="form-control" placeholder="请输入手机验证码" aria-describedby="basic-addon2" id="icode2">
															  	<span class="input-group-addon" id="basic-addon1" onclick="getPhoneCode1(this)">发送验证码</span>
															</div>
														</div>
													</div>
													<button class="btn btn1 width3" onclick="iPhoneqd()">确定</button>
												
												</div>
												
											</div>
											
										</div>
									</div>
								
								</div>
							</div>
							<!--安全设置-->
							<div class="tab-pane fade " id="t-setUp">
								<!--安全设置-->
								<div id="setuplist" style="display: block;" >
									<div class="panel-body" style="padding-top: 0;">
										<div class="withdlist">
											<span>你的账户安全级别：</span>
											<span class="progtext">中</span>
											<div class="progress">
												<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
											    	<!--<span class="sr-only">40% Complete (success)</span>-->
												</div>
											</div>	
										</div>
										<div class="withdlist">
											<img src="<%=basePath %>views/GlyxWeb/images/Own.png" class="setUpimg" id="setsname"/>
											<div class="dis">
												<b style="font-size: 16px;">实名认证</b>
												<div class="col_7a7 pad5">
													保障账户安全，确认身份认证才能提现。
												</div>
											</div>
											<div class="setupclick navbar-right">
												<span class="" id="setzt1">已认证</span>
												<div class="col_7a7 pad5">
													<a href="#" data-toggle="tab" id="renz" onclick="tzshiming()">修改</a>
												</div>
											</div>	
										</div>
										<!--<div class="withdlist">
											<img src="<%=basePath %>views/GlyxWeb/images/Information.png" class="setUpimg"/>
											<div class="dis">
												<b class="title">手机认证</b>
												<div class="col_7a7 pad5">
													您验证的手机：132****5638若以丢失或停用，请立即更换，避免账户被盗。
												
												</div>
											</div>
											<div class="setupclick navbar-right">
												<span class="">已认证</span>
												<div class="col_7a7 pad5">
													<a href="#t-realName" data-toggle="tab">立即认证</a>
												</div>
											</div>	
										</div>-->
										<div class="withdlist"  style="padding-bottom: 50px;">
											<img src="<%=basePath %>views/GlyxWeb/images/Safety.png" class="setUpimg" id="setmima"/>
											<div class="dis">
												<b style="font-size: 16px;">交易密码</b>
												<div class="col_7a7 pad5">
													互联网账户存在被盗风险，建议您定期更改密码以保护账户安全。
												</div>
											</div>
											<div class="setupclick navbar-right">
												<span class="" id="setzt2">未设置</span>
												<div class="col_7a7 pad5">
													<a href="#" data-toggle="tab" onclick="aaa()" id="shezhi">立即设置</a>
												</div>
											</div>	
										</div>
										
									</div>
									
								</div>
								<!--交易密码-->
								<div id="Password" style="display: none;">
									<div class="panel-body" style="padding-top: 0;">
										<div class="withdlist">
											<span class="topic2">交易密码：</span>
											<input class="ipt" type="password" placeholder="请输入你的六位数字密码" id="jymm1" />
										</div>
										<div class="withdlist">
											<span class="topic2">再次确认：</span>
											<input class="ipt" type="password" placeholder="请输入你的六位数字密码" id="jymm2" />
										</div>
										<div class="withdlist ">
											<span class="withdipt topic" style="width: 85px;">手机验证码：</span>
											<div id="" style="display: inline-block;width: 300px;">
												<div class="input-group">
												 	<input type="text" class="form-control" placeholder="请输入手机验证码" aria-describedby="basic-addon3" id="jycode">
												  	<span class="input-group-addon" id="basic-addon3" onclick="getPhoneCode(this)">发送验证码</span>
												</div>
											</div>
										</div>
										<button class="btn btn1" onclick="Xgpwd()">确定</button>
									</div>
									
								</div>
								
							</div>
						
							<!--实名认证-->
							<div class="tab-pane fade " id="t-realName">
								<input type="hidden" id="token1" value="${token}"/>
							<div class="">
							<div class="panel-body" style="padding-top: 0;">
								<span class="col_7a7">注：以下真实姓名和身份证号将用于您在网站上签署的投资协议以及资金账户的开通，一旦认证通过，将无法更改请认真填写！</span>
								<div class="withdlist">
									<span class="topic">真实姓名：</span>
									<input class="ipt" id="real-name" type="text" placeholder="请输入真实姓名" />
								</div>
								<div class="withdlist">
									<span class="topic">身份证号：</span>
									<input class="ipt" id="real-id" type="text" placeholder="请输入身份证号" />
								</div>
								<div class="withdlist">
									<span class="topic">银行名称：</span>
									<!--<input class="ipt" type="text" placeholder="请输入银行名称" />-->
									<select class="real-bank ipt" id="select1" style="width: 182px;  font-size:15px;color: #afafaf;">
										<option value="-1">选择银行</option>
										<option value="1">光大银行</option>
										<option value="2">兴业银行</option>
										<option value="3">农业银行</option>
										<option value="4">广发银行</option>
										<option value="6">建设银行</option>
										<option value="7">杭州银行</option>
										<option value="8">重庆银行</option>
										<option value="9">宁波银行</option>
										<option value="10">平安银行</option>
										<option value="11">工商银行</option>
										<option value="12">交通银行</option>
										<option value="13">招商银行</option>
										<option value="14">中国银行</option>
										<option value="15">莱商银行</option>
										<option value="16">上海银行</option>
										<option value="17">江苏银行</option>
										<option value="18">华夏银行</option>
										<option value="19">中信银行</option>
										<option value="20">民生银行</option>
										<option value="21">中国邮政储蓄银行</option>
										<option value="22">广州银行</option>
										<option value="23">北京银行</option>
										<option value="24">临商银行</option>
									</select>
								</div>
								<div class="withdlist">
									<span class="topic">手机号：</span>
									<input class="ipt" id="real-phone" type="text" placeholder="请输入手机号" />
								</div>
								<div class="withdlist">
									<span class="topic">银行卡号：</span>
									<input class="ipt" id="real-number" type="text" placeholder="请输入银行卡号" />
								</div>
								<button class="btn btn1" onclick="realname()" id="realname-btn">确定</button>
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


<script>
	$("#citySelect").citySelect({  
       nodata: "none",  
       required: false,  
     
 }); 
 function modif(){
 	$("#modifyPhone").modal('show')
 }
 function aaa () {
 	$("#setuplist").hide()
 	$("#Password").show()
 }

$("#main-nav li").eq(2).addClass("active");

var sex='${sex}';
if(sex==0 && sex!=''){
	$('#optionsRadios1').attr('checked','checked');
}else if(sex==1){
	$('#optionsRadios2').attr('checked','checked');
}else{
	$('#optionsRadios1').removeAttr("checked"); 
	$('#optionsRadios2').removeAttr("checked"); 
}
		
	
</script>
</html>