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
	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>수업업무</h3>
				</div>
				<div class="title_right">
					<div
						class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="강의 검색">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">검색</button>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>
								수강신청
							</h2>
							<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link"><i
										class="fa fa-chevron-up"></i></a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-expanded="false">
									<i class="fa fa-wrench"></i></a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#">Settings 1</a></li>
										<li><a href="#">Settings 2</a></li>
									</ul></li>
								<li><a class="close-link"><i class="fa fa-close"></i></a></li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<p class="text-muted font-13 m-b-30">2019년도 1학기 수강신청</p>
							<table class="table table-striped jambo_table bulk_action">
								<thead>
									<tr class="headings">
										<th>학년구분</th>
										<th>강의번호</th>
										<th>이수구분</th>
										<th>강의명</th>
										<th>학점</th>
										<th>담당교수</th>
										<th>강의시간</th>
										<th>잔여석</th>
										<th>신청</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="dto" items="${dtos}">
									<tr>
										<td>${grade}학년</td>
										<td>${lecCode}</td>
										<td>${lectureClassfication}</td>
										<td>${lectureName}</td>
										<td>${lectureScore}</td>
										<td>${empName}</td>
										<td>${timetblCode}</td>
										<td>${maximumCapacity}</td>
										<th><a class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>신청</a></th>
									</tr>
									</c:forEach>
								</tbody>
							</table>
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