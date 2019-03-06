<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <%@ include file="../../Basic/settings.jsp" %>
    <title>Insert title here</title>
</head>

<body class="nav-md">
    <%@ include file="../../Basic/navbar.jsp" %>
    <!-- page content -->
    <div class="right_col" role="main">
        <div class="col-md-6 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>학과별 그래프<small>선택 비교 가능</small></h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div id="major_chart" style="width:100%; height:347px;"></div>
                </div>
            </div>
        </div>
    
        <div class="col-md-6 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>단과대별 학점 평균<small>선택 비교 가능</small></h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div id="fac_chart" style="width:100%; height:350px;"></div>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>강의별 학점 평균<small>선택 비교 가능</small></h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                     <div id="mg_chart" style="width:100%; height:350px;"></div>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>학년별 학점 평균<small></small></h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                     <div id="lvl_chart" style="height:349px;"></div>
                </div>
            </div>
        </div>
    </div>



    <!-- /page content -->

 <%@ include file="../../Basic/footer.jsp" %> 
<script>
    
    $(function(){
    	
		if( typeof (echarts) === 'undefined'){ return; }
		console.log('init_echarts');
	

		  var theme = {
		  color: [
			  '#26B99A', '#34495E', '#BDC3C7', '#3498DB',
			  '#9B59B6', '#8abb6f', '#759c6a', '#bfd3b7'
		  ],

		  title: {
			  itemGap: 8,
			  textStyle: {
				  fontWeight: 'normal',
				  color: '#408829'
			  }
		  },

		  dataRange: {
			  color: ['#1f610a', '#97b58d']
		  },

		  toolbox: {
			  color: ['#408829', '#408829', '#408829', '#408829']
		  },

		  tooltip: {
			  backgroundColor: 'rgba(0,0,0,0.5)',
			  axisPointer: {
				  type: 'line',
				  lineStyle: {
					  color: '#408829',
					  type: 'dashed'
				  },
				  crossStyle: {
					  color: '#408829'
				  },
				  shadowStyle: {
					  color: 'rgba(200,200,200,0.3)'
				  }
			  }
		  },toolbox: {
  			  show: true,
  			  feature: {
  				magicType: {
  				  show: true,
  				  type: ['pie', 'funnel'],
  				  option: {
  					funnel: {
  					  x: '25%',
  					  width: '50%',
  					  funnelAlign: 'center',
  					  max: 1548
  					}
  				  }
  				},
  				restore: {
  				  show: true,
  				  title: "새로고침"
  				},
  				saveAsImage: {
  				  show: true,
  				  title: "이미지로 저장"
  				}
  			  }
  			},

		  dataZoom: {
			  dataBackgroundColor: '#eee',
			  fillerColor: 'rgba(64,136,41,0.2)',
			  handleColor: '#408829'
		  },
		  grid: {
			  borderWidth: 0
		  },

		  categoryAxis: {
			  axisLine: {
				  lineStyle: {
					  color: '#408829'
				  }
			  },
			  splitLine: {
				  lineStyle: {
					  color: ['#eee']
				  }
			  }
		  },

		  valueAxis: {
			  axisLine: {
				  lineStyle: {
					  color: '#408829'
				  }
			  },
			  splitArea: {
				  show: true,
				  areaStyle: {
					  color: ['rgba(250,250,250,0.1)', 'rgba(200,200,200,0.1)']
				  }
			  },
			  splitLine: {
				  lineStyle: {
					  color: ['#eee']
				  }
			  }
		  },
		  timeline: {
			  lineStyle: {
				  color: '#408829'
			  },
			  controlStyle: {
				  normal: {color: '#408829'},
				  emphasis: {color: '#408829'}
			  }
		  },

		  k: {
			  itemStyle: {
				  normal: {
					  color: '#68a54a',
					  color0: '#a9cba2',
					  lineStyle: {
						  width: 1,
						  color: '#408829',
						  color0: '#86b379'
					  }
				  }
			  }
		  },
		  map: {
			  itemStyle: {
				  normal: {
					  areaStyle: {
						  color: '#ddd'
					  },
					  label: {
						  textStyle: {
							  color: '#c12e34'
						  }
					  }
				  },
				  emphasis: {
					  areaStyle: {
						  color: '#99d2dd'
					  },
					  label: {
						  textStyle: {
							  color: '#c12e34'
						  }
					  }
				  }
			  }
		  },
		  force: {
			  itemStyle: {
				  normal: {
					  linkStyle: {
						  strokeColor: '#408829'
					  }
				  }
			  }
		  },
		  chord: {
			  padding: 4,
			  itemStyle: {
				  normal: {
					  lineStyle: {
						  width: 1,
						  color: 'rgba(128, 128, 128, 0.5)'
					  },
					  chordStyle: {
						  lineStyle: {
							  width: 1,
							  color: 'rgba(128, 128, 128, 0.5)'
						  }
					  }
				  },
				  emphasis: {
					  lineStyle: {
						  width: 1,
						  color: 'rgba(128, 128, 128, 0.5)'
					  },
					  chordStyle: {
						  lineStyle: {
							  width: 1,
							  color: 'rgba(128, 128, 128, 0.5)'
						  }
					  }
				  }
			  }
		  },
		  gauge: {
			  startAngle: 225,
			  endAngle: -45,
			  axisLine: {
				  show: true,
				  lineStyle: {
					  color: [[0.2, '#86b379'], [0.8, '#68a54a'], [1, '#408829']],
					  width: 8
				  }
			  },
			  axisTick: {
				  splitNumber: 10,
				  length: 12,
				  lineStyle: {
					  color: 'auto'
				  }
			  },
			  axisLabel: {
				  textStyle: {
					  color: 'auto'
				  }
			  },
			  splitLine: {
				  length: 18,
				  lineStyle: {
					  color: 'auto'
				  }
			  },
			  pointer: {
				  length: '90%',
				  color: 'auto'
			  },
			  title: {
				  textStyle: {
					  color: '#333'
				  }
			  },
			  detail: {
				  textStyle: {
					  color: 'auto'
				  }
			  }
		  },
		  textStyle: {
			  fontFamily: 'Arial, Verdana, sans-serif'
		  }
	  };

		  
		  
		  
		  
		  
		  
    	if ($('#fac_chart').length ){  
  		  
  		  var echartDonut = echarts.init(document.getElementById('fac_chart'), theme);
  		  
  		  echartDonut.setOption({
  			tooltip: {
  			  trigger: 'item',
  			  formatter: "{a} <br/>{b} : {c} ({d}%)"
  			},
  			calculable: true,
  			legend: {
  			  x: 'center',
  			  y: 'bottom',
  			  data: [
  				<c:forEach var="vo" items="${fa}" varStatus="status">
				'${vo.faculty}',
  				</c:forEach>
  				  
  				  ]
  			},
  			toolbox: {
  			  show: true,
  			  feature: {
  				magicType: {
  				  show: true,
  				  type: ['pie', 'funnel'],
  				  option: {
  					funnel: {
  					  x: '25%',
  					  width: '50%',
  					  funnelAlign: 'center',
  					  max: 1548
  					}
  				  }
  				},
  				restore: {
  				  show: true,
  				  title: "새로고침"
  				},
  				saveAsImage: {
  				  show: true,
  				  title: "이미지로 저장"
  				}
  			  }
  			},
  			series: [{
  			  name: '단과별 점수 백분율',
  			  type: 'pie',
  			  radius: ['35%', '55%'],
  			  itemStyle: {
  				normal: {
  				  label: {
  					show: true
  				  },
  				  labelLine: {
  					show: true
  				  }
  				},
  				emphasis: {
  				  label: {
  					show: true,
  					position: 'center',
  					textStyle: {
  					  fontSize: '14',
  					  fontWeight: 'normal'
  					}
  				  }
  				}
  			  },
  			  data: [
  				<c:forEach var="vo" items="${fa}" varStatus="status">
  				  {
  				value: ${vo.avgScore},
  				name: '${vo.faculty}',
  			  }, 
  			</c:forEach>
  			  
  			  ]
  			}]
  		  });

  		} 
    	
    	
    	
    	
    	
    	
    	
    	
    	if ($('#mg_chart').length ){  
			  
			  var echartPie = echarts.init(document.getElementById('mg_chart'), theme);

			  echartPie.setOption({
				tooltip: {
				  trigger: 'item',
				  formatter: "{a} <br/>{b} : {c} ({d}%)"
				},
				legend: {
				  x: 'center',
				  y: 'bottom',
				  data: [
					<c:forEach var="vo" items="${genders}">
						'${vo.lecturename}',
		  			</c:forEach>
					  
					  ]
				},
				toolbox: {
				  show: true,
				  feature: {
					magicType: {
					  show: true,
					  type: ['pie', 'funnel'],
					  option: {
						funnel: {
						  x: '25%',
						  width: '50%',
						  funnelAlign: 'left',
						  max: 1548
						}
					  }
					},
					restore: {
					  show: true,
					  title: "새로고침"
					},
					saveAsImage: {
					  show: true,
					  title: "이미지로 저장"
					}
				  }
				},
				calculable: true,
				series: [{
				  name: '강의별 평균 학점',
				  type: 'pie',
				  radius: '55%',
				  center: ['50%', '48%'],
				  data: [
					  
					  <c:forEach var="vo" items="${genders}" varStatus="status">
					 {
					value:${vo.avgScore},
					name: '${vo.lecturename}'
				 	 }, 
				 	</c:forEach>
				  ]
				}]
			  });

			  var dataStyle = {
				normal: {
				  label: {
					show: false
				  },
				  labelLine: {
					show: false
				  }
				}
			  };

			  var placeHolderStyle = {
				normal: {
				  color: 'rgba(0,0,0,0)',
				  label: {
					show: false
				  },
				  labelLine: {
					show: false
				  }
				},
				emphasis: {
				  color: 'rgba(0,0,0,0)'
				}
			  };

			} 
    	
    	
    	
    	
    	
		if ($('#lvl_chart').length ){ 
			  
			  var echartBar = echarts.init(document.getElementById('lvl_chart'), theme);

			  echartBar.setOption({
				title: {
					text: '학년별 분류',
				},
				tooltip: {
				  trigger: 'axis'
				},
				legend: {
				  x: 100,
				  data: [

						<c:forEach var="vo" items="${gr}" varStatus="status">
						'${vo.grade}',
						</c:forEach>
					  			
					  
					  
					  ]
				},
				toolbox: {
					  show: true,
					  feature: {
						restore: {
						  show: true,
						  title: "새로고침"
						},
						saveAsImage: {
						  show: true,
						  title: "이미지로 저장"
						}
					  }
					},
				calculable: true,
				xAxis: [{
				  type: 'value',
				  boundaryGap: [0, 0.01]
				}],
				yAxis: [{
				  type: 'category',
				  data: ['학년 별']
				}],
				series: [
					

					<c:forEach var="vo" items="${gr}" varStatus="status">
					{
				  name: '${vo.grade}학년',
				  type: 'bar',
				  data: [${vo.avgScore}]
				}, 
				
				</c:forEach>	
				]
			  });

			} 
    	
    	
    	
    	
    	
    	
    	
    	if ($('#major_chart').length ){
			  
			  var echartBar = echarts.init(document.getElementById('major_chart'), theme);

			  echartBar.setOption({
				title: {
				  text: '',
				
				},
				tooltip: {
				  trigger: 'axis'
				},
				legend: {
				  data: [
					  	<c:forEach var="vo" items="${ma}" varStatus="status">
							'${vo.majorName}',
						</c:forEach>
					  ]
				},
				toolbox: {
				  show: false
				},
				calculable: false,
				xAxis: [{
				  type: 'category',
				  data: ['학과별 평균점수']
				}],
				yAxis: [{
				  type: 'value'
				}],
				series: [
					<c:forEach var="vo" items="${ma}" varStatus="status">	
					
					{
				  name: '${vo.majorName}',
				  type: 'bar',
				  data: [${vo.avgScore}],
				  markPoint: {
					data: [{
					  type: 'max',
					  name: '최고 평균'
					}, {
					  type: 'min',
					  name: '최저 평균'
					}]
				  },
				  markLine: {
					data: [{
					  type: 'average',
					  name: '평균점수'
					}]
				  }
				},
				
				</c:forEach>
	
				
				]
			  });

		}
    	
    	
    	
    	
    	
    });
</script>




</body>

</html>
