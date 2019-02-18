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
			<li class="events-group">
				<div class="top-info">
					<span>월</span>
				</div>
				<ul>
					<c:forEach var="dto" items="${dtosT}">
						<c:if test="${dto.lectureDay == '월'}">
							<li class="single-event" data-start="${dto.beginningLectureTime}"
								data-end="${dto.endLectureTime}" data-event="event-${dto.rank}"><a
								href="#0"><span></span> <em class="event-name">${dto.lectureName}</em>
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
					<c:forEach var="dto" items="${dtosT}">
						<c:if test="${dto.lectureDay == '화'}">
							<li class="single-event" data-start="${dto.beginningLectureTime}"
								data-end="${dto.endLectureTime}" data-event="event-${dto.rank}"><a
								href="#0"><span></span> <em class="event-name">${dto.lectureName}</em>
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
					<c:forEach var="dto" items="${dtosT}">
						<c:if test="${dto.lectureDay == '수'}">
							<li class="single-event" data-start="${dto.beginningLectureTime}"
								data-end="${dto.endLectureTime}" data-event="event-${dto.rank}"><a
								href="#0"><span></span> <em class="event-name">${dto.lectureName}</em>
								
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
					<c:forEach var="dto" items="${dtosT}">
						<c:if test="${dto.lectureDay == '목'}">
							<li class="single-event" data-start="${dto.beginningLectureTime}"
								data-end="${dto.endLectureTime}" data-event="event-${dto.rank}"><a
								href="#0"><span></span> <em class="event-name">${dto.lectureName}</em>
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
					<c:forEach var="dto" items="${dtosT}">
						<c:if test="${dto.lectureDay == '금'}">
							<li class="single-event" data-start="${dto.beginningLectureTime}"
								data-end="${dto.endLectureTime}" data-event="event-${dto.rank}"><a
								href="#0"><span></span> <em class="event-name">${dto.lectureName}</em>
							</a></li>
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

<script src="/project/resources/js/schedule/modernizr.js"></script>
<script src="/project/resources/js/schedule/main.js"></script>
