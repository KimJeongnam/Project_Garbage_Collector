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

<style>
.h1, h1 < span{
	font: inherit;
	font-style: inherit;
	font-variant-ligatures: inherit;
	font-variant-caps: inherit;
	font-variant-numeric: inherit;
	font-variant-east-asian: inherit;
	font-weight: bold;
	font-stretch: inherit;
	font-size: 100%;
	line-height: inherit;
	font-family: inherit;
}

html {
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

button, html input[type=button], input[type=reset], input[type=submit] {
	-webkit-appearance: button;
	cursor: pointer;
}

.btn-success:hover {
	background: #169F85;
	color: #fff;
}

.btn-danger:hover {
	background: #d43f3a;
	color: #fff;
}

.btn:hover {
	text-decoration: none;
}

.btn {
	margin-bottom: -6px;
	border-radius: 3px;
	margin-bottom: 5px;
	margin-right: 5px;
	display: inline-block;
	padding: 6px 12px;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	touch-action: manipulation;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
	text-transform: none;
}

.btn-success {
	color: #fff;
	background: #26B99A;
	border: 1px solid #169F85;
}

.btn-danger {
	color: #fff;
	background-color: #d9534f;
	border: 1px solid #d43f3a;
}

button, input {
	font: inherit;
	margin: 0;
	overflow: visible;
	-webkit-writing-mode: horizontal-tb !important;
}

:after, :before {
	box-sizing: border-box;
}
</style>

<div style="width: 700; margin: 2em auto; margin-top: 20px;">
	<h1 style="font-size: 25px; font-weight: bold;">
		[교번 : ${empNumber } <span
			style="margin-left: 10px; margin-right: 10px; font-size: 20px; font-weight: normal;">'${semester}학기'
			시간표</span>]
	</h1>
</div>

<div class="cd-schedule loading" style="width: 700; height: 1050;">
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
								<c:choose>
									<c:when test="${mode eq 'selector' }">
									<c:set var="key">${lecture.lectureName}</c:set>
										<li class="single-event"
											data-start="${lecture.beginningLectureTime}"
											data-end="${lecture.endLectureTime}" data-event="event-${colorMap[key] }"
											onclick="" id="li-${dStatus.index }${iStatus.index}"><a><span></span>
												<em style="color:white; font-weight: bold; padding: 5px; font-size: 10px;">
													${lecture.classTime }교시
												</em>
												<em class="event-name"
												id="chk-${dStatus.index }${iStatus.index}">${lecture.lectureName }</em>
										</a></li>
									</c:when>
									<c:when test="${mode eq 'view' }">
										<li class="single-event"
											data-start="${lecture.beginningLectureTime}"
											data-end="${lecture.endLectureTime}" data-event="event-3" style="background: #2E9AFE;"
											onclick="" id="li-${dStatus.index }${iStatus.index}" ><a><span></span>
												<em style="color:white; font-weight: bold; padding: 5px; font-size: 10px;">
												${lecture.classTime }교시
												</em>
												<em class="event-name"
												id="chk-${dStatus.index }${iStatus.index}">${lecture.lectureName }</em>
										</a></li>
									</c:when>
								</c:choose>
							</c:if>
						</c:forEach>

						<c:forEach var="dto" items="${dtos}" varStatus="iStatus">
							<c:if test="${dto.lectureDay == day}">
								<li class="single-event"
									data-start="${dto.beginningLectureTime}"
									data-end="${dto.endLectureTime}" data-event="event-6"
									onclick="selectTime(${dto.timetblCode }
										,'${dStatus.index }${iStatus.index}'
										, '${dto.lectureDay}'
										,'${dto.classTime}');"
									id="li-${dStatus.index }${iStatus.index}"><a
									style="cursor: pointer;"><span></span> <em
										class="event-name" id="chk-${dStatus.index }${iStatus.index}"></em>
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

<c:if test="${mode eq 'selector' }">
<div class="button"
	style="width: 700; margin: 2em auto; margin-top: 50px;">
	<table>
		<tr>
			<td><input type="button" class="btn btn-success" value="확인"
				onclick="selectTimeDo();"> <input type="button"
				class="btn btn-danger" value="취소" onclick="self.close();"></td>
		</tr>
	</table>
</div>
</c:if>
<!-- jQuery -->
<script src="/project/resources/vendors/jquery/dist/jquery.min.js"></script>
<script src="/project/resources/js/schedule/modernizr.js"></script>
<script src="/project/resources/js/schedule/main.js"></script>
<script src="/project/resources/js/majorlecManage.js"
	type="text/javascript"></script>

