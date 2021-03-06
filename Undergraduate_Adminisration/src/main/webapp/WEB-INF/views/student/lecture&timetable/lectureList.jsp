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

<%@ include file="../../Basic/settings.jsp"%>
<title>강의목록</title>
</head>
<body class="nav-md">
	<table id="datatable" class="table table-striped table-bordered">
		<thead>
			<tr>
				<th style="width:9%">학년구분</th>
				<th style="width:6%">강의번호</th>
				<th style="width:6%">이수구분</th>
				<th style="width:23%">강의명</th>
				<th style="width:7%">학점</th>
				<th style="width:11%">담당교수</th>
				<th style="width:23%">강의시간</th>
				<th style="width:7%">잔여석</th>
				<th style="width:8%">신청</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${dtosL}">
				<tr>
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
					<td>${dto.classTime}</td>
					<td>${dto.maximumCapacity}</td>
					<th><a onclick="applyLecture('${userNumber}','${dto.lecCode}');"
						class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>신청</a></th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="row">
		<div class="col-sm-5">
			<div class="dataTables_info" id="datatable_info" role="status"
			aria-live="polite"> 총	${cnt} 개 목록 중
			<c:choose>
				<c:when test="${number < pageSize }">
					1
				</c:when>
				<c:otherwise>
					${number-pageSize+1}
				</c:otherwise>
			</c:choose>
			번 부터 ${number}번 까지 </div>
		</div>

		<div class="col-sm-7">
			<div class="text-right">
				<ul class="pagination">
					<c:if test="${cnt > 0 }">
						<c:if test="${startPage > pageBlock }">
							<a href="/student/lectureList">[◀◀]</a>
							<a href="/student/lectureList?pageNum=${startPage - pageBlock }">[◀&nbsp;prev]</a>

							<li class="paginate_button previous disabled"
								style="cursor: pointer;" id="datatable_previous"><a
								onclick="studentLecture('${userNumber}', 1);"
								aria-controls="datatable" data-dt-idx="0" tabindex="0">Frist</a></li>
							<li class="paginate_button previous disabled"
								style="cursor: pointer;"
								onclick="studentLecture('${userNumber}', ${startPage - pageBlock});"
								id="datatable_previous"><a aria-controls="datatable"
								data-dt-idx="0" tabindex="0">Previous</a></li>
						</c:if>
						<c:forEach var="page" begin="${startPage }" end="${endPage }">
							<c:choose>
								<c:when test="${pageNum == page }">
									<li class="paginate_button active"><a href="#"
										aria-controls="datatable" tabindex="0">${page }</a></li>
								</c:when>
								<c:otherwise>
									<li class="paginate_button" style="cursor: pointer;"
										onclick="studentLecture('${userNumber}', ${page });"><a
										aria-controls="datatable" tabindex="0">${page }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${pageCount > endPage }">
							<li class="paginate_button next" id="datatable_next"
								style="cursor: pointer;"
								onclick="studentLecture('${userNumber}', ${startPage + pageBlock });">
								<a aria-controls="datatable" tabindex="0">Next</a>
							</li>
							<li class="paginate_button next" id="datatable_next"
								style="cursor: pointer;"
								onclick="studentLecture('${userNumber}', ${pageCount });">
								<a aria-controls="datatable" tabindex="0">Last</a>
							</li>
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<!-- /page content -->

	<!-- .cd-schedule schedule폴더에 js추가됨-->
	<script src="/project/resources/js/schedule/modernizr.js"></script>
	<script src="/project/resources/js/schedule/main.js"></script>
	<script type="text/javascript">
	</script>
</body>
</html>