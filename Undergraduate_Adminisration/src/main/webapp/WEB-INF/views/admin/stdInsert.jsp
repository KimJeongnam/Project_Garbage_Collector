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
				<div class="title_left">
					<h3>학생 등록</h3>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<!-- Smart Wizard -->
			<p>신규 학생 등록 메뉴입니다. 절차에 따라서 필요한 정보를 입력 해주세요.</p>
			<div id="wizard" class="form_wizard wizard_horizontal">
				<ul class="wizard_steps">
					<li><a href="#step-1"> <span class="step_no">1</span>
						 <span class="step_descr"> Step 1<br /> <small>개인정보입력</small></span></a>
					</li>
					<li><a href="#step-2"> <span class="step_no">2</span>
					 	<span class="step_descr"> Step 2<br /> <small>학과정보입력</small></span></a>
					</li>
					<li><a href="#step-3"> <span class="step_no">3</span> 
						<span class="step_descr"> Step 3<br /> <small>회원가입정보확인</small></span></a>
					</li>
				</ul>
				<!-- 학생 등록 스텝1 -개인정보입력 -->
				<div id="step-1">
					<form class="form-horizontal form-label-left">
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="first-name">이름 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="userName" name="userName" required="required"
									class="form-control col-md-7 col-xs-12">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="last-name">영문성명 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="userEngName" name="userEngName"
									required="required" class="form-control col-md-7 col-xs-12">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">주민등록번호
								<span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input id="userSsn" name="userSsn" class="date-picker form-control col-md-7 col-xs-12"
									required="required" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">성별
								<span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<div id="gender" class="btn-group" data-toggle="buttons">
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="gender" value="male"> &nbsp; Male &nbsp;
                                </label>
                                <label class="btn btn-primary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="gender" value="female"> Female
                                </label>
                              </div>
                            </div>
                      	</div>
						<div class="form-group">
							<label for="middle-name"
								class="control-label col-md-3 col-sm-3 col-xs-12">사진</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="file" id="userImage"
									class="form-control col-md-7 col-xs-12" type="text" name="userImage">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">
								핸드폰 번호 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input id="userCellNum" name="userCellNum" class="date-picker form-control col-md-7 col-xs-12"
									required="required" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">이메일
								<span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input id="userEmail" name="userEmail" class="date-picker form-control col-md-7 col-xs-12"
									required="required" type="text">
							</div>
						</div>
						<div class="form-group">
							<label for="middle-name"
								class="control-label col-md-3 col-sm-3 col-xs-12">주소</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" name="zip" class="input" required="required" 
												placeholder="입학일을 입력하시오">
								<button type="button" name="zipSearch" onclick="openZipSearch();">검색</button><br>
								주소 :<input id="studentAddress1" name="addr1"class="form-control col-md-7 col-xs-12"
									data-validate-length-range="6" data-validate-words="2"
									placeholder="" name="studentAddress1" type="text"><br>
								상세 :<input id="studentAddress2" name="addr2" class="form-control col-md-7 col-xs-12"
									data-validate-length-range="6" data-validate-words="2"
									placeholder="" name="studentAddress2" type="text"><br>
							</div>
						</div>
					</form>
				</div>
				<!-- 학생 등록 스텝2 - 학과정보입력-->
				<div id="step-2">
					<form class="form-horizontal form-label-left">
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="last-name">단과대학 <span class="required">*</span>
							</label>
							<div class="col-md-2 col-sm-2 col-xs-4">
								<select name="faculty">
						       		<option value="분류없음" >분류없음</option>
						       		<option value="사범대">사범대</option>
						       		<option value="체육대">체육대</option>
						       		<option value="예술대">예술대</option>
						       		<option value="경영대">경영대</option>
						       		<option value="자연대">자연대</option>
						       		<option value="인문대">인문대</option>
						       		<option value="공과대">공과대</option>
						       		<option value="의대">의대</option>
						       </select>
					       </div>
					       <label class="control-label col-md-1 col-sm-1 col-xs-2"
								for="last-name">학과 번호 <span class="required">*</span>
							</label>
				       		<div class="col-md-2 col-sm-2 col-xs-4">
								<select name="majorNum">
						       		<option value="분류없음" >분류없음</option>
						       		<option value="100" >100</option>
						       		<option value="101">101</option>
						       		<option value="102">102</option>
						       		<option value="103">103</option>
						       		<option value="104">104</option>
						       		<option value="105">105</option>
						       		<option value="106">106</option>
						       		<option value="107">107</option>
							  	</select>
					       </div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="last-name">학기 <span class="required">*</span>
							</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<div id="gender" class="btn-group" data-toggle="buttons">
		                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
		                                  <input type="radio" name=semester value="semester1"> &nbsp; 1학기 &nbsp;
		                                </label>
		                                <label class="btn btn-primary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
		                                  <input type="radio" name="semester" value="semester2"> 2학기
		                                </label>
	                             	</div>
								</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="last-name">학년 <span class="required">*</span>
							</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<div id="gender" class="btn-group" data-toggle="buttons">
		                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
		                                  <input type="radio" name=grade value="grade1"> &nbsp; 1학년 &nbsp;
		                                </label>
		                                <label class="btn btn-primary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
		                                  <input type="radio" name="grade" value="grade2"> 2학년
		                                </label>
		                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
		                                  <input type="radio" name=grade value="grade3"> &nbsp; 3학년 &nbsp;
		                                </label>
		                                <label class="btn btn-primary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
		                                  <input type="radio" name="grade" value="grade4"> 4학년
		                                </label>
	                             	</div>
								</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="last-name">학번 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="userNumber" name="userNumber"
									required="required" class="form-control col-md-7 col-xs-12">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="first-name">입학일 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="date" id="adDate" name="adDate" required="required"
									class="form-control col-md-2 col-xs-4">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="last-name">졸업예정일 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="date" id="graDate" name="graDate"
									required="required" class="form-control col-md-7 col-xs-12">
							</div>
						</div>
					</form>
				</div>
				<!-- 학생 등록 스텝3 -최종 입력정보확인 -->
				<div id="step-3">
					<form action ="stdInsertPro" method ="post" enctype="multipart/form-data" class="form-horizontal form-label-left">
						
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="last-name">학기 <span class="required">*</span>
							</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<div id="gender" class="btn-group" data-toggle="buttons">
		                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
		                                  <input type="radio" name=semester value="semester1"> &nbsp; 1학기 &nbsp;
		                                </label>
		                                <label class="btn btn-primary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
		                                  <input type="radio" name="semester" value="semester2"> 2학기
		                                </label>
	                             	</div>
								</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="first-name">이름 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="userName" name="userName" required="required"
									class="form-control col-md-7 col-xs-12">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="last-name">영문성명 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="userEngName" name="userEngName"
									required="required" class="form-control col-md-7 col-xs-12">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="last-name">학과 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="majorName" name="majorName"
									required="required" class="form-control col-md-7 col-xs-12">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="last-name">학년 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="grade" name="grade"
									required="required" class="form-control col-md-7 col-xs-12">
							</div>
						</div>
						<div class="form-group">
							<label for="middle-name"
								class="control-label col-md-3 col-sm-3 col-xs-12">사진</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="file" id="userImage"
									class="form-control col-md-7 col-xs-12" type="text" name="userImage">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">주민등록번호
								<span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input id="userSsn" name="userSsn" class="date-picker form-control col-md-7 col-xs-12"
									required="required" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">
								핸드폰 번호 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input id="userCellNum" name="userCellNum" class="date-picker form-control col-md-7 col-xs-12"
									required="required" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">이메일
								<span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input id="userEmail" name="userEmail" class="date-picker form-control col-md-7 col-xs-12"
									required="required" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="first-name">학번 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="userNumber" name="userNumber" required="required"
									class="form-control col-md-7 col-xs-12">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="first-name">입학일 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="date" id="adDate" name="adDate" required="required"
									class="form-control col-md-7 col-xs-12">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="last-name">졸업예정일 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="date" id="graDate" name="graDate"
									required="required" class="form-control col-md-7 col-xs-12">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="last-name">학적상태 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="leaveStatus" name="leaveStatus"
									required="required" class="form-control col-md-7 col-xs-12">
							</div>
						</div>
						<div class="form-group">
							<label for="middle-name"
								class="control-label col-md-3 col-sm-3 col-xs-12">주소</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" name="zip" class="input" required="required" 
												placeholder="입학일을 입력하시오"><br>
								주소 :<input id="studentAddress1" name="addr1"class="form-control col-md-7 col-xs-12"
									data-validate-length-range="6" data-validate-words="2"
									placeholder="" name="studentAddress1" type="text"><br>
								상세 :<input id="studentAddress2" name="addr2" class="form-control col-md-7 col-xs-12"
									data-validate-length-range="6" data-validate-words="2"
									placeholder="" name="studentAddress2" type="text"><br>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /page content -->
	<!-- 다음 주소 API 추가  -->
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

	<%@ include file="../Basic/footer.jsp"%>
	<!-- jQuery Smart Wizard -->
	<script
		src="/project/resources/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
	<script type="text/javascript">
	function openZipSearch() {
		daum.postcode.load(function(){
		new daum.Postcode({
			oncomplete: function(data) {
				$('[name=zip]').val(data.zonecode); // 우편번호 (5자리)
				$('[name=addr1]').val(data.address);
				$('[name=addr2]').val(data.buildingName);
			}
		}).open();
	});
	};
	</script>

</body>
</html>