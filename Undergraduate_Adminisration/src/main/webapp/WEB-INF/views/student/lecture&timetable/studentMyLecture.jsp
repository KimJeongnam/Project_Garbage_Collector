<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../Basic/settings.jsp"%>
<title>내 강의 목록</title>
</head>
<body class="nav-md">
	<div style="float: right; margin-bottom: 10px;">신청학점 : ${totalLecPoint}</div>
	<table id="datatable" class="table table-striped table-bordered">
		<thead>
			<tr>
				<th>학년구분</th>
				<th>강의번호</th>
				<th>이수구분</th>
				<th>강의명</th>
				<th>학점</th>
				<th>담당교수</th>
				<th>강의실</th>
				<th>취소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${dtosM}">
				<tr id="lectureHover">
					<td>${dto.grade}학년</td>
					<td id="getLecCode">${dto.lecCode}</td>
					<td><c:if test="${dto.lectureClassfication == 1}">
													전공
												</c:if> <c:if test="${dto.lectureClassfication == 2}">
													교양
												</c:if></td>
					<td>${dto.lectureName}</td>
					<td>${dto.lectureScore}</td>
					<td>${dto.accountHolder}</td>
					<td>${dto.classRoom}</td>
					<th><a onclick="cancelLecture('${userNumber}','${dto.infoCode}');" class="btn btn-danger">
						<i class="glyphicon glyphicon-trash"></i>취소</a></th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<!-- <input class="btn btn-info" type="button" value="수정" onclick="window.location='proUpdate'">
								<input class="btn btn-danger" type="button" value="삭제" onclick="window.location='proDelete'"> -->
	</div>
	<!-- /page content -->
</body>
</html>