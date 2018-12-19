$(function() {
	var xAxisData = [];
	var showData = [];
	$.ajax({
		url:"../charts/getLineCharts.do",
		type:"post",
		dataType:"json",
		data:{"showType":"countRegister"},
		async:false,
		success:function(data){
			xAxisData = data.xAxisData;
			var tmpArr = data.showData;
			for(var i=0;i<tmpArr.length;i++){
				showData[i] = parseInt(tmpArr[i]);
			}
		}
	});
	
    var e = echarts.init(document.getElementById("echarts-line-chart")),
    a = {
        title: {
            text: "每天注册量统计图"
        },
        tooltip: {
            trigger: "axis"
        },
        legend: {
            data: ["注册量"]
        },
        grid: {
            x: 40,
            x2: 40,
            y2: 24
        },
        calculable: !0,
        xAxis: [{
            type: "category",
            boundaryGap: !1,
            data: xAxisData
        }],
        yAxis: [{
            type: "value",
            axisLabel: {
                formatter: "{value}"
            }
        }],
        series: [{
            name: "注册量",
            type: "line",
            data: showData,
            markPoint: {
                data: [{
                    type: "max",
                    name: "最大值"
                },
                {
                    type: "min",
                    name: "最小值"
                }]
            },
            markLine: {
                data: [{
                    type: "average",
                    name: "平均值"
                }]
            }
        }]
    };
    e.setOption(a),
    $(window).resize(e.resize);
});