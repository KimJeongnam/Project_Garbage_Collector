<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../Basic/settings.jsp"%>
<title>자바대학교 학사관리시스템</title>

<style>
.toggle-off {
	margin-bottom: 0px;
	margin-right: 0px;
}

<style>
.selcls { 
    padding: 9px; 
    border: solid 1px #517B97; 
    outline: 0; 
    background: -webkit-gradient(linear, left top, left 25, from(#FFFFFF), color-stop(4%, #CAD9E3), to(#FFFFFF)); 
    background: -moz-linear-gradient(top, #FFFFFF, #CAD9E3 1px, #FFFFFF 25px); 
    box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px; 
    -moz-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px; 
    -webkit-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px; 

    } 
   
</style>    
</style>
</head>
<body class="nav-md">
	<!-- page content -->
	<div class="col-md-3 col-sm-3 col-xs-12">

		<section class="panel">

			<div class="x_title">`
				<h2>운동역학</h2>
				<div class="clearfix"></div>
			</div>
			<div class="panel-body">
				<div class="x_panel">
					<div class="x_title">
						<h2>과제리스트</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
							</li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false"><i
									class="fa fa-wrench"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Settings 1</a></li>
									<li><a href="#">Settings 2</a></li>
								</ul></li>
							<li><a class="close-link"><i class="fa fa-close"></i></a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<ul class="list-unstyled timeline">
						<c:forEach var="task" items="${task}" varStatus="status">
							<li>
							
								<div class="block" >
									<div class="tags">
											<a class="tag" onclick="hideshow('${task.reportcode}');">	 <span> ${status.count} 번째 과제</span>	</a>
											<input type="hidden" class="code" id="coode" value="${task.reportcode}">			
									</div>
									<div class="block_content">
										<h2 class="title">
											<a>${task.reportName}</a>
										</h2>
										<p class="excerpt">${task.reportInfo}</p>

									</div>
								</div>
							
							</li>
							</c:forEach> 
						</ul>
								<div style="float: right; margin-top: 20px;">
									<div class="text-center mtop20">
										<button type="button" class="btn btn-sm btn-primary"
											data-toggle="modal" data-target=".bs-example-modal-lg1" onclick="reportlist()">과제
											업로드</button>
										<div class="modal fade bs-example-modal-lg1" tabindex="-1"
											role="dialog" aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">

													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">
															<span aria-hidden="true">×</span>
														</button>
														<h4 class="modal-title" id="myModalLabel">참고자료 업로드</h4>
													</div>
													<form action="re_insert" method="post" class="form-horizontal form-label-left" novalidate>
													<div class="modal-body">

															<!-- <p>For alternative validation library <code>parsleyJS</code> check out in the <a href="form.html">form page</a>
																	                      </p>
																	                      <span class="section">Personal Info</span>
																	 -->
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="name">과제 번호 <span class="required">*</span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input id="disabled"
																		class="form-control col-md-7 col-xs-12"
																		data-validate-length-range="6" data-validate-words="2"
																		name="disabled" placeholder="both name(s) e.g Jon Doe"
																		required="required" type="text" disabled>
																	<input type="hidden" name="leccode" class="leccode">
																</div>
															</div>
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="reportname">과제 명 <span class="required">*</span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input type="email" id="email" name="reportname"
																		required="required"
																		class="form-control col-md-7 col-xs-12">
																</div>
															</div>
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="enddate">마감 일 <span class="required">*</span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input type="date" id="enddate" name="enddate"
																		data-validate-linked="year" required="required"
																		class="form-control col-md-7 col-xs-12">
																</div>
															</div>
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="content">과제 내용 <span class="required">*</span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<textarea id="content" required="required"
																		name="content" style="height: 200px;"
																		class="form-control col-md-7 col-xs-12"></textarea>
																</div>
															</div>
														


													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">취소</button>
														<button type="submit" class="btn btn-primary">저장</button>
													</div>
													
													</form>

												</div>
											</div>
										</div>
										<button type="button" class="btn btn-sm btn-warning"
											data-toggle="modal" data-target=".bs-example-modal-lg">&nbsp;&nbsp;과제내용
											수정&nbsp;&nbsp;</button>

										<div class="modal fade bs-example-modal-lg" tabindex="-1"
											role="dialog" aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">

													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">
															<span aria-hidden="true">×</span>
														</button>
														<h4 class="modal-title" id="myModalLabel2">과제내용 수정</h4>
													</div>
													<form action="reportupdate" method="post">
													<div class="modal-body">
													<div class="col-sm-2" style="margin-bottom: 20px;">
													
														<select class="form-control inputstl" id="gender1" name="reportcode">
															<c:forEach var="task" items="${task}" varStatus="status">
																<option value="${task.reportcode}">${status.count}번째 과제</option>
															</c:forEach>
														</select> 
														
														</div>
														<!-- //글제목 입력 폼 -->
														<div class="form-group has-success" style="margin-bottom: 20px"> 
														<div class="col-sm-12">
														<label  class="control-label" style="float: left">과제 제목 : </label>
														</div> 
														<input type="text" class="form-control" name ="reportname" id="subject"> 
														<div class="col-sm-12">
														<label  class="control-label" style="float: left;margin-top: 20px;">마감 일 : </label>
														</div> 
														<input type="date" class="form-control" name ="enddate" id="subject"> 
														</div> 
														
														
														<!-- //글내용 입력 폼  -->
														<div class="form-group has-warning"> 
														<label class="control-label" for="content" style="float: left">   &nbsp; &nbsp;과제 내용 : </label> 
														<textarea class="form-control" rows="10" name="content" id="content"></textarea> 
														</div> 
													

														<!-- <textarea id="message" required="required"
															class="form-control" name="message"
															data-parsley-trigger="keyup" data-parsley-minlength="20"
															data-parsley-maxlength="300"
															data-parsley-minlength-message="20자 이상 작성하여야 합니다."
															data-parsley-validation-threshold="30"></textarea> -->

													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">취소</button>
														<button type="submit" class="btn btn-primary">저장</button>
														<button type="button" onclick="deletePro();" class="btn btn-danger">삭제</button>
													</div>
													</form>
												</div>
											</div>
										</div>
									</div>

								</div>
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- /page content -->

	<script
		src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	<script type="text/javascript">
		
	 <%@ include file="../Basic/datePickerJS.jsp"%>
		
	</script>

	<script type="text/javascript">
	function reportlist() {
		$('#disabled').val($('#mystatus').val());
		$('.leccode').val($('#mystatus').val());
	}
	
	function deletePro() {
		var deletecode = $('#gender1').val();
		 location.href="reportdelete?reportcode="+deletecode;
	}
	
	
	
	</script>
	
	
	


</body>
</html>