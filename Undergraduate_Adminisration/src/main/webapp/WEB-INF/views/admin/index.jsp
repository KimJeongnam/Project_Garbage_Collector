<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@ include file="../Basic/settings.jsp" %>
<title>Insert title here</title>
</head>
<body class="nav-md">
	<%@ include file="../Basic/navbar.jsp" %>
	
			<!-- page content -->
            <div class="right_col" role="main">
                <div class="row tile_count">
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-users"></i> 총 학생 수</span>
              <c:forEach items="${s_t}" var="vo">
              <div class="count">${vo.total}</div>
              </c:forEach>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-users"></i> 총 직원 수</span>
               <c:forEach items="${u_t}" var="vo">
              <div class="count">${vo.total}</div>
              </c:forEach>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-university"></i> 총 교수 인원 수</span>
              <c:forEach items="${p_t}" var="vo">
              <div class="count">${vo.total}</div>
              </c:forEach>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-female"></i> 총 여자 학생 수</span>
               <c:forEach items="${g_t}" var="vo">
              <div class="count">${vo.total}</div>
              </c:forEach>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-male"></i> 총 남자 학생 수</span>
               <c:forEach items="${m_t}" var="vo">
              <div class="count">${vo.total}</div>
              </c:forEach>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-mortar-board"></i> 총 강의 수</span>
               <c:forEach items="${l_t}" var="vo">
              <div class="count">${vo.total}</div>
              </c:forEach>
            </div>
          </div>
          
          
          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="dashboard_graph">
                <div class="row x_title">
                  <div class="col-md-6">
                    <h3> 매달 총 급여 지급 내역 <small>매달 급여 총액</small></h3>
                  </div>
                </div>


					<!-- 차트 -->
                <div class="col-md-9 col-sm-9 col-xs-12">
                   <div id="monthPay" style="height:350px;"></div>
                </div>
                
                
                <div class="col-md-3 col-sm-3 col-xs-12 bg-white">
                  <div class="x_title">
                    <h2>최고 급여 직원 4인</h2>
                    <div class="clearfix"></div>
                  </div>

                  <div class="col-md-12 col-sm-12 col-xs-6">
                     <c:forEach items="${monthPayTop}" var="vo">
                    <div>
                      <p>${vo.userName }</p>
                      <div class="">
                        <div class="progress progress_sm" style="width: 76%;">
                          <div class="progress-bar bg-green" role="progressbar" aria-valuemin="0" aria-valuemax="7500000" data-transitiongoal="${vo.personnelTotalPay}"><h2><fmt:formatNumber value="${vo.personnelTotalPay}" pattern="#,###" />원</h2></div>
                        </div>
                      </div>
                    </div>
     				</c:forEach>
                  </div>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
          </div>
          <br />
          
          
             
          
          
          
          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="dashboard_graph">
                <div class="row x_title">
                  <div class="col-md-6">
                    <h3>학생별 평균점수 분포도 <small>모든 학생 정보 수렴</small></h3>
                  </div>
                </div>



						<!-- 차트 -->
                <div class="col-md-9 col-sm-9 col-xs-12">
                   <div id="score_scatter" style="height:350px;"></div>
                </div>
                
                
                
                <div class="col-md-3 col-sm-3 col-xs-12 bg-white">
                  <div class="x_title">
                    <h2>최고 평점 학생 4인</h2>
                    <div class="clearfix"></div>
                  </div>

                  <div class="col-md-12 col-sm-12 col-xs-6">
                  
                  <c:forEach items="${nameAvgTop}" var="vo">
                    <div>
                      <p>${vo.userName }</p>
                      <div class="">
                        <div class="progress progress_sm" style="width: 76%;">
                          <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="${vo.avgScore}"><h2>${vo.avgScore}점</h2></div>
                        </div>
                      </div>
                    </div>
                   </c:forEach>
                   
                  </div>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>

          </div>
          <br />
          
          
             
          
            </div>
           
            <!-- /page content -->
            
	<%@ include file="../Basic/footer.jsp" %>
	
	
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
			  
			  
			  
			  
			  
			  
			  
			  
			  if ($('#monthPay').length ){ 
				  
				  var echartLine = echarts.init(document.getElementById('monthPay'), theme);

				  echartLine.setOption({
					title: {
					  text: '월 급여 지급내역',
					  subtext: '매달 총액'
					},
					tooltip: {
					  trigger: 'axis'
					},
					legend: {
					  x: 220,
					  y: 40,
					  data: [
						  
						  '월 지급 총액']
					},
					toolbox: {
					  show: true,
					  feature: {
						magicType: {
						  show: true,
						  title: {
							line: 'Line',
							bar: 'Bar',
							stack: 'Stack',
							tiled: 'Tiled'
						  },
						  type: ['line', 'bar', 'stack', 'tiled']
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
					xAxis: [{
					  type: 'category',
					  boundaryGap: false,
					  data: [
						  <c:forEach var="vo" items="${monthPayTotal}" varStatus="status">
						  '${vo.imputedYear}',
						  </c:forEach>
							]
					}],
					yAxis: [{
					  type: 'value'
					}],
					series: [{
					  name: '급여 총액',
					  type: 'line',
					  smooth: true,
					  itemStyle: {
						normal: {
						  areaStyle: {
							type: 'default'
						  }
						}
					  },
					  data: [
						  <c:forEach var="vo" items="${monthPayTotal}" varStatus="status">
						  ${vo.totalAmount},
						  </c:forEach>
						  ]
					},{
						  name: '기본급 총액',
						  type: 'line',
						  smooth: true,
						  itemStyle: {
							normal: {
							  areaStyle: {
								type: 'default'
							  }
							}
						  },
						  data: [
							  <c:forEach var="vo" items="${subPay}" varStatus="status">
							  ${vo.basicP},
							  </c:forEach>
							  ]
						},
						{
							  name: '식대 총액',
							  type: 'line',
							  smooth: true,
							  itemStyle: {
								normal: {
								  areaStyle: {
									type: 'default'
								  }
								}
							  },
							  data: [
								  <c:forEach var="vo" items="${subPay}" varStatus="status">
								  ${vo.foodP},
								  </c:forEach>
								  ]
							},
							{
								  name: '차량유지비 총액',
								  type: 'line',
								  smooth: true,
								  itemStyle: {
									normal: {
									  areaStyle: {
										type: 'default'
									  }
									}
								  },
								  data: [
									  <c:forEach var="vo" items="${subPay}" varStatus="status">
									  ${vo.vcost},
									  </c:forEach>
									  ]
								},{
									  name: '초과근무 수당 총액',
									  type: 'line',
									  smooth: true,
									  itemStyle: {
										normal: {
										  areaStyle: {
											type: 'default'
										  }
										}
									  },
									  data: [
										  <c:forEach var="vo" items="${subPay}" varStatus="status">
										  ${vo.extraP},
										  </c:forEach>
										  ]
									}
					]
				  });

				} 
				  
			  
			  
			  
			  
				  
				if ($('#score_scatter').length ){ 
				  
				  var echartScatter = echarts.init(document.getElementById('score_scatter'), theme);

				  echartScatter.setOption({
					title: {
					  text: '학과별 개인 평균 점수',
					  
					},
					tooltip: {
					  trigger: 'axis',
					  showDelay: 0,
					  axisPointer: {
						type: 'cross',
						lineStyle: {
						  type: 'dashed',
						  width: 1
						}
					  }
					},
					legend: {
					  data: [
						  <c:forEach var="vo" items="${facStdNameAvg}" varStatus="status">
						  '${vo.majorName}',
						  </c:forEach>
						  
						  ]
					},
					toolbox: {
					  show: true,
					  feature: {
						saveAsImage: {
						  show: true,
						  title: "이미지로 저장"
						}
					  }
					},
					xAxis: [{
					  type: 'value',
					  scale: true,
					  axisLabel: {
						formatter: '{value} 학년'
					  }
					}],
					yAxis: [{
					  type: 'value',
					  scale: true,
					  axisLabel: {
						formatter: '{value} 점'
					  }
					}],
					series: [
						
						
						  <c:forEach var="vo" items="${facStdNameAvg}" varStatus="status">
					{
					  name:  '${vo.majorName}#${status.index}',
					  type: 'scatter',
					  tooltip: {
						trigger: 'item',
						formatter: function(params) {
						  if (params.value.length > 1) {
							return params.seriesName + ' :<br/>' + params.value[0] + '학년 ' + params.value[1] + '점 ';
						  } else {
							return params.seriesName + ' :<br/>' + params.name + ' : ' + params.value + '점 ';
						  }
						}
					  },
					  data: [
							[${vo.grade}, ${vo.avgScore}],
					  ],
					  markPoint: {
						data: [{
						  type: 'max',
						  name: '평균'
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