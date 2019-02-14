<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <%@ include file="../Basic/settings.jsp" %>
    <title>Insert title here</title>
</head>
<c:if test="${empty s_myClass}">
<script type="text/javascript">
	alert("학점입력기간이 아닙니다. 이전 페이지로 돌아갑니다.");
	history.back();
</script>
</c:if>
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
                
                 
				<div class="title_right">
                    <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="검색할 이름을 적어주세요" id="tags" autocomplete="off" onkeyup="searchAjax();">
                            	<div id="search" class="autocomplete-suggestions" style="display: block; top: 33px; left: 14px; width: 190px; max-height: 300px; position: absolute; z-index: 5000;">
									검색부분
								</div>	 
						</div>
                    </div>
                </div>


            </div>
            <div class="clearfix"></div>
                <div class="col-md-12">
                    <div class="x_panel">
                        <div class="x_content">
                        
                        
                          <div class="" role="tabpanel" data-example-id="togglable-tabs">
                          
                                <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                    <c:forEach var="vo" items="${s_myClass}" varStatus="status">
                                        <li role="presentation" class="active">
                                        <a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">${vo.lectureName}</a>
                                        </li>
                                    </c:forEach>
                             		<c:forEach var="vo1" items="${v_myClass}" varStatus="status">
                                        <li role="presentation">
                                            <a href="#lec${status.index}" onclick="class_click('${vo1.lectureName}')" role="tab" data-toggle="tab" aria-expanded="false">${vo1.lectureName}</a>
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
        var firstLec = $('#home-tab').text();//home-tab의 강의명 값
        obj.firstLec = firstLec;
        var jsonData = JSON.stringify(obj);
        
        $.ajax({
            url: '/project/professor/score/firstLec',
            type: 'POST',
            data: jsonData,
            contentType: 'application/json;charset=UTF-8',
            success: function(data) {
               $('#tab_content1').html(data);//#tab_content1로 데이터를 뿌려라.
              
            },
            error: function() {
            	alert("Error! firstLec();");
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
                	alert("Error! class_click();");
                }
            });
    }
    
    $(function(){
        $('#home-tab').click(function(){
        	var obj = new Object();
            var firstLec = $('#home-tab').text();//home-tab의 강의명 값
            obj.firstLec = firstLec;
            var jsonData = JSON.stringify(obj);
            $.ajax({
                url: '/project/professor/score/firstLec',
                type: 'POST',
                data: jsonData,
                contentType: 'application/json;charset=UTF-8',
                success: function(data) {
                   $('#tab_content1').html(data);//#tab_content1로 데이터를 뿌려라.
                },
                error: function() {
                	alert("Error! firstLec();");
                }
            });
        });
    });
    
 		function searchAjax(){
			var search = $('#tags').val();//tag의 입력값
			if(search.length < 1){
				$('#search').empty(); return; //ajax 종료.
				}
			
			var obj = new Object();
			obj.search = search;
			
			var jsonData = JSON.stringify(obj);
			
			var availableTags = $.ajax({
				url : '/project/professor/score/search_score',
				type : 'POST',
				data : jsonData,
				contentType : 'application/json;charset=UTF-8',
				success : function(data) {
					$('#tab_content1').html(data);//성공할시 이곳으로 데이터를 뿌려라
				},
				error : function() {
					alert("Error! searchAjax()");
				}
			});
		} 
		
    </script>
</body>
</c:if>
</html>