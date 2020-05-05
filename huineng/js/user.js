var setting = {
	data: {
		key: {
			title: "t"
		},
		simpleData: {
			enable: true
		}
	},
	callback: {
		beforeClick: beforeClick,
		//				onClick: onClick
	}
};

var zNodes = [];

var log, className = "dark";

function beforeClick(treeId, treeNode, clickFlag) {
	className = (className === "dark" ? "" : "dark");
	showLog(treeNode.id);
	return(treeNode.click != false);
}
//		function onClick(event, treeId, treeNode, clickFlag) {
//			showLog("[ "+getTime()+" onClick ]&nbsp;&nbsp;clickFlag = " + clickFlag + " (" + (clickFlag===1 ? "普通选中": (clickFlag===0 ? "<b>取消选中</b>" : "<b>追加选中</b>")) + ")");
//		}		
function showLog(str) {
	var clas = $('#ChangChart option:selected').attr('value');
	listload(1, clas, str);

}

$.ajax({
	url: '/organization/tree', // 跳转到 action
	type: 'POST',
	contentType: 'application/x-www-form-urlencoded; charset=UTF-8',

	dataType: "json", //返回结果格式
	success: function(data) {

		for(var i = 0; i < data.length; i++) {
			var value = {
				name: data[i].text,
				id: data[i].id
			}
			value.children = [];
			if(data[i].children != null) {
				for(var j = 0; j < data[i].children.length; j++) {
					var childrenItem = {
						name: data[i].children[j].text,
						id: data[i].children[j].id
					}
					value.children.push(childrenItem);
				}
			}
			zNodes.push(value);
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			
			
		}

	},
	error: function() {

		// view("异常！");
		//				$.alert("异常！");
	}
});

function listload(page, rows,id) {
	$('#page').html('');
	$('#mytab').html('');
	$('#now').val(page);
	$('#bmid').val(id);
	$.ajax({
		url: '/user/dataGrid', // 跳转到 action
		type: 'POST',
		data: {
			"page": page,
			'rows': rows,
			'organizationId':id
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {

			var allList = data.rows;

			for(var i = 0; i < allList.length; i++) {

				if(allList[i].sex == 0) {
					var sex = '男';
				} else if(allList[i].sex == 1) {
					var sex = '女';
				}
				if(allList[i].usertype==0){
					var usertype='管理员';
				}else{
					var usertype='用户';
				}
				
				if(allList[i].status==0){
					var status='正常';
				}else{
					var status='停用';
				}
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

				html += '<tr><td>' + allList[i].loginname + '</td><td>' + allList[i].name + '</td><td>' + allList[i].organizationName + '</td><td>' + allList[i].createdate + '</td><td>' + sex + '</td><td>'+allList[i].age+'</td><td>'+allList[i].phone+'</td><td>'+js+'</td><td>'+usertype+'</td><td>'+status+'</td><td><a href="javascript:edit(' + allList[i].id + ')" class="btn btn-default btn-sm">编辑</a><a href="javascript:del(' + allList[i].id + ')" class="btn btn-default btn-sm">删除</a></td></tr>';

				$('#mytab').append(html);

			}

			var page = '';
			page += '<input type="hidden" id="pagess" value="" /><li><a href="javascript:fenye1(1)" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li><li id="last"><a href="javascript:fenye1(2)" aria-label="Next"><span aria-hidden="true">下一页</span></a></li>';
			$('#page').append(page);
			$('#pagess').val(data.total);
			pagess();
		

		},
		error: function() {

		}
	});

}

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
	var id=$('#bmid').val();
	var clas = $('#ChangChart option:selected').attr('value');
	listload(index, clas,id);

}

function fenye1(index) {
var id=$('#bmid').val();
	var now = $('#now').val();
	var pagess = $('#pagess').val();
	var clas = $('#ChangChart option:selected').attr('value');
	pagess = pagess / clas;
	var page = parseInt(pagess + 1);

	if(index == 1) {
		now = parseInt(now - 1);
		if(now >= 1) {
			listload(index, clas,id);

		} else {
			alert('这是第一页');
		}

	} else if(index == 2) {
		now = parseInt(now) + parseInt(1);

		if(now <= page) {
			listload(index, clas,id);

		} else {
			alert('这是最后一页');
		}

	}

}

$("#ChangChart").change(function() {
	var id=$('#bmid').val();
	console.log('改变');
	var clas = $('#ChangChart option:selected').attr('value');

	listload(1, clas, id);

});



function add() {

	$('#myModal').modal('show')
}


function del(index) {
	$('#delcon').html('');
	$('#del').modal('show');
	var html = '';
	html += '<button type="button" class="btn btn-default" data-dismiss="modal">否</button><button type="button" class="btn btn-primary" onclick="delcon(' + index + ')">是</button>';
	$('#delcon').append(html);
}

function delcon(index) {
var now = $('#now').val();
var id=$('#bmid').val();
var clas = $('#ChangChart option:selected').attr('value');
	$.ajax({
		url: '/user/delete', // 跳转到 action
		type: 'POST',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data: {
			'id': index,
			
		},
		dataType: "json", //返回结果格式
		success: function(data) {

			alert(data.msg);
			$('#del').modal('hide');
			listload(now, clas,id);

		},
		error: function() {
			// view("异常！");
			//				$.alert("异常！");
		}
	});

}



function edit(index) {
	
		$('#edit').attr('src','/user/editPage?id='+index+'');

	$('#myModaledit').modal('show')
}