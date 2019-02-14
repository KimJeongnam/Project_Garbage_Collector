<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600"
	rel="stylesheet">
<link rel="stylesheet" href="/project/resources/css/schedule/reset.css">
<!-- CSS reset -->
<link rel="stylesheet" href="/project/resources/css/schedule/style.css">
<!-- Resource style -->


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
			<c:forEach var="day" items="${days }" varStatus="dStatus">
				<li class="events-group">
					<div class="top-info">
						<span>${day }</span>
					</div>
					<ul>
						<c:forEach var="lecture" items="${lectures}">
							<c:if test="${lecture.lectureDay == day}">
								<li class="single-event" data-start="${lecture.beginningLectureTime}"
									data-end="${lecture.endLectureTime}" data-event="event-3"
									onclick=""
									id="li-${dStatus.index }${iStatus.index}">
									<a><span></span> <em class="event-name" id="chk-${dStatus.index }${iStatus.index}">${lecture.lectureName }</em>
								</a></li>
							</c:if>
						</c:forEach>
						
						<c:forEach var="dto" items="${dtos}" varStatus="iStatus">
							<c:if test="${dto.lectureDay == day}">
								<li class="single-event" data-start="${dto.beginningLectureTime}"
									data-end="${dto.endLectureTime}" data-event="event-6"
									onclick="selectTime(${dto.timetblCode },'${dStatus.index }${iStatus.index}');"
									id="li-${dStatus.index }${iStatus.index}">
									<a style="cursor: pointer;"><span></span> <em class="event-name" id="chk-${dStatus.index }${iStatus.index}"></em>
								</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
			</c:forEach>
		</ul>
	</div>

	
	<div class="cover-layer"></div>
</div>
<!-- jQuery -->
<script src="/project/resources/vendors/jquery/dist/jquery.min.js"></script>
<script src="/project/resources/js/schedule/modernizr.js"></script>
<script src="/project/resources/js/schedule/main.js"></script>
<script src="/project/resources/js/majorlecManage.js" type="text/javascript"></script>

