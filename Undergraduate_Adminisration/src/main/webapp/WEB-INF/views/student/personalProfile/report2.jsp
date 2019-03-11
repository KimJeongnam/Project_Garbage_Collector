<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../Basic/settings.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>자바대학교 학사관리시스템</title>
</head>
<body class="nav-md">
	<!-- page content -->
	<div class="col-md-3 col-sm-3 col-xs-12">
		<section class="panel">
			<div class="x_title">
				<h4 style="margin-top: 37px;">과제내용</h4>
				<div class="clearfix"></div>
			</div>
			<div class="panel-body">
				<h3 class="green">
					<i class="fa fa-university"></i> ${dtos.getLectureName()}
				</h3>
				<p>
					<br> <br> ${dtos.getReportInfo()}
				</p>
				<br />
				<div class="project_detail">
					<p class="title">과제 명</p>
					<p>${dtos.getReportName()}</p>
				</div>
				<br />
				<br />
				<c:if test="${reportCheck != 0}">
				<ul class="list-unstyled project_files">
					<li><i class="fa fa-file-word-o"></i> 제출 완료</li>
				</ul>
				</c:if>
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
									<form action="../student/assignment" method="post" enctype="multipart/form-data" class="form-horizontal form-label-left" onsubmit="abc();">

										<p>
											파일을 잘못 보낼시 교수에게 요청
											과제 제출 전 파일  <code>필수 Check</code>
										</p>

										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="name">과제 번호 <span class="required">:</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
													<input type = "hidden" name="reportcode" value="${dtos.getReportcode()}">
													${dtos.getReportcode()}
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="email">과제 명 <span class="required">:</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
													<input type = "hidden" name="title" value="${dtos.getReportName()}">
													${dtos.getReportName()} 
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="email">학번 <span class="required">:</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
													${vo.getUserNumber()}
											</div>
										</div>
										<div class="item form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="number">이름 <span class="required">:</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
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
												<input type="hidden" id="lecName" name="lecName" value="${dtos.getLectureName()}">
												<button id="send" type="submit" class="btn btn-success">보내기</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- /page content -->

	
	<script type="text/javascript">
	</script>
	



</body>
</html>