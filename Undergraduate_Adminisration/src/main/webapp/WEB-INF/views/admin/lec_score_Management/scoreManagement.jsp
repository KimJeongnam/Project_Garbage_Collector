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
        <div class="col-md-6 col-sm-6 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>학과별 학점 평균<small>???</small></h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div id="major_chart" style="width:100%; height:280px;"></div>
                </div>
            </div>
        </div>
    
        <div class="col-md-6 col-sm-6 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>단과대별 학점 평균<small>하..</small></h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div id="fac_chart" style="width:100%; height:280px;"></div>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>연도별 전교생 학점 평균<small>후..</small></h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                     <div id="all_chart" style="width:100%; height:300px;"></div>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>학년별 학점 평균<small>스바</small></h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <canvas id="lvl_chart"></canvas>
                </div>
            </div>
        </div>
    </div>



    <!-- /page content -->

 <%@ include file="../../Basic/footer.jsp" %> 
<script>
   

    $(function() {

        if (typeof(Morris) === 'undefined') {
            return;
        }
        console.log('init_morris_charts');
        if ($('#major_chart').length) {

            Morris.Bar({
                element: 'major_chart',
                data: [{
                			학과명: '간호학과',
                			평균점수: 66
                    },
                    {
                    		학과명: '수학교육과',
                    		평균점수: 88
                    },
                    {
                     	 	학과명: '체육교육과',
                       	 	평균점수: 75
                    },
                    {
                      	  	학과명: '연극학과',
                        	평균점수: 71
                    },
                    {
                        	학과명: '경영학과',
                        	평균점수: 65
                    },
                    {
                        	학과명: '물리학과',
                        	평균점수: 54
                    },
                    {
                        	학과명: '기계공학과',
                        	평균점수: 11
                    },
                    {
                        	학과명: '일본어학과',
                        	평균점수: 66
                    },
                    {
                        	학과명: '멀티미디어학과',
                        	평균점수: 47
                    },
                    {
                        	학과명: '컴퓨터공학과',
                        	평균점수: 71
                    }
                ],
                xkey: '학과명',
                ykeys: ['평균점수'],
                labels: ['평균점수'],
                barRatio: 0.4,
                barColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
                xLabelAngle: 35,
                hideHover: 'auto',
                resize: true
            });

        }
        
        if ($('#all_chart').length) {
            Morris.Line({
                element: 'all_chart',
                xkey: '연도',
                ykeys: ['평균학점'],
                labels: ['평균학점'],
                hideHover: 'auto',
                lineColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
                data: [{
                		연도: '2015',
                      	평균학점: 66
                    },
                    {
                    	연도: '2016',
                    	평균학점: 71
                    },
                    {
                    	연도: '2017',
                    	평균학점: 65
                    },
                    {
                    	연도: '2018',
                    	평균학점: 85
                    },
                    {
                    	연도: '2019',
                    	평균학점: 88
                    }
                ],
                resize: true
            });

        }

        
        if ($('#fac_chart').length) {
            Morris.Area({
                element: 'fac_chart',
                data: [{
                        기간범위: '2015 1학기',
                        경영대: 14,
                        사범대: 27,
                        체육대: 13,
                        자연대: 84,
                        예술대: 57,
                        공과대: 17
                    },
                    {
                        기간범위: '2015 2학기',
                        경영대: 81,
                        사범대: 52,
                        체육대: 13,
                        자연대: 84,
                        예술대: 55,
                        공과대: 16
                    },
                    {
                        기간범위: '2016 1학기',
                        경영대: 87,
                        사범대: 58,
                        체육대: 19,
                        자연대: 10,
                        예술대: 51,
                        공과대: 12
                    },
                    {
                        기간범위: '2016 2학기',
                        경영대: 34,
                        사범대: 47,
                        체육대: 57,
                        자연대: 64,
                        예술대: 77,
                        공과대: 87
                    },
                    {
                        기간범위: '2017 1학기',
                        경영대: 94,
                        사범대: 87,
                        체육대: 17,
                        자연대: 86,
                        예술대: 55,
                        공과대: 14
                    },
                    {
                        기간범위: '2017 2학기',
                        경영대: 83,
                        사범대: 52,
                        체육대: 11,
                        자연대: 80,
                        예술대: 70,
                        공과대: 87
                    },
                    {
                        기간범위: '2018 1학기',
                        경영대: 84,
                        사범대: 57,
                        체육대: 17,
                        자연대: 84,
                        예술대: 57,
                        공과대: 44
                    },
                    {
                        기간범위: '2018 2학기',
                        경영대: 84,
                        사범대: 88,
                        체육대: 66,
                        자연대: 44,
                        예술대: 20,
                        공과대: 66
                    },
                    {
                        기간범위: '2019 1학기',
                        경영대: 41,
                        사범대: 77,
                        체육대: 17,
                        자연대: 12,
                        예술대: 57,
                        공과대: 30
                    },
                    {
                        기간범위: '2019 2학기',
                        경영대: 84,
                        사범대: 57,
                        체육대: 77,
                        자연대: 84,
                        예술대: 57,
                        공과대: 55
                    
                    }
                ],
                xkey: '기간범위',
                ykeys: ['경영대','사범대','체육대','자연대','예술대','공과대'],
                lineColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
                labels: ['경영대', '사범대','체육대','자연대','예술대','공과대'],
                pointSize: 2,
                hideHover: 'auto',
                resize: true
            });

        }
        
        
    });

    
    $(function() {
        if ($('#lvl_chart').length) {
            var ctx = document.getElementById("lvl_chart");
            var lineChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ["2015년", "2016년", "2017년", "2018년", "2019년"],
                    datasets: [{
                        label: "1학년",
                        backgroundColor: "rgba(38, 185, 154, 0.31)",
                        borderColor: "rgba(38, 185, 154, 0.7)",
                        pointBorderColor: "rgba(38, 185, 154, 0.7)",
                        pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
                        pointHoverBackgroundColor: "#fff",
                        pointHoverBorderColor: "rgba(220,220,220,1)",
                        pointBorderWidth: 1,
                        data: [31, 74, 6, 39, 20]
                    }, {
                        label: "2학년",
                        backgroundColor: "rgba(3, 88, 106, 0.3)",
                        borderColor: "rgba(3, 88, 106, 0.70)",
                        pointBorderColor: "rgba(3, 88, 106, 0.70)",
                        pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
                        pointHoverBackgroundColor: "#fff",
                        pointHoverBorderColor: "rgba(151,187,205,1)",
                        pointBorderWidth: 1,
                        data: [82, 23, 66, 9, 99]
                    }, {
                        label: "3학년",
                        backgroundColor: "rgba(3, 88, 106, 0.3)",
                        borderColor: "rgba(3, 88, 106, 0.70)",
                        pointBorderColor: "rgba(3, 88, 106, 0.70)",
                        pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
                        pointHoverBackgroundColor: "#fff",
                        pointHoverBorderColor: "rgba(151,187,205,1)",
                        pointBorderWidth: 1,
                        data: [2, 73, 76, 69, 9]
                    }, {
                        label: "4학년 그 외",
                        backgroundColor: "rgba(3, 88, 106, 0.3)",
                        borderColor: "rgba(3, 88, 106, 0.70)",
                        pointBorderColor: "rgba(3, 88, 106, 0.70)",
                        pointBackgroundColor: "rgba(3, 88, 106, 0.70)",
                        pointHoverBackgroundColor: "#fff",
                        pointHoverBorderColor: "rgba(151,187,205,1)",
                        pointBorderWidth: 1,
                        data: [55, 63, 86, 90, 9]
                    }]
                },
            });

        }

    });
</script>




</body>

</html>
