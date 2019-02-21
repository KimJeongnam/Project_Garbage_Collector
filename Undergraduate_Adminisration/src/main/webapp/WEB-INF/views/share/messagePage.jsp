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

	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>메세지</h3>
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

				<div class="">
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>
									Daily active users <small>Sessions</small>
								</h2>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<div class="row form-inline">
									<div class="col-sm-6">
										<label>
											Show
											<select class="form-control input-sm" id="msg-pagesize" onchange="getMessages('${userNumber }', 1);">
												<option value="5">5</option>
												<option value="10" selected="selected">10</option>
												<option value="25">25</option>
												<option value="50">50</option>
												<option value="100">100</option>
											</select>
										</label>
									</div>
										
									<div class="col-sm-6">
										<div style="text-align: right;">
											<label>
												Search:
												<input type="search" id="msg-search-keyword" class="form-control input-sm"
													onkeyup="getMessages('${userNumber }', 1);">
											</label>
										</div>
									</div>
								</div>
								<div id="messageBoard"></div>
							</div>
						</div>
					</div>
					
					<div class="col-md-6 col-sm-6 col-xs-12" id="show-msg-panel">
						
					</div>
				</div>

			</div>
		</div>
	</div>


	<%@ include file="../Basic/footer.jsp"%>
	<script>
	$(function(){
		getMessages('${userNumber}', 1);
	});
	</script>
</body>
</html>