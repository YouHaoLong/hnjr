var id='';
var creareID='';
function chancan(creareID){
	creareID=creareID;
}
function loadxx(id){
	
    id=id;
	$.ajax({
		url: '/product/findProductByID', // 跳转到 action
		type: 'POST',
		data: {
			"id": id,

		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			console.log(data)
			$('#cpxx1').html(data.obj[0].productIdNum);
			$('#cpxx2').html(data.obj[0].productCode);
			$('#cpxx3').html(data.obj[0].ProjectIdNum);
			$('#cpxx4').html(data.obj[0].projectName);
			$('#cpxx5').html(data.obj[0].name);
			if(data.obj[0].type==1){
				$('#cpxx6').html('股票型');
			}else if(data.obj[0].type==2){
				$('#cpxx6').html('货币型');
				
			}else if(data.obj[0].type==3){
				$('#cpxx6').html('偏股型');
				
			}else if(data.obj[0].type==4){
				$('#cpxx6').html('股债平衡型');
				
			}else if(data.obj[0].type==5){
				$('#cpxx6').html('偏债型');
				
			}else if(data.obj[0].type==6){
				$('#cpxx6').html('债券型');
				
			}else if(data.obj[0].type==7){
				$('#cpxx6').html('保本型');
				
			}else if(data.obj[0].type==8){
				$('#cpxx6').html('指数型');
				
			}else if(data.obj[0].type==9){
				$('#cpxx6').html('短债型');
				
			}
			
			
			$('#cpxx7').html(data.obj[0].financing);
			$('#cpxx8').html(data.obj[0].expectMoney);
			$('#cpxx9').html(data.obj[0].term);
			
			if(data.obj[0].whetherStaging==1){
				$('#cpxx10').html('是');
			}else{
				$('#cpxx10').html('否');
			}
			if(data.obj[0].payingInterest==1){
				$('#cpxx11').html('定期');
			}else{
				$('#cpxx11').html('不定期');
			}
			
		
			$('#cpxx12').html(data.obj[0].trusteeshipBank);
			$('#cpxx13').html(data.obj[0].entrustBank);
			if(data.obj[0].profiTypet==1){
				$('#cpxx14').html('固定');
			}else if(data.obj[0].profiTypet==2){
				$('#cpxx14').html('浮动');
			}else if(data.obj[0].profiTypet==3){
				$('#cpxx14').html('浮动加固定');
			}
			$('#cpxx15').html(data.obj[0].empName);
			$('#cpxx16').html(data.obj[0].managePhone);
			$('#cpxx17').html(data.obj[0].userName);
			$('#cpxx18').html(data.obj[0].dockingPhone);
			$('#cpxx19').html(data.obj[0].investmentTerm);
			$('#cpxx20').html(data.obj[0].startingPoint);
			
			
			
			
			
		},
		error: function() {

		}
	});
	
		$.ajax({
		url: '/product/findProductInfoByProductId', // 跳转到 action
		type: 'POST',
		data: {
			"productId": id,

		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			$('#zt1').html(data.obj[0].state);
			$('#zt2').html(data.obj[0].establishTime);
			$('#zt3').html(data.obj[0].grantTime);
			$('#zt4').html(data.obj[0].actualMoney);
			if(data.obj[0].consignmentMode==1){
					$('#zt5').html('自主');
			}else if(data.obj[0].consignmentMode==2){
					$('#zt5').html('分销');
			}else if(data.obj[0].consignmentMode==3){
					$('#zt5').html('代销');
			}
		
			$('#zt6').html(data.obj[0].investmentAdvisor);
			
			if(data.obj[0].fundType==1){
				$('#zt7').html('股票型');
			}else if(data.obj[0].fundType==2){
				$('#zt7').html('货币型');
				
			}else if(data.obj[0].fundType==3){
				$('#zt7').html('偏股型');
				
			}else if(data.obj[0].fundType==4){
				$('#zt7').html('股债平衡型');
				
			}else if(data.obj[0].fundType==5){
				$('#zt7').html('偏债型');
				
			}else if(data.obj[0].fundType==6){
				$('#zt7').html('债券型');
				
			}else if(data.obj[0].fundType==7){
				$('#zt7').html('保本型');
				
			}else if(data.obj[0].fundType==8){
				$('#zt7').html('指数型');
				
			}else if(data.obj[0].fundType==9){
				$('#zt7').html('短债型');
				
			}
			
			
			$('#zt8').html(data.obj[0].funManage);
			$('#zt9').html(data.obj[0].raiseObject);
			$('#zt10').html(data.obj[0].scale);
			$('#zt11').html(data.obj[0].administration);
			$('#zt12').html(data.obj[0].trustFee);
			$('#zt13').html(data.obj[0].subscriptionFee);
			$('#zt14').html(data.obj[0].participateIn);
			$('#zt15').html(data.obj[0].exitmode);
			$('#zt16').html(data.obj[0].taxTypes);
			$('#zt17').html(data.obj[0].taxRate);
			
			
		},
		error: function() {

		}
	});
}





function pagess() {

	var pagess = $('#pagess').val();
	var clas = $('#ChangChart option:selected').attr('value');
	pagess = pagess / clas;
	paget=pagess % clas;
//	alert(paget);
	if(paget==0){
		var page=parseInt(pagess);
	}else{
		var page = parseInt(pagess + 1);
	}
	for(var i = 1; i <= page; i++) {
		var oTest = document.getElementById("page");
		var newNode = document.createElement("li");
		var reforeNode = document.getElementById("last");

		newNode.innerHTML = "<a href='javascript:fenye(" + i + ");'>" + i + "</a>";
		oTest.insertBefore(newNode, reforeNode);
	}

}

function fenye(index) {

	var clas = $('#ChangChart option:selected').attr('value');
	listload(index, clas, id);

}

function fenye1(index) {

	var now = $('#now').val();
	var pagess = $('#pagess').val();
	var clas = $('#ChangChart option:selected').attr('value');
	pagess = pagess / clas;
	var page = parseInt(pagess + 1);

	if(index == 1) {
		now = parseInt(now - 1);
		if(now >= 1) {
			listload(now, clas, id);

		} else {
			alert('这是第一页');
		}

	} else if(index == 2) {
		now = parseInt(now) + parseInt(1);

		if(now <= page) {
			listload(now, clas,id);

		} else {
			alert('这是最后一页');
		}

	}

}


function pagess1() {

	var pagess = $('#pagess1').val();
	var clas = $('#ChangChart1 option:selected').attr('value');
	pagess = pagess / clas;
	paget=pagess % clas;
//	alert(paget);
	if(paget==0){
		var page=parseInt(pagess);
	}else{
		var page = parseInt(pagess + 1);
	}
	for(var i = 1; i <= page; i++) {
		var oTest = document.getElementById("page1");
		var newNode = document.createElement("li");
		var reforeNode = document.getElementById("last1");

		newNode.innerHTML = "<a href='javascript:fen(" + i + ");'>" + i + "</a>";
		oTest.insertBefore(newNode, reforeNode);
	}

}

function fen(index) {
	

	var clas = $('#ChangChart1 option:selected').attr('value');
	listload(index, clas,id);

}

function fen1(index) {

	var now = $('#now1').val();
	var pagess = $('#pagess1').val();
	var clas = $('#ChangChart1 option:selected').attr('value');
	pagess = pagess / clas;
	var page = parseInt(pagess + 1);

	if(index == 1) {
		now = parseInt(now - 1);
		if(now >= 1) {
			listload(now, clas,id);

		} else {
			alert('这是第一页');
		}

	} else if(index == 2) {
		now = parseInt(now) + parseInt(1);

		if(now <= page) {
			listload(now, clas,id);

		} else {
			alert('这是最后一页');
		}

	}

}




function sut(){
			$('#adduser').html('');
			$('#sutup').modal('show');
			$.ajax({
		url: '/userInfo/getAllUser', // 跳转到 action
		type: 'POST',
		data: {
			"page": 1,
			'pagesize': 10000,

		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {

				var allList = data.obj.list;
			for(var i = 0; i < allList.length; i++) {

				if(allList[i].sex == 0) {
					var sex = '男';
				} else if(allList[i].sex == 1) {
					var sex = '女';
				} else if(allList[i].sex == 2) {
					var sex = '不明';
				}
				if(allList[i].mobile_one == "") {
					var mobile = allList[i].mobile_two;
				} else if(allList[i].mobile_two == '') {
					var mobile = allList[i].mobile_one;
				} else {
					var mobile = allList[i].regular_phone;
				}
				if(allList[i].user_type == 0) {
					var user_type = '个人';
				} else if(allList[i].user_type == 1) {
					var user_type = '机构';
				}
//				id = allList[i].id
//				console.log(id)
				var html = '';
				html += '<tr><td class=" col-xs-1">'+allList[i].userNum+'</td><td class=" col-xs-1">'+allList[i].name+'</td><td class=" col-xs-1">'+sex+'</td><td class=" col-xs-2">'+mobile+'</td><td class=" col-xs-1">'+user_type+'</td><td class=" col-xs-1">'+allList[i].employeeName+'</td><td class=" col-xs-2">'+allList[i].create_date+'</td><td class=" col-xs-1"><a class="btn btn1" href="javascript:userxz('+allList[i].id+')">选择</a></td></tr>';
				$('#adduser').append(html);
			}

		},
		error: function() {

		}
	});
			
			
			
}


function userxz(id){
	
	$('#sutup').modal('hide');
	$('#useryhid').val(id);
	$.ajax({
		url: '/userInfo/findUserBuUserID', // 跳转到 action
		type: 'POST',
		data: {
			"userId":id,

		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			$('#username').html(data.obj.name);
			
				if(data.obj.mobileOne == "") {
					var mobile = data.obj.mobileTwo;
				} else if(data.obj.mobileTwo == '') {
					var mobile = data.obj.mobileOne;
				} else {
					var mobile =data.obj.regularPhone;
				}
				
				$('#iphone').html(mobile);
				$('#time').html(data.obj.createDate);
				$('#tuijian').html(data.obj.refereename);
				$('#bumen').html(data.obj.refereeDepartment);
				$('#bank').html(data.obj.bankDeposit);
				$('#banknum').html(data.obj.bankCode);
				$('#userId').val(data.obj.id);

		},
		error: function() {

		}
	});
}

function list() {
		$('#buylist').modal('show');
		
		$('#username').html('');
		$('#iphone').html('');
		$('#time').html('');
		$('#tuijian').html('');
		$('#bumen').html('');
		$('#bank').html('');
		$('#banknum').html('');
		$('#userId').val('');
		$('#sgje').val('');
		$('#sgqx').val('');
		$('#fileupload').val('');
		
		$.ajax({
		url: '/product/findProductByID', // 跳转到 action
		type: 'POST',
		data: {
			"id":id,

		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			$('#prdname').html(data.obj[0].name);
			$('#cpid').html(data.obj[0].productIdNum);	
			$('#productId').val(data.obj[0].productIdNum);	
			
			if(data.obj[0].type==1){
				$('#cplx').html('债券型');
			}else if(data.obj[0].type==2){
				$('#cplx').html('股权型');
				
			}

		},
		error: function() {

		}
	});
}

function sgqx(){
	$('#buylist').modal('hide');
}


function check(index) {

    $('#check').modal('show');
	$.ajax({
		url: '/product/getProductManageByID', // 跳转到 action
		type: 'POST',
		data: {
			"id":index,

		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			$('#mtitle').val(data.obj.title);
			$('#createtime').val(data.obj.createtime);
			$('#employeeId').val(data.obj.employeeid);
			if(data.obj.fileurl==''||data.obj.fileurl==null){
				var stc = '#';
				$('#fileUrl').html('无附件');
				
			}else{
				var stc='/project/downloadFile?realPath='+data.obj.fileurl+'';
				$('#fileUrl').html(data.obj.filename);
				$('#fileUrl').attr('href',stc);
			}
			
			
			$('#remark').html(data.obj.remark);
			$('#opinion').html(data.obj.opinion);
		},
		error: function() {

		}
	});
}

function confirm(recordId,orderId) {
	
	
	$.ajax({
			url: '/product/updatePaymentRecord', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'recordId':recordId,
				'orderId':orderId,
				'state':2,
				'employeeId':0
			},
			dataType: "json", //返回结果格式
			success: function(data) {
			alert(data.msg);
			$('#btn_cle').css("display","block")
			append(order);
			},
			error: function() {
				console.log('请求失败')
			}
		});
}

function delfukj(index){
	
		$.ajax({
			url: '/product/deletePaymentRecordById', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'id':index,
			
			},
			dataType: "json", //返回结果格式
			success: function(data) {
			alert(data.msg);
		
			append(order,userid);
			},
			error: function() {
				console.log('请求失败')
			}
		});
}


function allrecord(){
	var clas = $('#ChangChart option:selected').attr('value');
		$.ajax({
			url: '/product/completePaymentRecord', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'orderId':order,
				'createId':1
			},
			dataType: "json", //返回结果格式
			success: function(data) {
			alert(data.msg);
			if(data.success==true){
				$('#append').modal('hide');	
			listload(1, clas, id);
			}
			
			},
			error: function() {
				console.log('请求失败')
			}
		});
}

function record(){
////	alert(order);
//alert(userid);
	$.ajax({
		url: '/product/insertPaymentRecord', // 跳转到 action
		type: 'POST',
		data: {
			"userId":userid,
			"money":$("#pay_money").val(),
			"orderId":order,
			"createId":1
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			console.log(data)
			alert(data.msg)
			append(order,userid);
			$('#pay_money').val('');
		},
		error: function() {
			console.log('请求失败')
		}
	});
}
function fukuan(){
	$.ajax({
		url: '/product/completePaymentRecord', // 跳转到 action
		type: 'POST',
		data: {
			
			"orderId":order,
			"createId":1
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			console.log(data);
			alert(data.msg);
			$('#append').modal('hide');	
			
		},
		error: function() {
			console.log('请求失败')
		}
	});
}


function allfp(index){
	
	 $('#syfp').html("");
	$.ajax({
			url: '/product/getAllProfitDistributionByProductId', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'productId':index,
			},
			dataType: "json", //返回结果格式
			success: function(data) {
                $('#syfp').html("");
			
			console.log(data)
			var allList = data.obj;
			for(var i = 0; i < allList.length; i++) {
				var html = '';
				if(allList[i].income!=null){
				if(allList[i].income.length==1){
					var three='';
					var six='';
					var twelve='';
					if(allList[i].income[0].term==3){
						three=allList[i].income[0].incomeRatio+'%';
						html += '<tr><td>'+allList[i].amounContribution+'</td><td>'+twelve+'</td><td>'+six+'</td><td>'+three+'</td></tr>';
					}else if(allList[i].income[0].term==6){
						six=allList[i].income[0].incomeRatio+'%';
						html += '<tr><td>'+allList[i].amounContribution+'</td><td>'+twelve+'</td><td>'+six+'</td><td>'+three+'</td></tr>';
					}else if(allList[i].income[0].term==12){
						twelve=allList[i].income[0].incomeRatio+'%';
						html += '<tr><td>'+allList[i].amounContribution+'</td><td>'+twelve+'</td><td>'+six+'</td><td>'+three+'</td></tr>';
					}
					
					
					
				}else if(allList[i].income.length==2){
					var three=allList[i].income[0].incomeRatio+'%';
					var six=allList[i].income[1].incomeRatio+'%';
					var twelve='';
					
					
					html += '<tr><td>'+allList[i].amounContribution+'</td><td>'+twelve+'</td><td>'+six+'</td><td>'+three+'</td></tr>';
					
				}else{
					html += '<tr><td>'+allList[i].amounContribution+'</td><td>'+allList[i].income[2].incomeRatio+'%</td><td>'+allList[i].income[1].incomeRatio+'%</td><td>'+allList[i].income[0].incomeRatio+'%</td></tr>';
				}
					
					
				}else{
					html += '<tr><td>'+allList[i].amounContribution+'</td><td></td><td></td><td></td></tr>';
					
				}
				
				
				$('#syfp').append(html);
				
			}
			
			},
			error: function() {
				console.log('请求失败')
			}
		});
}

function tcfs(index){
	$('#fscon').html('');
		$.ajax({
			url: '/product/getAllRoyaltyMethodByProductId', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'productId':index,
				'page':1,
				'pagesize':10000
			},
			dataType: "json", //返回结果格式
			success: function(data) {
			
			console.log(data)
			var allList = data.obj.list;
			for(var i = 0; i < allList.length; i++) {
				var html = '';
				
					html += '<tr><td><input type="text" class="tdinpt" id="xgtc1'+allList[i].id+'" value="'+allList[i].amountContribution+'"></td><td><input class="tdinpt" type="text" id="xgtc2'+allList[i].id+'" value="'+allList[i].buyTime+'个月"></td><td><input type="text" class="tdinpt" id="xgtc3'+allList[i].id+'" value="'+allList[i].frontFee+'%"></td><td><input type="text" class="tdinpt" id="xgtc4'+allList[i].id+'" value="'+allList[i].backLoad+'%"></td><td><input class="btn btn1" value="修改" type="button" onclick="xgtc('+allList[i].id+','+allList[i].productId+')" style="padding: 1px 8px;margin-right: 15px;"><input class="btn btn1" value="删除" type="button" onclick="sctc('+allList[i].id+','+allList[i].productId+')" style="padding: 1px 8px;"></td></tr>';
				
				$('#fscon').append(html);
				
			}
			
			},
			error: function() {
				console.log('请求失败')
			}
		});
}
function xgtc(index,pid){
	var xgtc1=$("#xgtc1"+index).val();
	var tc2=$("#xgtc2"+index).val();
	if(tc2.length>3||tc2.length==3){
		var xgtc2=tc2.substr(0,tc2.length-2)
	}else{
		var xgtc2 = tc2
	}
	var tc3=$("#xgtc3"+index).val();
	var xgtc3 = tc3.split('%')[0]
	console.log(xgtc3)
	var tc4=$("#xgtc4"+index).val();
	var xgtc4 = tc4.split('%')[0]
	console.log(xgtc4)
	$.ajax({
			url: '/product/updateRoyaltyMethod', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'id':index,
				'amountContribution':xgtc1,
				'buyTime':xgtc2,
				'frontFee':xgtc3,
				'backLoad':xgtc4,
			},
			dataType: "json", //返回结果格式
			success: function(data) {
			alert(data.msg);
			tcfs(pid)

			},
			error: function() {
				console.log('请求失败')
			}
		});
	
}
function sctc(id,pid){
	$("#shanchucon").html('');
	$("#shanchu").modal('show');
	var html = '';
	html += '<button type="button" class="btn btn-default" onclick="delusercon(' +id+ ',' +pid+ ')">是</button><button type="button" class="btn btn-default" data-dismiss="modal">否</button>';
	$('#shanchucon').append(html);
}

function delusercon(id,pid){
	
	$.ajax({
			url: '/product/deleteRoyaltyMethodByRId', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'id':id,
			},
			dataType: "json", //返回结果格式
			success: function(data) {
			alert(data.msg);
			$("#shanchu").modal('hide');
			tcfs(pid)
			},
			error: function() {
				console.log('请求失败')
			}
		});
	
}
function addtc(index){
	var tc1=$('#tc1').val();
	var tc2=$('#tc2 option:selected').attr('value');
	var tc3=$('#tc3').val();
	var tc4=$('#tc4').val();
	$.ajax({
			url: '/product/insertRoyaltyMethod', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'productId':index,
				'amountContribution':tc1,
				'buyTime':tc2,
				'frontFee':tc3,
				'backLoad':tc4,
				'createID':1
			},
			dataType: "json", //返回结果格式
			success: function(data) {
			
			alert(data.msg);
			tcfs(index)
			
			},
			error: function() {
				console.log('请求失败')
			}
		});
	
}

function addsy(index){
	
	var tc1=$('#sy1').val();
	var tc2=$('#sy2 option:selected').attr("value");
	var tc3=$('#sy3').val();
//	tc1=tc1.replace("-","<money&&money<=");  
//	alert(tc1);
	$.ajax({
			url: '/product/insertProfitDistribution', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'productId':index,
				'amountContribution':tc1,
				'term':tc2,
				'incomeRatio':tc3,
				'state':0
			},
			dataType: "json", //返回结果格式
			success: function(data) {
			alert(data.msg);
			syfsload(index)
			},
			error: function() {
				console.log('请求失败')
			}
		});
	
}


function syfsload(index){
	$('#sycon').html('');
		$.ajax({
			url: '/product/getAllProfitDistributionListByProductId', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'productId':index,
				
			},
			dataType: "json", //返回结果格式
			success: function(data) {
			
			console.log(data)
			var allList = data.obj;
			for(var i = 0; i < allList.length; i++) {
				var name=allList[i].amounContribution
					var html = '';
					html += '<tr><td><input type="text" class="tdinpt" id="xgsy1'+allList[i].id+'" value="'+name+'"></td><td><input type="text" class="tdinpt" id="xgsy2'+allList[i].id+'" value="'+allList[i].term+'个月"></td><td><input type="text" class="tdinpt" id="xgsy3'+allList[i].id+'" value="'+allList[i].incomeRatio+'%"></td><td><input class="btn btn1" value="修改" type="button" onclick="xgsy('+allList[i].id+','+allList[i].productid+')" style="padding: 1px 8px;margin-right: 15px;"><input class="btn btn1" value="删除" type="button" onclick="scsy('+allList[i].id+','+allList[i].productid+')" style="padding: 1px 8px;"></td></tr>';
				$('#sycon').prepend(html);
				
			}
			
			},
			error: function() {
				console.log('请求失败')
			}
		});
}
function xgsy(id,pid){
	var xgsy1=$('#xgsy1'+id).val();
	var sy2=$('#xgsy2'+id).val();
	var nun=sy2.length
	if(nun>3||nun==3){
		var xgsy2 = sy2.substr(0,nun-2)
	}else{
		var xgsy2 = sy2
	}

	var sy3=$('#xgsy3'+id).val();
	var xgsy3 = sy3.split('%')[0]
	console.log(xgsy3)
	$.ajax({
			url: '/product/updateProfitDistribution', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'id':id,
				'productId':pid,
				'amounContribution':xgsy1,
				'term':xgsy2,
				'incomeRatio':xgsy3,
				'state':0,
				'updateId':0,
				
			},
			dataType: "json", //返回结果格式
			success: function(data) {
			alert(data.msg);
			syfsload(pid)
			
			},
			error: function() {
				console.log('请求失败')
			}
		});
	
}
function scsy(id,pid){
	$("#scsycon").html('');
	$("#scsy").modal('show');
	var html = '';
	html += '<button type="button" class="btn btn-default" onclick="scsycon(' +id+ ',' +pid+ ')">是</button><button type="button" class="btn btn-default" data-dismiss="modal">否</button>';
	$('#scsycon').append(html);
}

function scsycon(id,pid){
	
	$.ajax({
			url: '/product/deleteProfitDistributionByID', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'id':id,
			},
			dataType: "json", //返回结果格式
			success: function(data) {
			alert(data.msg);
			$("#scsy").modal('hide');
			syfsload(pid)
			},
			error: function() {
				console.log('请求失败')
			}
		});
	
}


var dayinid='';
function lookcon(index){
	$('#buylistcon').modal('show');
	dayinid=index;
	$.ajax({
			url: '/product/getUserProductOrderByOrderId', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'orderId':index,
				
			},
			dataType: "json", //返回结果格式
			success: function(data) {
			
			console.log(data);
			$('#sgcon1').html(data.obj.userName);
			$('#sgcon2').html(data.obj.mobile_one);
			$('#sgcon3').html(data.obj.create_date);
			$('#sgcon4').html(data.obj.employeeName);
			$('#sgcon5').html(data.obj.organizationName);
			$('#sgcon6').html(data.obj.bankName);
			$('#sgcon7').html(data.obj.bank_code);
			$('#sgcon8').html(data.obj.productName);
			$('#sgcon9').html(data.obj.productIdNum);
			$('#sgcon10').html(data.obj.profiTypet);
			$('#sgcon11').html(data.obj.applyMoney);
			$('#sgcon12').html(data.obj.applyTime);
			if(data.obj.periodization==0){
			$('#sgcon13').html('否');	
			}else if(data.obj.periodization==1){
				$('#sgcon13').html('是');	
				
			}
			
			if(data.obj.payingInterest==1){
				$('#sgcon14').html('定期');
			}else if(data.obj.payingInterest==2){
				$('#sgcon14').html('不定期');
			}
			
			
			if(data.obj.incomeType==1){
			$('#sgcon15').html('固定');	
			}else if(data.obj.incomeType==2){
				$('#sgcon15').html('浮动');
			}else if(data.obj.incomeType==3){
				$('#sgcon15').html('浮动加固定');
			}
			if(data.obj.fileurl==''||data.obj.fileurl==null){
				var stc = '#';
				$('#xiazai1').html('无附件');
				
			}else{
				var stc='/project/downloadFile?realPath='+data.obj.fileUrl+'';
				$('#xiazai1').attr('href',stc);
				$('#xiazai1').html('下载附件');
			
			}
		
			},
			error: function() {
				console.log('请求失败')
			}
		});
}


function print() {
//	alert(dayini
	window.location.href='/product/getWord?orderId='+dayinid;
}
function finance() {
//	alert(dayinid);
	window.location.href='/product/getExcel?orderId='+dayinid+'&produtId='+id;
}

function look_over(index) {
	console.log(index)
	$('#look_over').modal('show')
	$.ajax({
		url: '/product/getPaymentPrincipalById', // 跳转到 action
		type: 'POST',
		data: {
			"id":index,
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			console.log(data);
			
			var all = data.obj;
			if(all.periodization==0){
				period='否'
			}else if(all.periodization==1){
				period='是'
			}
			if(all.incomeType==1){
				income='固定'
			}else if(all.incomeType==2){
				income='浮动'
			}else if(all.incomeType==3){
				income='浮动加固定'
			}
			if(all.type==1){
				type='债券型'
			}else if(all.type==2){
				type='股权型'
			}
			if(all.payingInterest==1){
				payingInterest = '利息'
			}else if(all.payingInterest==2){
				payingInterest = '本金'
			}else if(all.payingInterest==3){
				payingInterest = '本息'
			}
			
			var creat = all.createTime
			var creat1 = creat.substr(0,10)
			$('#userName').html(all.userName);
			$('#mobile_one').html(all.mobile_one);
			$('#employeeName').html(all.employeeName);
			$('#organizationName').html(all.organizationName);
			$('#bankName').html(all.bankName);
			$('#bank_code').html(all.bank_code);
			$('#productName').html(all.produtName);
			$('#productIdNum').html(all.productIdNum);
			
			$('#type').html(type);
			$('#createTime').html(creat1);
			$('#endTime').html(all.endTime);
			$('#applyMoney').html(all.applyMoney);
			$('#yield').html(all.yield+'%');
			$('#applyTime').html(all.applyTime);
			$('#existingNum').html(all.existingNum);
			$('#hlxuNum').html(all.hlxuNum);
			$('#incomeMoney').html(all.incomeMoney);
			$('#existing').html(all.existingIncomeMoney);
			$('#hlxu').html(all.hlxuIncomeMoney);
			
		},
		error: function() {
			console.log('请求失败')
		}
	});
}
function call_off(index) {
 	$('#look_over').modal('hide')
	}
function pagess2() {

	var pagess = $('#pagess2').val();
	var clas = $('#ChangChart2 option:selected').attr('value');
	pagess = pagess / clas;
	paget=pagess % clas;
//	alert(paget);
	if(paget==0){
		var page=parseInt(pagess);
	}else{
		var page = parseInt(pagess + 1);
	}
	for(var i = 1; i <= page; i++) {
		var oTest = document.getElementById("page2");
		var newNode = document.createElement("li");
		var reforeNode = document.getElementById("last2");

		newNode.innerHTML = "<a href='javascript:fenpaycon(" + i + ");'>" + i + "</a>";
		oTest.insertBefore(newNode, reforeNode);
	}

}

function fenpaycon(index) {

	var clas = $('#ChangChart2 option:selected').attr('value');
	listload2(index, clas, id);

}

function fenpay(index) {

	var now = $('#now2').val();
	var pagess = $('#pagess2').val();
	var clas = $('#ChangChart2 option:selected').attr('value');
	pagess = pagess / clas;
	var page = parseInt(pagess + 1);

	if(index == 1) {
		now = parseInt(now - 1);
		if(now >= 1) {
			listload2(now, clas, id);

		} else {
			alert('这是第一页');
		}

	} else if(index == 2) {
		now = parseInt(now) + parseInt(1);

		if(now <= page) {
			listload2(now, clas,id);

		} else {
			alert('这是最后一页');
		}

	}

}


function paysuccess(index){
	
	
	$('#delpaycon').html('');
	$('#payqueren').modal('show');
	var html = '';
	html += '<button type="button" class="btn btn-default" onclick="paycon(' + index + ')">是</button><button type="button" class="btn btn-default" data-dismiss="modal">否</button>';
	$('#delpaycon').append(html);
}

function paycon(index){
	
//	var ss=[];
//	ss.push(index);
//	console.log(ss);
	var clas = $('#ChangChart2 option:selected').attr('value');
		$.ajax({
		url: '/product/updatePaymentPrincipal', // 跳转到 action
		type: 'POST',
		data: {
			"payId": index,
			'state': 2,
			"updateId":1
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			if(data.success==true){
				alert(data.msg);
					listload2(1, clas, id);
					$('#payqueren').modal('hide');
			}else{
				alert(data.msg);
			}

		},
		error: function() {

		}
	});
}

function duopay(){
	obj = document.getElementsByName("infoID");
	check_val = [];
    for(k in obj){
        if(obj[k].checked)
            check_val.push(obj[k].value);
    }
    var b = check_val.join(","); 
    
    var clas = $('#ChangChart2 option:selected').attr('value');
		$.ajax({
		url: '/product/updatePaymentPrincipal', // 跳转到 action
		type: 'POST',
		data: {
			"payId": b,
			'state': 2,
			"updateId":1
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			if(data.success==true){
				alert(data.msg);
					listload2(1, clas, id);
					$('#payqueren').modal('hide');
			}else{
				alert(data.msg);
			}

		},
		error: function() {

		}
	});
}


