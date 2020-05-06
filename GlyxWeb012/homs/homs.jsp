<%@ page language="java" contentType="text/html; charset=UTF-8"
			 pageEncoding="UTF-8"%>
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<%
	String path = request.getContextPath();
	String basePath2 = request.getServerName() + ":"
			+ request.getServerPort() + path + "/";
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
		<title>优财交易</title>
		<!-- Bootstrap core CSS -->
		<link href="<%=basePath %>views/webhoms/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<%=basePath %>views/webhoms/css/base.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>views/webhoms/css/share.css" />
		<link rel="stylesheet" href="<%=basePath %>views/webhoms/css/homs.css" type="text/css" />
		<script src="<%=basePath %>views/webhoms/js/jquery.min.js"></script>
		<script src="<%=basePath %>views/webhoms/js/bootstrap.min.js"></script>
		<script src="<%=basePath %>views/webhoms/js/echarts.js"></script>
		<script src="<%=basePath %>views/webhoms/js/homs.js"></script>
		<script src="<%=basePath %>views/webhoms/js/lines.js"></script>
		<script src="<%=basePath %>views/webhoms/js/homsquery.js"></script>
		<script src="<%=basePath %>views/webhoms/js/My97DatePicker/WdatePicker.js"></script>
	</head>
	<style>	.ss {
	width: 15px;
	height: 15px;
	position: absolute;
	right: 5px;
	top: 10px;
	background: url('<%=basePath %>views/webhoms/images/close.png') no-repeat;
 background-size:100% 100%;
z-index: 10;
display: none;

}
.spanicon1 {
	width: 19px;
	height: 19px;
	display: inline-block;
	position: absolute;
	top: 1px;
	right: 1px;
	background: url(<%=basePath %>views/webhoms/images/shang.jpg)no-repeat;

}
.spanicon2 {
	width: 19px;
	height: 19px;
	display: inline-block;
	position: absolute;
	bottom: 1px;
	right: 1px;
	background: url(<%=basePath %>views/webhoms/images/xia.jpg)no-repeat;

}
.main_nav>a.active{
	background: #fe7e14 !important;
	color: #fff !important;
}	
	</style>

	<body>
		<jsp:include page="/views/webhoms/menu.jsp" flush="true"></jsp:include>
		<div class="container main clearfix">
			<div class="main_left pull-left">
				<div class="information">
					<div class="information_top">
						<div class="information_topimg">
							<img src="" id="inf_img" />
						</div>
						<div class="information_topiphone" id="inf_iphone"></div>
					</div>
					<div class="information_bottom">
						<div class="information_b">初始资金：<span class="color2" id="inf_b1">0</span></div>
						<div class="row information_line"><div class="col-md-6 padrightnot">可用余额：<span class="color2" id="inf_b2">0</span></div><div class="col-md-6 padrightnot">总资产：<span class="color2" id="inf_b3">0</span></div></div>
							<div class="row information_line"><div class="col-md-6 padrightnot">持仓总市值：<span class="color2" id="inf_b4">0</span></div><div class="col-md-6 padrightnot">持仓浮动盈亏：<span class="color3" id="inf_b5">0</span></div></div>
							<div class="row information_line"><div class="col-md-6 padrightnot">预警线：<span class="color2" id="inf_b6">0</span></div><div class="col-md-6 padrightnot">平仓线：<span class="color2" id="inf_b7">0</span></div></div>
					</div>
				</div>
				
				<div class="information" style="margin-bottom: 0;">
					<div class="ourposition">我的持仓</div>
					<div class="ourpositionline"><div class="col-md-3 text-center padnot color2">名称/代码</div><div class="col-md-3 text-center padnot color2">盈亏/市值</div><div class="col-md-3 text-center padnot color2">持仓/可卖</div><div class="col-md-3 text-center padnot color2">成本/最新</div></div>
					<ul class="ourpositioncon" id="position">
					  <li>
					  	<a href="#">
					  		<p class="col-md-3"><span>平安银行</span><span>100001</span></p>
					  		<p class="col-md-3"><span>-150</span><span>1000</span></p>
					  		<p class="col-md-3"><span>100</span><span>100</span></p>
					  		<p class="col-md-3"><span>10.65</span><span>1356</span></p>
					  	</a>
					  </li>
					  
					</ul>
					<div class="homs_fenye clearfix">
						<div class="homs_fenyel pull-left">共<span id="allshu">14</span>条,<span id="danyeshu">1</span>页记录</div>
						<div class="homs_fenyer pull-right"><a href="#" onclick="P_page(1)" >上一页</a><span id="pages">1</span><a href="#" onclick="N_page(1)" >下一页</a></div>
					</div>
				</div>
					<div class="information" >
					<div class="ourposition">自选股</div>
					<div class="ourpositionline"><div class="col-md-2 text-center padnot color2">名称/代码</div><div class="col-md-2 text-center padnot color2">当前价</div><div class="col-md-2 text-center padnot color2">涨跌幅</div><div class="col-md-2 text-center padnot color2">最高价</div><div class="col-md-2 text-center padnot color2">最低价</div><div class="col-md-2 text-center padnot color2">操作</div></div>
					<ul class="ourpositioncon" id="zixuangu">
					  <li>
					  	<a href="#">
					  		<p class="col-md-2"><span>平安银行</span><span>100001</span></p>
					  		<p class="col-md-2 line1">13.26</p>
					  		<p class="col-md-2 line1">-1.65%</p>
					  		<p class="col-md-2 line1">13.27</p>
					  		<p class="col-md-2 line1">13.09</p>
					  		<p class="col-md-2 line1"><span class="zx_close" onclick="sc_zxg()"></span></p>
					  	</a>
					  </li>
					  
					  
					</ul>
					<div class="homs_fenye clearfix">
						
						<div class="homs_fenyel pull-left">共<span id="allshu2">14</span>条,<span id="danyeshu2">1</span>页记录</div>
						<div class="homs_fenyer pull-right"><a href="#" onclick="P_page(2)" >上一页</a><span id="pages2">1</span><a href="#" onclick="N_page(2)" >下一页</a></div>
					</div>
				</div>
				
			</div>
			
			<div class="main_right pull-right">
				<div class="main_rightbb">
						<ul class="nav nav-tabs homs_nav" role="tablist">
							<li role="presentation" class="active">
								<a href="#buy" aria-controls="home" role="tab" data-toggle="tab">买入</a>
							</li>
							<li role="presentation">
								<a href="#sell" aria-controls="profile" role="tab" data-toggle="tab">卖出</a>
							</li>
							<li role="presentation">
								<a href="#remove" aria-controls="profile" role="tab" data-toggle="tab" onclick="removecx()">撤单</a>
							</li>
							<li role="presentation">
								<a href="#chaxun" aria-controls="profile" role="tab" data-toggle="tab" onclick="daydeal(1,5)">查询</a>
							</li>
							
						</ul>

						<!-- Tab panes -->
						<div class="tab-content homs_bottom">
							<div role="tabpanel" class="tab-pane active" id="buy">
							   <div class="mai clearfix">
							   		<div class="mai_l pull-left">
							   		<form id="buyform">
							   				<div class="mai_input">
							   					<label>股票代码：</label>
							   					<div style="position: relative;width: 30%; display: inline-block; margin-right: 2%; "><input type="text" placeholder="输入证劵代码" id="stock" onkeyup="value=value.replace(/[^\d.]/g,'')" style="width: 100%;" /><span class="ss" onclick="clos()"></span></div>
							   					<label>股票名称：</label>
							   					<input type="text" value="" readonly="" id="stockname"/>
							   				</div>
							   				<div class="mai_input">
							   					<label>当前价格：</label>
							   					<input type="text" value=""  readonly="" id="stockdqjq"/>
							   					<label>最大可买：</label>
							   					<input type="text" value="" readonly="" id="stockzdkm"/>
							   				</div>
							   				<div class="mai_input">
							   					<label>买入价格：</label>
							   						<div style="position: relative;width: 30%; display: inline-block; height: 40px !important;margin-right: 2%;  "><input type="text" value="" style="width: 100%;" id="stockmrjq" onkeyup="value=value.replace(/[^\d.]/g,'').replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3')" /><span class="spanicon1" onclick="moneyadd()"></span><span class="spanicon2" onclick="moneyminus()"></span></div>
							   					
							   					<label>可用资金：</label>
							   					<input type="text" value="" readonly="" id="ky" />
							   				</div>
							   				<div class="mai_input">
							   					<label>买入数量：</label>
							   					<div style="position: relative;width: 30%; display: inline-block; height: 40px !important;margin-right: 2%;  "><input type="text" value="0" style="width: 100%;" id="stockmysl" onkeyup="value=value.replace(/[^\d.]/g,'')" /><span class="spanicon1" onclick="numberadd()"></span><span class="spanicon2" onclick="numberminus()"></span></div>
							   					
							   					<label>买入金额：</label>
							   					<input type="text" value="" readonly="" id="stockmrje"/>
							   				</div>
							   				<div class="mai_input">
							   					<label style="min-height: 1px;"></label>
							   					<div class="mai_radio" id="mairu">
							   						<label><input name="buyra" type="radio" value="1" />全部 </label> 
													<label><input name="buyra" type="radio" value="2" />1/2</label> 
													<label><input name="buyra" type="radio" value="3" />1/3</label> 


							   					</div>
							   				</div>
							   			
							   			</form>
							   				<div class="mai_input" style="text-align: center;">
							   					
							   					<button style="background: #E9811E;" onclick="buy()">买入</button>
							   					<button>重置</button>
							   				</div>
							   		</div>
							   		<div class="mai_r pull-right">
							   			<div class="mai_rtitle">
							   				 -
							   			</div>
							   			<div class="mai_wd1 clearfix" style="border-bottom:1px solid #cfd4df ;">
							   				<div class="col-md-4">卖五(元/手)</div><div class="col-md-4 text-center mais1">-</div><div class="col-md-4 text-right mais2">-</div>
							   				<div class="col-md-4">卖四(元/手) </div><div class="col-md-4 text-center mais3">-</div><div class="col-md-4 text-right mais4">-</div>
							   				<div class="col-md-4">卖三(元/手)</div><div class="col-md-4 text-center mais5">-</div><div class="col-md-4 text-right mais6">-</div>
							   				<div class="col-md-4">卖二(元/手)</div><div class="col-md-4 text-center mais7">-</div><div class="col-md-4 text-right mais8">-</div>
							   				<div class="col-md-4">卖一(元/手)</div><div class="col-md-4 text-center mais9">-</div><div class="col-md-4 text-right mais10">-</div>

							   			</div>
							   			<div class="mai_wd1 clearfix">
							   				<div class="col-md-4">买一(元/手)</div><div class="col-md-4 text-center maix1">-</div><div class="col-md-4 text-right maix2">-</div>
							   				<div class="col-md-4">买二(元/手)</div><div class="col-md-4 text-center maix3">-</div><div class="col-md-4 text-right maix4">-</div>
							   				<div class="col-md-4">买三(元/手)</div><div class="col-md-4 text-center maix5">-</div><div class="col-md-4 text-right maix6">-</div>
							   				<div class="col-md-4">买四(元/手)</div><div class="col-md-4 text-center maix7">-</div><div class="col-md-4 text-right maix8">-</div>
							   				<div class="col-md-4">买五(元/手)</div><div class="col-md-4 text-center maix9">-</div><div class="col-md-4 text-right maix10">-</div>

							   			</div>
							   			<div class="mai_rbb clearfix">
							   				<p>最新：<span class="maizn">0.00</span></p>
							   				<p>涨停：<span class="maizt">0.00</span></p>
							   				<p>昨收：<span class="maizs">0.00</span></p>
							   				<p>跌停：<span class="maidt">0.00</span></p>
							   			</div>
							   		</div>
							   </div>
							      <!--提示-->
							      	<div class="modal fade in" id="buytishi" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
		  
						<div class="modal-content">
							<div class="modal-header">
								
								<div class="center">
									<h4 class="modal-title" id="myModalLabel">买入委托</h4>
								</div>
							</div>
							<div class="modal-body center">
								<div class="row"><div class="col-md-6">股票代码：<sapn id="buydm">1111</sapn></div><div class="col-md-6">股票名称:<span id="buyname">ss</span></div></div>
								<div class="row"><div class="col-md-6">委托价格：<sapn id="buyjg">1111</sapn></div><div class="col-md-6">委托数量:<span id="buysl">ss</span></div></div>
								<div class="nextbtn" style="margin: 60px 0 40px;">
						   			<button type="button" class="btn"  onclick="buynext()" id="buybtn">买入</button>
						   			<button type="button" class="btn" data-dismiss="modal" aria-label="Close">取消</button>
						   		</div>
							
							</div>
							
						</div>
					</div>
				</div>
							
								
							</div>
							
							
							
							
							<div role="tabpanel" class="tab-pane" id="sell">
								<div class="mai clearfix">
							   		<div class="mai_l pull-left">
							   			<form id="sellform">
							   				<div class="mai_input">
							   					<label>股票代码：</label>
							   					<div style="position: relative;width: 30%; display: inline-block;margin-right: 2%;  "><input type="text" placeholder="输入证劵代码" id="stock1" onkeyup="value=value.replace(/[^\d.]/g,'')" style="width: 100%;" /><span class="ss" onclick="clos()"></span></div>
							   					<label>股票名称：</label>
							   					<input type="text" value="" readonly="" id="stockname1"/>
							   				</div>
							   				<div class="mai_input">
							   					<label>当前价格：</label>
							   					<input type="text" value=""  readonly="" id="stockdqjq1"/>
							   					<label>最大可卖：</label>
							   					<input type="text" value="" readonly="" id="stockzdkm1"/>
							   				</div>
							   				<div class="mai_input">
							   					<label>卖出价格：</label>
							   						<div style="position: relative;width: 30%; display: inline-block; height: 40px !important;margin-right: 2%;  "><input type="text" value="" style="width: 100%;" id="stockmrjq1" onkeyup="value=value.replace(/[^\d.]/g,'').replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3')" /><span class="spanicon1" onclick="moneyadd1()"></span><span class="spanicon2" onclick="moneyminus1()"></span></div>
							   					
							   					<label>可用资金：</label>
							   					<input type="text" value="" readonly="" id="ky1" />
							   				</div>
							   				<div class="mai_input">
							   					<label>卖出数量：</label>
							   					<div style="position: relative;width: 30%; display: inline-block; height: 40px !important;margin-right: 2%;  "><input type="text" value="0" style="width: 100%;" id="stockmysl1" onkeyup="value=value.replace(/[^\d.]/g,'')" /><span class="spanicon1" onclick="numberadd1()"></span><span class="spanicon2" onclick="numberminus1()"></span></div>
							   					
							   					<label>卖出金额：</label>
							   					<input type="text" value="" readonly="" id="stockmrje1"/>
							   				</div>
							   				<div class="mai_input">
							   					<label style="min-height: 1px;"></label>
							   					<div class="mai_radio" id="maichu1">
							   						<label><input name="sellra" type="radio" value="1" />全部 </label> 
													<label><input name="sellra" type="radio" value="2" />1/2</label> 
													<label><input name="sellra" type="radio" value="3" />1/3</label> 


							   					</div>
							   				</div>
							   				
							   			</form>
							   			<div class="mai_input" style="text-align: center;">
							   					
							   					<button style="background: #25b000;" onclick="sell()">卖出</button>
							   					<button>重置</button>
							   			</div>
							   		</div>
							   		<div class="mai_r pull-right">
							   			<div class="mai_rtitle">
							   				 平安银行
							   			</div>
							   			<div class="mai_wd1 clearfix" style="border-bottom:1px solid #cfd4df ;">
							   				<div class="col-md-4">卖五(元/手)</div><div class="col-md-4 text-center mais1">-</div><div class="col-md-4 text-right mais2">-</div>
							   				<div class="col-md-4">卖四(元/手) </div><div class="col-md-4 text-center mais3">-</div><div class="col-md-4 text-right mais4">-</div>
							   				<div class="col-md-4">卖三(元/手)</div><div class="col-md-4 text-center mais5">-</div><div class="col-md-4 text-right mais6">-</div>
							   				<div class="col-md-4">卖二(元/手)</div><div class="col-md-4 text-center mais7">-</div><div class="col-md-4 text-right mais8">-</div>
							   				<div class="col-md-4">卖一(元/手)</div><div class="col-md-4 text-center mais9">-</div><div class="col-md-4 text-right mais10">-</div>

							   			</div>
							   			<div class="mai_wd1 clearfix">
							   				<div class="col-md-4">买一(元/手)</div><div class="col-md-4 text-center maix1">-</div><div class="col-md-4 text-right maix2">-</div>
							   				<div class="col-md-4">买二(元/手)</div><div class="col-md-4 text-center maix3">-</div><div class="col-md-4 text-right maix4">-</div>
							   				<div class="col-md-4">买三(元/手)</div><div class="col-md-4 text-center maix5">-</div><div class="col-md-4 text-right maix6">-</div>
							   				<div class="col-md-4">买四(元/手)</div><div class="col-md-4 text-center maix7">-</div><div class="col-md-4 text-right maix8">-</div>
							   				<div class="col-md-4">买五(元/手)</div><div class="col-md-4 text-center maix9">-</div><div class="col-md-4 text-right maix10">-</div>

							   			</div>
							   			<div class="mai_rbb clearfix">
							   				<p>最新：<span class="maizn">0.00</span></p>
							   				<p>涨停：<span class="maizt">0.00</span></p>
							   				<p>昨收：<span class="maizs">0.00</span></p>
							   				<p>跌停：<span class="maidt">0.00</span></p>
							   			</div>
							   		</div>
							   </div>
							   
							   	<div class="modal fade in" id="selltishi" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
		  
						<div class="modal-content">
							<div class="modal-header">
								
								<div class="center">
									<h4 class="modal-title" id="myModalLabel">卖出委托</h4>
								</div>
							</div>
							<div class="modal-body center">
								<div class="row"><div class="col-md-6">股票代码：<sapn id="selldm">1111</sapn></div><div class="col-md-6">股票名称:<span id="sellname">ss</span></div></div>
								<div class="row"><div class="col-md-6">委托价格：<sapn id="selljg">1111</sapn></div><div class="col-md-6">委托数量:<span id="sellsl">ss</span></div></div>
								<div class="nextbtn" style="margin: 60px 0 40px;">
						   			<button type="button" class="btn"  onclick="sellnext()">卖出</button>
						   			<button type="button" class="btn" data-dismiss="modal" aria-label="Close">取消</button>
						   		</div>
							
							</div>
							
						</div>
					</div>
				</div>
							   
							</div>
							
							
							<div role="tabpanel" class="tab-pane" id="remove">
								<div class="mai clearfix" style="padding: 25px;">
									<div class="">
										<table class="table" style="word-break:break-all; word-wrap:break-all;">
											<thead>
												<tr>
													<th>股票代码</th>
													<th>股票名称</th>
													<th>买入/卖出</th>
													
													<th>委托时间</th>
													<th>委托价格</th>
													<th>委托数量</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody id="myremove">
												<tr>
													<td>50320</td>
													<td>平安银行</td>
													<td style="color: red;">买入</td>
													<td>2014-05-07</td>
													
													<td>4.23</td>
													<td>10000</td>
													<td>
														<button class="removebtn" onclick="show_widows()">撤单</button>
													</td>
												</tr>
												<tr>
													<td>50320</td>
													<td>平安银行</td>
													<td style="color: green;">卖出</td>
													<td>2014-05-07</td>
													
													<td>4.23</td>
													<td>10000</td>
													<td>
														<button class="removebtn" onclick="show_widows()">撤单</button>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<nav class="paging">
										<input class="pagbtn" type="button" value="上一页">
										<!--<input id="pages" class="ipt" type="text" value="1">-->
										<span>1</span>	
										<input class="pagbtn" type="button" value="下一页">
									</nav>
								</div>
								<!--撤单弹窗-->
								<div class="modal fade in" id="prompt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
												<div class="center">
													<h4 class="modal-title" id="myModalLabel">撤单</h4>
												</div>
											</div>
											<div class="modal-body" style="text-align: center;">
												<div class="head">
													您是否确定撤单？
												</div>
												<div class="nextbtn" style="margin: 60px 0 40px;">
													<input type="hidden" id="removenum" value="" />
										   			<button type="button" class="btn" onclick="removeqd()">确定撤单</button>
										   		</div>
											
											</div>
											
										</div>
									</div>
								</div>
							</div>
							
							<div role="tabpanel" class="tab-pane" id="chaxun">
								<ul class="nav nav-tabs chaxuntab" role="tablist">
									<!--<li role="presentation" class="active" >
										<a href="#flowing" aria-controls="home" role="tab" data-toggle="tab">资金流水</a>
									</li>-->
									<li role="presentation" class="active">
										<a href="#daydeal" aria-controls="profile" role="tab" data-toggle="tab" onclick="daydeal(1,5);">当日成交</a>
									</li>
									<li role="presentation">
										<a href="#dayentrust" aria-controls="profile" role="tab" data-toggle="tab" onclick="dayentrust(1,5);">当日委托</a>
									</li>
									<li role="presentation">
										<a href="#historyentrust" aria-controls="profile" role="tab" data-toggle="tab" onclick="historyentrust(1,5);">历史委托</a>
									</li>
									<li role="presentation">
										<a href="#record" aria-controls="profile" role="tab" data-toggle="tab" onclick="record(1,5);">成交记录</a>
									</li>
									<li role="presentation">
										<a href="#delivery" aria-controls="profile" role="tab" data-toggle="tab" onclick="delivery(1,5);">交割单</a>
									</li>
								</ul>
								<div class="tab-content">
									<!--资金流水-->
									<!--<div role="tabpanel" class="tab-pane active" id="flowing">
										<div class="mai clearfix" style="padding: 15px;">
										
											<div class="">
												<table class="table" style="word-break:break-all; word-wrap:break-all;">
													<thead>
														<tr>
															<th>订单编号</th>
															<th>股票代码</th>
															<th>股票名称</th>
															<th>成交时间</th>
															<th>成交价格</th>
															<th>成交金额</th>
															<th>成交数量</th>
															<th>成交余额</th>
															<th></th>
														</tr>
													</thead>
													<tbody id="myflowing">
														<tr>
															<td>h123456</td>
															<td>50320</td>
															<td>平安银行</td>
															<td>20140507 12:25:13</td>
															<td>4.23</td>
															<td>10000</td>
															<td>1000</td>
															<td>10000</td>
															<td class="tdpad">
																<div class="bg_515" >买</div>
															</td>
														</tr>
														<tr>
															<td>h123456</td>
															<td>50320</td>
															<td>平安银行</td>
															<td>20140507 12:25:13</td>
															<td>4.23</td>
															<td>10000</td>
															<td>1000</td>
															<td>10000</td>
															<td class="col_515">
																<div class="bg_651">卖 </div>	
															</td>
														</tr>
														
													</tbody>
												</table>
											</div>
											<nav class="paging">
												<input class="pagbtn" type="button" value="上一页">
												<span>1</span>	
												<input class="pagbtn" type="button" value="下一页">
											</nav>
										</div>
										
									</div>
									-->
									<!--当日成交-->
									<div role="tabpanel" class="tab-pane active" id="daydeal">
										<div class="mai clearfix" style="padding: 15px;">
											<div class="">
												<table class="table" style="word-break:break-all; word-wrap:break-all;">
													<thead>
														<tr>
															<th>股票代码</th>
															<th>股票名称</th>
															<th>委托价格</th>
															
															<th>成交时间</th>
															<th>成交价格</th>
															<th>成交金额</th>
															<th>成交数量</th>
															<th>成交状态</th>
															<th></th>
														</tr>
													</thead>
													<tbody id="mydaydeal">
														<tr>
															<td>h123456</td>
															<td>50320</td>
															<td>平安银行</td>
															<td>20140507</td>
															<td>12:25:13</td>
															<td>4.23</td>
															<td>10000</td>
															<td>1000</td>
															<td>10000</td>
															<td class="col_515">
																<div class="bg_651">卖 </div>	
															</td>
														</tr>
														<tr>
															<td>h123456</td>
															<td>50320</td>
															<td>平安银行</td>
															<td>20140507 12:25:13</td>
															<td>4.23</td>
															<td>10000</td>
															<td>1000</td>
															<td>10000</td>
															<td class="tdpad">
																<div class="bg_515" >买</div>
															</td>
														</tr>
														
													</tbody>
												</table>
											</div>
											<nav class="paging">
												<input class="pagbtn" type="button" value="上一页" onclick="aP_page(1)">
												<span id="adpages1">1</span>	
												<input class="pagbtn" type="button" value="下一页" onclick="aN_page(1)">
											</nav>
										</div>
										
									</div>
									
									<!--当日委托-->
									<div role="tabpanel" class="tab-pane " id="dayentrust">
										<div class="mai clearfix" style="padding: 15px;">
											<div class="">
												<table class="table" style="word-break:break-all; word-wrap:break-all;">
													<thead>
														<tr>
															<th>股票代码</th>
															<th>股票名称</th>
															<th>委托价格</th>
															<th>委托数量</th>
														
															<th>成交时间</th>
															<th>成交价格</th>
															<th>成交金额</th>
															<th>成交数量</th>
															<th>成交状态</th>
															<th></th>
														</tr>
													</thead>
													<tbody id="mydayentrust">
														<tr>
															<td>50320</td>
															<td>平安银行</td>
															<td>13.8</td>
															<td>100</td>
															<td>20140507</td> 
															<td>12:25:13</td>
															<td>4.23</td>
															<td>100</td>
															<td>1000</td>
															<td>已成交</td>
															<td class="tdpad">
																<div class="bg_515" >买</div>
															</td>
														</tr>
														<tr>
															<td>50320</td>
															<td>平安银行</td>
															<td>13.8</td>
															<td>100</td>
															<td>20140507</td> 
															<td>12:25:13</td>
															<td>4.23</td>
															<td>100</td>
															<td>1000</td>
															<td>已成交</td>
															<td class="col_515">
																<div class="bg_651">卖 </div>	
															</td>
														</tr>
														
														
													</tbody>
												</table>
											</div>
											<nav class="paging">
												<input class="pagbtn" type="button" value="上一页" onclick="aP_page(2)">
												<span id="adpages2">1</span>	
												<input class="pagbtn" type="button" value="下一页" onclick="aN_page(2)">
											</nav>
										</div>
										
									</div>
									
									<!--历史委托-->
									<div role="tabpanel" class="tab-pane " id="historyentrust">
										<div class="mai clearfix" style="padding: 15px;">
											<div class="query">
												<input type="text" class="form-control Wdate" id="calendarStart" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,onpicked:function(){calendarEnd.focus();}})">
												 -
												<input type="text" class="form-control Wdate" id="calendarEnd" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
												
												<button type="button" class="querybtn">搜索</button>
												
											</div>
											<div class="">
												<table class="table" style="word-break:break-all; word-wrap:break-all;">
													<thead>
														<tr>
															<th>股票代码</th>
															<th>股票名称</th>
															<th>委托日期</th>
															<th>委托时间</th>
															<th>委托价格</th>
															<th>委托数量</th>
															<th>委托状态</th>
															<th>操作</th>
														</tr>
													</thead>
													<tbody id="myentrust">
														<tr>
															<td>00001</td>
															<td>平安银行</td>
															<td>20140507</td> 
															<td>12:25:13</td>
															<td>4.23</td>
															<td>100</td>
															<td>已成交</td>
															<td class="tdpad">
																<div class="bg_515" >买</div>
															</td>
														</tr>
														
														<tr>
															<td>00001</td>
															<td>平安银行</td>
															<td>20140507</td> 
															<td>12:25:13</td>
															<td>4.23</td>
															<td>100</td>
															<td>已成交</td>
															<td class="col_515">
																<div class="bg_651">卖 </div>	
															</td>
														</tr>
														
														
														
													</tbody>
												</table>
											</div>
											<nav class="paging">
												<input class="pagbtn" type="button" value="上一页" onclick="aP_page(3)">
												<span id="adpages3">1</span>	
												<input class="pagbtn" type="button" value="下一页" onclick="aN_page(3)">
											</nav>
										</div>
										
									</div>
									
									<!--成交记录-->
									<div role="tabpanel" class="tab-pane " id="record">
										<div class="mai clearfix" style="padding: 15px;">
											<div class="query">
												<input type="text" class="form-control Wdate" id="calendarStart" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,onpicked:function(){calendarEnd.focus();}})">
												 -
												<input type="text" class="form-control Wdate" id="calendarEnd" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
												
												<button type="button" class="querybtn">搜索</button>
												
											</div>
											<div class="">
												<table class="table" style="word-break:break-all; word-wrap:break-all;">
													<thead>
														<tr>
															<th>股票代码</th>
															<th>股票名称</th>
															<th>委托价格</th>
															<th>成交时间</th>
															<th>成交价格</th>
															<th>成交金额</th>
															<th>成交数量</th>
															<th>成交状态</th>
															<th></th>
														</tr>
													</thead>
													<tbody id="myrecord">
														<tr>
															<td>00001</td>
															<td>平安银行</td>
															<td>4.23</td>
															<td>2014050712:25:13</td> 
															<td>4.23</td>
															<td>100</td>
															<td>100</td>
															<td>已成交</td>
															<td class="col_515">
																<div class="bg_651">卖 </div>	
															</td>
														</tr>
														<tr>
															<td>00001</td>
															<td>平安银行</td>
															<td>20140507</td> 
															<td>12:25:13</td>
															<td>4.23</td>
															<td>100</td>
															<td>100</td>
															<td>已成交</td>
															<td>
																<div class="bg_515">买</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
											<nav class="paging">
												<input class="pagbtn" type="button" value="上一页" onclick="aP_page(4)">
												<span id="adpages4">1</span>	
												<input class="pagbtn" type="button" value="下一页" onclick="aN_page(4)">
											</nav>
										</div>
										
									</div>
									
									<!--交割单-->
									<div role="tabpanel" class="tab-pane " id="delivery">
										<div class="mai clearfix" style="padding: 15px;">
											<div class="query">
												<input type="text" class="form-control Wdate" id="calendarStart" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,onpicked:function(){calendarEnd.focus();}})">
												 -
												<input type="text" class="form-control Wdate"  id="calendarEnd" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
												
												<button type="button" class="querybtn">搜索</button>
											
											</div>
											<div class="">
												<table class="table" style="word-break:break-all; word-wrap:break-all;">
													<thead>
														<tr>
															<th>股票代码</th>
															<th>股票名称</th>
															<th>成交时间</th>
															<th>成交价格</th>
															<th>成交金额</th>
															<th>成交数量</th>
															<th>佣金</th>
															<th>印花税</th>
															<th>过户费</th>
															<th></th>
														</tr>
													</thead>
													<tbody id="mydelivery">
														<tr>
															<td>00001</td>
															<td>平安银行</td>
															<td>2014050712:25:13</td> 
															<td>4.23</td>
															<td>100</td>
															<td>100</td>
															<td>100</td>
															<td>100</td>
															<td>100</td>
															<td class="tdpad">
																<div class="bg_515" >买</div>
															</td>
														</tr>
														<tr>
															<td>00001</td>
															<td>平安银行</td>
															<td>2014050712:25:13</td> 
															<td>4.23</td>
															<td>100</td>
															<td>100</td>
															<td>100</td>
															<td>100</td>
															<td>100</td>
															<td class="tdpad">
																<div class="bg_651">卖 </div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
											<nav class="paging">
												<input class="pagbtn" type="button" value="上一页" onclick="aP_page(5)">
												<span id="adpages5">1</span>	
												<input class="pagbtn" type="button" value="下一页" onclick="aN_page(5)">
											</nav>
										</div>
										
									</div>
									
								</div>
							</div>
						
						</div>
							</div>
							
				
				
				<div class="search" style="position: relative;"  >
					<input type="text" onkeyup="cs_search()" placeholder="输入股票代码/中文名称/首字母" id="search_key"/><button class="glyphicon glyphicon-search" aria-hidden="true"></button>
					<div id="searchmain" style="width: 100%; background: #fff; z-index: 1000; padding-bottom: 60px; position: absolute; top: 40px; right: 0;display: none;">
					<ul class="nav nav-stacked nav-tabs" role="tablist" style="width: 100%;" id="searchlist">
							<li style="font-size:15px ;">
								<span>
									<span class="navspan" style="text-align: center;">代码</span>
									<span class="navspan1">名称</span>
									<span class="navspan1">简拼</span>
									<span class="navspan" style="text-align: center;">类型</span>
								</span>
							</li>
						
							
						</ul>
					<ul>
					
									
				</div>
				</div>

				
	
				<div class="top" style="padding: 10px 0;">
					<div style="padding: 0 15px;">
						<div class="dis" style="font-size: 16px;">
							<span id="right1">平安银行</span> <span id="right2">000001</span>
						</div>
						<div class="dis time">
							<span>12-06</span> <span>14:34:22</span>
						</div>
						<div class="dis">
							<button class="btn" id="addzx" style="margin-right: 20px;" onclick="addstock()"/>加入自选</button>
							<button class="btn" style="margin-right: 20px;background: #EDEDED; color: #333 !important; display: none;" onclick="delstock()" id="delzx"/>删除自选</button>
							<button class="buybtn" onclick="gpbuy()"/>买入</button>
						</div>
					</div>
					<hr />
					<div style="padding: 0 15px;">
						<div>
							<div class="topsub1">
								<span style="font-size: 24px;" id="right3">-</span>
							</div>
							<div class="topsub" >
								<span>昨收：</span> <span id="right4">-</span>
							</div>
							<div class="topsub" >
								<span>今开：</span> <span id="right5">-</span>
							</div>
							<div class="topsub" >
								<span>最高：</span> <span id="right6">-</span>
							</div>
							<div class="topsub" >
								<span>最低：</span> <span id="right7">-</span>
							</div>
							<div class="topsub" >
								<span>成交量：</span> <span id="right8">-</span>
							</div>
						</div>
						<div>
							<div class="topsub1">
								<span id="right9" style="width: 40%; display: inline-block;">-</span> <span id="right10" style="width: 40%; display: inline-block;">-</span>
							</div>
							<div class="topsub" >
								<span>成交额：</span> <span id="right11">-</span>
							</div>
							<div class="topsub" >
								<span>总市值：</span> <span id="right12">-</span>
							</div>
							<div class="topsub" >
								<span>涨停：</span> <span id="right13">-</span>
							</div>
							<div class="topsub" >
								<span>跌停：</span> <span id="right14">-</span>
							</div>
							<div class="topsub" >
								<span>振幅：</span> <span id="right15">-</span>
							</div>
						</div>
					</div>
					<div class="main_nav"><a href="javascript:chekine(1)" id="che1">分时</a><a href="javascript:chekine(2)" class="active" id="che2">日k</a><a href="javascript:chekine(3)" id="che3">周k</a><a href="javascript:chekine(4)" id="che4">月k</a><input type="hidden" id="kmainstock" value=""/></div>
					<div id="main" style="width: 100%; height: 600px;"></div>
				</div>
				
						</div>
				</div>
			</div>
		</div>
		</div>
		
		
		<jsp:include page="/views/webhoms/bottom.jsp" flush="true"></jsp:include>
	
	</body>
	<script>
	var nowpage = $('#pages').html();
	position(nowpage, 5);
	
	var nowpage1=$('#pages2').html();
	zxgcx(nowpage1,5);

function sc_zxg(index,num) {
	$.ajax({
		url: '/Data/delMyStock.do', // 跳转到 action
		type: 'POST',
		data:{'stockCode':index},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			if(data.success==true){
				alert('删除成功');
				var nowpage1=$('#pages1').html();
				zxgcx(nowpage1,5);
				if(num==1){
					$('#delzx').css('display','none');
					$('#addzx').css('display','inherit');
				}else{
					return;
				}
			}
		
			
		},
		error: function() {

		}
	});
}


function addstock(){
	var stockid=$('#right2').html();
	var stockname=$('#right1').html()
		$.ajax({
		url: '/Data/addMyStock.do', // 跳转到 action
		type: 'POST',
		data:{'stockCode':stockid,'stockName':stockname},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			if(data.success==true){
				alert('添加成功');
				var nowpage1=$('#pages1').html();
				zxgcx(nowpage1,5);
				$('#delzx').css('display','inherit');
				$('#addzx').css('display','none');
			}
		
			
		},
		error: function() {

		}
	});
}

function delstock(){
	var stockid=$('#right2').html();
	sc_zxg(stockid,1);
}


//买入
$("#mairu :radio").click(function() {
	var roi = $(this).val();
	var price = $('#stockmrjq').val();
	var pasj = $('#ky').val();
	var snun = $('#stock').val();
	if(snun == '' || snun == null) {
		alert('请输入股票代码');
		$("input[type='radio']").removeAttr('checked');

	} else {
		if(roi == 1) {
			price = price * 100;
			if(price == 0) {
				$('#stockmysl').val(price);
				$('#stockzdkm').val(price);
			} else {
				var num = parseInt(pasj / price);
				var num1 = parseInt(num * 100);
				$('#stockmysl').val(num1);
				$('#stockzdkm').val(num1);
			}
		} else if(roi == 2) {
			price = price * 100 * 2;
			if(price == 0) {
				$('#stockmysl').val(price);
			} else {
				var num = parseInt(pasj / price);
				var num1 = parseInt(num * 100);
				$('#stockmysl').val(num1);
				$('#stockzdkm').val(num1);
			}
		} else if(roi == 3) {
			price = price * 100 * 3;
			if(price == 0) {
				$('#stockmysl').val(price);
			} else {
				var num = parseInt(pasj / price);
				var num1 = parseInt(num * 100);
				$('#stockmysl').val(num1);
				$('#stockzdkm').val(num1);
			}
		}
	}
});
//卖出
$("#maichu1 :radio").click(function() {
	var roi= $(this).val();
	var data=window.data;
	var allList=data.obj.rows;
	var code=$('#stock1').val();
	var array = [];
		 var snun=$('#stock1').val();
 			 if(snun=='' ||snun==null){			 	
 			 	alert('请输入股票代码');			 	
 			 }else{
			for(var i=0;i<allList.length;i++){
				if(roi==1){				
					if(code==allList[i].shareCode){
						var quantity=allList[i].availableNum;						
						$('#stockmysl1').val(quantity);
					}				
				}else if(roi==2){
						if(code==allList[i].shareCode){	
							var quantity=allList[i].availableNum;
							var snuns=quantity/2;
						    var nuns= snuns % 100;
						  	quantity=snuns-nuns;
							$('#stockmysl1').val(quantity);
					}					
				}else if(roi==3){
						if(code==allList[i].shareCode){
							var quantity=allList[i].availableNum;
							var snuns=quantity/3;
						    var nuns= snuns % 100;
						  	quantity=snuns-nuns;
							$('#stockmysl1').val(quantity);
					}
					
				}				
				var map ={};
				map=allList[i].shareCode;
				array[i]=map;
			}
			var num= array.indexOf(code);
			if(num==-1){
				alert('您的可卖数量为0');
			}
				}
  	});

function buy(){
	var stock=$('#stock').val();
	var stockname=$('#stockname').val();
	var stockmrjq=$('#stockmrjq').val();
	var stockmysl=$('#stockmysl').val();
	if (stock=='') {
		alert('请输入股票代码')
	}else if(stockmysl==''||stockmysl==0){
		alert('请输入买入数量')
	}else{
		$("#buytishi").modal('show');
		$('#buydm').html(stock);
		$('#buyname').html(stockname);
		$('#buyjg').html(stockmrjq);
		$('#buysl').html(stockmysl);
	}
}
function sell(){
	var stock=$('#stock1').val();
	var stockname=$('#stockname1').val();
	var stockmrjq=$('#stockmrjq1').val();
	var stockmysl=$('#stockmysl1').val();
	if (stock=='') {
		alert('请输入股票代码')
	}else if(stockmysl==''||stockmysl==0){
		alert('请输入卖出数量')
	}else{
		$("#selltishi").modal('show');
		$('#selldm').html(stock);
		$('#sellname').html(stockname);
		$('#selljg').html(stockmrjq);
		$('#sellsl').html(stockmysl);
	}
}


	kinesj('000001','day','gp');
	xuanzhe('000001','gz');
	function show_widows (index) {		
			$("#prompt").modal('show')			
			$('#removenum').val(index);
		}
	
	
	//画图开始
	
var myChart = echarts.init(document.getElementById('main'));	
var upColor = '#00da3c';
var downColor = '#ec0000';


function splitData(rawData,index) {
    var categoryData = [];
    var values = [];
    var volumes = [];
   
    for (var i = 0; i < rawData.length; i++) {
        categoryData.push(rawData[i].splice(0, 1)[0]);
   //     values.push(rawData[i]);
           var vals=[];
      vals[0]=rawData[i][0];   
      vals[1]=rawData[i][1];
      vals[2]=rawData[i][2];
      vals[3]=rawData[i][3];
      if(index==1){
      	values.push(rawData[i]);
      }else{
       values[i]=vals;
      }
    
        volumes.push([i, rawData[i][4], rawData[i][0] > rawData[i][1] ? 1 : -1]);
    }
    console.log(values);
    return {
        categoryData: categoryData,
        values: values,
        volumes: volumes
    };
}

function calculateMA(dayCount, data) {
	console.log(data.values);
    var result = [];
    for (var i = 0; i < 242; i++) {
     
        var len = data.values.length;
        var sum = 0;
        if(i<len){
        	
       
     	if(dayCount==5){
     		 sum += data.values[i][0];
     	}else if(dayCount==10){
     		 sum += data.values[i][3];
     	}
        }else{
        	sum+='-';
        }
        result.push(sum);
    }
    return result;
}



	</script>
	
</html>