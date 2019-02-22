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
						<br>
						<br>
						 ${dtos.getReportInfo()}
					</p>
					<br />
					<div class="project_detail">
						<p class="title">강의 명</p> 
						<p> ${dtos.getLectureName()}</p>
						<p class="title">과제 명</p>
						<p> ${dtos.getReportName()}</p>
					</div>
					<br />
					<h5>주의 사항</h5>
					<ul class="list-unstyled project_files">
						<li><a href=""><i class="fa fa-file-word-o"></i> 제출 파일 :한글</a></li>
						<li><a href="">&nbsp;&nbsp;&nbsp;<i class="fa fa-mail-forward"></i> 폰트 크기 : 11 </a></li>
						<li><a href=""><i class=""></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 글씨체 : 굴림</a></li>
						<li><a href=""><i class=""></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 개요 준수</a></li>

					</ul>
					<br />
					<!-- Large modal -->
					<div class="text-center mtop20">
						<button type="button" class="btn btn-sm btn-primary"
							data-toggle="modal" data-target=".bs-example-modal-lg1">과제 업로드
						</button>
						<!-- modal 여러개 사용시 위 data-target 과 밑 class 이름을 같게 수정하셈!! -->
						<div class="modal fade bs-example-modal-lg1"
							tabindex="-1" role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">×</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">과제 업로드 </h4>
									</div>
									<div class="modal-body">
										<form action="#" class="dropzone"></form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">취소
										</button>
										<button type="button" class="btn btn-primary">저장</button>
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
	<%@ include file="../../Basic/datePickerJS.jsp"%>
	</script>


</body>
</html>