function flowing(nowpage,pagesize){
	$('#myflowing').html('');


}
var page1='';
var nowpage1='';
var page2='';
var nowpage2='';
var page3='';
var nowpage3='';
var page4='';
var nowpage4='';
var page5='';
var nowpage5='';
//当日成交
function daydeal(nowpage,pagesize){
	$('#mydaydeal').html('');
	nowpage1=nowpage;
	console.log(nowpage);
	$.ajax({
			url: '/api/other/findtodaytradingpc.action', // 跳转到 action
			type: 'POST',
			data:{'pagesize':pagesize,'nowpage':nowpage},
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType: "json", //返回结果格式
			success: function(data) {
				var allList=data.obj.rows;
			
				for(i=0;i<allList.length;i++){
					
					var html='';
					var state=allList[i].state;
					if(state==1){
						state='委托中';
					}else if(state==2){
						
						state='全部成交';
					}else if(state==3){
						state='部分成交';
					}else if(state==4){
						state='全部撤单';
					}else if(state==5){
						state='部分撤单';
					}
					
					if(allList[i].type==1){
						html+='<tr><td>'+allList[i].sharesCode+'</td><td>'+allList[i].sharesName+'</td><td>'+allList[i].entrustPrice+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].dealSingleMoney+'</td><td>'+allList[i].dealNum+'</td><td>'+allList[i].dealMoney+'</td><td>'+state+'</td><td class="tdpad"><div class="bg_515" >买</div></td></tr>';
					}else if(allList[i].type==2){
						html+='<tr><td>'+allList[i].sharesCode+'</td><td>'+allList[i].sharesName+'</td><td>'+allList[i].entrustPrice+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].dealSingleMoney+'</td><td>'+allList[i].dealNum+'</td><td>'+allList[i].dealMoney+'</td><td>'+state+'</td><td class="col_515"><div class="bg_651">卖 </div></td></tr>';
					}
					
					$('#mydaydeal').append(html);
				}
				
					var totalPage=parseInt(data.obj.total/pagesize);
			var paget=data.obj.total%pagesize;

			if(paget==0){
				page1=parseInt(totalPage);
			}else{
				page1 = parseInt(totalPage + 1);
			}
				
			},
			error: function() {
	
			}
	});

}






function dayentrust(nowpage,pagesize){
	$('#mydayentrust').html('');
	nowpage2=nowpage;
	console.log(nowpage);
	$.ajax({
			url: '/api/other/findtodayentrustpc.action', // 跳转到 action
			type: 'POST',
			data:{'pagesize':pagesize,'nowpage':nowpage},
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType: "json", //返回结果格式
			success: function(data) {
				var allList=data.obj.rows;
			
				for(i=0;i<allList.length;i++){
					
					var html='';
					var state=allList[i].entrustState;
					if(state==1){
						state='委托中';
					}else if(state==2){
						
						state='全部成交';
					}else if(state==3){
						state='部分成交';
					}else if(state==4){
						state='全部撤单';
					}else if(state==5){
						state='部分撤单';
					}
					
					if(allList[i].type==1){
						html+='<tr><td>'+allList[i].sharesCode+'</td><td>'+allList[i].sharesName+'</td><td>'+allList[i].entrustPrice+'</td><td>'+allList[i].entrustCount+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].dealSingleMoney+'</td><td>'+allList[i].dealNum+'</td><td>'+allList[i].dealMoney+'</td><td>'+state+'</td><td class="tdpad"><div class="bg_515" >买</div></td></tr>';
					}else if(allList[i].type==2){
						html+='<tr><td>'+allList[i].sharesCode+'</td><td>'+allList[i].sharesName+'</td><td>'+allList[i].entrustPrice+'</td><td>'+allList[i].entrustCount+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].dealSingleMoney+'</td><td>'+allList[i].dealNum+'</td><td>'+allList[i].dealMoney+'</td><td>'+state+'</td><td class="col_515"><div class="bg_651">卖 </div></td></tr>';
					}
					
					$('#mydayentrust').append(html);
				}
				var totalPage=parseInt(data.obj.total/pagesize);
			var paget=data.obj.total%pagesize;

			if(paget==0){
				page2=parseInt(totalPage);
			}else{
				page2 = parseInt(totalPage + 1);
			}
				
			},
			error: function() {
	
			}
	});

}

function historyentrust(nowpage,pagesize,startDate,endDate){
	$('#myentrust').html('');
	nowpage3=nowpage;
	console.log(nowpage);
	$.ajax({
			url: '/api/other/findhistoryentrustpc.action', // 跳转到 action
			type: 'POST',
			
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:{'pagesize':pagesize,'nowpage':nowpage,'type':0,'startDate':startDate,'endDate':endDate},
			dataType: "json", //返回结果格式
			success: function(data) {
				var allList=data.obj.rows;
			
				for(i=0;i<allList.length;i++){
					
					var html='';
					var state=allList[i].entrustState;
					if(state==1){
						state='委托中';
					}else if(state==2){
						
						state='全部成交';
					}else if(state==3){
						state='部分成交';
					}else if(state==4){
						state='全部撤单';
					}else if(state==5){
						state='部分撤单';
					}
					
					if(allList[i].type==1){
						html+='<tr><td>'+allList[i].sharesCode+'</td><td>'+allList[i].sharesName+'</td><td>'+allList[i].createTimeForYMD+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].entrustPrice+'</td><td>'+allList[i].entrustCount+'</td><td>'+state+'</td><td class="tdpad"><div class="bg_515" >买</div></td></tr>';
					}else if(allList[i].type==2){
						html+='<tr><td>'+allList[i].sharesCode+'</td><td>'+allList[i].sharesName+'</td><td>'+allList[i].createTimeForYMD+'</td><td>'+allList[i].createTime+'</td><td>'+allList[i].entrustPrice+'</td><td>'+allList[i].entrustCount+'</td><td>'+state+'</td><td class="col_515"><div class="bg_651">卖 </div></td></tr>';
					}
					
					$('#myentrust').append(html);
				}
				var totalPage=parseInt(data.obj.total/pagesize);
			var paget=data.obj.total%pagesize;

			if(paget==0){
				page3=parseInt(totalPage);
			}else{
				page3 = parseInt(totalPage + 1);
			}
				
			},
			error: function() {
	
			}
	});

}



function record(nowpage,pagesize,startDate,endDate){
	$('#myrecord').html('');
	nowpage4=nowpage;
	console.log(nowpage);
	$.ajax({
			url: '/api/other/findhistoryrecordpc.action', // 跳转到 action
			type: 'POST',
		
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:{'type':0,'startDate':startDate,'endDate':endDate,'pagesize':pagesize,'nowpage':nowpage},
			dataType: "json", //返回结果格式
			success: function(data) {
				var allList=data.obj.rows;
			
				for(i=0;i<allList.length;i++){
					
					var html='';
					var state=allList[i].entrustState;
					if(state==1){
						state='委托中';
					}else if(state==2){
						
						state='全部成交';
					}else if(state==3){
						state='部分成交';
					}else if(state==4){
						state='全部撤单';
					}else if(state==5){
						state='部分撤单';
					}
					
					if(allList[i].type==1){
						html+='<tr><td>'+allList[i].sharesCode+'</td><td>'+allList[i].sharesName+'</td><td>'+allList[i].entrustPrice+'</td><td>'+allList[i].createTimeForYMD+'</td><td>'+allList[i].dealSingleMoney+'</td><td>'+allList[i].dealNum+'</td><td>'+allList[i].dealMoney+'</td><td>'+state+'</td><td class="tdpad"><div class="bg_515" >买</div></td></tr>';
					}else if(allList[i].type==2){
						html+='<tr><td>'+allList[i].sharesCode+'</td><td>'+allList[i].sharesName+'</td><td>'+allList[i].entrustPrice+'</td><td>'+allList[i].createTimeForYMD+'</td><td>'+allList[i].dealSingleMoney+'</td><td>'+allList[i].dealNum+'</td><td>'+allList[i].dealMoney+'</td><td>'+state+'</td><td class="col_515"><div class="bg_651">卖 </div></td></tr>';
					}
					
					$('#myrecord').append(html);
				}
				var totalPage=parseInt(data.obj.total/pagesize);
			var paget=data.obj.total%pagesize;

			if(paget==0){
				page4=parseInt(totalPage);
			}else{
				page4 = parseInt(totalPage + 1);
			}
				
			},
			error: function() {
	
			}
	});

}

function delivery(nowpage,pagesize,startDate,endDate){
	$('#mydelivery').html('');
	nowpage5=nowpage;
	console.log(nowpage);
	$.ajax({
			url: '/api/other/finddeliverypc.action', // 跳转到 action
			type: 'POST',
			
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:{'type':0,'startDate':startDate,'endDate':endDate,'pagesize':pagesize,'nowpage':nowpage},
			dataType: "json", //返回结果格式
			success: function(data) {
				var allList=data.obj.rows;
			
				for(i=0;i<allList.length;i++){
					
					var html='';
				
					
					if(allList[i].buy==0){
						html+='<tr><td>'+allList[i].sharesCode+'</td><td>'+allList[i].sharesName+'</td><td>'+allList[i].times+'</td><td>'+allList[i].dealSingleMoney+'</td><td>'+allList[i].allMoney+'</td><td>'+allList[i].quantity+'</td><td>'+allList[i].commission+'</td><td>'+allList[i].stampDuty+'</td><td>'+allList[i].transFee+'</td><td class="tdpad"><div class="bg_515" >买</div></td></tr>';
					}else if(allList[i].buy==1){
						html+='<tr><td>'+allList[i].sharesCode+'</td><td>'+allList[i].sharesName+'</td><td>'+allList[i].times+'</td><td>'+allList[i].dealSingleMoney+'</td><td>'+allList[i].allMoney+'</td><td>'+allList[i].quantity+'</td><td>'+allList[i].commission+'</td><td>'+allList[i].stampDuty+'</td><td>'+allList[i].transFee+'</td><td class="col_515"><div class="bg_651">卖 </div></td></tr>';
					}
					
					$('#mydelivery').append(html);
				}
				var totalPage=parseInt(data.obj.total/pagesize);
			var paget=data.obj.total%pagesize;

			if(paget==0){
				page5=parseInt(totalPage);
			}else{
				page5 = parseInt(totalPage + 1);
			}
				
			},
			error: function() {
	
			}
	});

}



//分页上一页
function aP_page(index){
	
		if(index==1){
			if(nowpage1==1){
				alert('这是第一页');
			}else{
				var pages=parseInt(nowpage1-1);
				nowpage1=pages;
		
				$('#adpages1').html(pages);
				daydeal(pages,5);
			}
		}else if(index==2){
			if(nowpage2==1){
				alert('这是第一页');
			}else{
				var pages=parseInt(nowpage2-1);
				nowpage2=pages;
		
				$('#adpages2').html(pages);
				dayentrust(pages,5);
			}
		}else if(index==3){
			if(nowpage3==1){
				alert('这是第一页');
			}else{
				var pages=parseInt(nowpage3-1);
				nowpage3=pages;
		
				$('#adpages3').html(pages);
				historyentrust(pages,5);
			}
		}else if(index==4){
			if(nowpage4==1){
				alert('这是第一页');
			}else{
				var pages=parseInt(nowpage4-1);
				nowpage4=pages;
		
				$('#adpages4').html(pages);
				record(pages,5);
			}
		}else if(index==5){
			if(nowpage5==1){
				alert('这是第一页');
			}else{
				var pages=parseInt(nowpage5-1);
				nowpage5=pages;
		
			$('#adpages5').html(pages);
			delivery(pages,5);
			}
		}
	
	
	
	
}

//分页下一页
function aN_page(index){
	console.log(page);
	console.log(nowpage);


//		$('#pages').val(pages);
		if(index==1){
				if(nowpage1==page1){
					alert('这是最后一页');
					}
				else{
					var pages=parseInt(nowpage1)+parseInt(1);
					nowpage1=pages;
					$('#adpages1').html(pages);
					daydeal(pages,5);
				}
		}else if(index==2){
			if(nowpage2==page2){
					alert('这是最后一页');
					}
				else{
					var pages=parseInt(nowpage2)+parseInt(1);
					nowpage2=pages;
					$('#adpages2').html(pages);
					dayentrust(pages,5);
				}
		}else if(index==3){
			if(nowpage3==page3){
					alert('这是最后一页');
					}
				else{
					var pages=parseInt(nowpage3)+parseInt(1);
					nowpage3=pages;
					$('#adpages3').html(pages);
					historyentrust(pages,5);
				}
		}else if(index==4){
			if(nowpage4==page4){
					alert('这是最后一页');
					}
				else{
					var pages=parseInt(nowpage4)+parseInt(1);
					nowpage4=pages;
					$('#adpages4').html(pages);
					record(pages,5);
				}
		}else if(index==5){
			if(nowpage5==page5){
					alert('这是最后一页');
					}
				else{
					var pages=parseInt(nowpage5)+parseInt(1);
					nowpage5=pages;
					$('#adpages5').html(pages);
					delivery(pages,5);
				}
		}
	
}