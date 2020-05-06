

var page='';
var nowpage=''
//查询提现记录
function txRecord(nowpage,pagesize){
	$('#mypayment').html('');
	nowpage=nowpage;
	$.ajax({
		url: '/tran/tofetchRecord.htm', // 跳转到 action
		type: 'POST',
		data:{'nowpage':nowpage,'pagesize':pagesize},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			var allList=data.obj.rows;
			for(i=0;i<allList.length;i++){
				var states=allList[i].states;
				if(states==1){
					states='待处理';
				}else if(states==2){
					states='成功';
				}else if(states==3){
					states='失败';
				}else if(states==4){
					states='处理中';
				}else if(states==5){
					states='审核通过';
				}else if(states==6){
					states='操作失败';
				}
				var html='';
				html+='<tr><td class="padleft">'+allList[i].id+'</td><td class="">￥'+allList[i].money+'</td><td>'+allList[i].date+'</td><td class="col_11e">'+states+'</td></tr>';
				$('#mypayment').append(html);
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

//分页上一页
function P_page(index){
	if(nowpage==1){
		alert('这是第一页');
	}else{
		var pages=parseInt(nowpage-1);
		nowpage=pages;
		$('#pages').val(pages);
		if(index==1){
			ylRecord(pages,10);
		}else if(index==2){
			nbRecord(pages,10);
		}else if(index==3){
			txRecord(pages,10);
		}
	}
	
	
	
}

//分页下一页
function N_page(index){
	console.log(page);
	console.log(nowpage);

	if(nowpage==page){
		alert('这是最后一页');
	}else{
		var pages=parseInt(nowpage)+parseInt(1);
		nowpage=pages;
		$('#pages').val(pages);
		if(index==1){
			ylRecord(pages,10);
		}else if(index==2){
			nbRecord(pages,10);
		}else if(index==3){
			txRecord(pages,10);
		}
	}
}


//查询牛币记录
function nbRecord(nowpage,pagesize){
	$('#mypayment').html('');
	nowpage=nowpage;
	$.ajax({
		url: '/tran/myCopper.htm', // 跳转到 action
		type: 'POST',
		data:{'nowpage':nowpage,'pagesize':pagesize},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			var allList=data.obj.rows;
			for(i=0;i<allList.length;i++){
				var type=allList[i].type;
				
				
				var html='';
				if(type==0){
					html+='<tr><td class="padleft">'+allList[i].tranNo+'</td><td class="col_11e">+'+allList[i].fee+'</td><td>'+allList[i].describe+'</td><td class="col_11e">成功</td><td>'+allList[i].createTime+'</td></tr>';
				}else if(type==1){
					html+='<tr><td class="padleft">'+allList[i].tranNo+'</td><td class="col_e4b">-'+allList[i].fee+'</td><td>'+allList[i].describe+'</td><td class="col_11e">成功</td><td>'+allList[i].createTime+'</td></tr>';
				}
				
				$('#mypayment').append(html);
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

//查询银两记录
function ylRecord(nowpage,pagesize){
	$('#mypayment').html('');
	nowpage=nowpage;
	$.ajax({
		url: '/tran/mySilver.htm', // 跳转到 action
		type: 'POST',
		data:{'nowpage':nowpage,'pagesize':pagesize},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			var allList=data.obj.rows;
			for(i=0;i<allList.length;i++){
			
				var html='';
				if(allList[i].paymnettransactionno =='WEIXIN' || allList[i].paymnettransactionno =='WEIXINGZ' || allList[i].paymnettransactionno =='ALIPAY' ||allList[i].paymnettransactionno =='BEWEIXIN' || allList[i].paymnettransactionno =='QNTRAN'){
								var paymnettransactionno='账户充值';
								html+='<tr><td class="padleft">'+allList[i].transactionno+'</td><td class="col_11e">+'+allList[i].transactionamount+'</td><td>'+paymnettransactionno+'</td><td class="col_11e">'+allList[i].tranddescription+'</td><td>'+allList[i].transactiontmie+'</td></tr>';

							}else if(allList[i].paymnettransactionno == 'HTAC'){
								var paymnettransactionno='项目投资';
								html+='<tr><td class="padleft">'+allList[i].transactionno+'</td><td class="col_e4b">-'+allList[i].transactionamount+'</td><td>'+paymnettransactionno+'</td><td class="col_11e">'+allList[i].tranddescription+'</td><td>'+allList[i].transactiontmie+'</td></tr>';
								
							}else if(allList[i].paymnettransactionno == 'COST'){
								var paymnettransactionno='兑换牛币';
									html+='<tr><td class="padleft">'+allList[i].transactionno+'</td><td class="col_e4b">-'+allList[i].transactionamount+'</td><td>'+paymnettransactionno+'</td><td class="col_11e">'+allList[i].tranddescription+'</td><td>'+allList[i].transactiontmie+'</td></tr>';
								
							}else if( allList[i].paymnettransactionno == 'HPAY' || allList[i].paymnettransactionno == 'BCWITH'){
								var paymnettransactionno='提现';
									html+='<tr><td class="padleft">'+allList[i].transactionno+'</td><td class="col_e4b">-'+allList[i].transactionamount+'</td><td>'+paymnettransactionno+'</td><td class="col_11e">'+allList[i].tranddescription+'</td><td>'+allList[i].transactiontmie+'</td></tr>';
								
								
							}else if(allList[i].paymnettransactionno == 'INCOME'){								
									var paymnettransactionno='账户收益';
									html+='<tr><td class="padleft">'+allList[i].transactionno+'</td><td class="col_11e">+'+allList[i].transactionamount+'</td><td>'+paymnettransactionno+'</td><td class="col_11e">'+allList[i].tranddescription+'</td><td>'+allList[i].transactiontmie+'</td></tr>';
								
							}else if(allList[i].paymnettransactionno == 'TZSJL'){
								var paymnettransactionno='推荐奖励';
								html+='<tr><td class="padleft">'+allList[i].transactionno+'</td><td class="col_11e">+'+allList[i].transactionamount+'</td><td>'+paymnettransactionno+'</td><td class="col_11e">'+allList[i].tranddescription+'</td><td>'+allList[i].transactiontmie+'</td></tr>';
								
							}else if(allList[i].paymnettransactionno == 'TZS'){
								
								if(allList[i].transactiontype==0){
									var paymnettransactionno='挑战赛支出';
									html+='<tr><td class="padleft">'+allList[i].transactionno+'</td><td class="col_e4b">-'+allList[i].transactionamount+'</td><td>'+paymnettransactionno+'</td><td class="col_11e">'+allList[i].tranddescription+'</td><td>'+allList[i].transactiontmie+'</td></tr>';
									
								}else if(allList[i].transactiontype==1){
									var paymnettransactionno='挑战赛收益';
									html+='<tr><td class="padleft">'+allList[i].transactionno+'</td><td class="col_11e">+'+allList[i].transactionamount+'</td><td>'+paymnettransactionno+'</td><td class="col_11e">'+allList[i].tranddescription+'</td><td>'+allList[i].transactiontmie+'</td></tr>';
								
								}
								
							}else if(allList[i].paymnettransactionno == 'TZC'){
								
								if(allList[i].transactiontype==0){
									var paymnettransactionno='挑战赛支出';
									html+='<tr><td class="padleft">'+allList[i].transactionno+'</td><td class="col_e4b">-'+allList[i].transactionamount+'</td><td>'+paymnettransactionno+'</td><td class="col_11e">'+allList[i].tranddescription+'</td><td>'+allList[i].transactiontmie+'</td></tr>';
									
								}else if(allList[i].transactiontype==1){
									var paymnettransactionno='挑战赛收益';
									html+='<tr><td class="padleft">'+allList[i].transactionno+'</td><td class="col_11e">+'+allList[i].transactionamount+'</td><td>'+paymnettransactionno+'</td><td class="col_11e">'+allList[i].tranddescription+'</td><td>'+allList[i].transactiontmie+'</td></tr>';
								
								}
								
							}else if(allList[i].paymnettransactionno == 'PROP'){								
								var paymnettransactionno='道具保本金额';
								html+='<tr><td class="padleft">'+allList[i].transactionno+'</td><td class="col_11e">+'+allList[i].transactionamount+'</td><td>'+paymnettransactionno+'</td><td class="col_11e">'+allList[i].tranddescription+'</td><td>'+allList[i].transactiontmie+'</td></tr>';
								
							}else if(allList[i].paymnettransactionno == 'RECOMMEND'){
								var paymnettransactionno='推荐收益';
								html+='<tr><td class="padleft">'+allList[i].transactionno+'</td><td class="col_11e">+'+allList[i].transactionamount+'</td><td>'+paymnettransactionno+'</td><td class="col_11e">'+allList[i].tranddescription+'</td><td>'+allList[i].transactiontmie+'</td></tr>';
							
							}else if(allList[i].paymnettransactionno == 'GAMEJL'){
								
								if(allList[i].transactiontype==1){
									var paymnettransactionno='账户充值';
									html+='<tr><td class="padleft">'+allList[i].transactionno+'</td><td class="col_e4b">-'+allList[i].transactionamount+'</td><td>'+paymnettransactionno+'</td><td class="col_11e">'+allList[i].tranddescription+'</td><td>'+allList[i].transactiontmie+'</td></tr>';
									
								}else if(allList[i].transactiontype==2){
									var paymnettransactionno='提现';
									html+='<tr><td class="padleft">'+allList[i].transactionno+'</td><td class="col_11e">+'+allList[i].transactionamount+'</td><td>'+paymnettransactionno+'</td><td class="col_11e">'+allList[i].tranddescription+'</td><td>'+allList[i].transactiontmie+'</td></tr>';
								
								}else if(allList[i].transactiontype==3){
									var paymnettransactionno='消费';
									html+='<tr><td class="padleft">'+allList[i].transactionno+'</td><td class="col_11e">+'+allList[i].transactionamount+'</td><td>'+paymnettransactionno+'</td><td class="col_11e">'+allList[i].tranddescription+'</td><td>'+allList[i].transactiontmie+'</td></tr>';
								
								}else if(allList[i].transactiontype==4){
									var paymnettransactionno='A币转银两';
									html+='<tr><td class="padleft">'+allList[i].transactionno+'</td><td class="col_11e">+'+allList[i].transactionamount+'</td><td>'+paymnettransactionno+'</td><td class="col_11e">'+allList[i].tranddescription+'</td><td>'+allList[i].transactiontmie+'</td></tr>';
								
								}
								
							}else if(allList[i].paymnettransactionno == 'COST'){
								var paymnettransactionno='消耗银两';
								html+='<tr><td class="padleft">'+allList[i].transactionno+'</td><td class="col_11e">+'+allList[i].transactionamount+'</td><td>'+paymnettransactionno+'</td><td class="col_11e">'+allList[i].tranddescription+'</td><td>'+allList[i].transactiontmie+'</td></tr>';
							
							}
				
				
					
				
					
				
				
				$('#mypayment').append(html);
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
