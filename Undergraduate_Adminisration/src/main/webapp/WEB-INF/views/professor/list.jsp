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
                    <h3>내 강의 수강학생 목록</h3>
                </div>
                <div class="title_right">
                    <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                        <div class="input-group">
                            <input type="search" class="form-control" placeholder="검색할 이름을 적어주세요" onkeyup="searchStudent('${userNumber}')" id="searchStudent">
                            	<div id="divSuggest">
									<div id="suggestlist">
										<!-- 결과 출력 위치 -->
									</div>
								</div>
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">검색</button>
                            </span>
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
                                        <li role="presentation" class="active">
                                        <a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">All</a>
                                        </li>



                                        <c:forEach var="vo1" items="${myClass}" varStatus="status">
                                            <li role="presentation">
                                                <a href="#lec${status.index}" onclick="class_click('lec${status.index}', '${vo1.lectureName}')" role="tab" data-toggle="tab" aria-expanded="false">${vo1.lectureName}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>



                                    <div id="myTabContent" class="tab-content">

							


                                        <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                            <div class="col-md-12 col-sm-12 col-xs-12 text-center">
                                            </div>

                                            <div class="clearfix"></div>




                                            <c:forEach var="vo2" items="${list}">
                                                <div class="col-md-3 col-sm-3 col-xs-12 profile_details">
                                                    <div class="well profile_view">
                                                        <div class="col-sm-12" style="height:200px;">
                                                            <h2><strong>No. ${vo2.userNumber}</strong></h2>
                                                            <div class="left col-xs-7">
                                                                <h2>${vo2.userName}</h2>
                                                                ${vo2.userEngName}<br>
                                                                <ul class="list-unstyled">
                                                                    <li><i class="fa fa-phone"> &nbsp; &nbsp;</i>${vo2.userCellNum}</li>
                                                                    <li><i class="fa fa-send"> &nbsp; &nbsp;</i>${vo2.userEmail}</li>
                                                                </ul>

                                                            </div>
                                                            <div class="right col-xs-5 text-center">
                                                                <img src="${staticPath}${vo2.userImage}" alt="" class="img-circle img-responsive" style="height: 152px; width: 126px;">
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 bottom text-center">
                                                            <div class="col-xs-12 col-sm-6 emphasis">
                                                                <p><strong>${vo2.grade} 학년&nbsp;</strong>&nbsp;${vo2.faculty }&nbsp;${vo2.majorName}</p>
                                                            </div>


                                                            <div class="col-xs-12 col-sm-6 emphasis">

                                                                <!-- id만 compose 입력하면 메세지창 뜨으으음 갸꿀!!!!-->
                                                                <button id="compose" type="button" class="btn btn-success btn-xs"><i class="fa fa-comments-o">&nbsp;메세지&nbsp;
                                                                    </i> </button>
                                                                <button type="button" onclick="window.location.href='${authPath }/score'" class="btn btn-primary btn-xs">
                                                                    <i class="fa fa-user"> </i>학점입력
                                                                </button>


                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                        </div>


										
                                        <c:forEach var="vo1" items="${myClass}" varStatus="status">
                                            <div role="tabpanel" class="tab-pane fade" id="lec${status.index}" aria-labelledby="profile-tab">
											</div>
                                        </c:forEach>
		
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
    <!-- /page content -->



    <!-- /page content -->

    <%@ include file="../Basic/footer.jsp" %>

    <script type="text/javascript">
        function class_click(divid, lecName) {

            var obj = new Object();
            obj.lecName = lecName;
            
            
            if($('#'+divid)!= null){
            	
	            var jsonData = JSON.stringify(obj);
	            $.ajax({
	                url: '/project/professor/list/class_click',
	                type: 'POST',
	                data: jsonData,
	                contentType: 'application/json;charset=UTF-8',
	                success: function(data) {
	                   $('#'+divid).html(data);
	                },
	                error: function() {
	                	alert("Error! class_click();");
	                }
	            });
            }
        }

        
        function searchStudent(userNumber){
        	var obj = new Object();
        	obj.userNumber = userNumber;
        	
        	if($('searchStudent')[0].value.length > 0){
        		obj.keyword = $('searchStudent')[0].value;
        	}
        	
        	var jsonData = JSON.stringify(obj);
        	
        	$.ajax({
        		url: '/project/professor/list/searchStudent',
        		type: 'POST',
        		data : jsonData,
        		contentType : 'application/json;charset=UTF-8',
        		success : function(data){
        			if(data != null){
        				if($('#searchStudent')!= null)
        					$('#searchStudent').html(data);
        			}
        		},
        		error:function(){
        			alert("Error! searchStudent();");
        		}
        	});
        }
    </script>

</body>

</html>
