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
        <div class="">
            <div class="page-title">
                <div class="title_left">
                    <h3> 주차별 강의 계획서 <small>강의 선택 후  작성</small></h3>
                </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
                <div class="col-md-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>총 강의 주차에 맞게 작성해주십시요.</h2>
                            <div class="btn-group" style="float: right">
                                <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button"> 강의 선택 <span class="caret"></span> </button>
                                <ul class="dropdown-menu">
                                    <c:forEach var="vo1" items="${vo1}" varStatus="status">
                                        <li><a href="#" id="lec">${vo1.lectureName}</a>
                                        </li>
                                    </c:forEach>
                                    <c:forEach var="vo2" items="${vo2}" varStatus="status">
                                        <li><a href="#" onclick="class_click('${vo2.lectureName}')">${vo2.lectureName}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>

                            <div class="clearfix"></div>
                        </div>
						
						
						
                        <div class="x_content">
                           <!-- ajax -->
                        </div>
                        
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /page content -->


    <%@ include file="../Basic/footer.jsp" %>
        
        <script>
        
            (function() {
                var obj = new Object();
                var firstLec = $('#lec').text(); //첫페이지 강의명 값
                obj.firstLec = firstLec;
                var jsonData = JSON.stringify(obj);

                $.ajax({
                    url: '/project/professor/plan/firstLec',
                    type: 'POST',
                    data: jsonData,
                    contentType: 'application/json;charset=UTF-8',
                    success: function(data) {
                        $('.x_content').html(data); //#x_content로 데이터를 뿌려라.

                    },
                    error: function() {
                		swal({
    						text:"Error! firstLec();",
    						icon: "error",
    						button:"확인",
    					});
                    }
                });
            })();

            function class_click(lecName) {
                var obj = new Object();
                obj.lecName = lecName;
                var jsonData = JSON.stringify(obj);

                $.ajax({
                    url: '/project/professor/plan/class_click',
                    type: 'POST',
                    data: jsonData,
                    contentType: 'application/json;charset=UTF-8',
                    success: function(data) {
                        $('.x_content').html(data);
                    },
                    error: function() {
    					swal({
    						text:"Error! class_click();",
    						icon: "error",
    						button:"확인",
    					});
                    }
                });
            }

            $(function() {
                $('#lec').click(function() {
                    var obj = new Object();
                    var firstLec = $('#lec').text(); //home-tab의 강의명 값
                    obj.firstLec = firstLec;
                    var jsonData = JSON.stringify(obj);
                    $.ajax({
                        url: '/project/professor/plan/firstLec',
                        type: 'POST',
                        data: jsonData,
                        contentType: 'application/json;charset=UTF-8',
                        success: function(data) {
                            $('.x_content').html(data); //#x_content로 데이터를 뿌려라.
                        },
                        error: function() {
        					swal({
        						text:"Error! firstLec();",
        						icon: "error",
        						button:"확인",
        					});
                        }
                    });
                });
            });

        </script>

</body>

</html>
