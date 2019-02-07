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
				<div class="x_panel">
				<div class="row">
					<div class="col-md-offset-1 col-md-10">
					<form action="stdInsertPro" method="post"
						enctype="multipart/form-data"
						class="form-horizontal form-label-left">
						<table class="table">
							<tr>
								<th class="control-label">단과대</th>
								<td>
									<select name="faculty" id ="faculty" onchange="selectFandM" >
							       		<option value="분류없음" >분류없음</option>
							       		<c:forEach var="fa" items="${outFandM}">
											<option value="${fa.faculty}">${fa.faculty}</option>
										</c:forEach>	
						      		</select>
								</td>
								<th class="control-label">학과번호</th>
								<td>
									<select name="majorNum" id ="majorNum">
							       		<option value="분류없음" >분류없음</option>
							       		<c:forEach var="major" items="${outFandM}">
											<option value="${major.majorNum}">${major.majorNum} : ${major.majorName}</option>
										</c:forEach>	
							  		</select>
								</td>
							</tr>
							<tr>
								<th class="control-label">학기</th>
								<td>
									 <p>
				                        1학기 <input type="radio" class="flat" name="semester" id="semester1" value="1" checked="semester1" required /> 
				                       &nbsp; 2학기 <input type="radio" class="flat" name="semester" id="semester2" value="2" />
				                     </p>
								</td>
								<th class="control-label">학년</th>
								<td>
									<p>
				                        1학년 <input type="radio" class="flat" name="grade" id="grade1" value="1" checked="grade1" required /> 
				                      &nbsp;  2학년 <input type="radio" class="flat" name="grade" id="grade2" value="2" />
				                      &nbsp;  3학년 <input type="radio" class="flat" name="grade" id="grade3" value="3" /> 
				                      &nbsp;  4학년 <input type="radio" class="flat" name="grade" id="grade4" value="4" />
				                     </p>
								</td>
							</tr>
							<tr>
								<th class="control-label">학번</th>
								<td><input type="text" class="input" required="required" id="userNumber" name="userNumber"
									placeholder="학번을 입력하시오">
									
								</td>
								<th class="control-label">사진</th>
								<td>
									<input type="file" id="userImage"type="text" name="userImage">
								</td>
							</tr>
							<tr>
								<th class="control-label">한글이름</th>
								<td><input type="text" class="input" required="required"
									id="userNumber" name="userNumber" placeholder="이름을 입력하시오">
								</td>
								<th class="control-label">영문이름</th>
								<td><input type="text" class="input" required="required"
									id="userEngName" name="userEngName" placeholder="영문이름을 입력하시오">
								</td>
							</tr>
							<tr>
								<th class="control-label">주민등록번호</th>
								<td><input type="text" class="input" required="required"
									id="userSsn" name="userSsn" placeholder="주민번호를 입력하시오"></td>
								<th class="control-label">성별</th>
								<td> 
									 <p>
				                        M <input type="radio" class="flat" name="gender" id="genderM" value="M"  required/> 
				                       	&nbsp;F <input type="radio" class="flat" name="gender" id="genderF" value="F" />
				                     </p>
								</td>
							</tr>
							<tr>
								<th class="control-label">휴대폰 연락처</th>
								<td><input type="text" class="input" required="required"
									id="userCellNum" name="userCellNum" placeholder="연락처를 입력하시오"></td>
								<th class="control-label">이메일</th>
								<td><input type="text" class="input" required="required"
									id="userEmail" name="userEmail" placeholder="이메일을 입력하시오"></td>
							</tr>
							<tr>
								<th class="control-label">주소</th>
								<td colspan="3"><input type="text" name="userZipCode" class="input"
									required="required" placeholder="주소를 입력하시오">

									<button type="button" name="zipSearch"
										onclick="openZipSearch();">검색</button>
									<br> 주소 :<input id="studentAddress1" name="userAddr1"
									class="form-control col-md-7 col-xs-12"
									data-validate-length-range="6" data-validate-words="2"
									placeholder=""  type="text"><br>
									상세 :<input id="studentAddress2" name="userAddr2"
									class="form-control col-md-7 col-xs-12"
									data-validate-length-range="6" data-validate-words="2"
									placeholder="" type="text"><br>
								</td>
							</tr>
							<tr>
								<th class="control-label">입학일</th>
								<td><input type="date" class="input" required="required"
									id="adDate" name="adDate" placeholder="현재학기를 입력하시오"></td>
								<th class="control-label">졸업예정일</th>
								<td><input type="date" class="input" required="required"
									id="graDate" name="graDate" placeholder="연락처를 입력하시오"></td>
							</tr>
						</table>
						<div class="ln_solid"></div>
							<div class="form-group">
								<div class="col-md-6 col-md-offset-5">
									<button type="button" class="btn btn-primary">취소</button>
									<button id="send" type="submit" class="btn btn-success">학생등록</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				</div>
				</div>
			</div>
		</div>
	<!-- /page content -->
	<!-- 다음 주소 API 추가  -->
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

	<%@ include file="../Basic/footer.jsp"%>
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
	function selectFandM(){
		$.ajax({
			url:"/admin/selectFaculty",
			type:"post",
			dataType:"json",
			data:{faculty: $("select[name='faculty'] > option:selected").val()}, //faculty slect의 값이 선택되면
			success: function(data) {
				$("select[name='majorNum'] option").remove();  // 옵션 제거
				$("select[name='majorNum']").append('<option value=""> - 선택 - </option>');
				
				$(data).each(function(index, item) {
					$("select[name='majorNum']").append('<option value="' + major.majorNum + '">' + major.majorNum +":"+ major.majorName + '</option>');
				});
		    }
	   });
 	};
	</script>

</body>
</html>