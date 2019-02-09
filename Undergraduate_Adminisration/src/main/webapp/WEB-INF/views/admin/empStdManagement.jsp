<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../Basic/settings.jsp"%>
<title>Insert title here</title>
</head>
<body class="nav-md">
	<%@ include file="../Basic/navbar.jsp"%>

	<script type="text/javascript">
	function employeeInfo(name){
		
	}
	</script>
	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>정보 조회</h3>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>교직원</h2>
							<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link">
									<i class="fa fa-chevron-up"></i></a>
								</li>
								<li><a class="close-link"><i class="fa fa-close"></i></a></li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<table id="datatable" class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>이름</th>
										<th>직책</th>
										<th>학과(학과코드)</th>
										<th>연차</th>
										<th>입사일</th>
										<th>연봉</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="vo" items="${vo}">
									<tr>
										<td><a href="proMyPage">${vo.userName}</a></td>
										<td>
											 <c:if test = "${vo.authority eq 'ROLE_PROFESSOR'}">
													교수
											</c:if> 
											<%-- ${vo.authority} --%>
										</td>
										<td>${vo.majorName}(${vo.majorNum})</td>
										<td>${vo.annualLevel}</td>
										<td>${vo.empHiredDate}</td>
										<td>${vo.totalPayment}만원</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<div>
								<input class="btn btn-primary" type="button" value="등록"
									onclick="window.location='proInsert'">
								<!-- <input class="btn btn-info" type="button" value="수정" onclick="window.location='proUpdate'">
								<input class="btn btn-danger" type="button" value="삭제" onclick="window.location='proDelete'"> -->
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>학생</h2>
							<ul class="nav navbar-right panel_toolbox">
								<li>
									<a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
								</li>
								<li><a class="close-link"><i class="fa fa-close"></i></a></li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<div class="row">
								<div class="col-sm-12">
									<div class="card-box table-responsive">
										<table id="datatable-keytable"
											class="table table-striped table-bordered">
											<thead>
												<tr>
													<th>이름</th>
													<th>학번</th>
													<th>학과(학과코드)</th>
													<th>학년</th>
													<th>연락처</th>
													<th>학적상태</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach var="dto" items="${dtos}">
												<tr>
													<td><a href="stdMyPage">${dto.userName}</a></td>
													<td>${dto.userNumber}</td>
													<td>${dto.majorName}(${dto.majorNum})</td>
													<td>${dto.grade}</td>
													<td>${dto.userCellNum}</td>
													<td><c:if test = "${dto.graduation_state ==0}">
															재학중
														</c:if>
														<c:if test = "${dto.graduation_state ==1}">
															졸업
														</c:if>
													</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
										<div>
											<input class="btn btn-primary" type="button" value="등록"
												onclick="window.location='stdInsert2'">
											<!-- <input class="btn btn-info" type="button" value="수정" onclick="window.location='proUpdate'">
											<input class="btn btn-danger" type="button" value="삭제" onclick="window.location='proDelete'"> -->
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

	<%@ include file="../Basic/footer.jsp"%>

	<script type="text/javascript">
		$(function (){
			
		});
	</script>
</body>
</html>