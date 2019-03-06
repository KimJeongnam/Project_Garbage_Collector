<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../Basic/settings.jsp"%>
<title>자바대학교 학사관리시스템</title>
</head>
<body class="nav-md">
	<div class="col-md-6 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					학과 등록<small></small>
				</h2>
				<div class="clearfix"></div>
			</div>

			<div class="x_content">
				<form id="demo-form2" data-parsley-validate
					class="form-horizontal form-label-left">

					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="majorCode">학과 코드 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="majorCode" required="required"
								class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="college">단과대 <span class="required">*</span>
						</label>
						<div class="col-md-3 col-sm-3 col-xs-8">
							<select id="college" name="last-name" required="required"
								class="form-control col-md-6 col-xs-12">
								<option disabled="disabled" selected="selected">선택하세요</option>
								<option>체육과학대</option>
								<option>공과대</option>
								<option>인문대</option>
								<option>사범대</option>
								<option>경영대</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="middle-name"
							class="control-label col-md-3 col-sm-3 col-xs-12" for="majorName">학과명</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input id="majorName" class="form-control col-md-7 col-xs-12"
								type="text" name="majorName">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="count">학년별 최대 인원수 <span class="required">*</span>
						</label>
						<div class="col-md-3 col-sm-3 col-xs-8">
							<input type="number" id="count"
								class="date-picker form-control col-md-7 col-xs-12"
								required="required" type="text">
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
							<button type="submit" class="btn btn-success">등록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		$(function (){
			
		});
	</script>
</body>
</html>