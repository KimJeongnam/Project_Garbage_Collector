<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<!-- Bootstrap -->
<link
	href="/project/resources/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container" style="margin-top:10px;">
		<div class="panel panel-default">
			<div class="panel-heading">교수 찾기</div>
			<div class="panel-body">
				<form data-parsley-validate class="form-horizontal form-label-left">
					<div class="col-xs-6">
						<div class="form-group ">
							<label for="pro-faculty-selector" class="control-label col-xs-4">단과대 </label>
							<div class="col-xs-5">
								<select id="pro-faculty-selector" name="faculty" class="form-control" onchange="selectProFaculty();">
									<option value="0">전체</option>
								</select>
							</div>
						</div>
					</div>
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-3" for="pro-major-selector">학과 </label>
							<div class="col-xs-5">
								<select id="pro-major-selector" class="form-control" onchange="professorList();">
									<option value="0">단과대 선택</option>
								</select>
							</div>
						</div>
					</div>
					<div class="col-xs-offset-6 col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-3"> 검색: </label>
							<div class="col-xs-8">
								<input type="text" id="pro-search" placeholder="교수명"
									class="form-control" onkeyup="professorList();">
							</div>
						</div>
					</div>
					<div id="professorList"></div>
				</form>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="/project/resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="/project/resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- 단과대, 학과, 강의 등등 AJAX -->
	<script src="/project/resources/js/share/getDivisions.js"></script>
	<!-- majorlecManage.js -->
	<script src="/project/resources/js/majorlecManage.js"></script>
	
	<script type="text/javascript">
	$(function(){
		getFacultys(init_pro_faculty_selector);
		professorList();
	});
	</script>
</body>
</html>