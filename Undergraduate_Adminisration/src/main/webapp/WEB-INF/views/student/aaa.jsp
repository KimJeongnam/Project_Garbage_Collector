<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../Basic/settings.jsp"%>
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
					<i class="fa fa-university"></i> 1주차 과제
				</h3>
				<p>
					1주차 운동역학의 이해. 운동역학 p.1 - p.134 까지 읽고 운동역학의 정의와
					개념, 목적, 필요성에 대해 서술하고 운동역학의 스포츠 적용 및 연구영역에 대해 자세히
					서술하시오. <br>
					<br> 한글 /폰트 크기 11 / 굴림 / 개요 를 준수.
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
					<li><a href=""><i class="fa fa-file-word-o"></i> 운동역학.docx</a></li>
					<li><a href=""><i class="fa fa-file-pdf-o"></i> 운동역학의 스포츠적용.pdf</a></li>
					<li><a href=""><i class="fa fa-mail-forward"></i> 운동역학의 역사.mln</a></li>
					<li><a href=""><i class="fa fa-picture-o"></i> 이미지.png</a></li>

				</ul>
				<br />
				Large modal
				<div class="text-center mtop20">
					<button type="button" class="btn btn-sm btn-primary"
						data-toggle="modal" data-target=".bs-example-modal-lg1">과제 업로드
					</button>
					modal 여러개 사용시 위 data-target 과 밑 class 이름을 같게 수정하셈!!
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
	<%@ include file="../Basic/datePickerJS.jsp"%>
	</script>


</body>
</html>