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
			<c:forEach items="${dtos2}" var="dto" varStatus="status">
				<tr class="zxc" style="cursor:pointer"> <!-- onclick="aaa();"   -->
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
			</tbody>
		</table>

	<!-- /page content -->

	<script
		src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	<script type="text/javascript">
	<%@ include file="../../Basic/datePickerJS.jsp"%>
	
	$("#aa tr").click(function(){ 	
		
		// 현재 클릭된 Row(<tr>)
		var tr = $(this);
		var td = tr.children();
		
		reportcontent(td.eq(0).text());
		
	});
	
	
	
/* 	$("#aa tr").click(function(){ 	

		var str = ""
		var tdArr = new Array();	// 배열 선언
		
		// 현재 클릭된 Row(<tr>)
		var tr = $(this);
		var td = tr.children();
		
		// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
		alert("클릭한 Row의 모든 데이터 : "+tr.text());
		
		// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
		td.each(function(i){
			tdArr.push(td.eq(i).text());
		});
		
		
		// td.eq(index)를 통해 값을 가져올 수도 있다.
		alert(td.eq(0).text());
		var userid = td.eq(1).text();
		var name = td.eq(2).text();
		var email = td.eq(3).text();
		
	}); */
	</script>


</body>
</html>