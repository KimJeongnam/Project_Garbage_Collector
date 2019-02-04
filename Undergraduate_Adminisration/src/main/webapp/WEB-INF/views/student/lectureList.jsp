<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600"
	rel="stylesheet">
<link rel="stylesheet" href="/project/resources/css/schedule/reset.css">
<!-- CSS reset -->
<link rel="stylesheet" href="/project/resources/css/schedule/style.css">
<!-- Resource style -->

<%@ include file="../Basic/settings.jsp"%>
<title>Insert title here</title>
</head>
<body class="nav-md">
			
				<table id="datatable" class="table table-striped table-bordered">
					<thead>
						<tr>
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
						<c:forEach var="dto" items="${dtosL}">
							<tr>
								<td>${dto.grade}학년</td>
								<td>${dto.lecCode}</td>
								<td><c:if test="${dto.lectureClassfication == 1}">
													전공
												</c:if> <c:if test="${dto.lectureClassfication == 0}">
													교양
												</c:if></td>
								<td>${dto.lectureName}</td>
								<td>${dto.lectureScore}</td>
								<td>${dto.accountHolder}</td>
								<td>${dto.classTime}</td>
								<td>${dto.maximumCapacity}</td>
								<th><a href="applyLecture?lecCode=${dto.lecCode}"
									class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>신청</a></th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div>
					<!-- <input class="btn btn-info" type="button" value="수정" onclick="window.location='proUpdate'">
								<input class="btn btn-danger" type="button" value="삭제" onclick="window.location='proDelete'"> -->
				</div>
			</div>
		</div>
	<!-- /page content -->

	<!-- .cd-schedule schedule폴더에 js추가됨-->
	<script src="/project/resources/js/schedule/modernizr.js"></script>
	<!-- 	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script> -->
	<!-- <script>
	if( !window.jQuery ) document.write('<script src="/project/resources/js/schedule/jquery-3.0.0.min.js"><\/script>');
	</script> -->
	<script src="/project/resources/js/schedule/main.js"></script>
</body>
</html>