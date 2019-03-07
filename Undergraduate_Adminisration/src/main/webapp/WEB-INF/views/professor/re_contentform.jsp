<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../Basic/settings.jsp"%>
<title>자바대학교 학사관리시스템</title>

<style>
</style>
</head>
<body class="nav-md">
	<!-- page content -->
	<div class="col-md-3 col-sm-3 col-xs-12">
			<div class="x_title">
				<h2 style="margin-top: 17PX;">${subject}</h2>
				<div class="clearfix"></div>
			</div>


				<div class="clearfix"></div>
			
			<div class="panel-body">
				<div class="x_content">
					<ul class="list-unstyled timeline">
						<c:forEach var="task" items="${task}" varStatus="status">
							<li>

								<div class="block">
									<div class="tags">
										<a class="tag" onclick="hideshow('${task.reportcode}');">
											<span> ${status.count} 번째 과제</span>
										</a> <input type="hidden" class="code" id="coode"
											value="${task.reportcode}">
									</div>
									<div class="block_content">
										<h2 class="title">
											<a>${task.reportName}</a>
										</h2>
										<p class="excerpt">${task.reportInfo}</p>
										<p class="excerpt">마감일 : &nbsp;${task.endDate}</p> 

										<button type="button" class="btn btn-sm btn-warning"
											data-toggle="modal" data-target=".bs-example-modal-lg${status.count}">&nbsp;&nbsp;과제내용
											수정&nbsp;&nbsp;</button>

									</div>
								</div>

							</li>
						</c:forEach>
					</ul>
					<div style="float: right; margin-top: 20px;">
						<div class="text-center mtop20">
							<button type="button" class="btn btn-sm btn-primary"
								data-toggle="modal" data-target=".bs-example-modal-lg"
								onclick="reportlist()">과제 업로드</button>
							<div class="modal fade bs-example-modal-lg" tabindex="-1"
								role="dialog" aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">

										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">×</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">참고자료 업로드</h4>
										</div>
										<form action="re_insert" method="post"
											class="form-horizontal form-label-left" novalidate>
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
															required="required" type="text" disabled> <input
															type="hidden" name="leccode" class="leccode">
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
														<textarea id="content" required="required" name="content"
															style="height: 200px;"
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

							<c:forEach var="task" items="${task}" varStatus="status">
							<div class="modal fade bs-example-modal-lg${status.count}" tabindex="-1"
								role="dialog" aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">

										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">×</span>
											</button>
											<h4 class="modal-title" id="myModalLabel2">과제내용 수정</h4>
										</div>
										<form action="reportupdate" method="post" onsubmit="return reportupdate();">
											<div class="modal-body">

												<!-- //글제목 입력 폼 -->
												<div class="form-group" style="margin-bottom: 20px">
													<div class="col-sm-12">
													<input type="hidden" name = reportcode value="${task.reportcode}">
														<label class="control-label" style="float: left">과제
															제목 : </label>
													</div>
													<input type="text" class="form-control" name="reportname"
														id="subject" value="${task.reportName}">
													<div class="col-sm-12">
														<label class="control-label"
															style="float: left; margin-top: 20px;">마감 일 :</label>
													</div>
													<input type="date" class="form-control" name="enddate"
														id="subject" value="${task.endDate}" onchange="dateFormat();">
												</div>


												<!-- //글내용 입력 폼  -->
												<div class="form-group">
													<label class="control-label" for="content"
														style="float: left"> &nbsp; &nbsp;과제 내용 : </label>
													<textarea class="form-control" rows="10" name="content"
														id="content" style="resize: none;">${task.reportInfo}</textarea>
												</div>
												

											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">취소</button>
												<button type="submit" class="btn btn-primary">저장</button>
												<button type="button" onclick="deletePro(${task.reportcode});"
													class="btn btn-danger">삭제</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							</c:forEach>

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
	
	function deletePro(deletecode) {
		 location.href="reportdelete?reportcode="+deletecode;
	}
	
	function dateFormat() {
		var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
		var obj = document.inputform.year.value;
		if (!date_pattern.test(obj)) {
			alert("날짜 형식이 잘못되었습니다");
			document.inputform.year.value = null;
			return;
		}
		//숫자 형식  
	}
	
	function reportupdate() {
		var scholarname = document.inputform.scholarname.value;
		var content = $('#editor-one')[0].innerHTML
		 if(!scholarname){
			alert("장학금 명을 입력해주세요");
			return false;
		 }
		if(content==0){
			alert("장학금 내용을 입력해주세요");
			return false;
		 }
		var scholarContent = $('#editor-one')[0].innerHTML
		$('#scholarContent').val(scholarContent);
		if($('#scholarContent').val().length > 0) return true;
		else return false;
	}
	
	
	
	</script>





</body>
</html>