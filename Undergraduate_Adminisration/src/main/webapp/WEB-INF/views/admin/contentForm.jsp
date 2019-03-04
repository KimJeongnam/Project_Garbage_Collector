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
				<div class="title">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>글 제목 : ${dto.scholarname}</h2>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">

								<div class="bs-example" data-example-id="simple-jumbotron">
									<div class="textarea">
										<div
											style="border: 5px double #48BAE4; height: auto; padding: 10px; margin-bottom: 20px; font-size: 18px;">
											<p>${dto.scholarcontent}</p>
										</div>
										<input class="btn btn-primary" type="button" value="목록"
											onclick="window.location='registrationList'">
									</div>
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

	<script type="text/javascript">
		$(function (){
			<%@ include file="../Basic/docReadyScripts.jsp" %>
		});
	</script>
</body>
</html>