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
				<div id="lectureList" class="">
				
				</div>
				<div id="schoolTimeTable" class="">
				
				</div>
				</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /page content -->
	<%@ include file="../Basic/footer.jsp"%>
	<script type="text/javascript">
		$(function() {
	    	<%@ include file="../Basic/docReadyScripts.jsp" %>
	    	studentLecture('${userNumber}');
	    	studentTimetable('${userNumber}');
	    });
	</script>

</body>
</html>