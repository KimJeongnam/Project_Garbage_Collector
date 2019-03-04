<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../Basic/settings.jsp"%>
<title>Insert title here</title>

<style>
.toggle-off {
	margin-bottom: 0px;
	margin-right: 0px;
}
</style>
</head>
<body class="nav-md">
	<!-- page content -->
	<div class="col-md-3 col-sm-3 col-xs-12">
		<section class="panel">
			<div class="x_title">
				<h2>운동역학</h2>
				<div class="clearfix"></div>
			</div>
			<div class="panel-body">
				<h3 class="green">
					<i class="fa fa-university"></i> 과제 내용
				</h3>
				<p>
					<br> <br> ${dtos.getReportInfo()}
				</p>
				<br />
				<div class="project_detail">
					<p class="title">강의 명</p>
					<p>${dtos.getLectureName()}</p>
					<p class="title">과제 명</p>
					<p>${dtos.getReportName()}</p>
				</div>
				<br />
				<h5>주의 사항</h5>
				<ul class="list-unstyled project_files">
					<li><a href=""><i class="fa fa-file-word-o"></i> 제출 파일 :한글</a></li>
					<li><a href="">&nbsp;&nbsp;&nbsp;<i
							class="fa fa-mail-forward"></i> 폰트 크기 : 11
					</a></li>
					<li><a href=""><i class=""></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							글씨체 : 굴림</a></li>
					<li><a href=""><i class=""></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							개요 준수</a></li>

				</ul>
				<br />
				<!-- Large modal -->
				<div class="text-center mtop20">
					<button type="button" class="btn btn-sm btn-primary"
						data-toggle="modal" data-target=".bs-example-modal-lg1">과제
						업로드</button>
					<!-- modal 여러개 사용시 위 data-target 과 밑 class 이름을 같게 수정하셈!! -->
					<div class="modal fade bs-example-modal-lg1" tabindex="-1"
						role="dialog" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">×</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">과제 업로드</h4>
								</div>
								<div class="modal-body">
									<form action="../student/assignment" method="post" enctype="multipart/form-data" class="form-horizontal form-label-left">

										<p>
											파일을 잘못 보낼시 교수에게 요청
											과제 제출 전 파일  <code>필수 Check</code>
										</p>
										<span class="section">과제 제출</span>

										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="name">과제 번호 <span class="required">:</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<%-- <input id="name" class="form-control col-md-7 col-xs-12"
													data-validate-length-range="6" data-validate-words="2"
													name="name" placeholder="both name(s) e.g Jon Doe"
													required="required" type="text" value="${vo.getUserName()}"> --%>
													<input type = "hidden" name="reportcode" value="${dtos.getReportcode()}">
													${dtos.getReportcode()}
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="email">과제 명 <span class="required">:</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<!-- <input type="email" id="email" name="email"
													required="required" class="form-control col-md-7 col-xs-12"> -->
													<input type = "hidden" name="title" value="${dtos.getReportName()}">
													${dtos.getReportName()} 
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="email">학번 <span class="required">:</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<!-- <input type="email" id="email2" name="confirm_email"
													data-validate-linked="email" required="required"
													class="form-control col-md-7 col-xs-12"> -->
													${vo.getUserNumber()}
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="number">이름 <span class="required">:</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<!-- <input type="number" id="number" name="number"
													required="required" data-validate-minmax="10,100"
													class="form-control col-md-7 col-xs-12"> -->
													<input type = "hidden" name=userName value="${vo.getUserName()}">
													${vo.getUserName()}
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="website">제출 파일 <span class="required">:</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="file" id="website" name="website"
													required="required" placeholder="www.website.com" style="float: right;">
											</div>
										</div>
										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-6 col-md-offset-3">
												<!-- <button type="reset" class="btn btn-primary">취소</button> -->
												<button id="send" type="submit" class="btn btn-success">보내기</button>
											</div>
										</div>
									</form>
								</div>
								<!-- <div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">취소
										</button>
										<button type="button" class="btn btn-primary">저장</button>
									</div> -->
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
	<%@ include file="../../Basic/datePickerJS.jsp"%>
	</script>
	
	<script type="text/javascript">
	/* function aaa() {
		if(${dtos.getProgress()} < 0){
			alert("마감되었습니다")
			self.close();
		}
	} */
	
	</script>


</body>
</html>