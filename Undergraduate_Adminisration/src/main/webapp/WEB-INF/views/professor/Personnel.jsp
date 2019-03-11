<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../Basic/settings.jsp"%>
<style type="text/css">
</style>
<title>자바대학교 학사관리시스템</title>

<style>
</style>
</head>
<body class="nav-md">
	<!-- page content -->
	<div class="col-md-9 col-sm-9 col-xs-12">

		<ul class="stats-overview">
			<li><span class="name"
				style="font-size: 20px; font-weight: bold;"> 총 수강인원 </span> <span
				class="value text-success"
				style="font-size: 20px; font-weight: bold;"> ${cnt} </span></li>

			<li><span class="name"
				style="font-size: 20px; font-weight: bold;"> 과제 제출 인원 </span> <span
				class="value text-success"
				style="font-size: 20px; font-weight: bold;"> ${submitCnt} </span></li>




			<li class="hidden-phone" style="font-size: 20px; font-weight: bold;"><span
				class="name" style="font-size: 20px; font-weight: bold;">과제
					미제출 인원</span> <span class="value text-success"
				style="font-size: 20px; font-weight: bold;"> ${notCnt} </span></li>
		</ul>
		<div>

			<h4>제출리스트</h4>
			<c:if test="${submitCnt == 0}">
				<div class="alert alert-secondary" role="alert">
					<h2 style="text-align: center;">제출 과제가 없습니다.</h2>

				</div>
			</c:if>

			<c:if test="${reportsubmitCnt == 0}">
				<h2 style="text-align: center;">과제가 없습니다.</h2>
			</c:if>

			<!-- end of user messages -->
			<ul class="messages">
				<c:forEach var="dto" items="${dtos}">
					<li><img src="/project/resources/${dto.userImage}"
						class="avatar" alt="Avatar">
						<div class="message_date">
							<h3 class="date text-info">${dto.day}일</h3>
							<p class="month">${dto.month}월</p>
						</div>
						<div class="message_wrapper">
							<h4 class="heading">${dto.userName}</h4>
							<blockquote class="message">${dto.reportName}이해
								제출합니다.</blockquote>
							<br />
							<p class="url">
								<span class="fs1 text-info" aria-hidden="true" data-icon="?"></span>
								<input type="hidden" id="IDX"
									value="${staticPath }${dto.fileName}"> <a
									href="file?file=${dto.fileName}" name=file>${dto.stdNumber}&nbsp;${dto.userName}&nbsp;${dto.fileName2}<i
									class="fa fa-paperclip"></i></a>
								<!-- 2019380527 김설현 운동역학의 이해.doc -->
							</p>
						</div></li>
				</c:forEach>
			</ul>
			<!-- end of user messages -->

			<div class="row">
				<div class="col-sm-6">
					<div class="text-letf">
						<ul class="pagination">
							<c:if test="${submitCnt > 0 }">
								<c:if test="${startPage > pageBlock }">
									<a href="/admin/resister/adminjudgeLis">[◀◀]</a>
									<a
										href="/admin/resister/adminjudgeLis?pageNum=${startPage - pageBlock }">[◀&nbsp;prev]</a>

									<li class="paginate_button previous disabled"
										style="cursor: pointer;" id="datatable_previous"><a
										onclick="adminjudgeList('${userNumber}', 1);"
										aria-controls="datatable" data-dt-idx="0" tabindex="0">Frist</a></li>
									<li class="paginate_button previous disabled"
										style="cursor: pointer;"
										onclick="adminjudgeList('${userNumber}', ${startPage - pageBlock});"
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
												onclick="adminjudgeList('${userNumber}', ${page });"><a
												aria-controls="datatable" tabindex="0">${page }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:if test="${pageCount > endPage }">
									<li class="paginate_button next" id="datatable_next"
										style="cursor: pointer;"
										onclick="adminjudgeList('${userNumber}', ${startPage + pageBlock });">
										<a aria-controls="datatable" tabindex="0">Next</a>
									</li>
									<li class="paginate_button next" id="datatable_next"
										style="cursor: pointer;"
										onclick="adminjudgeList('${userNumber}', ${pageCount });">
										<a aria-controls="datatable" tabindex="0">Last</a>
									</li>
								</c:if>
							</c:if>
						</ul>
					</div>
				</div>
			</div>


		</div>


	</div>

	<!-- /page content -->

	<script
		src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	<script type="text/javascript">
	<%@ include file="../Basic/datePickerJS.jsp"%>
	</script>
	<script type="text/javascript">
	$(".report_list").text($("#mystatus option:selected").text());
	
	
		} 
	
	
	
	</script>



	<%-- function aaa() {
			if(${dtos.getProgress()} < 0){
				alert("마감되었습니다")
				self.close();
			}
		}  --%>



</body>
</html>