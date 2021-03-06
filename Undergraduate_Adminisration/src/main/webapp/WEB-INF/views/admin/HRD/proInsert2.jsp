<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../Basic/settings.jsp"%>
<title>자바대학교 학사관리시스템</title>
<script src="${staticPath}/js/setRegister/setRegister.js"></script>
</head>
<body class="nav-md" >
	<%@ include file="../../Basic/navbar.jsp"%>

	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>교수 및 직원 등록</h3>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<!-- Smart Wizard -->
			<p>신규 교직원 등록 메뉴입니다. 절차에 따라서 필요한 정보를 입력 해주세요.</p>
			<div class="x_panel">

				<div class="x_content">
					<div class="" role="tabpanel" data-example-id="togglable-tabs">
						<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
							<li role="presentation" class="active"><a
								href="#tab_content1" id="home-tab" role="tab" data-toggle="tab"
								aria-expanded="true">교수 등록</a></li>
							<li role="presentation" class=""><a href="#tab_content2"
								role="tab" id="profile-tab" data-toggle="tab" 
								aria-expanded="false" >직원 등록</a></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div role="tabpanel" class="tab-pane fade active in"
								id="tab_content1" aria-labelledby="home-tab">
								<span class="section">개인정보 입력</span>
								<div class="row">
									<div class="col-md-offset-1 col-md-10">
										<form action="proInsertPro" method="post" onsubmit="return proInputChk();"
											name="proInput" enctype="multipart/form-data"class="form-horizontal form-label-left">
											<table class="table">
												<tr>
													<th class="control-label">단과대</th>
													<td><select name="faculty" id="faculty"
														style="height: 22px; width: 172px;" onchange="nextFaculty();">
															<option value="">분류없음</option>
															<c:forEach var="fa" items="${outFandM}">
																<option value="${fa.faculty}">${fa.faculty}</option>
															</c:forEach>
													</select></td>
													<th class="control-label">학과번호</th>
													<td><select name="majorNum" id="majorNum"
														style="width: 130px; height: 22px; width: 172px;" onchange="nextMajor();">
															<option value="분류없음">분류없음</option>
													</select></td>
												</tr>
												<tr>
													<th class="control-label">교번</th>
													<td>
														<input type="text" class="input"  numberOnly = "numberOnly" 
																required="required" id="userNumber" name="userNumber" max="8"
																placeholder="교번을 입력하시오" onkeyup="nextProNum();">
														<input type="button" value="중복확인" name="numberChk" id="numberChk" >
														<div id="displayTxt" ></div>
													</td>
													<th class="control-label">사진</th>
													<td><input type="file" id="userImage" type="text"
														name="userImage" onchange="nextImage();"></td>
												</tr>
												<tr>
													<th class="control-label">한글이름</th>
													<td><input type="text" class="input" korOnly="true" 
														required="required" id="userName" name="userName"
														placeholder="이름을 입력하시오"></td>
													<th class="control-label">영문이름</th>
													<td><input type="text" class="input" engOnly="true"
														required="required" id="userEngName" name="userEngName"
														placeholder="영문이름을 입력하시오"></td>
												</tr>
												<tr>
													<th class="control-label">주민등록번호</th>
													<td>
														<input class="input" type="text" name="jumin1" maxlength="6" style="width : 80px"
															onkeyup ="nextJumin1();" numberOnly="true">
															- <input class="input" type="password" name="jumin2" maxlength="7"
															style="width:81px;" onkeyup="nextJumin2();" numberOnly="true">
													</td>
													<th class="control-label">성별</th>
													<td>
														<p>
															남 <input type="radio" class="flat" name="gender" onclick="nextSex();"
																	id="genderM" value="남자" required /> &nbsp;
															여 <input type="radio" class="flat" name="gender" id="genderF" onclick="nextSex();"
																	value="여자" />
														</p>
													</td>
												</tr>
												<tr>
													<th class="control-label">휴대폰 연락처</th>
													<td>
														<input class="input" type="text" name="hp1" maxlength="3"
														 	style= "width : 40px" onkeyup="nextHP1();" numberOnly="true">
														 	-
														 	<input class="input" type="text" name="hp2" maxlength="4"
														 	style= "width : 54px" onkeyup="nextHP2();" numberOnly="true">
														 	-
														 	<input class="input" type="text" name="hp3" maxlength="4"
														 	style= "width : 54px" onkeyup="nextHP3();" numberOnly="true">
													</td>
													
													<th class="control-label">이메일</th>
													<td>
														<input class="input" type="text" name="email1" maxlength="10" style="width : 65px"> @
														<input class="input" type="text" name="email2" maxlength="20" style="width : 83px">
														<select class ="input" name="email3" style="height:23px;" onchange="selectEmailChkPro();">
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
													<td colspan="3"><input type="text" name="userZipCode"
														class="input" required="required" placeholder="우편번호를 입력하세요.">

														<button type="button" name="zipSearch"
															onclick="openZipSearch();">검색</button> <br> 
														주소 :<input id="studentAddress1" name="userAddr1"
																	style="margin-top: 5px; margin-bottom: 5px; width : 350px;"
																	placeholder="" type="text"><br>
														 상세 :<input id="studentAddress2" name="userAddr2"
														 			style="margin-top: 5px; margin-bottom: 5px; width : 350px;"
																	placeholder="" type="text"><br>
													</td>
												</tr>
												<tr>
													<th class="control-label">은행명</th>
													<td><input type="text" class="input"
														required="required" id="bankName" name="bankName"
														placeholder="은행명을 입력하시오" ></td>
													<th class="control-label">예금주</th>
													<td><input type="text" class="input"
														required="required" id="accountHolder"
														name="accountHolder" placeholder="예금주를 입력하시오"></td>
												</tr>
												<tr>
													<th class="control-label">계좌번호</th>
													<td><input type="text" class="input"
														required="required" id="accountNumber"
														name="accountNumber" placeholder="계좌번호를 입력하시오"></td>
													<th class="control-label">입사일</th>
													<td><input type="date" class="input" style="width : 172px"
														required="required" id="empHiredDate" name="empHiredDate"></td>
												</tr>
											</table>
											<div class="ln_solid"></div>
											<div class="form-group">
												<div class="col-md-6 col-md-offset-2">
													<button type="button" class="btn btn-primary"
														onclick="window.location='empStdManagement'">뒤로</button>
													<button id="send" type="submit" class="btn btn-success">교수등록</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="tab_content2"
								aria-labelledby="profile-tab" >
								<span class="section">개인정보 입력</span>
								<div class="row">
									<div class="col-md-offset-1 col-md-10">
										<form action="proInsertPro" method="post" onsubmit="return empInputChk();"
											name="empInput" enctype="multipart/form-data"
											class="form-horizontal form-label-left">
											<input type="hidden" name="majorNum" value="000"> 
											<input type="hidden" name="authority" value="ROLE_ADMIN">
											
											<table class="table">
												<tr>
													<th class="control-label">직원번호</th>
													<td>
														<input type="text" class="input" max="8" numberOnly = "numberOnly" 
																required="required" id="empNumber" name="userNumber"
																placeholder="직원번호를 입력하시오" onkeyup="nextEmpNum();">
														<input type="button" value="중복확인" name="numberChk" id="EmpnumberChk" >
														<div id="empDisplayTxt" ></div>
													</td>
													
													<th class="control-label">사진</th>
													<td><input type="file" id="empImage" type="text"
														name="userImage" onchange="nextEmpImage();"></td>
												</tr>
												<tr>
													<th class="control-label">한글이름</th>
													<td><input type="text" class="input" korOnly="true"
														required="required" id="userName" name="userName"
														placeholder="이름을 입력하시오"></td>
													<th class="control-label">영문이름</th>
													<td><input type="text" class="input" engOnly="true"
														required="required" id="userEngName" name="userEngName"
														placeholder="영문이름을 입력하시오"></td>
												</tr>
												<tr>
													<th class="control-label">주민등록번호</th>
													<td>
														<input class="input" type="text" name="jumin1" maxlength="6" style="width : 80px"
															onkeyup ="nextJumin1Emp();">
															- <input class="input" type="password" name="jumin2" maxlength="7"
															style="width:81px;" onkeyup="nextJumin2Emp();">
													</td>
													<th class="control-label">성별</th>
													<td>
														<p>
															남 <input type="radio" class="flat" name="gender" onclick="nextSexEmp();"
																id="genderM" value="남자" required /> &nbsp;
															여 <input
															type="radio" class="flat" name="gender" id="genderF"
															value="여자" onclick="nextSexEmp();" />
														</p>
													</td>
												</tr>
												<tr>
													<th class="control-label">휴대폰 연락처</th>
													<td>
														<input class="input" type="text" name="hp1" maxlength="3"
														 	style= "width : 40px" onkeyup="nextHP1Emp();">
														 	-
														 	<input class="input" type="text" name="hp2" maxlength="4"
														 	style= "width : 54px" onkeyup="nextHP2Emp();">
														 	-
														 	<input class="input" type="text" name="hp3" maxlength="4"
														 	style= "width : 54px" onkeyup="nextHP3Emp();">
													</td>
													
													<th class="control-label">이메일</th>
													<td>
														<input class="input" type="text" name="email1" maxlength="10" style="width : 65px">
														@ <input class="input" type="text" name="email2" maxlength="20" style="width : 83px">
														<select class ="input" name="email3" style="height:23px;" onchange="selectEmailChkEmp();">
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
													<td colspan="3"><input type="text" name="userZipCode"
														class="input" required="required" placeholder="우편번호를 입력하세요.">

														<button type="button" name="zipSearch"
															onclick="openZipSearch();">검색</button> <br> 
														주소 :<input id="studentAddress1" name="userAddr1"
																	style="margin-top: 5px; margin-bottom: 5px; width : 350px;"
																	placeholder="" type="text"><br>
														 상세 :<input id="studentAddress2" name="userAddr2"
														 			style="margin-top: 5px; margin-bottom: 5px; width : 350px;"
																	placeholder="" type="text"><br>
													</td>
												</tr>
												<tr>
													<th class="control-label">은행명</th>
													<td><input type="text" class="input"
														required="required" id="bankName" name="bankName"
														placeholder="은행명을 입력하시오"></td>
													<th class="control-label">예금주</th>
													<td><input type="text" class="input"
														required="required" id="accountHolder"
														name="accountHolder" placeholder="예금주를 입력하시오"></td>
												</tr>
												<tr>
													<th class="control-label">계좌번호</th>
													<td><input type="text" class="input"
														required="required" id="accountNumber"
														name="accountNumber" placeholder="계좌번호를 입력하시오"></td>
													<th class="control-label">입사일</th>
													<td><input type="date" class="input" style="width : 172px"
														required="required" id="empHiredDate" name="empHiredDate"></td>
												</tr>
											</table>
											<div class="ln_solid"></div>
											<div class="form-group">
												<div class="col-md-6 col-md-offset-2">
													<button type="button" class="btn btn-primary"
														onclick="window.location='empStdManagement'">뒤로</button>
													
													<button id="send" type="submit" class="btn btn-success">직원등록</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
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
			daum.postcode.load(function() {
				new daum.Postcode({
					oncomplete : function(data) {
						$('[name=userZipCode]').val(data.zonecode); // 우편번호 (5자리)
						$('[name=userAddr1]').val(data.address);
						$('[name=userAddr2]').val(data.buildingName);
					}
				}).open();
			});
		};

		$('#faculty').change(function() {
			var obj = new Object();
			// 임의의 obj변수명 faculty에 faculty라는 클라스가 변할때 값을 담는다.
			obj.college = $(this).val();

			//위의 obj에 담긴 값을 json문자열데이터 변환해서 jsonData에 담는다.
			var jsonData = JSON.stringify(obj);

			if ($(this).val() == "") {

				$('#majorNum').empty(); // 메이저 셀렉터 초기화
				// 초기화 이후 들어갈 value와 text 설정
				$('#majorNum').append($('<option>', {
					text : '선택하세요',
					disabled : 'disabled',
					selected : 'selected'
				}));
				console.log(obj);
			} else {
				$.ajax({
					url : "/project/rest/json/getMajors",
					type : 'POST',
					data : jsonData,
					contentType : 'application/json;charset=UTF-8',
					success : function(data) {
						setMajors(data);
					},
					error : function() {
						alert("잘못된 접근입니다.")
					}
				});
			}
		});
		/*자바스크립트 - 메이저넘 셀렉터에 옵션값을 성정해줌.   */
		var setMajors = function(data) {
			$('#majorNum').empty();

			$('#majorNum').append($('<option>', {
				text : '선택하세요',
				disabled : 'disabled',
				selected : 'selected'
			}));

			for (var i = 0; i < data.length; i++) {
				$('#majorNum').append($('<option>', {

					//데이터의 변수명은 vo의 정의된 변수명과 동일해야 함.
					text : data[i].majorNum + " : " + data[i].majorName,
					value : data[i].majorNum
				}));
			}
		}
		
		//교번 -문자만
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
		
		
		//교수 중복확인
		$(function() {
		    //idck 버튼을 클릭했을 때 
			var numberChk = 0;
		    $("#numberChk").click(function() {
		        
		        //userNum을  param.
		        var userNum = $('#userNumber').val();
		        if(userNum.length <8){
					alert("해당번호는 8자리가  충족하지 않습니다.");
					$('#userNumber').val("");
		         }else if(userNum.length >=9){
		        	alert("해당번호는 8자리가  충족하지 않습니다.");
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
		
		//emp 중복확인
		$(function() {
		    //idck 버튼을 클릭했을 때 
			var numberChk = 0;
		    $('#EmpnumberChk').click(function() {
		        
		        //userNum을  param.
		        var empNum = $('#empNumber').val();
		        if(empNum.length < 8){
					alert("해당번호는 8자리가  충족하지 않습니다.");
					$('#empNumber').val("");
		      
		          }else if(empNum.length >=9){
		        	alert("해당번호는 8자리가  충족하지 않습니다.");
					$('#empNumber').val("");  
		        }else{
		        
		        $.ajax({
		            async: true,
		            type : 'POST',
		            data : empNum,
		            url : "/project/admin/ajax/confirmNum",
		            dataType : "json",
		            contentType: "application/json; charset=UTF-8",
		            success : function(data) {
		                if (data.cnt > 0 ) {
		                    $("#empDisplayTxt").html( "<span style='color : red'>" + $("#empNumber").val() +" 은(는) 이미 사용중 입니다. </span>");
		                    $("#empNumber").val("");
		                    $("#empNumber").focus();
		                    //아이디가 존제할 경우 빨깡으로 , 아니면 검정으로 처리하는 디자인
		                
		                } else {
		                	 $("#empDisplayTxt").html( "<span style='color : black;'><b> " + $("#empNumber").val() +" 은(는) 사용가능합니다. </b></span>");
		                	 $("#empImage").focus();
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