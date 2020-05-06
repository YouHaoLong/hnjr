function init() {
			console.log(1111)
			$.ajax({
				url: '/pcTransation/pcLoadCurrentData.htm', // 跳转到 action
				type: 'POST',
				contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				dataType: "json", //返回结果格式
				success: function(data) {
					console.log(data)
					$('#money').html(data.obj.availablebalance);
					 var phone = data.obj.telphone;
					var mphone = phone.substr(0, 3) + '****' + phone.substr(7);
					$('#telphone').html(mphone);
					$('#cardno').html(data.obj.cardNo);

				},
				error: function() {

				}
			});
		
}
function queren() {
			var token=$('#token').val();
			var money=$('#Money').val();
			var code=$('#Code').val();
			var pass=$('#Password').val();
			if(money==''){
				alert('请输入提现金额');
			}else if(code==''){
				alert('请输入手机验证码')
			}else if(pass==''){
				alert('请输入支付密码');
			}else{
				
				$.ajax({
				url: '/tran/withdraw.htm', // 跳转到 action
				type: 'POST',
				data:{'withdrawidamount':money,'code':code,'paypwd':pass,'token':token},
				dataType: "json", //返回结果格式
				success: function(data) {
					console.log(data)
					if(data.success==true){
						alert(data.msg);
						console.log(data.msg)
						window.location.reload()
					}else{
						alert(data.msg);
					}
					
				},
				error: function() {

				}
			});
	
				
				
			}
}


//是否实名认证
$(function(){
	
	$.ajax({
				url: '/tran/checkauth.htm', // 跳转到 action
				type: 'POST',
				contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				dataType: "json", //返回结果格式
				success: function(data) {
				
					if(data==1){
					
						return false;
					}else if(data==2){
						
						$('#profit').modal('show');
				}

				},
				error: function() {

				}
			});
	
});
			
//发信息
   var s_time = null;
    var messageTime = 120;

    function showTime() {
        messageTime--;
        $("#basic-addon2").html(messageTime + " S后再次点击");
        if (messageTime == 0 || messageTime < 0) {
            window.clearInterval(s_time);
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
            url:'/tran/sendsms.htm',// 跳转到 action
            type:'post',
            cache:false,
            dataType : "json",//返回结果格式
            success:function(data) {
					if(data.success=true){
						alert(data.msg);
						$("#iphone_btn").css('background','#ddd')
					}else{
						alert(data.msg);
						messageTime=0;

			}
            },
            error : function() {
                // view("异常！");
//              $.alert("异常！");
            }
        });

        showTime();
        s_time = setInterval("showTime()", 1000);

    }