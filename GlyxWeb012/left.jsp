
<%@ page language="java" contentType="text/html; charset=UTF-8"
			 pageEncoding="UTF-8"%>
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>



             <div class="col-md-3 pad7">
				<div id="left_top">
					<div> <img src="" id="topimg"/> </div>
					<div class="toptext">
						<b class="title" id="username">明天更好</b>
						<div style="margin-top: 15px;" id="iphone">132****7946</div>
					</div>
					<div class="topicon">
						<div class="leftimgs">
							<img src="" id="shiming"/>
						</div>
						
						<div  class="leftimgs">
							<img src="" id="mima"/>
						</div>
						
						
						
					</div>
					<button class="topbut" style="width: 60%;" onclick="qnTask();">立即签到</button>
				</div>
				<div id="left-bot" style="margin:10px 0 ;background: #fff; padding-bottom: 50px;">
					<ul id="main-nav" class="nav nav-sidebar" aria-labelledby="dropdownMenuDivider">
						<li role="separator" class="">
							<a href="<%=basePath %>pcHome/homePage.htm">
								<img src="<%=basePath %>views/GlyxWeb/images/Property1.png" id="leftzc" /> 账户资产
							</a>
						</li>
						<li>
							<a href="<%=basePath %>pcRecommend/converPcRecommend.htm">
								<img src="<%=basePath %>views/GlyxWeb/images/Friends.png" id="lefttj"/> 推荐好友
							</a>
						</li>
						<li>
							<a href="<%=basePath %>pcUserSetting/converPcBasicDocument.htm"  style="
    padding-left: 18px;">
								<i class="glyphicon glyphicon-cog" id="leftsz"></i> 个人设置
							</a>
						</li>
						<li>
							<a href="<%=basePath %>pcMessage/toPcMessage.htm"  style="
    padding-left: 18px;"><i class="glyphicon glyphicon-bell" id="leftxiaoxi"></i> 消息通知</a>
						</li>
						
					</ul>
				
				</div>
			</div>
			
<script>
//	aa()
//	function aa(){
//		$.ajax({
//					url: '<%=basePath %>user/querySignState.htm', // 跳转到 action
//					type: 'POST',
//					async: false,
//					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
//					
//					dataType: "json", //返回结果格式
//					success: function(data) {
//						console.log(data)
//					},
//					error: function() {
//		
//						// view("异常！");
//						//				$.alert("异常！");
//					}
//				});
//	}
		
		$.ajax({
					url: '<%=basePath %>pcHome/pcGetBaseInfo.htm', // 跳转到 action
					type: 'POST',
					async: false,
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					
					dataType: "json", //返回结果格式
					success: function(data) {
		     		
		     			 var img=data.obj.imgUrl;
		     		
		     			 $('#topimg').attr('src', data.obj.imgUrl);
		     			
		     			 var phone = data.obj.telphone;
						var mphone = phone.substr(0, 3) + '****' + phone.substr(7);
						$('#iphone').html(mphone);
						$('#username').html(data.obj.userName);
						if(data.obj.authRealName==1){
							$('#shiming').attr('src','<%=basePath %>views/GlyxWeb/images/Own.png')
						}else if(data.obj.authRealName==0){
							$('#shiming').attr('src','<%=basePath %>views/GlyxWeb/images/Own1.png')
						}
						
						if(data.obj.authPwd==1){
							$('#mima').attr('src','<%=basePath %>views/GlyxWeb/images/Safety.png')
						}else if(data.obj.authPwd==0){
							$('#mima').attr('src','<%=basePath %>views/GlyxWeb/images/Safety1.png')
							
						}
					},
					error: function() {
		
						// view("异常！");
						//				$.alert("异常！");
					}
				});
				
				
				function qnTask() {
					console.log(1111)
					
					$.ajax({
						url: 'http://task.glyx8.com/qiniu/setQnTaskJsonp.htm?taskid=68234162-9FBE-F348-C736-411097D00293', // 跳转到 action
						type: 'POST',
						contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
						dataType: "jsonp", //返回结果格式
						success: function(data) {
							console.log(data);
							alert(data.msg);
							window.location.reload();
						},
						error: function() {
		
						}
					});
				}
	</script>
