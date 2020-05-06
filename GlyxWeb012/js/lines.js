
//$(function(){

//});




function cs_search(){
	$('#searchlist').html('');
		console.log($("#search_key").val());
				if($("#search_key").val()!=''){
					
					var dom='';
					dom+='<li style="font-size:15px ;"><span><span class="navspan" style="text-align: center;">代码</span><span class="navspan1">名称</span><span class="navspan1">简拼</span><span class="navspan" style="text-align: center;">类型</span></span></li>';
					$('#searchlist').append(dom);
					$('#searchmain').css('display','block');
					$.ajax({
						url: '/Data/queryStock.do', // 跳转到 action
						type: 'POST',
						data:{'queryvalue':$("#search_key").val()},
						contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
						dataType: "json", //返回结果格式
						success: function(data) {
							var allList=data.obj;
						
							for(i=0;i<allList.length;i++){
								
								var html='';
								html+='<li role="presentation"><a href="#" onclick="xuanzhe(\''+allList[i].code+'\')"><span class="navspan" style="text-align: center;">'+allList[i].code+'</span><span class="navspan1">'+allList[i].name+'</span><span class="navspan1">'+allList[i].pinyin+'</span><span class="navspan" style="text-align: center;"> '+allList[i].type+' </span><span class="glyphicon glyphicon-menu-right"></span></a></li>';
								$('#searchlist').append(html);
							}
							
						},
						error: function() {
				
						}
					});
				};
}

function xuanzhe(stockid,stocktype){
	$('#che2').addClass('active');
		$('#che1').removeClass('active');
		$('#che3').removeClass('active');
		$('#che4').removeClass('active');
	$('#searchmain').css('display','none');
	kinesj(stockid,'day','gp');
	$('#kmainstock').val(stockid);
	var day='day';
	$.ajax({
						url: '/Data/getData.do', // 跳转到 action
						type: 'POST',
						data:{'stockid':stockid,'stockation':day,'stocktype':stocktype},
						contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
						dataType: "json", //返回结果格式
						success: function(data) {
							if(data.success==true){
								$('#right1').html(data.obj.stockName);
								$('#right2').html(data.obj.stockCode);
								$('#right3').html(data.obj.nowPrice);
								$('#right4').html(data.obj.yesterdayClosePrice);
								$('#right5').html(data.obj.openPrice);
								$('#right6').html(data.obj.maxPrice);
								$('#right7').html(data.obj.minPrice);
								$('#right8').html(data.obj.volumn);
								$('#right11').html(data.obj.volumnMoney);
								$('#right10').html(data.obj.diff_rate);
								$('#right9').html(data.obj.diff_quota);
								$('#right12').html(data.obj.totalcapital);
								$('#right13').html(data.obj.highLimit);
								$('#right14').html(data.obj.downLimit);
								$('#right15').html(data.obj.swing);
								if(data.obj.nowPrice>=data.obj.openPrice){
									$('#right3').css('color','red');
									$('#right9').css('color','red');
									$('#right10').css('color','red');
								}else{
									$('#right3').css('color','#33b643');
									$('#right9').css('color','#33b643');
									$('#right10').css('color','#33b643');
								}
							}else{
								
							}
							
						},
						error: function() {
				
						}
					});
					
					//判断是否是自选股
			$.ajax({
						url: '/Data/checkMyStock.do', // 跳转到 action
						type: 'POST',
						data:{'stockid':stockid},
						contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
						dataType: "json", //返回结果格式
						success: function(data) {
							if(data.success==true){
								$('#delzx').css('display','inherit');
								$('#addzx').css('display','none');
							}else{
								
								$('#delzx').css('display','none');
								$('#addzx').css('display','inherit');
							}
							
						},
						error: function() {
				
						}
					});		
					
					
					
					
					
}


function chekine(index){
	var stockid=$('#kmainstock').val();
	console.log(1);
	if(index==1){
		minsj(stockid,'minute','gp');
		$('#che1').addClass('active');
		$('#che2').removeClass('active');
		$('#che3').removeClass('active');
		$('#che4').removeClass('active');
	}else if(index==2){
		kinesj(stockid,'day','gp');
		$('#che2').addClass('active');
		$('#che1').removeClass('active');
		$('#che3').removeClass('active');
		$('#che4').removeClass('active');
	}else if(index==3){
		kinesj(stockid,'week','gp');
		$('#che3').addClass('active');
		$('#che2').removeClass('active');
		$('#che1').removeClass('active');
		$('#che4').removeClass('active');
	}else if(index==4){
		kinesj(stockid,'month','gp');
		$('#che4').addClass('active');
		$('#che2').removeClass('active');
		$('#che3').removeClass('active');
		$('#che1').removeClass('active');
	}
}


function kinesj(stockid,stockation,stocktype){
	
	$.ajax({
		url: '/Data/getData.do', // 跳转到 action
		type: 'POST',
		data:{'stockation':stockation,'stockid':stockid,'stocktype':stocktype},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(rawData) {								
				
				var all=rawData.obj.dataList;
				var array1=[]
				for(i=0;i<all.length;i++){
					var map=[];
					map[0] = all[i].time;
					map[1]=all[i].open;
					map[2]=all[i].close;
					map[3]=all[i].max;
					map[4]=all[i].min;
					map[5]=all[i].volumn;
					array1[i]=map
				}							
  		  var data = splitData(array1);
  		  
  		  if(stockation=='day'){
		  		  	option = {
			        backgroundColor: '#fff',
			        animation: false,
			        tooltip: {
			            trigger: 'axis',
			            axisPointer: {
			                type: 'cross'
			            },
			            backgroundColor: 'rgba(245, 245, 245, 0.8)',
			            borderWidth: 1,
			            borderColor: '#ccc',
			            padding: 10,
			            textStyle: {
			                color: '#000'
			            },
			            position: function (pos, params, dom, elRect, size) {
			               
			                var obj = {top: 10};
			                obj[['left', 'right'][+(pos[0] < size.viewSize[0] / 2)]] = 30;
			                return obj;  
			            }
			            // extraCssText: 'width: 170px'
			        },
			        axisPointer: {
			            link: {xAxisIndex: 'all'},
			            label: {
			                backgroundColor: '#777'
			            }
			        },
			        toolbox: {
			            feature: {
			                dataZoom: {
			                    yAxisIndex: false
			                },
			                brush: {
			                    type: ['lineX', 'clear']
			                }
			            }
			        },
			        brush: {
			            xAxisIndex: 'all',
			            brushLink: 'all',
			            outOfBrush: {
			                colorAlpha: 0.1
			            }
			        },
			        visualMap: {
			            show: false,
			            seriesIndex: 5,
			            dimension: 2,
			            pieces: [{
			                value: 1,
			                color: downColor
			            }, {
			                value: -1,
			                color: upColor
			            }]
			        },
			        grid: [
			            {
			                left: '8%',
			                right: '8%',
			                height: '50%'
			            },
			            {
			                left: '8%',
			                right: '8%',
			                top: '63%',
			                height: '16%'
			            }
			        ],
			        xAxis: [
			            {
			                type: 'category',
			                data: data.categoryData,
			                scale: true,
			                boundaryGap : false,
			                axisLine: {onZero: false},
			                splitLine: {show: false},
			                splitNumber: 20,
			                min: 'dataMin',
			                max: 'dataMax',
			                axisPointer: {
			                    z: 100
			                }
			            },
			            {
			                type: 'category',
			                gridIndex: 1,
			                data: data.categoryData,
			                scale: true,
			                boundaryGap : false,
			                axisLine: {onZero: false},
			                axisTick: {show: false},
			                splitLine: {show: false},
			                axisLabel: {show: false},
			                splitNumber: 20,
			                min: 'dataMin',
			                max: 'dataMax'
			                
			            }
			        ],
			        yAxis: [
			            {
			                scale: true,
			                splitArea: {
			                    show: true
			                }
			            },
			            {
			                scale: true,
			                gridIndex: 1,
			                splitNumber: 2,
			                axisLabel: {show: false},
			                axisLine: {show: false},
			                axisTick: {show: false},
			                splitLine: {show: false}
			            }
			        ],
			        dataZoom: [
			            {
			                type: 'inside',
			                xAxisIndex: [0, 1],
			                start: 70,
			                end: 100
			            },
			            {
			                show: true,
			                xAxisIndex: [0, 1],
			                type: 'slider',
			                top: '85%',
			                start: 70,
			                end: 100
			            }
			        ],
			        series: [
			            {
			                name: '日k',
			                type: 'candlestick',
			              data: data.values,
			                itemStyle: {
			                    normal: {
			                        color: downColor,
			                        color0: upColor,
			                        borderColor: null,
			                        borderColor0: null
			                    }
			                },
			                tooltip: {
			                    formatter: function (params) {
			                    	
			                        param = param[0];
			                        console.log(param.data[0]);
			                        return [
			                            '日期: ' + param.name + '<hr size=1 style="margin: 3px 0">',
			                            '今开: ' + param.data[0] + '<br/>',
			                            '昨收: ' + param.data[1] + '<br/>',
			                            '最低: ' + param.data[2] + '<br/>',
			                            '最高: ' + param.data[3] + '<br/>'
			                        ].join('');
			                    }
			                }
			            },
			            {
			                name: 'MA5',
			                type: 'line',
			             data: [],
			                smooth: true,
			                lineStyle: {
			                    normal: {opacity: 0.5}
			                }
			            },
			            {
			                name: 'MA10',
			                type: 'line',
			              data: [],
			                smooth: true,
			                lineStyle: {
			                    normal: {opacity: 0.5}
			                }
			            },
			            {
			                name: 'MA20',
			                type: 'line',
			//              data: calculateMA(20, data),
			                smooth: true,
			                lineStyle: {
			                    normal: {opacity: 0.5}
			                }
			            },
			            {
			                name: 'MA30',
			                type: 'line',
			 //             data: calculateMA(30, data),
			                smooth: true,
			                lineStyle: {
			                    normal: {opacity: 0.5}
			                }
			            },
			            {
			                name: '交易量',
			                type: 'bar',
			                xAxisIndex: 1,
			                yAxisIndex: 1,
			                data: data.volumes
			            }
			        ]
			    }
  		  }else if(stockation=='week'){
		  		  	option = {
			        backgroundColor: '#fff',
			        animation: false,
			        tooltip: {
			            trigger: 'axis',
			            axisPointer: {
			                type: 'cross'
			            },
			            backgroundColor: 'rgba(245, 245, 245, 0.8)',
			            borderWidth: 1,
			            borderColor: '#ccc',
			            padding: 10,
			            textStyle: {
			                color: '#000'
			            },
			            position: function (pos, params, dom, elRect, size) {
			               
			                var obj = {top: 10};
			                obj[['left', 'right'][+(pos[0] < size.viewSize[0] / 2)]] = 30;
			                return obj;  
			            }
			            // extraCssText: 'width: 170px'
			        },
			        axisPointer: {
			            link: {xAxisIndex: 'all'},
			            label: {
			                backgroundColor: '#777'
			            }
			        },
			        toolbox: {
			            feature: {
			                dataZoom: {
			                    yAxisIndex: false
			                },
			                brush: {
			                    type: ['lineX', 'clear']
			                }
			            }
			        },
			        brush: {
			            xAxisIndex: 'all',
			            brushLink: 'all',
			            outOfBrush: {
			                colorAlpha: 0.1
			            }
			        },
			        visualMap: {
			            show: false,
			            seriesIndex: 5,
			            dimension: 2,
			            pieces: [{
			                value: 1,
			                color: downColor
			            }, {
			                value: -1,
			                color: upColor
			            }]
			        },
			        grid: [
			            {
			                left: '8%',
			                right: '8%',
			                height: '50%'
			            },
			            {
			                left: '8%',
			                right: '8%',
			                top: '63%',
			                height: '16%'
			            }
			        ],
			        xAxis: [
			            {
			                type: 'category',
			                data: data.categoryData,
			                scale: true,
			                boundaryGap : false,
			                axisLine: {onZero: false},
			                splitLine: {show: false},
			                splitNumber: 20,
			                min: 'dataMin',
			                max: 'dataMax',
			                axisPointer: {
			                    z: 100
			                }
			            },
			            {
			                type: 'category',
			                gridIndex: 1,
			                data: data.categoryData,
			                scale: true,
			                boundaryGap : false,
			                axisLine: {onZero: false},
			                axisTick: {show: false},
			                splitLine: {show: false},
			                axisLabel: {show: false},
			                splitNumber: 20,
			                min: 'dataMin',
			                max: 'dataMax'
			                
			            }
			        ],
			        yAxis: [
			            {
			                scale: true,
			                splitArea: {
			                    show: true
			                }
			            },
			            {
			                scale: true,
			                gridIndex: 1,
			                splitNumber: 2,
			                axisLabel: {show: false},
			                axisLine: {show: false},
			                axisTick: {show: false},
			                splitLine: {show: false}
			            }
			        ],
			        dataZoom: [
			            {
			                type: 'inside',
			                xAxisIndex: [0, 1],
			                start: 60,
			                end: 100
			            },
			            {
			                show: true,
			                xAxisIndex: [0, 1],
			                type: 'slider',
			                top: '85%',
			                start: 60,
			                end: 100
			            }
			        ],
			        series: [
			            {
			                name: '周K',
			                type: 'candlestick',
			              data: data.values,
			                itemStyle: {
			                    normal: {
			                        color: downColor,
			                        color0: upColor,
			                        borderColor: null,
			                        borderColor0: null
			                    }
			                },
			                tooltip: {
			                    formatter: function (params) {
			                    	
			                        param = param[0];
			                        console.log(param.data[0]);
			                        return [
			                            '日期: ' + param.name + '<hr size=1 style="margin: 3px 0">',
			                            '今开: ' + param.data[0] + '<br/>',
			                            '昨收: ' + param.data[1] + '<br/>',
			                            '最低: ' + param.data[2] + '<br/>',
			                            '最高: ' + param.data[3] + '<br/>'
			                        ].join('');
			                    }
			                }
			            },
			            {
			                name: 'MA5',
			                type: 'line',
			           		 data:[],
			                smooth: true,
			                lineStyle: {
			                    normal: {opacity: 0.5}
			                }
			            },
			            {
			                name: 'MA10',
			                type: 'line',
							data:[],
			                smooth: true,
			                lineStyle: {
			                    normal: {opacity: 0.5}
			                }
			            },
			            {
			                name: 'MA20',
			                type: 'line',
			//              data: calculateMA(20, data),
			                smooth: true,
			                lineStyle: {
			                    normal: {opacity: 0.5}
			                }
			            },
			            {
			                name: 'MA30',
			                type: 'line',
			 //             data: calculateMA(30, data),
			                smooth: true,
			                lineStyle: {
			                    normal: {opacity: 0.5}
			                }
			            },
			            {
			                name: '交易量',
			                type: 'bar',
			                xAxisIndex: 1,
			                yAxisIndex: 1,
			                data: data.volumes
			            }
			        ]
			    }
  		  }else if(stockation=='month'){
		  		  	option = {
			        backgroundColor: '#fff',
			        animation: false,
			        tooltip: {
			            trigger: 'axis',
			            axisPointer: {
			                type: 'cross'
			            },
			            backgroundColor: 'rgba(245, 245, 245, 0.8)',
			            borderWidth: 1,
			            borderColor: '#ccc',
			            padding: 10,
			            textStyle: {
			                color: '#000'
			            },
			            position: function (pos, params, dom, elRect, size) {
			               
			                var obj = {top: 10};
			                obj[['left', 'right'][+(pos[0] < size.viewSize[0] / 2)]] = 30;
			                return obj;  
			            }
			            // extraCssText: 'width: 170px'
			        },
			        axisPointer: {
			            link: {xAxisIndex: 'all'},
			            label: {
			                backgroundColor: '#777'
			            }
			        },
			        toolbox: {
			            feature: {
			                dataZoom: {
			                    yAxisIndex: false
			                },
			                brush: {
			                    type: ['lineX', 'clear']
			                }
			            }
			        },
			        brush: {
			            xAxisIndex: 'all',
			            brushLink: 'all',
			            outOfBrush: {
			                colorAlpha: 0.1
			            }
			        },
			        visualMap: {
			            show: false,
			            seriesIndex: 5,
			            dimension: 2,
			            pieces: [{
			                value: 1,
			                color: downColor
			            }, {
			                value: -1,
			                color: upColor
			            }]
			        },
			        grid: [
			            {
			                left: '8%',
			                right: '8%',
			                height: '50%'
			            },
			            {
			                left: '8%',
			                right: '8%',
			                top: '63%',
			                height: '16%'
			            }
			        ],
			        xAxis: [
			            {
			                type: 'category',
			                data: data.categoryData,
			                scale: true,
			                boundaryGap : false,
			                axisLine: {onZero: false},
			                splitLine: {show: false},
			                splitNumber: 20,
			                min: 'dataMin',
			                max: 'dataMax',
			                axisPointer: {
			                    z: 100
			                }
			            },
			            {
			                type: 'category',
			                gridIndex: 1,
			                data: data.categoryData,
			                scale: true,
			                boundaryGap : false,
			                axisLine: {onZero: false},
			                axisTick: {show: false},
			                splitLine: {show: false},
			                axisLabel: {show: false},
			                splitNumber: 20,
			                min: 'dataMin',
			                max: 'dataMax'
			                
			            }
			        ],
			        yAxis: [
			            {
			                scale: true,
			                splitArea: {
			                    show: true
			                }
			            },
			            {
			                scale: true,
			                gridIndex: 1,
			                splitNumber: 2,
			                axisLabel: {show: false},
			                axisLine: {show: false},
			                axisTick: {show: false},
			                splitLine: {show: false}
			            }
			        ],
			        dataZoom: [
			            {
			                type: 'inside',
			                xAxisIndex: [0, 1],
			                start: 0,
			                end: 100
			            },
			            {
			                show: true,
			                xAxisIndex: [0, 1],
			                type: 'slider',
			                top: '85%',
			                start: 0,
			                end: 100
			            }
			        ],
			        series: [
			            {
			                name: '月k',
			                type: 'candlestick',
			              data: data.values,
			                itemStyle: {
			                    normal: {
			                        color: downColor,
			                        color0: upColor,
			                        borderColor: null,
			                        borderColor0: null
			                    }
			                },
			                tooltip: {
			                    formatter: function (params) {
			                    	
			                        param = param[0];
			                        console.log(param.data[0]);
			                        return [
			                            '日期: ' + param.name + '<hr size=1 style="margin: 3px 0">',
			                            '今开: ' + param.data[0] + '<br/>',
			                            '昨收: ' + param.data[1] + '<br/>',
			                            '最低: ' + param.data[2] + '<br/>',
			                            '最高: ' + param.data[3] + '<br/>'
			                        ].join('');
			                    }
			                }
			            },
			            {
			                name: 'MA51',
			                type: 'line',
			          		data:[],
			                smooth: true,
			                lineStyle: {
			                    normal: {opacity: 0.5}
			                }
			            },
			            {
			                name: 'MA10',
			                type: 'line',
							data:[],
			                smooth: true,
			                lineStyle: {
			                    normal: {opacity: 0.5}
			                }
			            },
			            {
			                name: 'MA20',
			                type: 'line',
			//              data: calculateMA(20, data),
			                smooth: true,
			                lineStyle: {
			                    normal: {opacity: 0.5}
			                }
			            },
			            {
			                name: 'MA30',
			                type: 'line',
			 //             data: calculateMA(30, data),
			                smooth: true,
			                lineStyle: {
			                    normal: {opacity: 0.5}
			                }
			            },
			            {
			                name: '交易量',
			                type: 'bar',
			                xAxisIndex: 1,
			                yAxisIndex: 1,
			                data: data.volumes
			            }
			        ]
			    }
  		  }


	  
		 myChart.setOption(option);
		}
	});

}

var ftime = ["09:30","09:31","09:32","09:33","09:34","09:35","09:36","09:37","09:38","09:39","09:40","09:41","09:42","09:43","09:44","09:45","09:46","09:47","09:48","09:49","09:50","09:51","09:52","09:53","09:54","09:55","09:56","09:57","09:58","09:59","10:00","10:01","10:02","10:03","10:04","10:05","10:06","10:07","10:08","10:09","10:10","10:11","10:12","10:13","10:14","10:15","10:16","10:17","10:18","10:19","10:20","10:21","10:22","10:23","10:24","10:25","10:26","10:27","10:28","10:29","10:30","10:31","10:32","10:33","10:34","10:35","10:36","10:37","10:38","10:39","10:40","10:41","10:42","10:43","10:44","10:45","10:46","10:47","10:48","10:49","10:50","10:51","10:52","10:53","10:54","10:55","10:56","10:57","10:58","10:59","11:00","11:01","11:02","11:03","11:04","11:05","11:06","11:07","11:08","11:09","11:10","11:11","11:12","11:13","11:14","11:15","11:16","11:17","11:18","11:19","11:20","11:21","11:22","11:23","11:24","11:25","11:26","11:27","11:28","11:29","11:30","13:00","13:01","13:02","13:03","13:04","13:05","13:06","13:07","13:08","13:09","13:10","13:11","13:12","13:13","13:14","13:15","13:16","13:17","13:18","13:19","13:20","13:21","13:22","13:23","13:24","13:25","13:26","13:27","13:28","13:29","13:30","13:31","13:32","13:33","13:34","13:35","13:36","13:37","13:38","13:39","13:40","13:41","13:42","13:43","13:44","13:45","13:46","13:47","13:48","13:49","13:50","13:51","13:52","13:53","13:54","13:55","13:56","13:57","13:58","13:59","14:00","14:01","14:02","14:03","14:04","14:05","14:06","14:07","14:08","14:09","14:10","14:11","14:12","14:13","14:14","14:15","14:16","14:17","14:18","14:19","14:20","14:21","14:22","14:23","14:24","14:25","14:26","14:27","14:28","14:29","14:30","14:31","14:32","14:33","14:34","14:35","14:36","14:37","14:38","14:39","14:40","14:41","14:42","14:43","14:44","14:45","14:46","14:47","14:48","14:49","14:50","14:51","14:52","14:53","14:54","14:55","14:56","14:57","14:58","14:59","15:00"];

function minsj(stockid,stockation,stocktype){
	
		$.ajax({
		url: '/Data/getData.do', // 跳转到 action
		type: 'POST',
		data:{'stockation':stockation,'stockid':stockid,'stocktype':stocktype},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(rawData) {								
				
				var all=rawData.obj;
				var array1=[]
				for(i=0;i<all.length;i++){
					var map=[];
					map[0] = all[i].timeStr;
					map[1]=all[i].nowPrice;
					map[2]='-';
					map[3]=all[i].sumPrice;
					map[4]=all[i].avgPrice;
					map[5]=all[i].volumn;
					array1[i]=map
				}										
  		  var data = splitData(array1,1);
  		     console.log(data);
  		
		  		  	option1 = {
			        backgroundColor: '#fff',
			        animation: false,
			        tooltip: {
			            trigger: 'axis',
			            axisPointer: {
			                type: 'cross'
			            },
			            backgroundColor: 'rgba(245, 245, 245, 0.8)',
			            borderWidth: 1,
			            borderColor: '#ccc',
			            padding: 10,
			            textStyle: {
			                color: '#000'
			            },
			            position: function (pos, params, dom, elRect, size) {
			               
			                var obj = {top: 10};
			                obj[['left', 'right'][+(pos[0] < size.viewSize[0] / 2)]] = 30;
			                return obj;  
			            }
			            // extraCssText: 'width: 170px'
			        },
			        axisPointer: {
			            link: {xAxisIndex: 'all'},
			            label: {
			                backgroundColor: '#777'
			            }
			        },
			        toolbox: {
			            feature: {
			                dataZoom: {
			                    yAxisIndex: false
			                },
			                brush: {
			                    type: ['lineX', 'clear']
			                }
			            }
			        },
			        brush: {
			            xAxisIndex: 'all',
			            brushLink: 'all',
			            outOfBrush: {
			                colorAlpha: 0.1
			            }
			        },
			        visualMap: {
			            show: false,
			            seriesIndex: 5,
			            dimension: 2,
			            pieces: [{
			                value: 1,
			                color: downColor
			            }, {
			                value: -1,
			                color: upColor
			            }]
			        },
			        grid: [
			            {
			                left: '8%',
			                right: '8%',
			                height: '50%'
			            },
			            {
			                left: '8%',
			                right: '8%',
			                top: '63%',
			                height: '16%'
			            }
			        ],
			        xAxis: [
			            {
			                type: 'category',
			                data: ftime,
			                scale: true,
			                boundaryGap : false,
			                axisLine: {onZero: false},
			                splitLine: {show: false},
			                splitNumber: 20,
			                min: 'dataMin',
			                max: 'dataMax',
			                axisPointer: {
			                    z: 100
			                }
			            },
			            {
			                type: 'category',
			                gridIndex: 1,
			                data: ftime,
			                scale: true,
			                boundaryGap : false,
			                axisLine: {onZero: false},
			                axisTick: {show: false},
			                splitLine: {show: false},
			                axisLabel: {show: false},
			                splitNumber: 20,
			                min: 'dataMin',
			                max: 'dataMax'
			                
			            }
			        ],
			        yAxis: [
			            {
			            	
			                scale: true,
			                 splitLine: {show: false},
			                 minInterval:0.1,  
			                splitArea: {
			                    show: false
			                }
			            },
			            {
			                scale: true,
			                gridIndex: 1,
			                splitNumber: 2,
			                axisLabel: {show: false},
			                axisLine: {show: false},
			                axisTick: {show: false},
			                splitLine: {show: false}
			            }
			        ],
			        dataZoom: [
			            {
			                type: 'inside',
			                xAxisIndex: [0, 1],
			                start: 0,
			                end: 100
			            },
			            {
			                show: true,
			                xAxisIndex: [0, 1],
			                type: 'slider',
			                top: '85%',
			                start: 0,
			                end: 100
			            }
			        ],
			        series: [
			            {
			                name: '日k',
			                type: 'candlestick',
			             data:[],
			                itemStyle: {
			                    normal: {
			                        color: downColor,
			                        color0: upColor,
			                        borderColor: null,
			                        borderColor0: null
			                    }
			                },
			                tooltip: {
			                    formatter: function (params) {
			                    	
			                        param = param[0];
			                        console.log(param.data[0]);
			                        return [
			                            '日期: ' + param.name + '<hr size=1 style="margin: 3px 0">',
			                            '今开: ' + param.data[0] + '<br/>',
			                            '昨收: ' + param.data[1] + '<br/>',
			                            '最低: ' + param.data[2] + '<br/>',
			                            '最高: ' + param.data[3] + '<br/>'
			                        ].join('');
			                    }
			                }
			            },
			            {
			                name: '当前价',
			                type: 'line',
			            	 data: calculateMA(5, data),
			                smooth: true,
			                symbol: 'none',
			                lineStyle: {
			                    normal: {opacity: 0.5, color:'#3677b8'}
			                },
			                 areaStyle:{ //区域填充样式
                        normal:{
                            //线性渐变
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0, color: '#b1e3fe' // 0% 处的颜色
                            }, {
                                offset: 1, color: '#fff' // 100% 处的颜色
                            }], false)
                        }
                    },
			               
                
			            },
			            {
			                name: '均价',
			                type: 'line',
			             	 data: calculateMA(10, data),
			                smooth: true,
			                symbol: 'none',
			                lineStyle: {
			                    normal: {opacity: 0.5,color:'#d9a627'}
			                }
			            },
			            {
			                name: 'MA20',
			                type: 'line',
			//              data: calculateMA(20, data),
			                smooth: true,
			                lineStyle: {
			                    normal: {opacity: 0.5}
			                }
			            },
			            {
			                name: 'MA30',
			                type: 'line',
			 //             data: calculateMA(30, data),
			                smooth: true,
			                lineStyle: {
			                    normal: {opacity: 0.5}
			                }
			            },
			            {
			                name: '交易量',
			                type: 'bar',
			                xAxisIndex: 1,
			                yAxisIndex: 1,
			                data: data.volumes
			            }
			        ]
			    }
  		  

		 myChart.setOption(option1);
		}
	});
	
}



