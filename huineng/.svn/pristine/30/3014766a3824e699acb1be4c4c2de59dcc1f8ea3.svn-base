

$("#ChangChart").change(function() {
	
	var clas = $('#ChangChart option:selected').attr('value');

	listload(1, clas);

});


//提成管理


function pagess() {
	
	var pagess = $('#pagess').val();
	var clas = $('#ChangChart option:selected').attr('value');
	pagess = pagess / clas;
	var page = parseInt(pagess + 1);
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
//发放奖励
function grant(draw){
	$("#grant").modal('show')
	$('#delcon').html('');
	var html = '';
	html += '<button type="button" class="btn btn-default" onclick="yes('+draw+')">是</button><button type="button" class="btn btn-default" data-dismiss="modal" onclick="cancel()">否</button>';
	$('#delcon').append(html);
}
function cancel(){
	$("#grant").modal('hide')
}
function yes(draw){
	$.ajax({
		type:"POST",
		url:"/product/updateDrawPercentage",
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data:{
			'drawId':draw,
			'drawState':0,
			'updateId':1
		},
		dataType: "json", //返回结果格式
		success: function(data) {
			console.log(data)
			if(data.success==true){
				alert(data.msg)
				$("#grant").modal('hide')
			}else{
				alert(data.msg)
			}
			var clas = $('#ChangChart option:selected').attr('value');
			listload(1, clas);
		}
	});
}
//批量确认
function duopay(){
	$("#grant").modal('show')
	$('#delcon').html('');
	var html = '';
	html += '<button type="button" class="btn btn-default" onclick="batch()">是</button><button type="button" class="btn btn-default" data-dismiss="modal" onclick="cancel()">否</button>';
	$('#delcon').append(html);
}



function batch(){
	obj = document.getElementsByName("infoID");
	check_val = [];
    for(k in obj){
        if(obj[k].checked)
            check_val.push(obj[k].value);
    }
    var b = check_val.join(","); 
    
    var clas = $('#ChangChart option:selected').attr('value');
		$.ajax({
		type:"POST",
		url:"/product/updateDrawPercentage",
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data:{
			'drawId':b,
			'drawState':0,
			'updateId':1
		},
		dataType: "json", //返回结果格式
		success: function(data) {
			console.log(data)
			alert(data.msg)
			$("#grant").modal('hide')
			var clas = $('#ChangChart option:selected').attr('value');
			listload(1, clas);
		},
		error: function() {

		}
	});
}
