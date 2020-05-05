
function add() {

			$('#myModal').modal('show');
		$.ajax({
		url: '/project/getProjectCode', // 跳转到 action
		type: 'POST',
	
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {

			$('#xxbm').val(data.obj);

		},
		error: function() {

		}
	});
}

function closecon(){
	$('#myModal').modal('hide');
	chongz()
}



$("#ChangChart").change(function() {
	console.log('改变');
	var clas = $('#ChangChart option:selected').attr('value');

	listload(1, clas);

});



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
	listload(index, clas);

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
			listload(now, clas);

		} else {
			alert('这是第一页');
		}

	} else if(index == 2) {
		now = parseInt(now) + parseInt(1);

		if(now <= page) {
			listload(now, clas);

		} else {
			alert('这是最后一页');
		}

	}

}

function xzcon(){
	$('#addxmxz').html('');
	$('#sutup').modal('show');
	
	$.ajax({
		url: '/user/dataGrid', // 跳转到 action
		type: 'POST',
		data: {
			'page': 1,
			'rows': 1000000,
			
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {

			var allList = data.rows;

			for(var i = 0; i < allList.length; i++) {

				var map=[];
				if(allList[i].rolesList!=null){
					for(var j = 0; j < allList[i].rolesList.length; j++) {
					var childrenItem =allList[i].rolesList[j].name;
						
					
					map[j]=allList[i].rolesList[j].name;
					var js=map;
//						console.log(js)
					}
					
				}

				var html = '';

				html += '<tr><td>'+allList[i].name+'</td><td>'+allList[i].phone+'</td><td>'+allList[i].organizationName+'</td><td>'+js+'</td><td><a class="btn btn1" href="javascript:xmxz('+allList[i].id+')" >选择</a></td></tr>';

				$('#addxmxz').append(html);

			}
			

		

		},
		error: function() {

		}
	});
}

function xmxz(index){
//	alert(index);
	$('#xxnameid').val(index);
	$.ajax({
		url: '/user/getUserInfo', // 跳转到 action
		type: 'POST',
		data: {
			'id': index,
	
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			$('#sutup').modal('hide');
			$('#xxuser').val(data.obj.name);
			$('#xxiphone').val(data.obj.phone);
		

		},
		error: function() {

		}
	});
	
}

function xzcon1(){
	
		$('#sutup1').modal('show');
	$('#adddjr').html('');
	$.ajax({
		url: '/userInfo/getAllUser', // 跳转到 action
		type: 'POST',
		data: {
			'page': 1,
			'pagesize': 1000000,
			
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {

			var allList = data.obj.list;

			for(var i = 0; i < allList.length; i++) {
				
				if(allList[i].sex==0){
					var sex='男'
				}else if(allList[i].sex==1){
					var sex='女'
				}else if(allList[i].sex==2){
					var sex='不明'
				}
				
				
				if(allList[i].mobile_one == "") {
					var mobile = allList[i].mobile_two;
				} else if(allList[i].mobile_two == '') {
					var mobile = allList[i].mobile_one;
				} else {
					var mobile = allList[i].mobile_two;
				}
				
				if(allList[i].user_type == 0) {
					var user_type = '个人';
				} else if(allList[i].user_type == 1) {
					var user_type = '机构';
				}

				var html = '';

				html += '<tr><td>'+allList[i].userNum+'</td><td>'+allList[i].name+'</td><td>'+sex+'</td><td>'+mobile+'</td><td>'+user_type+'</td><td>'+allList[i].employeeName+'</td><td>'+allList[i].create_date+'</td><td><a class="btn btn1" href="javascript:duijr('+allList[i].id+')" >选择</a></td></tr>';

				$('#adddjr').append(html);

			}
			

		

		},
		error: function() {

		}
	});
	
}
function duijr(index){
	$('#xxdjrid').val(index);
	$.ajax({
		url: '/userInfo/findUserBuUserID', // 跳转到 action
		type: 'POST',
		data: {
			'userId': index,
	
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			$('#sutup1').modal('hide');
			$('#xxdjr').val(data.obj.name);
			
				
				if(data.obj.mobileOne == "") {
					var mobile = data.obj.mobileTwo;
				}else if(data.obj.mobileTwo == '') {
					var mobile = data.obj.mobileOne;
				} else {
					var mobile = data.obj.regularPhone;
				}
			$('#xxdh').val(mobile);
		

		},
		error: function() {

		}
	});
}


function addcon(){
	var projectNum= $('#xxbm').val();
	var projectId=$('#xxid').val();
	var projectName=$('#xxname').val();
	var financing=$('#xxrz').val();
	var financingscale=$('#xxgm').val();
	var term=$('#xxqx option:selected').attr('value');
	var type=$('#xxlx option:selected').attr('value');
	var empId=$('#xxnameid').val();
	var phone=$('#xxiphone').val();
	var userid=$('#xxdjrid').val();
    var dockingcontact=$('#xxdh').val();
    
    if(projectId==''){
    	$('#xxid').css('border-color','red');
    }else if(projectName==''){
    	$('#xxname').css('border-color','red');
    	$('#xxid').css('border-color','#ccc');
    }else if(financing==''){
    	$('#xxrz').css('border-color','red');
    	$('#xxname').css('border-color','#ccc');
    	$('#xxid').css('border-color','#ccc');
    }else if(financingscale==''){
    	$('#xxgm').css('border-color','red');
    	$('#xxrz').css('border-color','#ccc');
    	$('#xxname').css('border-color','#ccc');
    	$('#xxid').css('border-color','#ccc');
    }else if(empId==''){
    	$('#xxuser').css('border-color','red');
    	$('#xxgm').css('border-color','#ccc');
    	$('#xxrz').css('border-color','#ccc');
    	$('#xxname').css('border-color','#ccc');
    	$('#xxid').css('border-color','#ccc');
    }else if(userid==''){
    	$('#xxdjr').css('border-color','red');
    	$('#xxuser').css('border-color','#ccc');
    	$('#xxgm').css('border-color','#ccc');
    	$('#xxrz').css('border-color','#ccc');
    	$('#xxname').css('border-color','#ccc');
    	$('#xxid').css('border-color','#ccc');
    }else{
		
	$.ajax({
		url: '/project/newProject', // 跳转到 action
		type: 'POST',
		data: {
			'projectNum': projectNum,
			'projectId':projectId,
			'projectName':projectName,
			'financing':financing,
			'financingscale':financingscale,
			'term':term,
			'type':type,
			'empId':empId,
			'phone':phone,
			'userid':userid,
			'dockingcontact':dockingcontact

		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			alert(data.msg);
			
			if(data.success==true){
				$('#myModal').modal('hide');
			var clas = $('#ChangChart option:selected').attr('value');

			listload(1, clas);	
			}else{
				$('#xxid').css('border-color','red');
			}
			chongz()
		},
		error: function() {

		}});
    
    }
}
