<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String product_host = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>添加</title>

		<!-- Bootstrap core CSS -->
		<link href="<%=product_host%>static/view/css/bootstrap.min.css" rel="stylesheet">

		<link href="<%=product_host%>static/view/css/dashboard.css" rel="stylesheet">
		<link href="<%=product_host%>static/view/css/index.css" rel="stylesheet">

		<link rel="stylesheet" href="<%=product_host%>static/view/css/style.css">

		<script src="<%=product_host%>static/view/js/jquery.min.js"></script>
		<script src="<%=product_host%>static/view/js/bootstrap-table.js"></script>
		<script src="<%=product_host%>static/view/js/bootstrap.min.js"></script>
		<script src="<%=product_host%>static/view/js/modernizr.js"></script>

		<script type="text/javascript" src="<%=product_host%>static/view/js/My97DatePicker/WdatePicker.js"></script>
	</head>
	<style>
		a.btn{
			 background: #D5D5D5;
			 text-decoration:none;
			 color: #333;
			 padding: 5px 8px;
			 margin-right: 5px;
			 margin-top: 10px;
			 font-size: 12px;
		}
		a.btn:hover{
			background:#D5D5D5 ;
		}

	</style>

	<body style="background: none; width: 600px; height:500px;padding-top: 0;">

		<div class="modal-body">
			<ul id="treeDemo" class="ztree"></ul>
			<a id="checkAllTrue" href="#" title="" onclick="return false;" class="btn">全选</a>
			<a id="checkAllFalse" href="#" title="" onclick="return false;"  class="btn">取消全部</a>
		</div>
		<div class="modal-footer" style="position: fixed; left: 0; bottom: 0; width: 100%;">
			<!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
			<button type="button" class="btn btn-primary" onclick="sotcon()">修改</button>
		</div>

	</body>
	<link rel="stylesheet" href="<%=product_host%>static/view/tree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<link rel="stylesheet" href="<%=product_host%>static/view/tree/css/demo.css" type="text/css">
	<script type="text/javascript" src="<%=product_host%>static/view/tree/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="<%=product_host%>static/view/tree/js/jquery.ztree.excheck.js"></script>
	<script>
		var setting = {
			
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			}
		};

		var zNodes = [];
		//		function beforeClick(treeId, treeNode) {
		//			var check = (treeNode && !treeNode.isParent);
		//			if (!check) alert("只能选择城市...");
		//			return check;
		//		}
		//		
//			var code;
//		
//		function setCheck() {
//			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
//			py = $("#py").attr("checked")? "p":"",
//			sy = $("#sy").attr("checked")? "s":"",
//			pn = $("#pn").attr("checked")? "p":"",
//			sn = $("#sn").attr("checked")? "s":"",
//			type = { "Y":py + sy, "N":pn + sn};
//			zTree.setting.check.chkboxType = type;
//			showCode('setting.check.chkboxType = { "Y" : "' + type.Y + '", "N" : "' + type.N + '" };');
//		}
//		function showCode(str) {
//			if (!code) code = $("#code");
//			code.empty();
//			code.append("<li>"+str+"</li>");
//		}
//		


		function checkNode(e) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			type = e.data.type,
			nodes = zTree.getSelectedNodes();
			if (type.indexOf("All")<0 && nodes.length == 0) {
				alert("请先选择一个节点");
			}

			if (type == "checkAllTrue") {
				zTree.checkAllNodes(true);
			} else if (type == "checkAllFalse") {
				zTree.checkAllNodes(false);
			} 
			
		}
			$(document).ready(function(){
		
			$("#checkAllTrue").bind("click", {type:"checkAllTrue"}, checkNode);
			$("#checkAllFalse").bind("click", {type:"checkAllFalse"}, checkNode);

			
		});

		

		$.ajax({
			url: '/resource/allTreesRole', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:{'id':${id}},
			dataType: "json", //返回结果格式
			success: function(data) {

				for(var i = 0; i < data.length; i++) {
					if(data[i].resourceId==null || data[i].resourceId==''){
						var checked = 'false';
					}else{
						var checked = 'true';
					}
					var value = {
						name: data[i].text,
						id: data[i].id,
						open: true,
						isParent: true,
						checked:checked,
						resourceId:data[i].resourceId,
					}
					value.children = [];
					if(data[i].children != null) {
						for(var j = 0; j < data[i].children.length; j++) {
							if(data[i].children[j].resourceId==null || data[i].children[j].resourceId==''){
								var checkeds = 'false';
							}else{
								var checkeds = 'true';
							}
							var childrenItem = {
								name: data[i].children[j].text,
								id: data[i].children[j].id,
								checked:checkeds,
								resourceId:data[i].children[j].resourceId,
							}
							childrenItem.children = [];
							if(data[i].children[j].children !=null){
								
								for(k=0;k<data[i].children[j].children.length;k++){
									
									if(data[i].children[j].children[k].resourceId==null || data[i].children[j].children[k].resourceId==''){
										var checkedss ='false';
									}else{
										var checkedss ='true';
									}
								
									var item={
										
										name: data[i].children[j].children[k].text,
										id: data[i].children[j].children[k].id,
										checked: checkedss,
										resourceId:data[i].children[j].children[k].resourceId,
										
									}
									childrenItem.children.push(item);
									
								}
								
								
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
		
		
		function sotcon(){
	
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = treeObj.getCheckedNodes(true);
			var arr=[];
			var arrid=[];
			for(i=0;i<nodes.length;i++){
				
				arr.push(nodes[i].id);
			
			}
			var b = arr.join(","); 
		
			
			$.ajax({
					url: '/role/grant', // 跳转到 action
					type: 'POST',
					data: {
						'id': ${id},
						'resourceIds':b
					},
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',

					dataType: "json", //返回结果格式
					success: function(data) {

						alert(data.msg);
						window.parent.sothide();
						
						

					},
					error: function() {

						// view("异常！");
						//				$.alert("异常！");
					}
				});
			
		

			
	
}
		
		
		
	</script>

</html>