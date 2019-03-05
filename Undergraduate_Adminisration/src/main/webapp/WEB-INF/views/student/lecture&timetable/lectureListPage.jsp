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
<title>수강신청/시간표</title>
</head>
<body class="nav-md">
	<%@ include file="../../Basic/navbar.jsp"%>
	<!-- page content -->
	<div class="right_col" role="main" style="min-height: 1000px">
		<div class="">
			<div class="page-title">
				<div class="title_left"></div>
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<c:if test="${status == 0}">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="col-md-6 col-sm-6 col-xs-12">
								<div class="x_panel">
									<div class="x_title">
										<h2>수강신청</h2>
										<div class="clearfix"></div>
									</div>
									<div class="row">
										<div class="x_content">
											<div class="row form-inline">
												<div class="col-sm-2">
													<label> Show <select class="form-control input-sm"
														id="lectureList-pagesize"
														onchange="studentLecture('${userNumber}', 1);">
															<option value="5">5</option>
															<option value="10" selected="selected">10</option>
															<option value="25">25</option>
															<option value="50">50</option>
															<option value="100">100</option>
													</select>
													</label>
												</div>
												<div class="col-sm-2">
													<select class="form-control input-sm"
														id="lectureList-major"
														onchange="studentLecture('${userNumber}', 1);">
														<option value="0" selected="selected">학과선택조회</option>
														<c:if test="${!empty dtosM}">
															<c:forEach var="dto" items="${dtosM}" varStatus="i">
																<option value="${dto.majorName}">${dto.majorName}</option>
															</c:forEach>
														</c:if>
													</select>
												</div>

												<div class="col-sm-2">
													<select class="form-control input-sm"
														id="lectureList-classification"
														onchange="studentLecture('${userNumber}', 1); ">
														<option value="0" selected="selected">이수구분</option>
														<option value="1">전공</option>
														<option value="2">교양</option>
													</select>
												</div>

												<div class="col-sm-2">
													<select class="form-control input-sm"
														id="lectureList-grade"
														onchange="studentLecture('${userNumber}', 1);">
														<option value="0" selected="selected">학년</option>
														<option value="1">1학년</option>
														<option value="2">2학년</option>
														<option value="3">3학년</option>
													</select>
												</div>

												<div class="col-sm-4">
													<div style="text-align: right;">
														<input type="search" id="lectureList-search-keyword"
															class="form-control input-sm"
															onkeyup="studentLecture('${userNumber}', 1);"
															placeholder="강의명 검색">
													</div>
												</div>
											</div>
										</div>
										<div id="lectureList" class=""></div>
									</div>
								</div>
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="x_panel">
										<div class="x_title">
											<h2>수강신청리스트</h2>
											<div class="clearfix"></div>
										</div>
										<div id="MyLectureList" class=""></div>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<div id="schoolTimeTable"></div>
							</div>
						</div>
					</div>
				</c:if>
			</div>
			<c:if test="${status != 0}">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="cd-schedule loading">
							<!-- page content -->
							<div class="timeline">
								<ul>
									<li><span>09:00</span></li>
									<li><span>09:30</span></li>
									<li><span>10:00</span></li>
									<li><span>10:30</span></li>
									<li><span>11:00</span></li>
									<li><span>11:30</span></li>
									<li><span>12:00</span></li>
									<li><span>12:30</span></li>
									<li><span>13:00</span></li>
									<li><span>13:30</span></li>
									<li><span>14:00</span></li>
									<li><span>14:30</span></li>
									<li><span>15:00</span></li>
									<li><span>15:30</span></li>
									<li><span>16:00</span></li>
									<li><span>16:30</span></li>
									<li><span>17:00</span></li>
									<li><span>17:30</span></li>
									<li><span>18:00</span></li>
									<li><span>18:30</span></li>
									<li><span>19:00</span></li>
								</ul>
							</div>

							<!-- .timeline -->

							<div class="events" style="min-height: 1000px;">
								<ul>
									<li class="events-group">
										<div class="top-info">
											<span>월</span>
										</div>
										<ul>
											<c:forEach var="dto" items="${dtosT}">
												<c:if test="${dto.lectureDay == '월'}">
													<li class="single-event"
														data-start="${dto.beginningLectureTime}"
														data-end="${dto.endLectureTime}"
														data-event="event-${dto.rank}"><a href="#0"><span></span>
															<em class="event-name">${dto.lectureName}</em> </a></li>
												</c:if>
											</c:forEach>
										</ul>
									</li>

									<li class="events-group">
										<div class="top-info">
											<span>화</span>
										</div>
										<ul>
											<c:forEach var="dto" items="${dtosT}">
												<c:if test="${dto.lectureDay == '화'}">
													<li class="single-event"
														data-start="${dto.beginningLectureTime}"
														data-end="${dto.endLectureTime}"
														data-event="event-${dto.rank}"><a href="#0"><span></span>
															<em class="event-name">${dto.lectureName}</em> </a></li>
												</c:if>
											</c:forEach>
										</ul>
									</li>

									<li class="events-group">
										<div class="top-info">
											<span>수</span>
										</div>
										<ul>
											<c:forEach var="dto" items="${dtosT}">
												<c:if test="${dto.lectureDay == '수'}">
													<li class="single-event"
														data-start="${dto.beginningLectureTime}"
														data-end="${dto.endLectureTime}"
														data-event="event-${dto.rank}"><a href="#0"><span></span>
															<em class="event-name">${dto.lectureName}</em> </a></li>
												</c:if>
											</c:forEach>
										</ul>
									</li>

									<li class="events-group">
										<div class="top-info">
											<span>목</span>
										</div>
										<ul>
											<c:forEach var="dto" items="${dtosT}">
												<c:if test="${dto.lectureDay == '목'}">
													<li class="single-event"
														data-start="${dto.beginningLectureTime}"
														data-end="${dto.endLectureTime}"
														data-event="event-${dto.rank}"><a href="#0"><span></span>
															<em class="event-name">${dto.lectureName}</em> </a></li>
												</c:if>
											</c:forEach>
										</ul>
									</li>

									<li class="events-group">
										<div class="top-info">
											<span>금</span>
										</div>
										<ul>
											<c:forEach var="dto" items="${dtosT}">
												<c:if test="${dto.lectureDay == '금'}">
													<li class="single-event"
														data-start="${dto.beginningLectureTime}"
														data-end="${dto.endLectureTime}"
														data-event="event-${dto.rank}"><a href="#0"><span></span>
															<em class="event-name">${dto.lectureName}</em> </a></li>
												</c:if>
											</c:forEach>
										</ul>
									</li>
								</ul>
							</div>

							<div class="event-modal">
								<header class="header">
									<div class="content">
										<span class="event-date"></span>
										<h3 class="event-name"></h3>
									</div>

									<div class="header-bg"></div>
								</header>

								<div class="body">
									<div class="event-info"></div>
									<div class="body-bg"></div>
								</div>

								<a href="#0" class="close">Close</a>
							</div>

							<div class="cover-layer"></div>
						</div>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	<!-- /page content -->

	<%@ include file="../../Basic/footer.jsp"%>
	<!-- .cd-schedule schedule폴더에 js추가됨-->
	<!-- 수강신청 -->

	<script src="${staticPath }/js/lecture/applyLecture.js"></script>
	<script src="/project/resources/js/schedule/modernizr.js"></script>
	<script src="/project/resources/js/schedule/main.js"></script>
	<script type="text/javascript">
		$(function() {
			studentMyLecture('${userNumber}');
			studentLecture('${userNumber}', 1);
			studentTimetable('${userNumber}');
		});
	</script>


</body>
</html>