<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart', 'bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {

        var chartDiv = document.getElementById('chart_div');

        var data = google.visualization.arrayToDataTable([
          ['년도', '지급장학금', '예산 장학금'],
          ['2016', 12000, 15000],
          ['2017', 11000, 15000],
          ['2018', 10000, 15000],
          ['2019', 18000, 15000],
        ]);

        var materialOptions = {
          width: 900,
          series: {
            0: { axis: 'distance' }, // Bind series 0 to an axis named 'distance'.
            1: { axis: 'brightness' } // Bind series 1 to an axis named 'brightness'.
          },
          axes: {
            y: {
              brightness: {side: 'right', label: '금액(원)'} // Right y-axis.
            }
          }
        };

        var classicOptions = {
          width: 900,
          series: {
            0: {targetAxisIndex: 0},
            1: {targetAxisIndex: 1}
          },
          title: 'Nearby galaxies - distance on the left, brightness on the right',
          vAxes: {
            // Adds titles to each axis.
            0: {title: 'parsecs'},
            1: {title: 'apparent magnitude'}
          }
        };

        function drawMaterialChart() {
          var materialChart = new google.charts.Bar(chartDiv);
          materialChart.draw(data, google.charts.Bar.convertOptions(materialOptions));
          button.innerText = 'Change to Classic';
          button.onclick = drawClassicChart;
        }

        function drawClassicChart() {
          var classicChart = new google.visualization.ColumnChart(chartDiv);
          classicChart.draw(data, classicOptions);
          button.innerText = 'Change to Material';
          button.onclick = drawMaterialChart;
        }

        drawMaterialChart();
    };
    </script>
<meta charset="UTF-8">
	<%@ include file="Basic/settings.jsp" %>
<title>Insert title here</title>
</head>
<body class="nav-md">
	<%@ include file="Basic/navbar.jsp" %>
	
			<!-- page content -->
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                        	<h1>장학 현황</h1>
                        </div>
                        <div class="title_right">
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                        	<div class="x_panel">
                        		<div class="x_content">
                        			<div class="col-md-offset-2 col-md-8" id="chart_div" style="width: 800px; height: 500px;"></div>
                        			<div class="x_panel fixed_height_320">
					                  <div class="x_title">
					                    <h2>Daily users <small>Sessions</small></h2>
					                    <ul class="nav navbar-right panel_toolbox">
					                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					                      </li>
					                      <li class="dropdown">
					                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
					                        <ul class="dropdown-menu" role="menu">
					                          <li><a href="#">Settings 1</a>
					                          </li>
					                          <li><a href="#">Settings 2</a>
					                          </li>
					                        </ul>
					                      </li>
					                      <li><a class="close-link"><i class="fa fa-close"></i></a>
					                      </li>
					                    </ul>
					                    <div class="clearfix"></div>
					                  </div>
					                  <div class="x_content">
					                  <table class="" style="width:100%">
					                    <tr>
					                      <th style="width:37%;">
					                        <p>Top 5</p>
					                      </th>
					                      <th>
					                        <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
					                          <p class="">학과</p>
					                        </div>
					                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
					                          <p class="">지급 금액</p>
					                        </div>
					                      </th>
					                    </tr>
					                    <tr>
					                      <td>
					                        <canvas id="canvas1" height="140" width="140" style="margin: 15px 10px 10px 0"></canvas>
					                      </td>
					                      <td>
					                        <table class="tile_info">
					                          <tr>
					                            <td>
					                              <p><i class="fa fa-square blue"></i>체육과학대 </p>
					                            </td>
					                            <td>$24.000.000</td>
					                          </tr>
					                          <tr>
					                            <td>
					                              <p><i class="fa fa-square green"></i>공과대 </p>
					                            </td>
					                            <td>$22.000.000</td>
					                          </tr>
					                          <tr>
					                            <td>
					                              <p><i class="fa fa-square purple"></i>인문대 </p>
					                            </td>
					                            <td>$18.000.000</td>
					                          </tr>
					                          <tr>
					                            <td>
					                              <p><i class="fa fa-square aero"></i>군대 </p>
					                            </td>
					                            <td>$17.000.000</td>
					                          </tr>
					                          <tr>
					                            <td>
					                              <p><i class="fa fa-square red"></i>한대 </p>
					                            </td>
					                            <td>$20.000.000</td>
					                          </tr>
					                        </table>
					                      </td>
					                    </tr>
					                  </table>
					                  </div>
					                </div>
                        		</div>
                        	</div>
						</div>
					</div>
                </div>
            </div>
            <!-- /page content -->
            
	<%@ include file="Basic/footer.jsp" %>
	
	<script type="text/javascript">
		$(function (){
			
		});
	</script>
</body>
</html>