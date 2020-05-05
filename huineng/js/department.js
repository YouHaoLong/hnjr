
var datastore=[];
function  fristlist(){
	
	$.ajax({
		url: '/organization/treeGrid', // 跳转到 action
		type: 'POST',
		
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			
			
			for(var i = 0; i < data.length; i++) {
			var value = {
				name: data[i].name,
				id: data[i].id,
				parent:data[i].pid,
				seq:data[i].seq,
				iconCls:data[i].iconCls,
				time:data[i].createdate,
				address:data[i].address,
				code:data[i].code
			}
			
			datastore.push(value);
			
			

			}
			
			loadlist();

		},
		error: function() {

		}
	});
		console.log(datastore)
}


fristlist();

function loadlist(){
	
		for(var i = 0; i < datastore.length; i++) {
		filltr($("#tree_table2"), datastore[i]);
	}
		$("#tree_table2").treeTable({
		clickableNodeNames: true
	});
	
}



	 //此处注意，由于第一个表格是第二列作为树形展现，不能在同一个界面里同时使用两个以上表格操作。



function filltr(apendtotable, ddataitem) {
						
	if(ddataitem.parent == null) {
		$("tbody", apendtotable).append("<tr id='" + ddataitem.id + "' class='parentnode'><td>" + ddataitem.code + "</td><td>" + ddataitem.name + "</td><td>" + ddataitem.seq + "</td><td>" + ddataitem.iconCls + "</td><td>" + ddataitem.time + "</td><td>" + ddataitem.address + "</td><td><button  class='btn btn-default btn-sm'  onclick='edit(" + ddataitem.id + ")'  >编辑</button><button class='btn btn-default btn-sm' onclick='del(" + ddataitem.id + ")'>删除</button></td></tr>");
	} else {
		$("#" + ddataitem.parent, apendtotable).after("<tr id='" + ddataitem.id + "' class='child-of-" + ddataitem.parent + "'><td>" + ddataitem.code + "</td><td>" + ddataitem.name + "</td><td>" + ddataitem.seq + "</td><td>" + ddataitem.iconCls + "</td><td>" + ddataitem.time + "</td><td>" + ddataitem.address + "</td><td><button  class='btn btn-default btn-sm'  onclick='edit(" + ddataitem.id + ")'  >编辑</button><button class='btn btn-default btn-sm' onclick='del(" + ddataitem.id + ")'>删除</button></td></tr>");
	}
}



function del(index){
	
	$('#delcon').html('');
	$('#del').modal('show');
	var html = '';
	html += '<button type="button" class="btn btn-default" data-dismiss="modal">否</button><button type="button" class="btn btn-primary" onclick="delcon(' + index + ')">是</button>';
	$('#delcon').append(html);
}

function delcon(index) {

	$.ajax({
		url: '/organization/delete', // 跳转到 action
		type: 'POST',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data: {
			'id': index,
			
		},
		dataType: "json", //返回结果格式
		success: function(data) {

			alert(data.msg);
			$('#del').modal('hide');
			
			 window.location.reload();


		},
		error: function() {
			// view("异常！");
			//				$.alert("异常！");
		}
	});

}



function addcon() {
			var code = $("#id_iframe").contents().find("#code").val();
		
			
			var name = $("#id_iframe").contents().find('#name').val();
			var seq = $("#id_iframe").contents().find('#seq').val();
			var icon = $("#id_iframe").contents().find('#icon').val();
			var address = $("#id_iframe").contents().find('#address').val();
			
			var pid = $("#id_iframe").contents().find('#pid').val();

			if(name == '') {
				alert('请输入名称');
			} else {
				$.ajax({
					url: '/organization/add', // 跳转到 action
					type: 'POST',
					data: {
						'name': name,
						'code': code,
						
						'seq': seq,
						'icon': icon,
						'address': address,
						'pid': pid
					},
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',

					dataType: "json", //返回结果格式
					success: function(data) {

						alert(data.msg);
						$('#myModal').modal('hide');
						window.location.reload();
						

					},
					error: function() {

						// view("异常！");
						//				$.alert("异常！");
					}
				});
			}
}


function edit(index) {
	
		$('#edit').attr('src','/organization/editPage?id='+index+'');

	$('#myModaledit').modal('show')
}



function editcon() {
			var code = $("#edit").contents().find("#code").val();
			
			var id = $("#edit").contents().find("#id").val();
			var name = $("#edit").contents().find('#name').val();
			var seq = $("#edit").contents().find('#seq').val();
			var icon = $("#edit").contents().find('#icon').val();
			var address = $("#edit").contents().find('#address').val();
			
			var pid = $("#edit").contents().find('#pid').val();

			if(name == '') {
				alert('请输入名称');
			} else {
				$.ajax({
					url: '/organization/edit', // 跳转到 action
					type: 'POST',
					data: {
						'name': name,
						'code': code,
						'id':id,
						'seq': seq,
						'icon': icon,
						'address': address,
						'pid': pid
					},
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',

					dataType: "json", //返回结果格式
					success: function(data) {

						
						alert(data.msg);
						$('#myModaledit').modal('hide');
						window.location.reload();
						
						

					},
					error: function() {

						// view("异常！");
						//				$.alert("异常！");
					}
				});
			}
}
