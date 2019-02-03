<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../Basic/settings.jsp"%>
<title>Insert title here</title>
</head>
<body class="nav-md">
	<%@ include file="../Basic/navbar.jsp"%>

<script>
function getMessages(){
	var obj = new Object();
	obj.userNumber = '${userNumber}';
	
	$.ajax({
		
	});
}
</script>

	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>모든쪽지</h3>
				</div>

				<div class="title_right">
					<div
						class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="검색">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">Go!</button>
							</span>
						</div>
					</div>
				</div>

				<div class="clearfix"></div>

				<div id="messageBoard" class="">
					
				</div>

			</div>
		</div>
	</div>


	<%@ include file="../Basic/footer.jsp"%>
	<script>
	$(function(){
		getMessages('${userNumber}');
	});
	</script>
</body>
</html>