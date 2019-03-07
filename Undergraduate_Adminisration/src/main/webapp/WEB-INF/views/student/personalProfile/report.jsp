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
		<table id="aa" class="data table table-striped no-margin">
			<thead>
				<tr>
					<th>과제 번호</th>
					<th>년도</th>
					<th>과제명</th>
					<th>과제 마감일</th>
					<th>진행 상태</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${dtos2 != null}">
			<c:forEach items="${dtos2}" var="dto" varStatus="status">
				<tr class="zxc" style="cursor:pointer">
					<td>${dto.reportcode}</td>
					<td>${dto.year}</td>
					<td>${dto.reportName}</td>
					<td>${dto.endDate}</td>
					<c:if test="${dto.progress >= 0}">
					<td>제출 가능</td>
					</c:if>
					
					<c:if test="${dto.progress < 0}">
					<td>마감</td>
					</c:if>
					
				</tr>
			</c:forEach>
			</c:if>
			
			<c:if test="${dtos == null}">
			<td colspan="5" style="text-align: center;">과제가 없습니다.</td>
			</c:if>
			</tbody>
		</table>

	<!-- /page content -->

	<script type="text/javascript">
	
	$(".zxc").click(function(){ 	
		
		// 현재 클릭된 Row(<tr>)
		var tr = $(this);
		var td = tr.children();
		
		reportcontent('${userNumber}',td.eq(0).text());
		
	});
	

	</script>


</body>
</html>