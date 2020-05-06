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
    <title>消息通知</title>
    <link rel="stylesheet" href="<%=basePath %>views/GlyxWeb/css/bootstrap.min.css">
    
    <link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/base.css"/>
    	<link rel="stylesheet" type="text/css" href="<%=basePath %>views/GlyxWeb/css/share.css" />
    	<link rel="stylesheet" href="<%=basePath %>views/GlyxWeb/css/messageNotification.css"/>
        <script type="text/javascript" src="<%=basePath %>views/GlyxWeb/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=basePath %>views/GlyxWeb/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=basePath %>views/GlyxWeb/js/messageNotification.js"></script>
</head>
<body>

        <!--头部-->
        <jsp:include page="/views/GlyxWeb/menu.jsp" flush="true"></jsp:include>


<nav id="nav">
        <div class="container">
            <div class="row">



        <!--主体侧边栏-->
        <jsp:include page="/views/GlyxWeb/left.jsp" flush="true"></jsp:include>





<!--详细内容部分-->
                <div class="col-md-9 pad7">
                    <div id="detail" class="clear">
                        <!--消息通知-->
                        <b class="title" style="padding-left: 15px;">消息通知</b>
                         	<ul class="rt">
                                <li>共<span>${totalMsg }</span>封,</li>
                                <li>未读<span>${unread }</span>封,</li>
                                <li>已读<span>${read }</span>封</li>
                            </ul>

                        <!--表格部分-->
                            <table class="table">

                                    <thead>
                                        <tr>
                                            <td>全部</td>
                                            <td>发送人</td>
                                            <td>内容</td>
                                            <td>日期</td>
                                        </tr>
                                    </thead>

                                <tbody class="information" id="mypayment">

                                    <tr class="yellow">
                                        <td>
                                            <input type="checkbox" name="checkname">
                                              <a type="button"
                                                 class="un_read"
                                                 data-toggle="modal"
                                                 data-target="#un_read"> 未读</a>
                                        </td>
                                        <td>
                                            <a href="#"
                                               type="button"
                                               data-toggle="modal"
                                               data-target="#un_read">古林英雄系统</a>
                                        </td>

                                        <td>
                                            <a href="#"
                                               type="button"
                                               data-toggle="modal"
                                               data-target="#un_read">
                                                恭喜你获得3个道具...
                                            </a>
                                        </td>
                                        <td class="date"
                                            type="button"
                                            data-toggle="modal"
                                            data-target="#un_read">
                                            <a href="#">2017-12-06 17:24:02</a>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <input type="checkbox" name="checkname">
                                            <a type="button"
                                               class="un_read"
                                               data-toggle="modal"
                                               data-target="#un_read">已读</a>
                                        </td>
                                        <td>
                                            <a href="#"data-toggle="modal"
                                               data-target="#un_read">古林英雄系统</a>
                                        </td>
                                        <td>
                                            <a href="#"data-toggle="modal"
                                               data-target="#un_read">
                                                恭喜你获得3个道具...
                                            </a>
                                        </td>
                                        <td class="date"data-toggle="modal"
                                            data-target="#un_read">
                                            <a href="#">2017-12-06 17:24:02</a>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        <!--**************************************-->


                        <!--分页-->
                          <nav class="paging">
									<input class="btn" style="background: #c2c2c2;" type="button" value="上一页" onclick="P_page(2)">
									<input id="pages" class="ipt" type="text" value="1">
									<input class="btn under" type="button" value="下一页" onclick="N_page(2)">
									<div class="padtop">
										<span class="col_7a7">共<span id="allshu">79</span>条，<span id="danyeshu">8</span>页记录</span>
									</div>
								</nav>
                    </div>
                </div>
<!--*********************************************** -->
            </div>
        </div>

</nav>

<!--消息通知弹窗-->
<div class="modal fade" tabindex="-1" role="dialog" id="un_read" aria-labelledby="myModalLabel" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closen()"><span aria-hidden="true">&times;</span></button>
                <h5 class="modal-title">系统消息</h5>


                <div class="modal-body">

                    <p>发送人：<span>股林英雄系统</span><span class="date" id="time">2017-12-20 19:30:34</span></p>

                    <p id="xq">尊敬的用户：您好！欢迎您使用股林英雄，为了保护您的合法权益，帮助您更好地使用股林英雄网站产品，
                        请您在网上及时进行实名认证以获</p>

                    <!--<div class="modal-footer">
                        <button type="button" class="btn btn-default">下一条</button>
                    </div>-->
                </div>
            </div>


        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->






<script type="text/javascript">
	
$("#main-nav li").eq(3).addClass("active");

   var  nowpage=$('#pages').val();

	xiaoxi(nowpage,10);


        </script>

</body>
</html>