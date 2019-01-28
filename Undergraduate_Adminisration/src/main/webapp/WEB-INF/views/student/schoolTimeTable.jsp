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
					<h3>
						SCHOOL SCHEDULER <small>Click to add/edit events</small>
					</h3>
				</div>

				<div class="title_right">
					<div
						class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for..."> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">Go!</button>
							</span>
						</div>
					</div>
				</div>
			</div>
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
				
				<!-- .timeline -->

				<div class="events">
					<ul>
						<li class="events-group">
							<div class="top-info">
								<span>Monday</span>
							</div>

							<ul>
								<li class="single-event" data-start="09:30" data-end="10:30"
									data-content="event-abs-circuit" data-event="event-1"><a
									href="#0"> <em class="event-name">Abs Circuit</em>
								</a></li>

								<li class="single-event" data-start="11:00" data-end="12:30"
									data-content="event-rowing-workout" data-event="event-2">
									<a href="#0"> <em class="event-name">Rowing Workout</em>
								</a>
								</li>

								<li class="single-event" data-start="14:00" data-end="15:15"
									data-content="event-yoga-1" data-event="event-3"><a
									href="#0"> <em class="event-name">Yoga Level 1</em>
								</a></li>
							</ul>
						</li>

						<li class="events-group">
							<div class="top-info">
								<span>Tuesday</span>
							</div>

							<ul>
								<li class="single-event" data-start="10:00" data-end="11:00"
									data-content="event-rowing-workout" data-event="event-2">
									<a href="#0"> <em class="event-name">Rowing Workout</em>
								</a>
								</li>

								<li class="single-event" data-start="11:30" data-end="13:00"
									data-content="event-restorative-yoga" data-event="event-4">
									<a href="#0"> <em class="event-name">Restorative Yoga</em>
								</a>
								</li>

								<li class="single-event" data-start="13:30" data-end="15:00"
									data-content="event-abs-circuit" data-event="event-1"><a
									href="#0"> <em class="event-name">Abs Circuit</em>
								</a></li>

								<li class="single-event" data-start="15:45" data-end="16:45"
									data-content="event-yoga-1" data-event="event-3"><a
									href="#0"> <em class="event-name">Yoga Level 1</em>
								</a></li>
							</ul>
						</li>

						<li class="events-group">
							<div class="top-info">
								<span>Wednesday</span>
							</div>

							<ul>
								<li class="single-event" data-start="09:00" data-end="10:15"
									data-content="event-restorative-yoga" data-event="event-4">
									<a href="#0"> <em class="event-name">Restorative Yoga</em>
								</a>
								</li>

								<li class="single-event" data-start="10:45" data-end="11:45"
									data-content="event-yoga-1" data-event="event-3"><a
									href="#0"> <em class="event-name">Yoga Level 1</em>
								</a></li>

								<li class="single-event" data-start="12:00" data-end="13:45"
									data-content="event-rowing-workout" data-event="event-2">
									<a href="#0"> <em class="event-name">Rowing Workout</em>
								</a>
								</li>

								<li class="single-event" data-start="13:45" data-end="15:00"
									data-content="event-yoga-1" data-event="event-3"><a
									href="#0"> <em class="event-name">Yoga Level 1</em>
								</a></li>
							</ul>
						</li>

						<li class="events-group">
							<div class="top-info">
								<span>Thursday</span>
							</div>

							<ul>
								<li class="single-event" data-start="09:30" data-end="10:30"
									data-content="event-abs-circuit" data-event="event-1"><a
									href="#0"> <em class="event-name">Abs Circuit</em>
								</a></li>

								<li class="single-event" data-start="12:00" data-end="13:45"
									data-content="event-restorative-yoga" data-event="event-4">
									<a href="#0"> <em class="event-name">Restorative Yoga</em>
								</a>
								</li>

								<li class="single-event" data-start="15:30" data-end="16:30"
									data-content="event-abs-circuit" data-event="event-1"><a
									href="#0"> <em class="event-name">Abs Circuit</em>
								</a></li>

								<li class="single-event" data-start="17:00" data-end="18:30"
									data-content="event-rowing-workout" data-event="event-2">
									<a href="#0"> <em class="event-name">Rowing Workout</em>
								</a>
								</li>
							</ul>
						</li>

						<li class="events-group">
							<div class="top-info">
								<span>Friday</span>
							</div>

							<ul>
								<li class="single-event" data-start="10:00" data-end="11:00"
									data-content="event-rowing-workout" data-event="event-2">
									<a href="#0"> <em class="event-name">Rowing Workout</em>
								</a>
								</li>

								<li class="single-event" data-start="12:30" data-end="14:00"
									data-content="event-abs-circuit" data-event="event-1"><a
									href="#0"> <em class="event-name">Abs Circuit</em>
								</a></li>

								<li class="single-event" data-start="15:45" data-end="16:45"
									data-content="event-yoga-1" data-event="event-3"><a
									href="#0"> <em class="event-name">Yoga Level 1</em>
								</a></li>
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
	<%@ include file="../Basic/footer.jsp"%>
	</div>

	<!-- .cd-schedule schedule폴더에 js추가됨-->
	<script src="/project/resources/js/schedule/modernizr.js"></script>
<!-- 	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script> -->
	<!-- <script>
	if( !window.jQuery ) document.write('<script src="/project/resources/js/schedule/jquery-3.0.0.min.js"><\/script>');
	</script> -->
	<script src="/project/resources/js/schedule/main.js"></script>
	<!-- Resource jQuery -->

	<script type="text/javascript">
		$(function() {

		});
	</script>
</body>
</html>