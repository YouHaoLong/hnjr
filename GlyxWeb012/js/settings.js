function realname(){
	console.log(1111)			
	var options=$(".real-bank option:selected");
	var real_name = $("#real-name").val();
	var real_id = $("#real-id").val();
	var real_bank = options.text();
	var real_number = $("#real-number").val();
	var real_phone = $("#real-phone").val();	          
	var regrealname = /^[\u4e00-\u9fa5]{2,6}$/;//名字
	var regrealid = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;//身份证
	var regrealnumber = /^(\d{16}|\d{19})$/;//银行卡
	var regrealphone = /^1[3|4|5|7|8][0-9]{9}$/;//手机号码
	var token = $("#token1").val();
	console.log(token)
	
	var sel = document.getElementById('select1');
	if(real_name == ""){
		alert('请输入您的真实姓名');
		return false;
	}else if(sel.value<1){
		alert('请输入您的银行名称');
		return false;
	}else if(!regrealname.test(real_name)){
		alert('真实姓名填写有误！') 
		return false;
	}else if(real_id == ""){
		alert('请输入您的身份证号码');
		return false;
	}else if(!regrealid.test(real_id)){
		alert('您的身份证号码有误！');
		return false;
	}else if(real_bank == ""){
		alert('请选择您的银行名字');
		return false;
	}else if(real_number == ""){
		alert('请输入您的银行卡号码');
		return false;
	}else if(real_phone == ""){
		alert('请输入您的银行卡绑定手机号');
		return false;
	}else if(!regrealphone.test(real_phone)){
		alert('请输入您的手机号码有误！');
		return false;
	}else{
	$("#realname-btn").attr("disabled", true); 	
	$.ajax( {
		url:'/auth/auth.htm',// 跳转到 action
		type:'POST',
		cache:false,
		data:{
			"name":real_name,"idNo":real_id,"cardNo":real_number,"mobile":real_phone,"bankname":real_bank,"token":token
		},
		dataType : "json",//返回结果格式
		success:function(data) {
		if(data.success==true){
		alert('认证成功');
			window.location.reload();
		}else{
		alert(data.msg);
		$("#realname-btn").attr("disabled", false);	}
		window.location.reload();
		},
		error : function() {
		// view("异常！");
		alert("请求繁忙，请重试");
		window.location.reload();
		}
	});
	}
}



//安全设置
 function bbb () {
 	$("#setuplist").show();
 	$("#Password").hide();
 	
 		$.ajax({
					url: '/pcHome/pcGetBaseInfo.htm', // 跳转到 action
					type: 'POST',
					async: false,
					contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
					
					dataType: "json", //返回结果格式
					success: function(data) {
		     			
						if(data.obj.authRealName==1){
							$('#setsname').attr('src','/views/GlyxWeb/images/Own.png');
							$('#setzt1').html('已认证');
							$('#setzt1').addClass('col_11e');
							
						}else if(data.obj.authRealName==0){
							$('#setsname').attr('src','/views/GlyxWeb/images/Own1.png');
							$('#setzt1').html('未验证');
							$('#renz').html('立即认证');
							$('#renz').addClass('col_11e');
						}
						
						if(data.obj.authPwd==1){
							$('#setmima').attr('src','/views/GlyxWeb/images/Safety.png');
							$('#setzt2').html('已设置');
							$('#setzt2').addClass('col_11e');
							$('#shezhi').html('修改');
						}else if(data.obj.authPwd==0){
							$('#setzt2').attr('src','/views/GlyxWeb/images/Safety1.png')
							$('#setzt2').html('未设置');
							$('#shezhi').addClass('col_11e');
						}
						
						if(data.obj.authRealName==1 && data.obj.authPwd==1){
							$('.progtext').html('高');
							$('.progress-bar-success').css('width','100%');
						}else if(data.obj.authRealName==1 || data.obj.authPwd==1){
							$('.progtext').html('中');
							 $('.progress-bar-success').css('width','50%');
						}else{
							$('.progtext').html('低');
							$('.progress-bar-success').css('width','0');
						}
					},
					error: function() {
		
						// view("异常！");
						//				$.alert("异常！");
					}
				});
 }

	
function tzshiming(){
	
	$('#t-realName').addClass('active in');
	$('#t-setUp').removeClass('active in');
	$('#nav-tabs li').eq(2).addClass('active');
	$('#nav-tabs li').eq(1).removeClass('active');
}

//支付密码
function Xgpwd(){
	var jymm1=$('#jymm1').val();
	var jymm2=$('#jymm2').val();
	var jycode=$('#jycode').val();
	var token = $("#token").val();
	if(jymm1==''){
		alert('交易密码不能为空');
	}else if(jymm2==''){
		alert('再次确认密码不能为空');
	}else if(jycode==''){
		alert('短信验证码不能为空');
	}else if(jymm1!=jymm2){
		alert('两次密码不一致');
	}else{
		$.ajax( {
			url:'/pcUserSetting/pcResetJyPwd.htm',// 跳转到 action
			type:'post',
			cache:false,
			data:{'paypwd':jymm1,'token':token,'code':jycode},
			dataType : "json",//返回结果格式
			success:function(data) {
				if(data.success==true){
					alert(data.msg);
					window.location.reload();
				}else{
					alert(data.msg);
				}

			},
			error : function() {

			}
			});
	}
	
}

//验证码
var s_time = null;
var messageTime = 120;

			function showTime() {
			messageTime--;
        $("#basic-addon3").html(messageTime + " S后再次点击");
        $("#basic-addon2").html(messageTime + " S后再次点击");
        if (messageTime == 0 || messageTime < 0) {
            window.clearInterval(s_time);
            $("#basic-addon3").html("发送验证码");
            $("#basic-addon2").html("发送验证码");
            messageTime=120;
        }
			}
			function getPhoneCode(e){

			if(messageTime!=120){
			alert("请稍后再试。")
			return;
			}


			$.ajax( {
			url:'/user/sendsms.htm',// 跳转到 action
			type:'post',
			cache:false,
			dataType : "json",//返回结果格式
			success:function(data) {
			if(data.success=true){
			alert(data.msg);
			}else{
			alert(data.msg);
			messageTime=0;

			}

			},
			error : function() {
			// view("异常！");
//			alert("异常！");
			messageTime=0;
			}
			});

			showTime();
			s_time = setInterval("showTime()", 1000);

			}
			
			
			
			
			var s_time1 = null;
			var messageTime1 = 120;

			function showTime1() {
			messageTime1--;
        $("#basic-addon1").html(messageTime + " S后再次点击");
     
        if (messageTime1 == 0 || messageTime1 < 0) {
            window.clearInterval(s_time1);
            $("#basic-addon1").html("发送验证码");
          
            messageTime1=120;
        }
			}
			function getPhoneCode1(e){

			if(messageTime1!=120){
			alert("请稍后再试。")
			return;
			}


			var phone=$('#newiphone').val();
			var regrealphone = /^1[3|4|5|7|8][0-9]{9}$/;//手机号码
				if(!regrealphone.test(phone)){
					alert('您输入的手机号码有误！');
									return false;
					
				}else if(phone==''){
					alert('请输入的手机号码！');
									return false;
				}else{
						$.ajax( {
						url:'/user/sendPhoneSms.htm?phone='+phone,// 跳转到 action
						type:'post',
						cache:false,
						dataType : "json",//返回结果格式
						success:function(data) {
						if(data.success=true){
						alert(data.msg);
						}else{
						alert(data.msg);
						messageTime1=0;
			
						}
			
						},
						error : function() {
						// view("异常！");
			//			alert("异常！");
						messageTime1=0;
						}
						});

			showTime1();
			s_time1 = setInterval("showTime1()", 1000);

			}
			
}

//改资料
function baocun(){
	var val=$('input:radio[name="optionsRadios"]:checked').val();
	var name=$('#uname').val();
	$.ajax( {
			url:'/pcUserSetting/saveBaseUserInfo.htm',// 跳转到 action
			type:'post',
			cache:false,
			data:{'userName':name,'sex':val},
			dataType : "json",//返回结果格式
			success:function(data) {
				console.log(data);
				if(data.success==true){
				alert(data.msg);
					
				}else{
			alert(data.msg);
				}

			},
			error : function() {

			}
			});
	
}

//修改手机
function iphonenext(){
	var icode1=$('#icode1').val();
	if(icode1==''){
		alert('请输入手机验证码');
	}else{
		$.ajax({
			url:'/user/verifyCode.htm?code='+icode1,// 跳转到 action
			type:'post',
			cache:false,
			dataType : "json",//返回结果格式
			success:function(data) {
			if(data.success==true){
				$('#xgsj2').css('display','block');
				$('#xgsj1').css('display','none');
				
			}else{
			alert(data.msg);
			}

			},
			error : function() {
			// view("异常！");
//			alert("异常！");
			}
			});
	}
}

function iPhoneqd(){
	var icode=$('#icode2').val();
	var iphone=$('#newiphone').val();
	if(iphone==''){
		alert('请输入新的手机号码');
	}else if(icode==''){
		alert('请输入手机验证码');
	}else{
		$.ajax({
			url:'/user/phoneCode.htm',// 跳转到 action
			type:'post',
			cache:false,
			data:{'code':icode,'phone':iphone},
			dataType : "json",//返回结果格式
			success:function(data) {
			if(data.success==true){
				alert(data.msg);
				window.location.reload();
			}else{
			alert(data.msg);
			}

			},
			error : function() {
			// view("异常！");
//			alert("异常！");
			}
			});
	}
}



//头像

		function setImagePreview() {
			var preview, img_txt, localImag, file_head = document.getElementById("file_head"),
				picture = file_head.value;
			if(!picture.match(/.jpeg|.jpg|.gif|.png|.bmp/i)) return alert("您上传的图片格式不正确，请重新选择！"), !1;
			if(preview = document.getElementById("preview"), file_head.files && file_head.files[0])preview.style.display = "block",
				preview.style.width = "120px",
				preview.style.height = "120px",
				preview.src = window.navigator.userAgent.indexOf("Chrome") >= 1 || window.navigator.userAgent.indexOf("Safari") >= 1 ? window.webkitURL.createObjectURL(file_head.files[0]) : window.URL.createObjectURL(file_head.files[0]);
			else {
				file_head.select(),
					file_head.blur(),
					img_txt = document.selection.createRange().text,
					localImag = document.getElementById("localImag"),
					localImag.style.width = "120px",
					localImag.style.height = "120px";
				try {
					localImag.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)",
						localImag.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = img_txt
				} catch(f) {
					return alert("您上传的图片格式不正确，请重新选择！"), !1
				}
				preview.style.display = "none",
					document.selection.empty()
			}

			subImg();
		}

//		function state1() {
//			$('#shangchuan').css('display', 'block')
//			var types = ${userType};
//			if(types == 0) {
//
//				subImg(0);
//
//			} else if(types == 1) {
//				subImg(1);
//			}
//
//		}

		function subImg(index) {
			var num = index;
			$.ajaxFileUpload({
				url: '/user/loadUserImg.htm', //处理图片脚本
				secureuri: false,
				fileElementId: 'file_head', //file控件id
				dataType: 'JSON',
				success: function(data, status) {
					console.log(data);
				
					window.location.reload();	
				},
				error: function(data, status, e) {
					alert(e);
				}
			})

		}
