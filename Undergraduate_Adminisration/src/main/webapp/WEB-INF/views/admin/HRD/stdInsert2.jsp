<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../Basic/settings.jsp"%>
<title>Insert title here</title>
<script src="${staticPath}/js/setRegister/setRegister.js"></script>
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
					<form action="stdInsertPro" method="post" onsubmit="return stdInputChk();"
						enctype="multipart/form-data" name="stdInput"
						class="form-horizontal form-label-left">
						<input type="hidden" name="hiddenNum" value="0">
						<table class="table">
							<tr>
								<th class="control-label">단과대</th>
								<td>
									<select name="faculty" id ="faculty" style="height : 22px;" onchange="nextFacultyStd();">
							       		<option value="" >분류없음</option>
							       		<c:forEach var="fa" items="${outFandM}" >
											<option value="${fa.faculty}">${fa.faculty}</option>
										</c:forEach>	
						      		</select>
								</td>
								<th class="control-label">학과번호</th>
								<td>
									<select name="majorNum" id ="majorNum" style="width : 130px; height : 22px;"  onchange="nextMajorStd();">
							       		<option value="" >분류없음</option>
							  		</select>
								</td>
							</tr>
							<tr>
								<th class="control-label">학기</th>
								<td>
									 <p>
				                        1학기 <input type="radio" class="flat" name="semester" id="semester" 
				                       			onchange="nextSemester();" value="1" checked required /> &nbsp;
				                        2학기 <input type="radio" class="flat" name="semester" id="semester" 
				                     			 value="2"  />
				                     </p>
								</td>
								<th class="control-label">학년</th>
								<td>
									<p>
				                       		  1학년 <input type="radio" class="flat" name="grade" id="grade1" value="1"  checked required /> 
				                      &nbsp;  3학년 <input type="radio" class="flat" name="grade" id="grade3" value="3"/> 
				                     </p>
								</td>
							</tr>
							<tr>
								<th class="control-label">학번</th>
								<td><input type="text" class="input" required="required" id="userNumber" name="userNumber" value=""
											min="8" placeholder="학번을 입력하시오" numberOnly = "numberOnly"  onkeyup="nextStdNum();">
									<input type="button" value="중복확인" name="numberChk" id="numberChk" >
									<div id="displayTxt" ></div>
								</td>
								<th class="control-label">사진</th>
								<td>
									<input type="file" id="userImage"type="text" name="userImage" onchange="nextStdImage();">
								</td>
							</tr>
							<tr>
								<th class="control-label">한글이름</th>
								<td><input type="text" class="input" required="required" korOnly="true" 
									id="userName" name="userName" placeholder="이름을 입력하시오">
								</td>
								<th class="control-label">영문이름</th>
								<td><input type="text" class="input" required="required" engOnly="true"
									id="userEngName" name="userEngName" placeholder="영문이름을 입력하시오">
								</td>
							</tr>
							<tr>
								<th class="control-label">주민등록번호</th>
									<td>
										<input class="input" type="text" name="jumin1" maxlength="6" style="width : 73px"
											onkeyup ="nextJumin1Std();" numberOnly="true">
											- <input class="input" type="password" name="jumin2" maxlength="7"
											style="width:80px;" onkeyup="nextJumin2Std();" numberOnly="true">
									</td>
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
									<td>
										<input class="input" type="text" name="hp1" maxlength="3"
										 	style= "width : 40px" onkeyup="nextHP1Std();" numberOnly="true">
										 	-
										 	<input class="input" type="text" name="hp2" maxlength="4"
										 	style= "width : 50px" onkeyup="nextHP2Std();" numberOnly="true">
										 	-
										 	<input class="input" type="text" name="hp3" maxlength="4"
										 	style= "width : 50px" onkeyup="nextHP3Std();" numberOnly="true">
									</td>
								<th class="control-label">이메일</th>
									<td>
										<input class="input" type="text" name="email1" maxlength="10" style="width : 65px"> @
										<input class="input" type="text" name="email2" maxlength="20" style="width : 83px">
										<select class ="input" name="email3" style="height:23px;" onchange="selectEmailChkStd();">
											<option value="0">직접입력</option>
											<option value="naver.com">네이버</option>
											<option value="gmail.com">구글</option>
											<option value="hanmail.net">다음</option>
											<option value="nate.com">네이트</option>
										</select>
									</td>
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
									id="adDate" name="adDate" style="width: 165px;" placeholder="현재학기를 입력하시오"></td>
								<th class="control-label">졸업예정일</th>
								<td><input type="date" class="input" required="required"
									id="graDate" name="graDate" style="width: 165px;" placeholder="연락처를 입력하시오"></td>
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
 	//전화번호 010만 입력 가능
 	 
 	
 		//학번 -문자만
		$("input:text[numberOnly]").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		});
	
		//영어이름 -영문자만
		$(document).on("keyup", "input:text[engOnly]", function() {
			$(this).val( $(this).val().replace(/[0-9]|[^\!-z\s]/gi,"") );
		});

		//한글이름 
		$(document).on("keyup", "input:text[korOnly]", function() {
			$(this).val( $(this).val().replace(/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"\\]/g,"") );
		});
		

		
		$(function() {
		    //idck 버튼을 클릭했을 때 
			var numberChk = 0;
		    $("#numberChk").click(function() {
		        
		        //userNum 을 param.
		        var userNum = $('#userNumber').val();
		        if(userNum.length  != 8){
					alert("해당번호는 8자리를  충족하지 않습니다.");
					$('#userNumber').val("");
		        }else{
		        
		        $.ajax({
		            async: true,
		            type : 'POST',
		            data : userNum,
		            url : "/project/admin/ajax/confirmNum",
		            dataType : "json",
		            contentType: "application/json; charset=UTF-8",
		            success : function(data) {
		                if (data.cnt > 0) {
		                    $("#displayTxt").html( "<span style='color : red'>" + $("#userNumber").val() +" 은(는) 이미 사용중 입니다. </span>");
		                    $("#userNumber").val("");
		                    $("#userNumber").focus();
		                    //아이디가 존제할 경우 빨깡으로 , 아니면 검정으로 처리하는 디자인
		                
		                } else {
		                	 $("#displayTxt").html( "<span style='color : black;'><b> " + $("#userNumber").val() +" 은(는) 사용가능합니다. </b></span>");
		                	 $("#userImage").focus();
		                    
		                    //아이디가 존제할 경우 빨깡으로 , 아니면 검정으로 처리하는 디자인
		                    //아이디가 중복하지 않으면  numberChk = 1 
		                    numberChk = 1;
		                    
		                }
		            },
		            error : function(error) {
		                
		                alert("error : " + error);
		            }
		        
		        });
		        }
		    });
		});
		
	
	</script>

</body>
</html>