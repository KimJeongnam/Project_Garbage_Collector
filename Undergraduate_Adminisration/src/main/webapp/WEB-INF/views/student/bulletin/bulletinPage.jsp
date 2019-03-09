<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="../../Basic/settings.jsp"%>
<title>자바대학교 학사관리시스템</title>
</head>
<body class="nav-md">
	<%@ include file="../../Basic/navbar.jsp"%>
	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left"></div>
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
							<div class="x_panel">
								<div class="x_title">
									<h2>장학금 신청 & 수혜내역</h2>
									<div class="clearfix"></div>
								</div>
								<div class= "row">
								<div class="x_content">
									<div class="row form-inline">
										<div class="col-sm-6">
											<h2>장학금 신청 글</h2>
											
											<div id="bulletinList" class=""></div>
										</div>
										
										<div class="col-md-6 col-sm-6 col-xs-6">
										<h2>장학금 수혜 내역</h2>
										<div id="managementlist" class=""></div>
										</div>
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
	<%@ include file="../../Basic/footer.jsp"%>
	<script type="text/javascript">
		$(function() {
		studentBulletinlist('${userNumber}',1); 
		studentmanagementlist('${userNumber}',1);
		});
	</script>

</body>
</html>