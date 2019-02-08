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
				<div class="title_left"></div>
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
								<div class= "row">
								<div class="x_content">
									<div class="row form-inline">
										<div class="col-sm-6">
											<label> Show <select class="form-control input-sm"
												id="lectureList-pagesize"
												onchange="studentLecture('${userNumber}', 1);">
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
											<input type="search" id="lectureList-search-keyword"
												class="form-control input-sm"
												onkeyup="studentLecture('${userNumber}', 1);" placeholder="검색">
											</div>
										</div>
									</div>
								</div>
								<div id="lectureList" class=""></div>
							</div>
							<div class="col-md-12 col-sm-12 col-xs-12" style="">
								<h2>신청내역</h2>
								<div class="clearfix"></div>
								<div id="MyLectureList" class=""></div>
							</div>
							</div>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div id="schoolTimeTable" class=""></div>
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
		studentMyLecture('${userNumber}');
		studentTimetable('${userNumber}');
		studentLecture('${userNumber}', 1);
			//applyLecture('${userNumber}','${dto.lecCode}');
			/* $("#lectureHover").hover(function(){
				$(this).css("background-color", "yellow");
			}); */
			/* $("#lectureHover").hover(function(){
				var obj = new Object();
				obj.lecCode = $("#getLecCode").value;
				
				var jsonData = JSON.stringify(obj);
				
				$.ajax({
					url: '/project/student/lectureList',
					type: 'POST',
					data : jsonData,
					contentType : 'application/json;charset=UTF-8',
					success : function(data){
						if(data != null){
							$('#lectureList').html(data);
						}
					},
					error:function(){
						alert("Error! studentLecture();");
					}
				})
			}); */
		});
	</script>

</body>
</html>