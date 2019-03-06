<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <%@ include file="../Basic/settings.jsp" %>
    <title>자바대학교 학사관리시스템</title>
</head>


<c:if test="${!empty s_myClass}">

    <body class="nav-md">
        <%@ include file="../Basic/navbar.jsp" %>



        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3> 강의별 학점관리 <small>강의 선택 후 학생별 입력</small></h3>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-md-12">
                    <div class="x_panel">
                        <div class="x_content">


                            <div class="" role="tabpanel" data-example-id="togglable-tabs">

                                <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                    <c:forEach var="vo" items="${s_myClass}" varStatus="status">
		                                    	<li id="homt" role="presentation">
		                                            <a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab">${vo.lectureName}</a>
		                                        </li>
                                    </c:forEach>
                                    <c:forEach var="vo1" items="${v_myClass}" varStatus="status">
                                        <li role="presentation" id="tag_${vo1.lectureName}">
                                            <a id="other_tab${vo1.lectureName}" href="#lec${status.index}" onclick="class_click('${vo1.lectureName}')" role="tab" data-toggle="tab" >${vo1.lectureName}</a>
                                        </li>
                                    </c:forEach>

                                </ul>


                                <div id="tab_content1" class="tab-content">
                                    <!-- 목록 ajax -->
                                </div>
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
                
                var firstLec = $('#home-tab').text(); //home-tab의 강의명 값
                obj.firstLec = firstLec;
                <c:if test="${lecName != null}">
                obj.firstLec = '${lecName}';
                var firstClass = '${firstClass.lectureName}';
                if(firstLec == firstClass){
                	 $('#home-tab').attr('aria-expanded','true');
                     $('#homt').attr('class', 'active');
                }else{
                	 $('#other_tab${lecName}').attr('aria-expanded','true');
                     $('#tag_${lecName}').attr('class', 'active');
                }
            	</c:if>
            	
                <c:if test="${lecName == null}">
                $('#home-tab').attr('aria-expanded','true');
                $('#homt').attr('class', 'active');
            	</c:if>
            	
             	
                var jsonData = JSON.stringify(obj);

                $.ajax({
                    url: '/project/professor/score/firstLec',
                    type: 'POST',
                    data: jsonData,
                    contentType: 'application/json;charset=UTF-8',
                    success: function(data) {
                        $('#tab_content1').html(data); //#tab_content1로 데이터를 뿌려라.

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
                    url: '/project/professor/score/class_click',
                    type: 'POST',
                    data: jsonData,
                    contentType: 'application/json;charset=UTF-8',
                    success: function(data) {
                        $('#tab_content1').html(data);
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
                $('#home-tab').click(function() {
                    var obj = new Object();
                    var firstLec = $('#home-tab').text(); //home-tab의 강의명 값
                    obj.firstLec = firstLec;
                    var jsonData = JSON.stringify(obj);
                    $.ajax({
                        url: '/project/professor/score/firstLec',
                        type: 'POST',
                        data: jsonData,
                        contentType: 'application/json;charset=UTF-8',
                        success: function(data) {
                            $('#tab_content1').html(data); //#tab_content1로 데이터를 뿌려라.
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
</c:if>



<c:if test="${empty s_myClass}">
 <%@ include file="../Basic/footer.jsp" %>
    <script type="text/javascript">
        swal({
    		text:"학점입력기간이 아닙니다. 이전 페이지로 돌아갑니다.",
    		button:"확인",
    	}).then((value)=>{
    		if(value)
    			history.back();
    	});

    </script>
</c:if>
</html>
