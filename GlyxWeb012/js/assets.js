init()
function init() {
	console.log(1111)
	$.ajax({
		url: '/account/getAccount.htm', // 跳转到 action
		type: 'POST',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			console.log(data)
			$('#available').html(data.obj.availableBalance);
			$('#balance').html(data.obj.balance);
			$('#total').html(data.obj.totalBalance);
			$('#profitLoss').html(data.obj.profitLossAmout);
			$('#recommend').html(data.obj.recommendAmount);
			$('#amountFrozen').html(data.obj.amountFrozen);
		},
		error: function() {

		}
	});
}