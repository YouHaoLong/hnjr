$(function(){
	//总资产左边
	
	$.ajax({
		url: '/api/assets/query.do', // 跳转到 action
		type: 'POST',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			
			$('#inf_b2').html(data.obj.availableBalance);//	可用余额
			$('#ky').val(data.obj.availableBalance);
			$('#ky1').val(data.obj.availableBalance);
			$('#inf_b1').html(data.obj.initAssets);//初始资金
				var dd = data.obj.positionFloatIncome;
					dd=dd.toString();
				var str = dd.substr(0, 1);
				if(str == '-') {
					
				}else{
					$('#inf_b5').addClass('color4');
				}
			$('#inf_b5').html(data.obj.positionFloatIncome); //持仓浮动盈亏
			$('#inf_b7').html(data.obj.noPositionMoney); //平仓线
			$('#inf_b6').html(data.obj.warningMoney);   //预警线
			$('#inf_b3').html(data.obj.totalAssets); //当前总资产
			$('#inf_b4').html(data.obj.positionValue); // 持仓总市值
			
		},
		error: function() {

		}
	});
	
	//买入
	$('#buyform :input')
				.blur(
						function() {
							//验证用户名
							if ($(this).is('#stock')) {
								if(this.value.length == 6){
								  	var index=$('#stock').val();
								  	share(index);
								
									$('.ss').css('display','block');
								}else if(this.value.length==0){
									$('.ss').css('display','none');
								}else{
									$('.ss').css('display','block');
								}
							}
							
					
						}).keyup(function() {
					$(this).triggerHandler("blur");
				}).focus(function() {
					$(this).triggerHandler("blur");
				});//end blur
				
				
				
				$('#sellform :input')
				.blur(
						function() {
							//验证用户名
							if ($(this).is('#stock1')) {
								if(this.value.length == 6){
								  	var index=$('#stock1').val();
								  	share(index);
								
									$('.ss').css('display','block');
								}else if(this.value.length==0){
									$('.ss').css('display','none');
								}else{
									$('.ss').css('display','block');
								}
							}
							
					
						}).keyup(function() {
					$(this).triggerHandler("blur");
				}).focus(function() {
					$(this).triggerHandler("blur");
				});//end blur
	
});

var page='';
var nowpage=''

function position(nowpage,pagesize){
	$('#position').html('');
	nowpage=nowpage;
	$.ajax({
		url: '/api/webassets/findhaveshare.do', // 跳转到 action
		type: 'POST',
		data:{'page':nowpage,'rows':pagesize},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			var allList=data.obj.rows;
			window.data =data;
			for(i=0;i<allList.length;i++){
				
				var html='';
				html+='<li><a href="javascript:xuanzhe(\''+allList[i].shareCode+'\')"><p class="col-md-3"><span>'+allList[i].shareName+'</span><span>'+allList[i].shareCode+'</span></p><p class="col-md-3"><span>'+allList[i].profitMoney+'</span><span>'+allList[i].totalValue+'</span></p><p class="col-md-3"><span>'+allList[i].number+'</span><span>'+allList[i].availableNum+'</span></p><p class="col-md-3"><span>'+allList[i].cost+'</span><span>'+allList[i].currentValue+'</span></p></a></li>';
				$('#position').append(html);
			}
			var totalPage=parseInt(data.obj.total/pagesize);
			var paget=data.obj.total%pagesize;

			if(paget==0){
				page=parseInt(totalPage);
			}else{
				page = parseInt(totalPage + 1);
			}
			
			$('#danyeshu').html(page);
			$('#allshu').html(data.obj.total);
		},
		error: function() {

		}
	});
}

 //自选股
	 function zxgcx(nowpage,pagesize){
	 		$('#zixuangu').html('');
	nowpage=nowpage;
	$.ajax({
		url: '/Data/queryMyStock.do', // 跳转到 action
		type: 'POST',
		data:{'nowpage':nowpage,'pagesize':pagesize},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			var allList=data.obj.rows;
//			window.data =data;
			for(i=0;i<allList.length;i++){
				
				var html='';
				html+='<li><a href="javascript:xuanzhe(\''+allList[i].stockCode+'\')"><p class="col-md-2"><span>'+allList[i].stockName+'</span><span>'+allList[i].stockCode+'</span></p><p class="col-md-2 line1">'+allList[i].nowPrice+'</p><p class="col-md-2 line1">'+allList[i].zdf+'</p><p class="col-md-2 line1">-</p><p class="col-md-2 line1">-</p><p class="col-md-2 line1"><span class="zx_close" onclick="sc_zxg(\''+allList[i].stockCode+'\')"></span></p></a></li>';
				$('#zixuangu').append(html);
			}
			var totalPage=parseInt(data.obj.total/pagesize);
			var paget=data.obj.total%pagesize;

			if(paget==0){
				page=parseInt(totalPage);
			}else{
				page = parseInt(totalPage + 1);
			}
			
			$('#danyeshu2').html(page);
			$('#allshu2').html(data.obj.total);
		},
		error: function() {

		}
	});
	 	
	 }


//分页上一页
function P_page(index){
	if(nowpage==1){
		alert('这是第一页');
	}else{
		var pages=parseInt(nowpage-1);
		nowpage=pages;
		
		if(index==1){
			$('#pages').html(pages);
			position(pages,5);
		}else if(index==2){
			$('#pages2').html(pages);
			zxgcx(pages,5);
		}
	}
	
	
	
}

//分页下一页
function N_page(index){
	if(nowpage==page){
		alert('这是最后一页');
	}else{
		var pages=parseInt(nowpage)+parseInt(1);
		nowpage=pages;
		
		if(index==1){
			
			$('#pages').html(pages);
			position(pages,5);
		}else if(index==2){
			$('#pages2').html(pages);
			zxgcx(pages,5);
		}
	}
}

//


//////////买入
//关闭
function clos(){
	$('#stock').val('');
	$('#stock1').val('');
	$('.ss').css('display','none');
	$(".mai_radio input[type='radio']").removeAttr('checked');
	$("#quantity").val('');

}

//五档
function share(index) {
				
			var index = index;
			//查询右边买卖
			$.ajax({
				url: '/api/trade/findsharebycode.do?code='+index, // 跳转到 action
				type: 'POST',
				contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				dataType: "json", //返回结果格式
				success: function(data) {
					if(data.success == true) {
						$('#stockname').val(data.obj.fiveRelations.securityName);//名称
						$('.mai_rtitle').html(data.obj.fiveRelations.securityName);//名称
						$('#stockdqjq').val(data.obj.fiveRelations.currentPrice);//当前价钱
							$('#stockname1').val(data.obj.fiveRelations.securityName);//名称
						$('#stockdqjq1').val(data.obj.fiveRelations.currentPrice);//当前价钱
						$('#stockmrjq1').val(data.obj.fiveRelations.currentPrice);//当前价钱
						var allmoney=$('#ky').val();						
						var price=data.obj.fiveRelations.currentPrice*100;
							if(price==0){
								
								  $('#stockzdkm').val(price);//最大可以，买
							}else{
								var num=parseInt(allmoney/price);
								 var num1=parseInt(num*100);
								  $('#stockzdkm').val(num1);//最大可以，买	 
						
							}
							
						
						$('#stockmrjq').val(data.obj.fiveRelations.currentPrice);//买入价钱
//						$('#stockmysl').val();//买入数量
//						$('#stockmrje').val();//买入金额
						$('.mais1').html(data.obj.fiveRelations.sellFivePrice);//卖5
						$('.mais2').html(data.obj.fiveRelations.sellfiveamount);//卖5
						$('.mais3').html(data.obj.fiveRelations.sellFourPrice);
						$('.mais4').html(data.obj.fiveRelations.sellfouramount);
						$('.mais5').html(data.obj.fiveRelations.sellThreePrice);
						$('.mais6').html(data.obj.fiveRelations.sellthreeamount);
						$('.mais7').html(data.obj.fiveRelations.selltwoPrice);
						$('.mais8').html(data.obj.fiveRelations.selltwoamount);
						$('.mais9').html(data.obj.fiveRelations.sellonePrice);
						$('.mais10').html(data.obj.fiveRelations.selloneamount);
						
						$('.maix1').html(data.obj.fiveRelations.buyOneprice);
						$('.maix2').html(data.obj.fiveRelations.buyamount);
						$('.maix3').html(data.obj.fiveRelations.buyTwoprice);
						$('.maix4').html(data.obj.fiveRelations.buyTwoamount);
						$('.maix5').html(data.obj.fiveRelations.buyThreeprice);
						$('.maix6').html(data.obj.fiveRelations.buyThreeamount);
						$('.maix7').html(data.obj.fiveRelations.buyFourprice);
						$('.maix8').html(data.obj.fiveRelations.buyfouramount);
						$('.maix9').html(data.obj.fiveRelations.buyFiveprice);
						$('.maix10').html(data.obj.fiveRelations.buyFiveamount);
						$('.maizn').html(data.obj.fiveRelations.currentPrice);
						$('.maizt').html(data.obj.limitUp)
						$('.maizs').html(data.obj.fiveRelations.yesterdayPrice)
						$('.maidt').html(data.obj.limitDown)
					} else {

					}

				},
				error: function() {
					// view("异常！");

				}
			});

}

function moneyminus(){
		
			var price=$('#stockmrjq').val();
				if(price==''||price==0){
					return;
				}else{
					price=(price*10000-0.01*10000)/10000;
					price =price.toFixed(2);
					$('#stockmrjq').val(price);
					
				}
			
			
		}
function moneyadd(){
			
			var price=$('#stockmrjq').val();
			price=(price*10000+0.01*10000)/10000;
			price =price.toFixed(2);
			$('#stockmrjq').val(price);
}

	function numberminus(){
			var price=$('#stockmrjq').val();
			var quantity=$('#stockmysl').val();
				if(quantity=='' ||quantity==0){
					return;
				}else{
					quantity=(quantity*1000-100*1000)/1000;
					$('#stockmysl').val(quantity);
					var all=(quantity*price).toFixed(2);;
					$('#stockmrje').val(all);
					
				}
		}
		function numberadd(){
			var price=$('#stockmrjq').val();
			var quantity=$('#stockmysl').val();
			quantity=(quantity*1000+100*1000)/1000;
			
			$('#stockmysl').val(quantity);
				var all=(quantity*price).toFixed(2);;
					$('#stockmrje').val(all);		
				
		}
	
	function buynext(){
		
		var stock=$('#stock').val();
	var stockname=$('#stockname').val();
	var stockmrjq=$('#stockmrjq').val();
	var stockmysl=$('#stockmysl').val();
		
		$.ajax({
			url: '/api/trade/entrustbuy.do', // 跳转到 action
			type: 'POST',
//			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:{
				'sharesCode':stock,
				'sharesName':stockname,
				'entrustPrice':stockmrjq,
				'entrustCount':stockmysl,
				'limitup':$('#maizt').html(),
				'limitdown':$('#maidt').html()
			},
			dataType: "json", //返回结果格式
			success: function(data) {
				if(data.success==true){
					
					alert(data.msg);
					window.location.reload();
				}else{
					
					alert(data.msg);
					window.location.reload();
				}
				
					

			},
			error: function() {
				// view("异常！");
				
			}
		});
	}
	
	
	
	//卖出
	
	
	function moneyminus1(){
		
			var price=$('#stockmrjq1').val();
				if(price==''||price==0){
					return;
				}else{
					price=(price*10000-0.01*10000)/10000;
					price =price.toFixed(2);
					$('#stockmrjq1').val(price);
					
				}
			
			
		}
		function moneyadd1(){
			
			var price=$('#stockmrjq1').val();
			price=(price*10000+0.01*10000)/10000;
			price =price.toFixed(2);
			$('#stockmrjq1').val(price);
		}
		
		function numberminus1(){
			
			var quantity=$('#stockmysl1').val();
				if(quantity=='' ||quantity==0){
					return;
				}else{
					quantity=(quantity*1000-100*1000)/1000;
					$('#stockmysl1').val(quantity);
					
				}
		}
		function numberadd1(){
			
			var data=window.data;
			
			var allList=data.obj.rows;
			console.log(allList);
			var code=$('#stock1').val();
			var array = [];
			for(var i=0;i<allList.length;i++){
				
				if(code==allList[i].shareCode){				
					var quantity=$('#stockmysl1').val();
					quantity=(quantity*1000+100*1000)/1000;
					if(quantity>allList[i].availableNum){
						alert('您的可卖数量已经是最大值');
						return;
					}
					$('#stockmysl1').val(quantity);
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
	
	
	function sellnext(){
		var stock=$('#stock1').val();
	var stockname=$('#stockname1').val();
	var stockmrjq=$('#stockmrjq1').val();
	var stockmysl=$('#stockmysl1').val();
		$.ajax({
			url: '/api/trade/entrustsale.do', // 跳转到 action
			type: 'POST',
			data:{
				'sharesCode':stock,
				'sharesName':stockname,
				'entrustPrice':stockmrjq,
				'entrustCount':stockmysl,
				'limitup':$('#maizt').html(),
				'limitdown':$('#maidt').html()
			},
			//contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType: "json", //返回结果格式
			success: function(data) {
				if(data.success==true){
				
					alert(data.msg);
					window.location.reload();
				}else{
					
					alert(data.msg);
					window.location.reload();
				}
				
					

			},
			error: function() {
				// view("异常！");
				
			}
		});
	}
	
	
	
	
	////////////////////撤单
	
	function removecx(){
		$('#myremove').html('');
		$.ajax({
			url: '/api/trade/querycanrevoke.do', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType: "json", //返回结果格式
			success: function(data) {
				if(data.success==true){
					
					var allList=data.obj;
					for(var i=0;i<allList.length;i++){
						
						
						if(allList[i].entrustState==1){
							var entrustState='委托中';
						}else if(allList[i].entrustState==2){
							var entrustState='全部成交';
						}else if(allList[i].entrustState==3){
							var entrustState='部分成交';
						}else if(allList[i].entrustState==4){
							var entrustState='全部撤单';
						}else if(allList[i].entrustState==5){
							var entrustState='部分撤单';
						}
					
						var html = '';
						if(allList[i].type==2){
							html+='<tr><td>'+allList[i].sharesCode+'</td><td>'+allList[i].sharesName+'</td><td style="color: green;">卖出</td><td>'+allList[i].createTime+'</td><td>'+allList[i].entrustPrice+'</td><td>'+allList[i].entrustCount+'</td><td><button class="removebtn" onclick="show_widows('+allList[i].id+')">撤单</button></td></tr>';
							
							
						}else if(allList[i].type==1){
							
								html+='<tr><td>'+allList[i].sharesCode+'</td><td>'+allList[i].sharesName+'</td><td style="color: red;">买入</td><td>'+allList[i].createTime+'</td><td>'+allList[i].entrustPrice+'</td><td>'+allList[i].entrustCount+'</td><td><button class="removebtn" onclick="show_widows('+allList[i].id+')">撤单</button></td></tr>';
							
				
						}
						
						
	
						$('#myremove').append(html);
					}
					
					
				}else{
					
				}
				
					

			},
			error: function() {
				// view("异常！");
				
			}
		});
	}
	
	
	function removeqd () {
		var uid=$('#removenum').val();
		$.ajax({
			url: '/api/trade/revoke.do', // 跳转到 action
			type: 'POST',
//			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:{
				'id':uid,
			},
			dataType: "json", //返回结果格式
			success: function(data) {
				if(data.success==true){
					
					alert(data.msg);
				
					location.reload();
					
				}else{
					
					alert(data.msg);
				
					location.reload();
				}
				
					

			},
			error: function() {
				// view("异常！");
				
			}
		});
	}
	 
	
	function gpbuy(){
		  $("html, body").animate({

      scrollTop: $("#buy").offset().top }, {duration: 500,easing: "swing"});
			var gpdm=$('#right2').html();
   			$('#stock').val(gpdm);
				share(gpdm);
	}

	