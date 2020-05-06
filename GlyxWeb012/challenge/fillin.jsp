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

		<title>填写资料</title>

		<!-- Bootstrap core CSS -->
		<link href="<%=basePath%>mobile/apply/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>mobile/apply/css/base.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>mobile/apply/css/style.css"/>
		<script src="<%=basePath%>mobile/apply/js/jquery.min.js"></script>
		<script src="<%=basePath%>mobile/apply/js/bootstrap.min.js"></script>
		<script src="<%=basePath%>mobile/apply/js/fillin.js"></script>
	</head>
	<style>
	.withdlist{ padding-top: 20px; width: 33%; display: inline-block; }
	.file { width: 245px; height: 150px; position: relative; display: inline-block; border-radius: 4px; overflow: hidden; color: #1E88C7; text-decoration: none; text-indent: 0; line-height: 20px; }
	.file input { position: absolute; font-size: 100px; right: 0; top: 0; opacity: 0; }
	.file:hover { border-color: #78C3F3; color: #004974; text-decoration: none; }
	</style>

	<body>
		<jsp:include page="menu.jsp" flush="true"></jsp:include>
		<div class="container" style="margin-top: 95px;">
			<div class="main">
				<div class="head">
					<b>申购流程，只需4步完成！</b>
				</div>
				<div class="step" style="margin-bottom: 0;">
					<div class="dis">
						<div class="substep" >
							<img src="<%=basePath%>mobile/apply/images/challenge/read.png"/>
						</div>
						<div class="arrow">
							<img src="<%=basePath%>mobile/apply/images/challenge/arrow.png"/>
						</div>
						<div class="wid75">阅读须知</div>
					</div>
					<div class="dis">
						<div class="substep" style="background: #E9811E;">
							<img src="<%=basePath%>mobile/apply/images/challenge/fillin1.png"/>
						</div>
						<div class="arrow">
							<img src="<%=basePath%>mobile/apply/images/challenge/arrow1.png"/>
						</div>
						<div class="wid75">填写资料</div>
					</div>
					
					<div class="dis">
						<div class="substep">
							<img src="<%=basePath%>mobile/apply/images/challenge/submit1.png"/>
						</div>
						<div class="arrow">
							<img src="<%=basePath%>mobile/apply/images/challenge/arrow.png"/>
						</div>
						<div class="wid75">提交审核</div>
					</div>
					
					<div class="dis">
						<div class="substep">
							<img src="<%=basePath%>mobile/apply/images/challenge/audit.png"/>
						</div>
						<div class="wid75">审核结果</div>
					</div>
					
				</div>
				<div style="padding: 15px 60px;">
					<div class="head1" style="color:#333 ;">
						<b>填写申请资料</b>
					</div>
					<hr />
				<form class="mui-input-group" name="formHead" method="post"  ENCTYPE="multipart/form-data"  action="<%=basePath%>hero/regOptorPC.htm" id="formHead" enctype="multipart/form-data">	
					<div>
						<div class="withdlist">
							<span class="">姓名：</span>
							<input class="ipt" id="realName" name="realName" type="text" placeholder="请输入你的真实姓名" />
							<input type="hidden" name="token" id="token" value="${token}" />
						</div>
						<div class="withdlist" style="text-align: center;">
							<span class="">性别：</span>
							<select class="ipt" name='gender'>
								<!--<option value="-1">下拉选择</option>-->
								<option value="1">男</option>
								<option value="0">女</option>
							</select>
						</div>
						<div class="withdlist" style="text-align: right;">
							<span class="">电子邮箱：</span>
							<input class="ipt" type="text" name="email" id="realemill" placeholder="请输入你的邮件地址" />
						</div>
					</div>
					<div>
						<div class="withdlist">
							<span class="">年龄：</span>
							<input class="ipt" type="text" name="age" id="realage" placeholder="请输入你的真实年龄" />
						</div>
						<div class="withdlist" style="text-align: center;">
							<span class="">股龄：</span>
							<input class="ipt" type="text" id="realguage" placeholder="请输入你的股龄" name="operateAge" />
							
						</div>
						<div class="withdlist" style="text-align: right;">
							<span class="">身份证号码：</span>  <!--value="${idCard}"-->
							<input type="text" class="ipt"readonly maxlength="18" name="idCardNo" id="idcardno" value="431027199505055454" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"/>
						</div>
					</div>
					<div>
						<div class="withdlist">
							<span class="">学历：</span>
							<select class="ipt" name="education">
					         	<option value="0">博士</option>
								<option value="1">硕士</option>
								<option value="2">本科</option>
								<option value="3">大专</option>
								<option value="4">高中</option>
								<option value="5">初中</option>
					        </select>
						</div>
					</div>
					</form>
				    <div class="center" style="margin-top: 60px;">
				     	<div>
					     	<div class="file">
					     		<img class="width1" id="preview1" src="<%=basePath%>mobile/apply/images/challenge/positive.png"/>
					     	 	<input type="file" accept="image/*" capture="camera" id="imgInp1" name="userimg1" onchange="javascript:setImagePreview(1);">
					        </div> 
						     <div class="file" style="margin-left: 60px;">
						     	<img class="width1" id="preview2" src="<%=basePath%>mobile/apply/images/challenge/wrongSide.png"/>
								<input type="file" accept="image/*" capture="camera" id="imgInp2" name="userimg2" onchange="javascript:setImagePreview(2);">
						    </div> 
				     	</div>
				     	
				     	<div class="text" style="margin: 50px 0 30px;">
				        	<div>备注：本人保证以上资料属实，如有不实之处，愿意承担相应的法律责任。</div>
					     	<div>
					        	<input type="checkbox" name="checkbox1" id="agreement" />
					        	<span>我已阅读并同意<span class="col_11e">《挑战赛用户协议》</span></span>
					     	</div>
				     	</div>
				    </div>
				    
			   		<div class="nextbtn">
			   			<button type="button" class="btn btn1" style="background: #34b7d7;" onclick="lastStep()" >返回上一步</button>
			   			
			   			<button type="button" class="btn" style="margin-left: 40px;" onclick="sub()" id="sub">确定</button>
			   		</div>
			   		 
				</div>
			</div>
		</div>	
	</body>
<script>
function sub(){
	var realname=$('#realName').val();
	var cardno=$('#idcardno').val();
	var cardimg1=$('#imgInp1').val();
	var cardimg2=$('#imgInp2').val();
	var email=$('#realemill').val();
	var age = $('#realage').val();
	var realguage = $('#realguage').val();
	if(realname==""){
		alert('请输入真实姓名');
	}else if(email==""){
		alert('请填写电子邮箱');
	}else if(age==""){
		alert('请填写您的年龄');
	}else if(realguage==""){
		alert('请填写您的股龄');
	}else if(cardno==""){
			alert('请输入身份证号码');
	}else if(cardimg1==""){
		alert('请上传身份证正面');
	}else if(cardimg2==""){
		alert('请上传身份证反面');
	}else if($("#agreement").prop("checked")==false){
		alert("请阅读并同意 《挑战赛用户协议》");
		
	}else{
		$('#sub').removeAttr('href');//去掉a标签中的href属性
		$('#sub').removeAttr('onclick');//去掉a标签中的onclick事件
		alert(1)
		// 检测是否已申请
		$.ajax({
		   type: "POST", 
		   url: "<%=basePath%>hero/checkUserIsHero.htm",
		   success: function(data){
		   	alert(data)
		   	if (data != 1) {
				   $("#formHead").submit();
			   } else {
					$('#sub').attr('href',"#");
					$("#sub").attr("onclick","javascript:sub()");
				   alert("正在审核中，请不要重复申请");
			   }
		   },
		   error: function(data) {
		   }
		});
	}
}
</script>
</html>