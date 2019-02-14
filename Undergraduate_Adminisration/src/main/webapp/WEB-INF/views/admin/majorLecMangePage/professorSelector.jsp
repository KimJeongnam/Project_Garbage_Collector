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
							<label for="faculty" class="control-label col-xs-4">단과대 </label>
							<div class="col-xs-5">
								<select id="faculty" name="faculty" class="form-control">
									<option value="0">선택</option>
									<option value="5">5</option>
								</select>
							</div>
						</div>
					</div>
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-3" for="major">학과 </label>
							<div class="col-xs-5">
								<select id="major" class="form-control">
									<option value="0">선택</option>
									<option value="5">5</option>
								</select>
							</div>
						</div>
					</div>
					<div class="col-xs-offset-6 col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-3"> 검색: </label>
							<div class="col-xs-8">
								<input type="text" id="search" placeholder="교수명"
									class="form-control">
							</div>
						</div>
					</div>
					<table class="table table-striped jambo_table bulk_action">
						<thead>
							<tr class="headings">
								<th class="text-center">교번</th>
								<th class="text-center">사진</th>
								<th class="text-center">단과대</th>
								<th class="text-center">학과명</th>
								<th class="text-center">이름</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="pro" items="${professors }">
								<tr>
									<td class="text-center" style="vertical-align: middle;">${pro.userNumber}</td>
									<td class="text-center" style="vertical-align: middle;">
									 	<img src="/project/resources${pro.userImage}" class="rounded" alt="...">
									 </td>
									<td class="text-center" style="vertical-align: middle;">${pro.faculty }</td>
									<td class="text-center" style="vertical-align: middle;">${pro.major }</td>
									<td><input class="btn btn-primary" type="button" value="선택"
										onclick=""></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>

	</div>

	<!-- jQuery -->
	<script src="/project/resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="/project/resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>