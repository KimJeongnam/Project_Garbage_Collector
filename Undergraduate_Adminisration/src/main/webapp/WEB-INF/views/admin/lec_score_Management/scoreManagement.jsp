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
                    <div id="graph_bar21" style="width:100%; height:280px;"></div>
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
                    <div id="graph_area21" style="width:100%; height:280px;"></div>
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
                     <div id="graph_line21" style="width:100%; height:300px;"></div>
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
                    <canvas id="lineChart21"></canvas>
                </div>
            </div>
        </div>
    </div>



    <!-- /page content -->

 <%@ include file="../../Basic/footer.jsp" %> 
<script>
    $(function() {
        if ($('#lineChart21').length) {
        	//학년별 학점평균
            var ctx = document.getElementById("lineChart21");
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

    $(function() {

        if (typeof(Morris) === 'undefined') {
            return;
        }
        console.log('init_morris_charts');
		//학과별 학점 평균
        if ($('#graph_bar21').length) {

            Morris.Bar({
                element: 'graph_bar21',
                data: [{
                        device: 'iPhone 4',
                        geekbench: 380
                    },
                    {
                        device: 'iPhone 4S',
                        geekbench: 655
                    },
                    {
                        device: 'iPhone 3GS',
                        geekbench: 275
                    },
                    {
                        device: 'iPhone 5',
                        geekbench: 1571
                    },
                    {
                        device: 'iPhone 5S',
                        geekbench: 655
                    },
                    {
                        device: 'iPhone 6',
                        geekbench: 2154
                    },
                    {
                        device: 'iPhone 6 Plus',
                        geekbench: 1144
                    },
                    {
                        device: 'iPhone 6S',
                        geekbench: 2371
                    },
                    {
                        device: 'iPhone 6S Plus',
                        geekbench: 1471
                    },
                    {
                        device: 'Other',
                        geekbench: 1371
                    }
                ],
                xkey: 'device',
                ykeys: ['geekbench'],
                labels: ['Geekbench'],
                barRatio: 0.4,
                barColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
                xLabelAngle: 35,
                hideHover: 'auto',
                resize: true
            });

        }

       

        if ($('#graph_area21').length) {
			//단과대별 학점 평균
            Morris.Area({
                element: 'graph_area21',
                data: [{
                        period: '2014 Q1',
                        iphone: 2666,
                        ipad: null,
                        itouch: 2647
                    },
                    {
                        period: '2014 Q2',
                        iphone: 2778,
                        ipad: 2294,
                        itouch: 2441
                    },
                    {
                        period: '2014 Q3',
                        iphone: 4912,
                        ipad: 1969,
                        itouch: 2501
                    },
                    {
                        period: '2014 Q4',
                        iphone: 3767,
                        ipad: 3597,
                        itouch: 5689
                    },
                    {
                        period: '2015 Q1',
                        iphone: 6810,
                        ipad: 1914,
                        itouch: 2293
                    },
                    {
                        period: '2015 Q2',
                        iphone: 5670,
                        ipad: 4293,
                        itouch: 1881
                    },
                    {
                        period: '2015 Q3',
                        iphone: 4820,
                        ipad: 3795,
                        itouch: 1588
                    },
                    {
                        period: '2015 Q4',
                        iphone: 15073,
                        ipad: 5967,
                        itouch: 5175
                    },
                    {
                        period: '2016 Q1',
                        iphone: 10687,
                        ipad: 4460,
                        itouch: 2028
                    },
                    {
                        period: '2016 Q2',
                        iphone: 8432,
                        ipad: 5713,
                        itouch: 1791
                    }
                ],
                xkey: 'period',
                ykeys: ['iphone', 'ipad', 'itouch'],
                lineColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
                labels: ['iPhone', 'iPad', 'iPod Touch'],
                pointSize: 2,
                hideHover: 'auto',
                resize: true
            });

        }

        
        if ($('#graph_line21').length) {
			//연도별 전교생 학점평균
            Morris.Line({
                element: 'graph_line21',
                xkey: 'year',
                ykeys: ['value'],
                labels: ['Value'],
                hideHover: 'auto',
                lineColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
                data: [{
                        year: '2012',
                        value: 20
                    },
                    {
                        year: '2013',
                        value: 10
                    },
                    {
                        year: '2014',
                        value: 5
                    },
                    {
                        year: '2015',
                        value: 5
                    },
                    {
                        year: '2016',
                        value: 20
                    }
                ],
                resize: true
            });

        }

    });

</script>




</body>

</html>
