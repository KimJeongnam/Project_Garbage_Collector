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
                <h3>과제관리<small> 교수화면</small></h3>
            </div>

            <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="이름을 입력하세요">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">검색</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>강의  과제 관리</h2>

                        <div class="btn-group" style="float: right">
                            <select class="form-control input-sm"
								id="mystatus"
								onchange="p_reportlist(${userNumber}),re_contentform(${userNumber})">
									<c:forEach var="dto" items="${vo}">
										<option value="${dto.lecCode}">${dto.lectureName}</option>
									</c:forEach>
							</select>
                        </div>
                        




                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">
                    <div id="Personnel" class=""></div>
                    <div id="Personnel2" class=""> </div>
                    <div id="re_contentform" class=""> </div>
                    
                   

                        <%-- <div class="col-md-9 col-sm-9 col-xs-12">

                            <ul class="stats-overview">
                                <li>
                                    <span class="name"> 총 수강인원 </span>
                                    <span class="value text-success"> ${cnt} </span>
                                </li>
                                <li>
                                    <span class="name"> 과제 제출 인원 </span>
                                    <span class="value text-success"> 3 </span>
                                </li>
                                <li class="hidden-phone">
                                    <span class="name">과제 미제출 인원</span>
                                    <span class="value text-success"> 27 </span>
                                </li>
                            </ul>
                            <div>

                                <h4>제출리스트</h4>

                                <!-- end of user messages -->
                                <ul class="messages">

                                    <li>
                                        <img src="/project/resources/images/img.jpg" class="avatar" alt="Avatar">
                                        <div class="message_date">
                                            <h3 class="date text-info">24</h3>
                                            <p class="month">1월</p>
                                        </div>
                                        <div class="message_wrapper">
                                            <h4 class="heading">김설현</h4>
                                            <blockquote class="message">운동역학의 이해 제출합니다.</blockquote>
                                            <br />
                                            <p class="url">
                                                <span class="fs1 text-info" aria-hidden="true" data-icon="?"></span>
                                                <a href="window.location='${staticPath }file/이름.docx'"><i class="fa fa-paperclip"></i> 2019380527 김설현 운동역학의 이해.doc </a>
                                            </p>
                                        </div>
                                    </li>
                                    <li>
                                        <img src="/project/resources/images/1.jpg" class="avatar" alt="Avatar">
                                        <div class="message_date">
                                            <h3 class="date text-info">24</h3>
                                            <p class="month">1월</p>
                                        </div>
                                        <div class="message_wrapper">
                                            <h4 class="heading">김설현</h4>
                                            <blockquote class="message">운동역학의 이해 제출합니다.</blockquote>
                                            <br />
                                            <p class="url">
                                                <span class="fs1 text-info" aria-hidden="true" data-icon="?"></span>
                                                <a href="#"><i class="fa fa-paperclip"></i> 2019380527 김설현 운동역학의 이해.doc </a>
                                            </p>
                                        </div>
                                    </li>
                                    <li>
                                        <img src="/project/resources/images/1.jpg" class="avatar" alt="Avatar">
                                        <div class="message_date">
                                            <h3 class="date text-info">24</h3>
                                            <p class="month">1월</p>
                                        </div>
                                        <div class="message_wrapper">
                                            <h4 class="heading">김설현</h4>
                                            <blockquote class="message">운동역학의 이해 제출합니다.</blockquote>
                                            <br />
                                            <p class="url">
                                                <span class="fs1 text-info" aria-hidden="true" data-icon="?"></span>
                                                <a href="#"><i class="fa fa-paperclip"></i> 2019380527 김설현 운동역학의 이해.doc </a>
                                            </p>
                                        </div>
                                    </li>
                                </ul>
                                <!-- end of user messages -->


                            </div>


                        </div> --%>

                        <!-- start project-detail sidebar -->
                        <!-- <div class="col-md-3 col-sm-3 col-xs-12">

                            <section class="panel">

                                <div class="x_title">
                                    <h2>운동역학</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="panel-body">
                               <div class="x_panel">
                <div class="x_title">
                  <h2>과제리스트 </h2>
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
                  <ul class="list-unstyled timeline">
                    <li>
                      <div class="block" onclick="aaa();">
                        <div class="tags">
                          <a href="" class="tag">
                            <span>첫번째 과제</span>
                          </a>
                        </div>
                        <div class="block_content">
                          <h2 class="title">
                                          <a>과제 제목</a>
                                      </h2>
                          <p class="excerpt">과제 내용</p>
                          
                        </div>
                      </div>
                      <div style="float: right; margin-top: 20px;">
                       <button type="button" class="btn btn-round btn-primary">Primary</button>
                        <button type="button" class="btn btn-round btn-danger">Danger</button>
                         <div class="text-center mtop20">
                                        <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg1">과제 업로드</button>
                                        <div class="modal fade bs-example-modal-lg1" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">

                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                        </button>
                                                        <h4 class="modal-title" id="myModalLabel">참고자료 업로드</h4>
                                                    </div>
                                                    <div class="modal-body">

                                                        <div class="x_panel">
                  <div class="x_title">
                    <h2>Form validation <small>sub title</small></h2>
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

                    <form class="form-horizontal form-label-left" novalidate>

                      <p>For alternative validation library <code>parsleyJS</code> check out in the <a href="form.html">form page</a>
                      </p>
                      <span class="section">Personal Info</span>

                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">강의 명 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="both name(s) e.g Jon Doe" required="required" type="text">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">과제 명 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="email" id="email" name="email" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">마감 일 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="email" id="email2" name="confirm_email" data-validate-linked="email" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">과제 내용 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <textarea id="textarea" required="required" name="textarea" style="height: 200px;" class="form-control col-md-7 col-xs-12"></textarea>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                                                        <button type="button" class="btn btn-primary">저장</button>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target=".bs-example-modal-lg">&nbsp;&nbsp;과제내용 수정&nbsp;&nbsp;</button>

                                        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">

                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                        </button>
                                                        <h4 class="modal-title" id="myModalLabel2">과제내용 수정</h4>
                                                    </div>
                                                    <div class="modal-body">

                                                        <textarea id="message" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="300" data-parsley-minlength-message="20자 이상 작성하여야 합니다." data-parsley-validation-threshold="10"></textarea>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                                                        <button type="button" class="btn btn-primary">저장</button>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                        
                       </div>
                    </li>
                  </ul>

                </div>
              </div>
                                   <h3 class="green"><i class="fa fa-university"></i> 1주차 과제</h3>

                                    <p>1주차 운동역학의 이해.
                                        운동역학 p.1 - p.134 까지 읽고 운동역학의 정의와 개념, 목적, 필요성에 대해 서술하고 운동역학의 스포츠 적용 및 연구영역에 대해 자세히 서술하시오. <br><br>
                                        한글 /폰트 크기 11 / 굴림 / 개요 를 준수.
                                    </p>
                                    <br />

                                    <div class="project_detail">

                                        <p class="title">교수</p>
                                        <p>정치호</p>
                                        <p class="title">강의</p>
                                        <p>운동역학</p>
                                    </div>

                                    <br />
                                    <h5>참고자료</h5>
                                    <ul class="list-unstyled project_files">
                                        <li><a href=""><i class="fa fa-file-word-o"></i> 운동역학.docx</a>
                                        </li>
                                        <li><a href=""><i class="fa fa-file-pdf-o"></i> 운동역학의 스포츠적용.pdf</a>
                                        </li>
                                        <li><a href=""><i class="fa fa-mail-forward"></i> 운동역학의 역사.mln</a>
                                        </li>
                                        <li><a href=""><i class="fa fa-picture-o"></i> 이미지.png</a>
                                        </li>

                                    </ul>
                                    <br />

                                    Large modal
                                    <div class="text-center mtop20">
                                        <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg1">참고자료 업로드</button>
                                        modal 여러개 사용시 위 data-target 과 밑 class 이름을 같게 수정하셈!!
                                        <div class="modal fade bs-example-modal-lg1" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">

                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                        </button>
                                                        <h4 class="modal-title" id="myModalLabel">참고자료 업로드</h4>
                                                    </div>
                                                    <div class="modal-body">

                                                        <form action="form_upload.html" class="dropzone"></form>


                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                                                        <button type="button" class="btn btn-primary">저장</button>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target=".bs-example-modal-lg">&nbsp;&nbsp;과제내용 수정&nbsp;&nbsp;</button>

                                        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">

                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                                        </button>
                                                        <h4 class="modal-title" id="myModalLabel2">과제내용 수정</h4>
                                                    </div>
                                                    <div class="modal-body">

                                                        <textarea id="message" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="300" data-parsley-minlength-message="20자 이상 작성하여야 합니다." data-parsley-validation-threshold="10"></textarea>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                                                        <button type="button" class="btn btn-primary">저장</button>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                </div> 
                            </section>

                        </div> -->
                        <!-- end project-detail sidebar -->

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
		p_reportlist('${userNumber}');
		re_contentform('${userNumber}');
		document.getElementById("Personnel1").style.display="none"
	});
 	 
 	
 	 function hideshow(reportcode) {
 		
 	  var x = document.getElementById("Personnel");
 	 	var y = document.getElementById("Personnel2");
 	 	
	  if (x.style.display === "none") {
	    x.style.display = "none";
	    y.style.display = "block";
	  } else {
	    x.style.display = "none";
	    y.style.display = "block";
	  }
	  
	  report_Personnel2(reportcode,$("#mystatus").val());
	  
	}
 	
 	 
	
	/* function p_reportlist(){
		
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "POST");
		form.setAttribute("action", "../professor/personnel");
		
		var cnt = 0;
		
		var field = document.createElement("input");
		field.setAttribute("hidden", "true");
		field.setAttribute("type", "text");
		field.setAttribute("name", "aaaaa");
		field.setAttribute("value", $('#mystatus').val());
		form.appendChild(field);
	
		document.body.appendChild(form);
		
		form.submit();
	} */
	
	
	
	</script>
</body>
</html>