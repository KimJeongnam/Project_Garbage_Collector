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
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>수강신청</h2>
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
											<td>${dto.grade}학년</td>
											<td>${dto.lecCode}</td>
											<td>
												<c:if test="${dto.lectureClassfication == 1}">
													전공
												</c:if>
												<c:if test="${dto.lectureClassfication == 0}">
													교양
												</c:if>
											</td>
											<td>${dto.lectureName}</td>
											<td>${dto.lectureScore}</td>
											<td>${dto.accountHolder}</td>
											<td>${dto.classTime}</td>
											<td>${dto.maximumCapacity}</td>
											<th><a href="applyLecture?lecCode=${dto.lecCode}" class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>신청</a></th>
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
			</div>
		</div>
	</div>
	<!-- /page content -->
	<%@ include file="../Basic/footer.jsp"%>

	<script type="text/javascript">
		/* $(function (){
			$("#keyword").keyup(function() { // keyup : 데이터 입력이 끝났을 때
				var k = $(this).val();		 // 입력한 키워드
				$("#lecture-table > tbody").hide();		
				$.ajax({
					type: "POST",
					data: "keyword=" + keyword,
					url : "${authPath }/lectureSearch",  // {컨트롤러}/이동페이지
					// search_sub 보내고 서비스 갔다가 dao 갔다가 mapper갔다가 아래 success로 옮
					success: function(data) {  // 콜백함수
						$("#lecture-table > tbody").html(data);  // 결과출력
					},
					error: function() {
						alert("오류");
					}
				})
			})
		}); */
	</script>
</body>
</html>