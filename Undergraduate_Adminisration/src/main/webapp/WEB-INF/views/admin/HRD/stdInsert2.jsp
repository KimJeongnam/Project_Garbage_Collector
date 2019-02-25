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
									<select name="faculty" id ="faculty" style="height : 22px;">
							       		<option value="" >분류없음</option>
							       		<c:forEach var="fa" items="${outFandM}" >
											<option value="${fa.faculty}">${fa.faculty}</option>
										</c:forEach>	
						      		</select>
								</td>
								<th class="control-label">학과번호</th>
								<td>
									<select name="majorNum" id ="majorNum" style="width : 130px; height : 22px;">
							       		<option value="" >분류없음</option>
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
									id="userName" name="userName" placeholder="이름을 입력하시오">
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
				                       	남<input type="radio" class="flat" name="gender" id="genderM" value="남자"  required/>&nbsp;
				                       	여<input type="radio" class="flat" name="gender" id="genderF" value="여자" />
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
								<div class="col-md-6 col-md-offset-2">
									<button type="button" class="btn btn-primary" onclick="window.location='empStdManagement'">뒤로</button>
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

	<%@ include file="../../Basic/footer.jsp"%>
	<script type="text/javascript">
	function openZipSearch() {
		daum.postcode.load(function(){
		new daum.Postcode({
			oncomplete: function(data) {
				$('[name=userZipCode]').val(data.zonecode); // 우편번호 (5자리)
				$('[name=userAddr1]').val(data.address);
				$('[name=userAddr2]').val(data.buildingName);
			}
		}).open();
	});
	};
	
	
 	$('#faculty').change(function(){
 		var obj = new Object();
 		// 임의의 obj변수명 faculty에 faculty라는 클라스가 변할때 값을 담는다.
 		obj.college = $(this).val(); 
 		
 		//위의 obj에 담긴 값을 json문자열데이터 변환해서 jsonData에 담는다.
 		var jsonData = JSON.stringify(obj);
 		
 		if($(this).val()==""){
 			
 			$('#majorNum').empty(); // 메이저 셀렉터 초기화
 			// 초기화 이후 들어갈 value와 text 설정
 			$('#majorNum').append($('<option>', {
				text : '선택하세요',
				disabled : 'disabled',
				selected : 'selected'
			}));
 		}else{
 			$.ajax({
 				url : "/project/rest/json/getMajors",
 				type : 'POST',
 				data : jsonData,
 				contentType : 'application/json;charset=UTF-8',
 				success : function(data){
 					setMajors(data);
 					
 					/* $('#majorNum').empty(); 
 					
 					//여기서의 data는 위의 매개변수 데이터, 즉, 위에서 매핑하여 내려온 jsonData
 					for(var i=0; i<data.length; i ++){
 						$('#majorNum').append($('<option>',{
 							
 							//데이터의 변수명은 vo의 정의된 변수명과 동일해야 함.
 			 				text : data[i].majorNum +" : "+ data[i].majorName,
 			 				value : data[i].majorNum
 			 			}));
 					} */
 				},
 				error : function(){
 					alert("잘못된 접근입니다.")
 				}
 			});
 		}
 	});
 	/*자바스크립트 - 메이저넘 셀렉터에 옵션값을 성정해줌.   */
 	  var setMajors = function(data){
		$('#majorNum').empty();
		
		$('#majorNum').append($('<option>', {
			text : '선택하세요',
			disabled : 'disabled',
			selected : 'selected'
		}));
		
		for(var i=0; i<data.length; i++){
			$('#majorNum').append($('<option>',{
			
				//데이터의 변수명은 vo의 정의된 변수명과 동일해야 함.
				text : data[i].majorNum +" : "+ data[i].majorName,
	 			value : data[i].majorNum 
			}));
		}
	}  
 	
 	//셀렉트박스 디스플레이
 /* 	 function majorDisplay(major){
 	 	if(major!=null){
 	 		for(var i=0; i<major.length; i++){
 	 			majorDisplay(major[i].majorNum, major[i].majorName);
 	 		}
 	 	}
 	 }  */
	</script>

</body>
</html>