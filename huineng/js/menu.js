
var datastore=[];
function  fristlist(){
	
	$.ajax({
		url: '/resource/treeGrid', // 跳转到 action
		type: 'POST',
		
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			
			
			for(var i = 0; i < data.length; i++) {
				
				if(data[i].resourcetype==1){
					var resourcetype='按钮';
				}else if(data[i].resourcetype==0){
					var resourcetype='菜单';
				}
				
				if(data[i].status==0){
					var status='正常';
				}else if(data[i].status==1){
					var status='停用';
				}
				
				
			var value = {
				name: data[i].name,
				id: data[i].id,
				parent:data[i].pid,
				seq:data[i].seq,
				iconCls:data[i].iconCls,
				time:data[i].createdate,
				address:data[i].url,
				resourcetype:resourcetype,
				status:status
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
		$("tbody", apendtotable).append("<tr id='" + ddataitem.id + "' class='parentnode'><td>" + ddataitem.name + "</td><td>" + ddataitem.address + "</td><td>" + ddataitem.seq + "</td><td>" + ddataitem.iconCls + "</td><td>" + ddataitem.resourcetype + "</td><td>" + ddataitem.status + "</td><td><button  class='btn btn-default btn-sm' onclick='edit(" + ddataitem.id + ")' >编辑</button><button class='btn btn-default btn-sm' onclick='del(" + ddataitem.id + ")'>删除</button></td></tr>");
	} else {
		$("#" + ddataitem.parent, apendtotable).after("<tr id='" + ddataitem.id + "' class='child-of-" + ddataitem.parent + "'><td>" + ddataitem.name + "</td><td>" + ddataitem.address + "</td><td>" + ddataitem.seq + "</td><td>" + ddataitem.iconCls + "</td><td>" + ddataitem.resourcetype + "</td><td>" + ddataitem.status + "</td><td><button  class='btn btn-default btn-sm' onclick='edit(" + ddataitem.id + ")'>编辑</button><button class='btn btn-default btn-sm' onclick='del(" + ddataitem.id + ")'>删除</button></td></tr>");
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
		url: '/resource/delete', // 跳转到 action
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


function add() {
	$('#myModal').modal('show')
}


function addcon() {
			var name = $("#id_iframe").contents().find("#name").val();
		
			var resourcetype = $("#id_iframe").contents().find('#resourcetype option:selected').attr('value');
			var urls = $("#id_iframe").contents().find('#url').val();
			var seq = $("#id_iframe").contents().find('#seq').val();
			var icon = $("#id_iframe").contents().find('#icon').val();
			var status = $("#id_iframe").contents().find('#status option:selected').attr('value');
			var pid = $("#id_iframe").contents().find('#pid').val();

			if(name == '') {
				alert('请输入名称');
			} else {
				$.ajax({
					url: '/resource/add', // 跳转到 action
					type: 'POST',
					data: {
						'name': name,
						'resourcetype': resourcetype,
						'url': urls,
						'seq': seq,
						'icon': icon,
						'status': status,
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
	
		$('#edit').attr('src','/resource/editPage?id='+index+'');

	$('#myModaledit').modal('show')
}



function editcon() {
			var name = $("#edit").contents().find("#name").val();
			var id = $("#edit").contents().find("#id").val();
			var resourcetype = $("#edit").contents().find('#resourcetype option:selected').attr('value');
			var urls = $("#edit").contents().find('#url').val();
			var seq = $("#edit").contents().find('#seq').val();
			var icon = $("#edit").contents().find('#icon').val();
			var status = $("#edit").contents().find('#status option:selected').attr('value');
			var pid = $("#edit").contents().find('#pid').val();

			if(name == '') {
				alert('请输入名称');
			} else {
				$.ajax({
					url: '/resource/edit', // 跳转到 action
					type: 'POST',
					data: {
						'id':id,
						'name': name,
						'resourcetype': resourcetype,
						'url': urls,
						'seq': seq,
						'icon': icon,
						'status': status,
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