<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../Basic/settings.jsp"%>
<title>Insert title here</title>
</head>
<body class="nav-md">
	<%@ include file="../../Basic/navbar.jsp"%>


	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>교직업무</h3>
				</div>

				<div class="title_right">
					<div
						class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="학생 검색">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">검색</button>
							</span>
						</div>
					</div>
				</div>
			</div>

			<div class="clearfix"></div>

			<div class="row">
				<div class="col-md-4 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>
								학과<small></small>
							</h2>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<div class="row form-group-sm">
								<div class="col-md-3 col-sm-4 col-xs-6 form-inline"
									style="padding-right: 0px;">
									<label> Show <select class="form-control input-sm"
										id="major-pagesize" onchange="getMajors();">
											<option value="5">5</option>
											<option value="10" selected="selected">10</option>
											<option value="25">25</option>
											<option value="50">50</option>
											<option value="100">100</option>
									</select>
									</label>
								</div>
								<div class="col-md-4 col-sm-4 col-xs-6 form-inline"
									style="padding-right: 0px;">
									<label>단과대: <select class="form-control input-sm"
										id="collegeSelector" onchange="getMajors();">
											<option selected="selected" value="0">전체</option>
									</select>
									</label>
								</div>
								<div class="col-md-5 col-sm-8 col-xs-6 form-inline"
									style="padding-right: 0px;">
									<label>
										<div style="text-align: right;">
											<input type="search" id="major-search-keyword"
												class="form-control input-sm col-md-2"
												onkeyup="getMajors();" placeholder="학과명">
										</div>
									</label>
								</div>
							</div>
							<div id="majorList"></div>
							<input type="button" class="btn btn-primary"
								onclick="openMajorModal('신규');" value="신규">
						</div>
					</div>
				</div>

				<div class="col-md-8 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>
								강의<small></small>
							</h2>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<div class="row form-inline">
								<div class="col-md-6">
									<div class="col-md-3 col-sm-4 col-xs-6 form-inline"
										style="padding-right: 0px;">
										<label> Show <select class="form-control input-sm"
											id="lecture-pagesize" onchange="">
												<option value="5">5</option>
												<option value="10" selected="selected">10</option>
												<option value="25">25</option>
												<option value="50">50</option>
												<option value="100">100</option>
										</select>
										</label>
									</div>
									<div class="col-md-3 col-sm-4 col-xs-6 form-inline"
										style="padding-right: 0px;">
										<label>구분: <select class="form-control input-sm"
											id="divisionSelector" onchange="">
												<option selected="selected" value="0">전체</option>
										</select>
										</label>
									</div>
									<div class="col-md-3 col-sm-4 col-xs-6 form-inline"
										style="padding-right: 0px;">
										<label>학과: <select class="form-control input-sm"
											id="majorSelector" onchange="">
												<option selected="selected" value="0">전체</option>
										</select>
										</label>
									</div>
								</div>
								
								<div class="col-md-6">
									<div style="text-align: right;">
										<label> Search: <input type="search"
											id="lecture-search-keyword" class="form-control input-sm"
											onkeyup="" placeholder="학과명">
										</label>
									</div>
								</div>
							</div>
							<div id="lectureList"></div>
							<input type="button" class="btn btn-primary" onclick=""
								value="신규">
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- majorModal -->

		<div class="modal fade" id="majorAdd-Modal" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>

						<div class="modal-title row">
							<div class="col-md6" id="majorModal-title">
								<h4>학과 등록</h4>
							</div>
						</div>
					</div>
					<div class="modal-body">
						<form id="demo-form2" data-parsley-validate
							class="form-horizontal form-label-left">
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="majorCode">학과 코드 <span class="required">*</span>
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input type="text" id="majorCode_view" disabled="disabled"
										class="form-control col-md-7 col-xs-12"> <input
										hidden="true" type="text" id="majorCode" name="majorCode"
										required="required" class="form-control col-md-7 col-xs-12">

								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="college">단과대 <span class="required">*</span>
								</label>
								<div class="col-md-3 col-sm-3 col-xs-8">
									<select id="college" name="last-name" required="required"
										class="form-control col-md-6 col-xs-12">
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="middle-name"
									class="control-label col-md-3 col-sm-3 col-xs-12"
									for="majorName">학과명</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input id="majorName" class="form-control col-md-7 col-xs-12"
										type="text" name="majorName" required="required">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="count">학년별 최대 인원수 <span class="required">*</span>
								</label>
								<div class="col-md-3 col-sm-3 col-xs-8">
									<input type="number" id="count"
										class="date-picker form-control col-md-7 col-xs-12"
										required="required" type="text" min="0">
								</div>
							</div>
							<div class="ln_solid"></div>
							<div class="form-group">
								<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
									<input type="button" class="btn btn-success" value=""
										onclick="" id="majorModalBtn"> <input hidden="true"
										type="button" class="btn btn-danger" value="삭제" onclick=""
										id="majorModalDelBtn">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="lecture-Modal" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>

						<div class="modal-title row">
							<div class="col-md6" id="lectureModal-title">
								<h4>강의 등록</h4>
							</div>
						</div>
					</div>
					<div class="modal-body">
						<form id="demo-form2" data-parsley-validate
							class="form-horizontal form-label-left">
							<!--  -->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										for="majorCode">강의 코드 <span class="required">*</span>
									</label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input type="text" id="majorCode_view" disabled="disabled"
											class="form-control col-md-7 col-xs-12"> <input
											hidden="true" type="text" id="majorCode" name="majorCode"
											required="required" class="form-control col-md-7 col-xs-12">
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										for="college">단과대 <span class="required">*</span>
									</label>
									<div class="col-md-3 col-sm-3 col-xs-8">
										<select id="college" name="last-name" required="required"
											class="form-control col-md-6 col-xs-12">
										</select>
									</div>
								</div>
							</div>
							<!--  -->
							<div class="col-md-6">
								<div class="form-group">
									<label for="middle-name"
										class="control-label col-md-3 col-sm-3 col-xs-12"
										for="majorName">학과명</label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input id="majorName" class="form-control col-md-7 col-xs-12"
											type="text" name="majorName" required="required">
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										for="count">학년별 최대 인원수 <span class="required">*</span>
									</label>
									<div class="col-md-3 col-sm-3 col-xs-8">
										<input type="number" id="count"
											class="date-picker form-control col-md-7 col-xs-12"
											required="required" type="text" min="0">
									</div>
								</div>
							</div>
							<!--  -->
							<div class="ln_solid"></div>
							<div class="col-md-6">
								<div class="form-group">
									<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
										<input type="button" class="btn btn-success" value=""
											onclick="" id="majorModalBtn"> <input hidden="true"
											type="button" class="btn btn-danger" value="삭제" onclick=""
											id="majorModalDelBtn">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../../Basic/footer.jsp"%>
	<script src="${staticPath }/js/majorlecManage.js"
		type="text/javascript"></script>
	<script>
		var init_collegeSelector = function(facultys) {
			for (var i = 0; i < facultys.length; i++)
				$('#collegeSelector').append($('<option>', {
					value : facultys[i],
					text : facultys[i]
				}));
		}

		$(function() {
			getFacultys(init_collegeSelector);
			getMajors();
		});
	</script>
</body>
</html>