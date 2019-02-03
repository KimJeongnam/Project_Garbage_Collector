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
                    <h3>마이페이지</h3>
                </div>


                <div class="clearfix"></div>

                <div class="row">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>프로필</h2>
                                 <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2><i class="fa fa-bars"></i> 개인정보</h2>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">


                                            <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">개인정보</a>
                                                    </li>
                                                    <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">교수소개</a>
                                                    </li>
                                                    <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">이력사항</a>
                                                    </li>
                                                </ul>




                                                <div id="myTabContent" class="tab-content">
                                                
                                                <!-- 자기소개  -->
                                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                <div class="col-md-12 col-sm-12 col-xs-12 text-center">
                        			<ul class="pagination pagination-split">
                                        <li><button type="button" onclick="window.location.href='${authPath }/list'" class="btn btn-round btn-primary">내 강의 모든학생</button></li>
                                    </ul>
								  <c:forEach var="vo1" items="${myClass}">
                                    <ul class="pagination pagination-split">
                                        <li><button type="button" class="btn btn-round btn-primary">${vo1.lectureName}</button></li>
                                    </ul>
                                  </c:forEach> 
                            
                                </div>

                                <div class="clearfix"></div>
  							
  							<c:forEach var="vo2" items="${list}">
                                <div class="col-md-3 col-sm-3 col-xs-12 profile_details">
                                    <div class="well profile_view">
                                        <div class="col-sm-12" style="height:200px;">
                                      <p><strong>듣는 과목명????</strong></p>
                                            <div class="left col-xs-7">
                                                <h2>${vo2.userName}</h2> 
                                                <ul class="list-unstyled">
                                                    <li><i class="fa fa-phone"> &nbsp; &nbsp;</i>${vo2.userCellNum}</li>
                                                    <li><i class="fa fa-send"> &nbsp; &nbsp;</i>${vo2.userEmail}</li>
                                                </ul>
                                            </div>
                                            <div class="right col-xs-5 text-center">
                                                <img src="${staticPath}${vo2.userImage}" alt="" class="img-circle img-responsive">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 bottom text-center">
                                            <div class="col-xs-12 col-sm-6 emphasis">
                                            		<p><strong>${vo2.grade} 학년&nbsp;</strong>&nbsp;${vo2.faculty }&nbsp;${vo2.majorName}</p>
                                            </div>
                                            
                                            
                                            <div class="col-xs-12 col-sm-6 emphasis">

                                                <!-- id만 compose 입력하면 메세지창 뜨으으음 갸꿀!!!!-->
                                                <button id="compose" type="button" class="btn btn-success btn-xs"><i class="fa fa-comments-o">&nbsp;&nbsp;메세지&nbsp;&nbsp;
                                                    </i> </button>
                                                <button type="button" onclick="window.location.href='${authPath }/score'" class="btn btn-primary btn-xs">
                                                    <i class="fa fa-user"> </i> &nbsp;학점입력&nbsp;&nbsp;
                                                </button>
                                                
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                                                    </div>
													<!-- 기본정보 끝  -->

	
													<!-- 자기소개  -->
                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
    
                                                    </div>
                                                    
													<!-- 자기소개  끝 -->


													<!-- 이력사항 -->
                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">



      
                                                    </div>
                                                    <!-- 이력사항 끝 -->
                                                    
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    <!-- /page content -->




    <%@ include file="../Basic/footer.jsp" %>

    <script type="text/javascript">
        $(function() {
        	<%@ include file="../Basic/docReadyScripts.jsp" %>
        });

    </script>
</body>

</html>
