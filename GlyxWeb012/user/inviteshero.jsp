    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
            <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

%>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
    <meta http-equiv="x-ua-compatible" content="IE=edge"/>
    <title>推荐将军</title>
        <link rel="stylesheet" href="<%=basePath %>views/GlyxWeb/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=basePath %>views/GlyxWeb/css/messageNotification.css"/>
        <link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/base.css"/>
        <link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/share.css"/>
        <script type="text/javascript" src="<%=basePath %>views/GlyxWeb/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=basePath %>views/GlyxWeb/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=basePath %>views/GlyxWeb/js/messageNotification.js"></script>
</head>
<style>
	.pagebtn{
		color: #FFF;
		border: none !important;
	}
</style>
<body>

        <!--头部-->
        <jsp:include page="/views/GlyxWeb/menu.jsp" flush="true"></jsp:include>

<!--主体-->
<nav id="nav">
        <div class="container">
            <div class="row">

        <!--主体侧边栏-->
        <jsp:include page="/views/GlyxWeb/left.jsp" flush="true"></jsp:include>



                <!--详细内容部分-->
                <div class="col-md-9">
                    <div id="detail" class="clear">
                        <!--推荐将军-->
                        <div class="lookup">
							<b class="title" style="padding-left: 15px;">推荐操盘手</b>
						</div>
                        <!--<ul class="rt GR">
                            <li>共<span>3</span>封,</li>
                            <li>未读<span>2</span>封,</li>
                            <li>已读<span>1</span>封</li>
                        </ul>-->

                    <!--表格部分-->
                        <table class="table GR" style="margin-top: 20px;">

                                <thead>
                                <tr>
                                    <td>昵称</td>
                                    <td>手机号</td>
                                    <td>状态</td>
                                    <td>阶段</td>
                                    <td>级别</td>
                                    <td>总收益</td>
                                    <td>结果</td>
                                </tr>
                                </thead>

                            <tbody id="matbody">
                            <!--<tr>
                                <td>
                                    <span>明天更好</span>
                                </td>
                                <td>
                                    <span>138****7815</span>
                                </td>
                                <td>
                                    <span>246316期挑战赛</span>
                                </td>
                                <td>
                                  <span>已结算</span>
                                </td>
                                <td>
                                    <span>发起挑战</span>
                                </td>
                                <td>
                                    <span>准将军</span>
                                </td>
                                <td>
                                    <span>0.001</span>
                                </td>
                                <td>
                                    <span class="Failure">失败</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>明天更好</span>
                                </td>
                                <td>
                                    <span>138****7815</span>
                                </td>
                                <td>
                                    <span>246316期挑战赛</span>
                                </td>
                                <td>
                                    <span>已结算</span>
                                </td>
                                <td>
                                    <span>发起挑战</span>
                                </td>
                                <td>
                                    <span>准将军</span>
                                </td>
                                <td>
                                    <span>0.001</span>
                                </td>
                                <td>
                                    <span class="succeed">成功</span>
                                </td>
                            </tr>-->
                            </tbody>
                        </table>
                        <!--分页-->
                        <div id="paging">
                            <div class="page">
                                <input type="button" class="previous_page pagebtn" style="background: #c2c2c2;" value="上一页" onclick="P_page(3)">
                               	<input id="pages" class="ipt" type="text" value="1">
                                <input type="button" class="next_page pagebtn" style="background: #E9811E;" value="下一页" onclick="N_page(3)">
                            </div>
                            <div class="page_number">


                                <p>共<span id="danyeshu">120</span>条,<span id="allshu">2</span>页记录.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!--*********************************************** -->
            </div>
        </div>

</nav>
        <script>
       
	
        var page='';
        var nowpage=''
        //查询提现记录
        var  nowpage=$('#pages').val();
        txRecord(nowpage,10)
        function txRecord(nowpage,pagesize){
        $('table.GR tbody').html('');
        nowpage=nowpage;
        $.ajax({
        url: '<%=basePath %>pcRecommend/pcQueryRecommendOptor.htm', // 跳转到 action
        type: 'POST',
        data:{'nowpage':nowpage,'pagesize':pagesize},
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        dataType: "json", //返回结果格式
        success: function(data) {
        var allList=data.obj.rows;
        for(var i=0;i<allList.length;i++){
        	if(allList[i].totalRewardAmount>0||allList[i].totalRewardAmount==0){
        		var rows='<tr><td><span>' + allList[i].realName + '</span></td><td><span>'+allList[i].mobile+'</span></td><td><span class="statcol">'+allList[i].state+'</span></td><td><span>'+allList[i].stage+'</span></td><td><span class="jbcol">'+allList[i].levelName+'</span></td><td><span>'+allList[i].totalRewardAmount+'</span></td><td><span class="succeed">胜利</span></td></tr>';
        	}else{
        		var rows='<tr><td><span>' + allList[i].realName + '</span></td><td><span>'+allList[i].mobile+'</span></td><td><span class="statcol">'+allList[i].state+'</span></td><td><span>'+allList[i].stage+'</span></td><td><span class="jbcol">'+allList[i].levelName+'</span></td><td><span>'+allList[i].totalRewardAmount+'</span></td><td><span class="Failure">失败</span></td></tr>';
        	}
        
        $("#matbody").append(rows);
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

        //分页上一页
        function P_page(index){
        if(nowpage==1){
        alert('这是第一页');
        }else{
        var pages=parseInt(nowpage-1);
        nowpage=pages;
        $('.page_number').val(pages);
        if(index==1){
        ylRecord(pages,10);
        }else if(index==2){
        nbRecord(pages,10);
        }else if(index==3){
        txRecord(pages,10);
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
        $('.page_number').val(pages);
        if(index==1){
        ylRecord(pages,10);
        }else if(index==2){
        nbRecord(pages,10);
        }else if(index==3){
        txRecord(pages,10);
        }
        }
        }



        </script>

</body>
</html>