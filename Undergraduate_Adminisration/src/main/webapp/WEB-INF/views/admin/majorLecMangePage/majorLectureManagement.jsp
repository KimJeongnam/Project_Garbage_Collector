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
									<div style="text-align: right;">
									<label>
											<input type="search" id="major-search-keyword"
												class="form-control input-sm col-md-2"
												onkeyup="getMajors();" placeholder="학과명">
									</label>
									</div>
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
									<div class="col-md-4 col-sm-4 col-xs-6 form-inline"
										style="padding-right: 0px;">
										<label> Show <select class="form-control input-sm"
											id="lecture-pagesize" onchange="getLectureList();">
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
										<label>구분: <select class="form-control input-sm"
											id="divisionSelector" onchange="getLectureList();">
												<option selected="selected" value="all">전체</option>
												<option value="1">전공</option>
												<option value="0">교양</option>
										</select>
										</label>
									</div>
									<div class="col-md-4 col-sm-4 col-xs-6 form-inline"
										style="padding-right: 0px;">
										<label>단과대: <select class="form-control input-sm"
											id="lec-facultySelector" onchange="selectLecFaculty();">
												<option selected="selected" value="0">전체</option>
										</select>
										</label>
									</div>
									
								</div>
								<div class="col-md-6">
									<div class="col-md-4 col-sm-6 col-xs-6 form-inline"
										style="padding-right: 0px;">
										<label>학과: <select class="form-control input-sm"
											id="lec-majorSelector" onchange="getLectureList();">
												<option selected="selected" value="0">단과대 선택</option>
										</select>
										</label>
									</div>
									<div class="col-md-8 col-sm-6 col-xs-6" style="text-align: right;">
										<label> Search: <input type="search"
											id="lecture-search-keyword" class="form-control input-sm"
											onkeyup="getLectureList();" placeholder="학과명">
										</label>
									</div>
								</div>
							</div>
							<div id="lectureList"></div>
							<input type="button" class="btn btn-primary" 
								onclick="openNewLectureModal();" value="신규">
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ==============================학과 추가, 수정 모달창START================================ -->

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
									for="majorCode">학과 코드 
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
									for="college">단과대 
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
									for="count">학년별 최대 인원수 
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
		<!-- ==============================학과 추가, 수정모달창END================================ -->
		
		<!-- ==============================강의 추가,수정모달창START================================ -->
		<div class="modal fade" id="lecture-Modal" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" onclick="initLectureModal();">
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
							<input hidden="true" type="text" id="majorNum"> <!-- 학과번호 -->
							<!--  -->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										for="lecCode">강의 코드 
									</label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input type="text" id="lecCode_view" disabled="disabled"
											class="form-control col-md-7 col-xs-12"> <input
											hidden="true" type="text" id="lecCode"
											required="required" class="form-control col-md-7 col-xs-12">
									</div>
								</div>
								
								<div class="form-group">
									<label for="middle-name"
										class="control-label col-md-3 col-sm-3 col-xs-12"
										for="majorName">교수 선택</label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input id="empNumberButton" class="form-control btn btn-warning col-md-7 col-xs-12"
											type="button" required="required" onclick="openProfessorSelector()" onchange=""
											value="선택 하세요.">
										<input id="empNumber" hidden="true" type="text">
									</div>
								</div>
								
								<div class="form-group">
									<label for="middle-name"
										class="control-label col-md-3 col-sm-3 col-xs-12"
										for="grade">학년</label>
									<div class="col-md-3 col-sm-3 col-xs-12">
										<select  id="grade" class="form-control col-md-3 col-xs-12">
											<option value="1" selected="selected">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
										</select>
									</div>
									<label for="middle-name"
										class="control-label col-md-2 col-sm-3 col-xs-12"
										for="grantedSemester">학기</label>
									<div class="col-md-3 col-sm-6 col-xs-12">
										<select  id="grantedSemester" class="form-control col-md-3 col-xs-12">
											<option value="1" selected="selected">1</option>
											<option value="2">2</option>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label for="middle-name"
										class="control-label col-md-3 col-sm-3 col-xs-12"
										for="classRoom">강의실</label>
									<div class="col-md-8 col-sm-6 col-xs-12">
										<input id="classRoom" class="form-control col-md-7 col-xs-12"
											type="text" required="required">
									</div>
								</div>
								<div class="form-group">
									<label for="middle-name"
										class="control-label col-md-3 col-sm-3 col-xs-12"
										for="classTimeButton">강의 시간 선택</label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input id="classTimeButton" class="form-control btn btn-default col-md-7 col-xs-12"
											type="button" value="교수를 선택하세요." disabled="disabled">
										<input id="classTime" hidden="true" type="text">
									</div>
									<div class="col-md-3 col-sm-6 col-xs-12">
										<input id="lecTimeReset" class="btn btn-warning col-md-7 col-xs-12"
											type="button" required="required" value="초기화" style="padding:5px;">
									</div>
								</div>
							</div>
							<!--  -->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										for="lectureClassfication">구분
									</label>
									<div class="col-md-3 col-sm-3 col-xs-8">
										<select id="lectureClassfication" required="required"
											class="form-control col-md-6 col-xs-12">
											<option value="선택">선택</option>
											<option value="0">교양</option>
											<option value="1">전공</option>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label for="middle-name"
										class="control-label col-md-3 col-sm-3 col-xs-12"
										for="lectureName">강의명</label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input id="lectureName" class="form-control col-md-7 col-xs-12"
											type="text" required="required">
									</div>
								</div>
								
								<div class="form-group">
									<label for="middle-name"
										class="control-label col-md-3 col-sm-3 col-xs-12"
										for="lectureScore">학점</label>
									<div class="col-md-3 col-sm-3 col-xs-12">
										<select  id="lectureScore" class="form-control col-md-3 col-xs-12">
											<option value="1" selected="selected">1 학점</option>
											<option value="2">2 학점</option>
											<option value="3">3 학점</option>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										for="maximumcapacity">제한 인원수
									</label>
									<div class="col-md-3 col-sm-3 col-xs-8">
										<input type="number" id="maximumcapacity"
											class="form-control col-md-7 col-xs-12"
											required="required" type="text" min="0">
									</div>
								</div>
							</div>
							<!--  -->
						</form>
					</div>
					<div class="modal-footer">
						<form id="demo-form3" data-parsley-validate
							class="form-horizontal form-label-left">
							<div class="col-md-6">
								<div class="form-group">
									<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3 text-left">
										<input type="button" class="btn btn-success" value="등록"
											onclick="insertLecture();" id="lectureModalBtn"> <input hidden="true"
											type="button" class="btn btn-danger" value="삭제" onclick=""
											id="lectureModalDelBtn">
									</div>
								</div>``
							</div><div class="col-md-6"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<!-- ==============================강의 추가,수정모달창END================================ -->
	</div>

	<%@ include file="../../Basic/footer.jsp"%>
	<script src="${staticPath }/js/majorlecManage.js"
		type="text/javascript"></script>
	
	
	<script>
	var setModifyLectureModal = function(data){
		initTime();
		
		if(data.lectureTimes.length==0){
			$('#classTimeButton').val('강의 시간을 선택 하세요.');
			$('#classTimeButton').attr("class", "form-control btn btn-warning col-md-7 col-xs-12");
		}else{
			$('#classTimeButton').attr("class", "form-control btn btn-success col-md-7 col-xs-12");	

			data.lectureTimes.forEach(function (time){
				var obj = new Object();
				obj.lectureDay = time.lectureDay;
				obj.classTime = time.classTime;
				lectureTimeMap.set(time.timetblCode, obj);
			});
			var str = dayParser(lectureTimeMap);
			$('#classTimeButton').val(str);
		}
		$('#classTimeButton').attr("onclick", "openTimeSelector('"+data.userNumber+"');")
		$('#classTimeButton').removeAttr("disabled");
		
		$('#majorNum').val(data.majorNum);
		setLecCode(data.lecCode);
		$('#lecTimeReset').attr('hidden', 'false');
		// 초기화 버튼 onclick 설정 해줘야함
		$('#empNumberButton').val(data.userNumber);
		$('#empNumberButton').attr("class", "form-control btn btn-success col-md-7 col-xs-12")
		$('#empNumber').val(data.userNumber);
		$('#grade').val(data.grade);
		$('#grantedSemester').val(data.grantedSemester);
		$('#classRoom').val(data.classRoom);
		$('#lectureClassfication').val(Number(data.lectureClassfication));
		$('#lectureName').val(data.lectureName);
		$('#lectureScore').val(data.lectureScore);
		$('#maximumcapacity').val(data.maximumCapacity);
		$('#lectureModalBtn').attr("onclick", "");
		$('#lectureModalBtn').attr("value", "수정");
		
		$('#lecture-Modal').modal({backdrop:'static', keyboard:false});
	}
	
	
		$(function() {
			getFacultys(init_collegeSelector);
			getFacultys(init_lec_facultySelector);
			getMajors();
			getLectureList();
		});
	</script>
</body>
</html>