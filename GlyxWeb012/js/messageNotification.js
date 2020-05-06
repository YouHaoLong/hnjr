var page='';
var nowpage='';

// 推荐将军
function hero(nowpage,pagesize){
	$('#mypayment').html('');
	nowpage=nowpage;
	$.ajax({
		url: '/pcRecommend/pcQueryRecommendOptor.htm', // 跳转到 action
		type: 'POST',
		data:{'nowpage':nowpage,'pagesize':pagesize},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			var allList=data.obj;
			for(i=0;i<allList.length;i++){
			    
				var iphone=allList[i].mobile;
				
				iphone = iphone.substr(0, 3) + '****' + iphone.substr(7);
			
			    
				var html='';
				html+='<tr><td>'+allList[i].realName+'</td><td>'+iphone+'</td><td>'+allList[i].state+'</td><td>'+allList[i].stage+'</td><td>'+allList[i].levelName+'</td><td>'+allList[i].totalRewardAmount+'</td></tr>';
				$('#mypayment').append(html);
			}
			var totalPage=parseInt(data.obj.total/pagesize);//总条数/每页显示的条数=总页数
			var paget=data.obj.total%pagesize;//判断是否能整除

			if(paget==0){//如果能整除
				page=parseInt(totalPage);//就得出当前总页数
			}else{//否则
				page = parseInt(totalPage + 1);//总页数+1
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
			hero(pages,10);
		}else if(index==2){
			xiaoxi(pages,10);
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
			hero(pages,10);
		}else if(index==2){
			xiaoxi(pages,10);
		}
	}
}


function xiaoxi(nowpage,pagesize){
		$('#mypayment').html('');
	nowpage=nowpage;
	$.ajax({
		url: '/message/openMessage.htm', // 跳转到 action
		type: 'POST',
		data:{'nowpage':nowpage,'pagesize':pagesize},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			var allList=data.obj.rows;
			for(i=0;i<allList.length;i++){
				
				var html='';
				if(allList[i].status==0){
					html+='<tr class="yellow" onclick="xiangqing('+allList[i].id+')">'+
	                '<td>'+
	                '<a type="button" class="un_read weidu"> 未读</a>'+
	                '</td>'+
	                '<td>'+
	                '<a href="#" type="button">'+ allList[i].title +'</a>'+
	                '</td>'+
	                '<td>'+
	                '<a href="#" type="button"> '+ allList[i].message +'</a>'+
	                '</td>'+
	                '<td class="date" type="button" >'+
	                '<a href="#">'+ allList[i].createtime+'</a>'+
	                '</td>'+
	                '</tr>';
				}else{
					html+='<tr onclick="xiangqing('+allList[i].id+')">'+
	                '<td>'+
	                '<a type="button" class="un_read"> 已读</a>'+
	                '</td>'+
	                '<td>'+
	                '<a href="#" type="button">'+ allList[i].title +'</a>'+
	                '</td>'+
	                '<td>'+
	                '<a href="#" type="button" > '+ allList[i].message +'</a>'+
	                '</td>'+
	                '<td class="date" type="button">'+
	                '<a href="#">'+ allList[i].createtime+'</a>'+
	                '</td>'+
	                '</tr>';
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


function xiangqing(index){
	$("#un_read").modal('show');
		$.ajax({
		url: '/message/userLookMeg.htm', // 跳转到 action
		type: 'POST',
		data:{'sendMsgId':index},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			console.log(data)
			$('#time').html(data.obj.createtime);
			$('#xq').html(data.obj.message);
			var  nowpage=$('#pages').val();
			xiaoxi(nowpage,10);
		},
		error: function() {

		}
	});

}

function closen(){
	 var  nowpage=$('#pages').val();
		
	xiaoxi(nowpage,10);
}
