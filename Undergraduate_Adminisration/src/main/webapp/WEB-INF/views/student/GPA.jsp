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
					<h3>전체 성적정보</h3>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>

		<div class="row">
			<!-- Smart Wizard -->
			<div class="x_content">
				<p>■ 전체학기 성적 목록</p>
				<table class="table table-striped jambo_table bulk_action">
					<thead>
						<tr class="headings">
							<th>학년도</th>
							<th>학기</th>
							<th>강의번호</th>
							<th>과목명</th>
							<th>학년</th>
							<th>이수구분</th>
							<th>학점</th>
							<th>등급</th>
							<th>평점</th>
							<th>평점계</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${dtos}">
							<tr>
								<td>${dto.year}</td>
								<td>${dto.semester}</td>
								<td>${dto.lecCode}</td>
								<td>${dto.lectureName}</td>
								<td>${dto.grade}</td>
								<td><c:if test="${dto.lectureClassfication == 1}">
													전공
												</c:if> <c:if test="${dto.lectureClassfication == 0}">
													교양
												</c:if></td>
								<td>${dto.lectureScore}</td>
								<td>${dto.credit}</td>
								<td>${dto.score}</td>
								<td>${dto.multiply}</td>

								<c:set var="totalgetlectureScore"
									value="${totalgetlectureScore + dto.lectureScore}" />
								<c:set var="totalgetmultiply"
									value="${totalgetmultiply + dto.multiply}" />
								<fmt:formatNumber var="averageScore"
									value="${totalgetmultiply/totalgetlectureScore}" pattern="#.##" />
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="table table-striped jambo_table bulk_action"
					style="text-align: right; width: 300px; float: right">
					<thead>
						<tr class="headings">
							<td>신청학점</td>
							<td>취득학점</td>
							<td>총평점</td>
							<td>평균학점</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${applyCredit}</td>
							<td><c:out value="${totalgetlectureScore}" /></td>
							<td><c:out value="${totalgetmultiply}" /></td>
							<td><c:out value="${averageScore}" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- /page content -->

	<%@ include file="../Basic/footer.jsp"%>

	<script type="text/javascript">
		$(function() {

		});
	</script>
</body>
</html>