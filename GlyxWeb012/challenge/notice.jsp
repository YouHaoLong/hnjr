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

		<title>阅读须知</title>

		<!-- Bootstrap core CSS -->
		<link href="<%=basePath%>mobile/apply/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>mobile/apply/css/base.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>mobile/apply/css/style.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>mobile/apply/css/initiate.css"/>
		<script src="<%=basePath%>mobile/apply/js/jquery.min.js"></script>
		<script src="<%=basePath%>mobile/apply/js/bootstrap.min.js"></script>
	</head>
	<style>
	td{
		padding: 10px 20px;
	}
	.nextbtn{
		width: 100%;
		text-align: center;
	}
	.nextbtn button{
		background: #e9811e;
		color: #fff;
		padding: 5px 15px;
	}
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
						<div class="substep" style="background: #E9811E;" >
							<img src="<%=basePath%>mobile/apply/images/challenge/read1.png"/>
						</div>
						<div class="arrow">
							<img src="<%=basePath%>mobile/apply/images/challenge/arrow1.png"/>
						</div>
						<div class="wid75">阅读须知</div>
					</div>
					<div class="dis">
						<div class="substep">
							<img src="<%=basePath%>mobile/apply/images/challenge/fillIn.png"/>
						</div>
						<div class="arrow">
							<img src="<%=basePath%>mobile/apply/images/challenge/arrow.png"/>
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
						<b>申请操盘手须知</b>
					</div>
					<p>股林英雄发起全面操盘，致力于为普通股民用户最大限度完成实盘操盘梦，本次活动名称为“晋级挑战赛”，如您有意向申请参加，请仔细阅读并熟知以下条例：</p>
					<p>1. 用户申请操盘手通过审核之后，即可参加“晋级挑战赛”。</p>
				    <p>2. 晋级挑战赛分为: A、周赛(两周/局) ；B、月赛(四周) 两种不同模式，用户可随意选择;</p>
				    <p>3. 晋级挑战赛周赛赛制为三局一轮，采取三打二(局)胜利，至少挑战二局且累计净盈利(扣除综合管理费后)>0%，即可通过挑战，成为牛币基金的御用操盘手; 若挑战失败可以再次发起挑战。</p>
				    <p>4. 晋级挑战赛月赛赛制，只需要打一局，操盘手收益率(扣除综合管理费后) &ge;5%，即可通过挑战。</p>
				    <p>5. 用户凡是在第一轮参加挑战赛的操盘手，周赛收益率为负(周赛按照累计叠加方式)，或者月赛收益率为负，在下一次参赛时，需要在本轮达标的基础上，收益率要全部覆盖上一轮的亏损，方能晋级通过。</p>
				    <p>6. 用户参与挑战赛，需要自带资金参与挑战，可以自定义操盘金额，500-3000元/局。</p>
				    <p>7. 操作账户控制须知:</p>
					<table border="1" cellspacing="0" cellpadding="0" style="margin-bottom: 10px;">
			    	<tr>
			    		<td>比例</td>
			    		<td>预警线</td>
			    		<td>平仓线</td>
			    	</tr>
			    	<tr>
			    		<td>1:2</td>
			    		<td>总资金的82%</td>
			    		<td>总资金的75%</td>
			    	</tr>
			    	<tr>
			    		<td>1:3</td>
			    		<td>总资金的90%</td>
			    		<td>总资金的83%</td>
			    	</tr>
			    	<tr>
			    		<td>1:4</td>
			    		<td>总资金的93%</td>
			    		<td>总资金的89%</td>
			    	</tr>
			    	</table>
			    	<p>8. 操作准则</p>
				    <p>操盘手买卖股票要遵守以下条例:</p>
				    <p>A. 不得购买S、ST、S*ST、SST以及被交易所特别处理的股票;</p>
				    <p>B. 不得购买权证类可以T+0交易的证券;</p>
				    <p>C. 不得购买首日上市新股(或复牌首日股票) 等当日不设涨跌停板限制的股票;</p>
				    <p>D. 中小创单只股票持仓市值不得超过账户总资产的50%</p>
				    <p>E. 在预警线以下总持仓市值不得超过总资产的50%;</p>
				    <p>F. 主板单票在预警线以上可以单票满仓，中小创单票不得超过总资产的50%;</p>
				    <p>G. 不得购买任何杠杆类股票产品，含分级基金;若在某一交易日违反上述持仓约定，则乙方须在下一个交易日上午10:30前自行调整至约定比例，否则举办方有权以任何可以成交的价格完全卖出违反上述持仓约定的股票；操盘手认可举办方的此项操作，并对因此带来的损失承担完全的责任。</p>
				    <p>9. 本次活动的最终解释权归股林英雄所有。</p>
				    <p>(最后，请在申请成为操盘手的过程中严肃对待，因为其资料直接影响您的申请是否通过，谢谢理解与支持，您的梦想舞台，股林英雄已为你搭建，期待你的加入！)</p>
			   		<div class="nextbtn">
			   			<button type="button" class="btn" onclick="japply()" >下一步</button>
			   		</div>
				</div>
				<!--提示-->
				<div class="modal fade in" id="realName" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
								<div class="center">
									<h4 class="modal-title" id="myModalLabel">提示</h4>
								</div>
							</div>
							<div class="modal-body center">
								<div class="head1">
									您还未实名认证，是否跳转到实名认证？
								</div>
								<div class="nextbtn" style="margin: 60px 0 40px;">
						   			<button type="button" class="btn" onclick="realname()" >跳到实名认证</button>
						   		</div>
							
							</div>
							
						</div>
					</div>
				</div>
			
			</div>
		</div>	
	</body>
<script>
  	function japply(){
  		
  		console.log(0000)
  		alert(1);
			// 检测是否实名认证
		$.ajax({
			   url: "http://192.168.7.98:8080/htjr_glsz/hero/isAuth.htm",
			   dataType : "json",//返回结果格式
			   success: function(data){
			   	alert(2);
					console.log(data)
					if (data.success == true) {
					  jumpApply();
				   } else {
					$('#realName').modal('show')
//					alert('您还未实名认证，是否跳转到实名认证？',function(e) {
//					if (e.index == 1) {
//						window.location.href = "http://192.168.7.97:8081/views/GlyxWeb/users/settings.jsp";
//					} else {
//						
//					}
//				})
//					
					
				   }
			   },
			   error: function(data) {
					
			   }
			});
		
	}
  	function realname () {
  		window.location.href = "http://192.168.7.97:8081/pcUserSetting/converPcRealNameAuth.htm";
  		
  	}
  	
	function jumpApply() {
		console.log(1111)
		// 检测是否已申请
		$.ajax({
			   type: "POST",
			   url: "http://192.168.7.98:8080/htjr_glsz/hero/checkUserIsHero.htm",
			   success: function(data){
			   		console.log(data)
				   if (data != 1) {
					   window.location.href = "http://192.168.7.98:8080/htjr_glsz/mobile/apply/challengeRound/challenge/fillin.jsp";
				   } else {
					   alert("正在审核中，请不要重复申请");
				   }
			   },
			   error: function(data) {
					
			   }
			});
	}
</script>
</html>