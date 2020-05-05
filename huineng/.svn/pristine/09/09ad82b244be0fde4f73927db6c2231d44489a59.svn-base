


function list() {
	$('#buylist').modal('show');			
}		
//放款记录		
$("#ChangChart").change(function() {
	console.log('改变');
	var clas = $('#ChangChart option:selected').attr('value');

	listload(1, clas,1);

});

function fenye(index) {

	var clas = $('#ChangChart option:selected').attr('value');
	listload(index, clas,1);

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
			listload(now, clas,1);

		} else {
			alert('这是第一页');
		}

	} else if(index == 2) {
		now = parseInt(now) + parseInt(1);

		if(now <= page) {
			listload(now, clas,1);

		} else {
			alert('这是最后一页');
		}

	}

}


function append(index) {
	$('#delcon').html('');
	$('#queding1').modal('show');
	var html = '';
	html += '<button type="button" class="btn btn-primary " onclick="quedcon(' + index + ')">是</button><button type="button" class="btn btn-default" data-dismiss="modal">否</button>';
	$('#delcon').append(html);
	
	
}

function quedcon(index){
	var clas = $('#ChangChart option:selected').attr('value');
	$.ajax({
		url: '/project/updateProjectLoanRecord', // 跳转到 action
		type: 'POST',
		data: {
			"projectLoanRecordId": index,

		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			$('#queding1').modal('hide');
			alert(data.msg);
			

			listload(1, clas,  1);
		},
		error: function() {

		}
	});
	
}


function fankan(index,pjid){
	
	$('#buylistcon').modal('show');
	$.ajax({
		url: '/project/findProjectLoanRecordInfo', // 跳转到 action
		type: 'POST',
		data: {
			"projectLoanRecordId": index,
			"projectId":pjid

		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			
			$('#buyc1').html(data.obj.userName);
			$('#buyc2').html(data.obj.mobile);
			$('#buyc3').html(data.obj.createTime);
			$('#buyc4').html(data.obj.name);
			$('#buyc5').html(data.obj.department);
			$('#buyc6').html(data.obj.bankName);
			$('#buyc7').html(data.obj.bankCode);
			$('#buyc8').html(data.obj.projectName);
			$('#buyc9').html(data.obj.ProjectIdNum);
			if(data.obj.financingType==1){
				$('#buyc10').html('股权型');
			}else if(data.obj.financingType==2){
				$('#buyc10').html('货币型');
				
			}else if(data.obj.financingType==3){
				$('#buyc10').html('偏股型');
				
			}else if(data.obj.financingType==4){
				$('#buyc10').html('股债平衡型');
				
			}else if(data.obj.financingType==5){
				$('#buyc10').html('偏债型');
				
			}else if(data.obj.financingType==6){
				$('#buyc10').html('债券型');
				
			}else if(data.obj.financingType==7){
				$('#buyc10').html('保本型');
				
			}else if(data.obj.financingType==8){
				$('#buyc10').html('指数型');
				
			}else if(data.obj.financingType==9){
				$('#buyc10').html('短债型');
				
			}
			
			$('#buyc11').html(data.obj.money);
			$('#buyc12').html(data.obj.createTile);
			
			if(data.obj.url==''||data.obj.url==null){
				$('#xiazai').html('无附件');
			}else{
				var stc='/project/downloadFile?realPath='+data.obj.url+'';
				$('#xiazai').html('下载附件');
				$('#xiazai').attr('href',stc);
			}
			
			

			
		},
		error: function() {

		}
	});
	
}
function colfan(){
	$('#buylistcon').modal('hide');
	
}


function sut() {
	$('#addxmxz').html('');
	$('#sutup').modal('show');

	$.ajax({
		url: '/project/findProjectAll', // 跳转到 action
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

				if(allList[i].financingType == 1) {
					var type = '股权型';
				} else if(allList[i].financingType == 2) {
					var type = '货币型';
				} else if(allList[i].financingType == 3) {
					var type = '偏股型';
				} else if(allList[i].financingType == 4) {
					var type = '股债平衡型';
				} else if(allList[i].financingType == 5) {
					var type = '偏债型';
				} else if(allList[i].financingType == 6) {
					var type = '债券型';
				} else if(allList[i].financingType == 7) {
					var type = '保本型';
				} else if(allList[i].financingType == 8) {
					var type = '指数型';
				} else if(allList[i].financingType == 9) {
					var type = '短债型';
				}

				if(allList[i].state == 1) {
					var state = '立项';
				} else if(allList[i].state == 2) {
					var state = '立项审核';

				} else if(allList[i].state == 3) {
					var state = '立项尽职调查';

				}else if(allList[i].state == 4){
					var state = '项目评审';
				}else if(allList[i].state == 5){
					var state = '项目小组跟进';
				}else if(allList[i].state == 6){
					var state = '申请出款';
				}else if(allList[i].state == 7){
					var state = '财务放款';
				}else if(allList[i].state == 8){
					var state = '清算';
				}else if(allList[i].state == 9){
					var state = '结束';
				}
				
				
				if(allList[i].percentage==''||allList[i].percentage==null){
					var percentage='';
				}else{
					var percentage=allList[i].percentage+'%';
				}

				var html = '';

				html += '<tr><td class=" col-xs-1">'+allList[i].projectName+'</td><td class=" col-xs-1">'+type+'</td><td class=" col-xs-1">'+allList[i].createTime+'</td><td class=" col-xs-2">'+allList[i].name+'</td><td class=" col-xs-1">'+percentage+'</td><td class=" col-xs-1">'+allList[i].empName+'</td><td class=" col-xs-1"><a class="btn btn1" href="javascript:xmxz('+allList[i].id+')" >选择</a></td></tr>';

				$('#addxmxz').append(html);

			}

		},
		error: function() {

		}
	});

}


function xmxz(index){
	$('#sutup').modal('hide');
	
	$.ajax({
		url: '/project/findProjectByProjectNum', // 跳转到 action
		type: 'POST',
		data: {
			"id":index,

		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			if(data.obj.financingtype == 1) {
					var type = '股权型';
				} else if(data.obj.financingtype == 2) {
					var type = '货币型';
				} else if(data.obj.financingtype == 3) {
					var type = '偏股型';
				} else if(data.obj.financingtype == 4) {
					var type = '股债平衡型';
				} else if(data.obj.financingtype == 5) {
					var type = '偏债型';
				} else if(data.obj.financingtype == 6) {
					var type = '债券型';
				} else if(data.obj.financingtype == 7) {
					var type = '保本型';
				} else if(data.obj.financingtype == 8) {
					var type = '指数型';
				} else if(data.obj.financingtype == 9) {
					var type = '短债型';
				}
			$('#tcxx8').html(data.obj.projectname);
			$('#tcxx9').html(data.obj.projectidnum);
			$('#projectId').val(data.obj.id);
			$('#tcxx10').html(type);
			chaxun(data.obj.id);


		},
		error: function() {

		}
	});
	
	
}

function chaxun(index){
	
		$.ajax({
		url: '/project/getUserInfoAndProjectByBrojectId', // 跳转到 action
		type: 'POST',
		data: {
			"projectId": index,

		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
	
			$('#tcxx1').html(data.obj.userName);
			$('#tcxx2').html(data.obj.mobile);
			$('#tcxx3').html(data.obj.createTime);
			$('#tcxx4').html(data.obj.name);
			$('#tcxx5').html(data.obj.department);
			$('#tcxx6').html(data.obj.bankName);
			$('#tcxx7').html(data.obj.bankCode);
			
			$('#bankId').val(data.obj.bankId);
			$('#number').val(data.obj.bankCode);
			$('#projectId').val(data.obj.id);
	
		},
		error: function() {

		}
	});
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
			var creat = all.createTime;
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
	listload2(index, clas);

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
			listload2(now, clas);

		} else {
			alert('这是第一页');
		}

	} else if(index == 2) {
		now = parseInt(now) + parseInt(1);

		if(now <= page) {
			listload2(now, clas);

		} else {
			alert('这是最后一页');
		}

	}

}


function paysuccess(index){
	
	
	$('#delpaycon').html('');
	$('#payqueren').modal('show');
	var html = '';
	html += '<button type="button" class="btn btn-default" data-dismiss="modal">否</button><button type="button" class="btn btn-default" onclick="paycon(' + index + ')">是</button>';
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
					listload2(1, clas);
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
					listload2(1, clas);
					$('#payqueren').modal('hide');
			}else{
				alert(data.msg);
			}

		},
		error: function() {

		}
	});
}




		



