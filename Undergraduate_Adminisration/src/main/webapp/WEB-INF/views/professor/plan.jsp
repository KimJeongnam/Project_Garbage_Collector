<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <%@ include file="../Basic/settings.jsp" %>
    <title>자바대학교 학사관리시스템</title>
</head>
<body class="nav-md">
    
<c:if test="${!empty vo1}">
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
                            <h2 id="lecT"></h2>
                            <div class="btn-group" style="float: right">
                            	<select id="lecture-selector" onchange="leC();" class="form-control">
                            		<c:forEach var="vo1" items="${vo1}" varStatus="status">
                            			<option selected="selected" value="${vo1.lectureName}">${vo1.lectureName }</option>
                                    </c:forEach>
                                    <c:forEach var="vo2" items="${vo2}" varStatus="status">
                                    	<option value="${vo2.lectureName}">${vo2.lectureName }</option>
                                    </c:forEach>
                            	</select>
                            	
                                <%-- <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button" > 강의 선택 <span class="caret"></span> </button>
                                <ul class="dropdown-menu">
                                    <c:forEach var="vo1" items="${vo1}" varStatus="status">
                                        <li onclick="leC('${vo1.lectureName}');"><a href="#" id="lec">${vo1.lectureName}</a>
                                        </li>
                                    </c:forEach>
                                    <c:forEach var="vo2" items="${vo2}" varStatus="status">
                                        <li onclick="leC('${vo2.lectureName}');"><a href="#" onclick="class_click('${vo2.lectureName}')">${vo2.lectureName}</a>
                                        </li>
                                    </c:forEach>
                                </ul> --%>
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
</c:if>

        
        <script>
        
            /* (function() {
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
                        $('#lecT').text(firstLec);
                    },
                    error: function() {
                		swal({
    						text:"Error! firstLec();",
    						icon: "error",
    						button:"확인",
    					});
                    }
                });
            })(); */
            //
            (function() {
                var obj = new Object();
                var firstLec = $('#lecture-selector').val(); //첫페이지 강의명 값
                obj.firstLec = firstLec;
                <c:if test="${lecName != null}">
                obj.firstLec = '${lecName}';
                $('#lecture-selector').val('${lecName}');
                $('#lecT').text('${lecName}');
            	</c:if>
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
            
            function leC() {
            	<c:if test="${lecName == null}">
           		$('#lecT').text($('#lecture-selector').val());
           	 	</c:if>
           		var obj = new Object();
                obj.lecName = $('#lecture-selector').val();
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

            
            
            
           /*  function class_click(lecName) {
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
            } */

            /* $(function() {
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
            }); */
            
            /* function leC(lecName) {
            	 $('#lecT').text(lecName);
            } */
           
      
        </script>
<c:if test="${empty vo1}">
<%@ include file="../Basic/footer.jsp" %>
    <script type="text/javascript">
    swal({
		text:"개강한 수업이 없습니다. 이전 페이지로 돌아갑니다.",
		button:"확인",
	}).then((value)=>{
		if(value)
			history.back();
	});

    </script>
</c:if>
</body>

</html>
