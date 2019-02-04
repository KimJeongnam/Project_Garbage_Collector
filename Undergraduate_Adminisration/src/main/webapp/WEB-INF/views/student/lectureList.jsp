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
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>수강신청</h2>
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
								<!-- <input class="btn btn-info" type="button" value="수정" onclick="window.location='proUpdate'">
								<input class="btn btn-danger" type="button" value="삭제" onclick="window.location='proDelete'"> -->
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-md-6 col-sm-6 col-xs-12">
				
                <!-- <div class="x_panel">
                  <div class="x_title">
                    <h2>시간표 <small>Bordered table subtitle</small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <table class="table table-bordered" style="min-height:800px">
                      <thead style="text-align:center">
                        <tr>
                          <th style="width:30px">시간</th>
                          <th>월</th>
                          <th>화</th>
                          <th>수</th>
                          <th>목</th>
                          <th>금</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th>09:00~09:50</th>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          
                        </tr>
                        <tr>
                          <th>10:00~:1050</th>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <th>11:00~11:50</th>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <th>12:00~12:50</th>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <th>13:00~13:50</th>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <th>14:00~14:50</th>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <th>15:00~15:50</th>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <th>16:00~16:50</th>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <th>17:00~17:50</th>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <th>18:00~18:50</th>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                      </tbody>
                    </table>

                  </div>
                </div> -->
				
				
				<div class="cd-schedule loading">
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
					</ul>
				</div>
				<div class="events" style="min-height: 1000px;">
					<ul>
						<li class="events-group" >
							<div class="top-info">
								<span>월</span>
							</div>
								<ul>
								<c:forEach var="dto" items="${dtos}">
								<c:if test="${dto.lectureDay == '월'}">
									
										<li class="single-event" data-start="${dto.beginningLectureTime}" data-end="${dto.endLectureTime}"
											data-content="event-abs-circuit" data-event="event-1"><a
											href="#0"> <em class="event-name">${dto.lectureName}</em>
										</a></li>
									
								</c:if>
								</c:forEach>
								</ul>
						</li>

						<li class="events-group">
							<div class="top-info">
								<span>화</span>
							</div>
								<ul>
								<c:forEach var="dto" items="${dtos}">
								<c:if test="${dto.lectureDay == '화'}">
									
										<li class="single-event" data-start="${dto.beginningLectureTime}" data-end="${dto.endLectureTime}"
											data-content="event-abs-circuit" data-event="event-1"><a
											href="#0"> <em class="event-name">${dto.lectureName}</em>
										</a></li>
								</c:if>
								</c:forEach>
								</ul>
						</li>

						<li class="events-group">
							<div class="top-info">
								<span>수</span>
							</div>
								<ul>
								<c:forEach var="dto" items="${dtos}">
								<c:if test="${dto.lectureDay == '수'}">
										<li class="single-event" data-start="${dto.beginningLectureTime}" data-end="${dto.endLectureTime}"
											data-content="event-abs-circuit" data-event="event-1"><a
											href="#0"> <em class="event-name">${dto.lectureName}</em>
										</a></li>
								</c:if>
								</c:forEach>
								</ul>
						</li>

						<li class="events-group">
							<div class="top-info">
								<span>목</span>
							</div>
								<ul>
								<c:forEach var="dto" items="${dtos}">
								<c:if test="${dto.lectureDay == '목'}">
										<li class="single-event" data-start="${dto.beginningLectureTime}" data-end="${dto.endLectureTime}"
											data-content="event-abs-circuit" data-event="event-1"><a
											href="#0"> <em class="event-name">${dto.lectureName}</em>
										</a></li>
								</c:if>
								</c:forEach>
								</ul>
						</li>

						<li class="events-group">
							<div class="top-info">
								<span>금</span>
							</div>
								<ul>
								<c:forEach var="dto" items="${dtos}">
								<c:if test="${dto.lectureDay == '금'}">
										<li class="single-event" data-start="${dto.beginningLectureTime}" data-end="${dto.endLectureTime}"
											data-content="event-abs-circuit" data-event="event-1"><a
											href="#0"> <em class="event-name">${dto.lectureName}</em>
										</a></li>
								</c:if>
								</c:forEach>
								</ul>

						</li>
					</ul>
				</div>
				</div> 
				
				</div>
				
				</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /page content -->
	<%@ include file="../Basic/footer.jsp"%>
	
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