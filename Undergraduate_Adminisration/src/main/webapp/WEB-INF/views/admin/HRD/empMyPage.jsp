<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<%@ include file="../../Basic/settings.jsp"%>
<script src="${staticPath}/js/setRegister/setRegister.js"></script>
<title>Insert title here</title>
</head>
<body class="nav-md">
	<%@ include file="../../Basic/navbar.jsp"%>
	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>직원 마이페이지</h3>
				</div>
				<div class="clearfix"></div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>프로필</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link">
									<i class="fa fa-chevron-up"></i></a>
									</li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false">
										<i class="fa fa-wrench"></i></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Settings 1</a></li>
											<li><a href="#">Settings 2</a></li>
										</ul>
									</li>
									<li>
										<a class="close-link"><i class="fa fa-close"></i></a>
									</li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<div class="col-md-3 col-sm-3 col-xs-12 profile_left">
									<div class="profile_img">
										<div id="crop-avatar">
											<!-- Current avatar -->
											<img style="width: 180px; height: 218px;"
												class="img-responsive avatar-view" src="${staticPath}${vo.userImage}" 
												alt="Avatar" title="Change the avatar">
										</div>
									</div>
									<h3>${vo.userName}</h3>
									<ul class="list-unstyled user_data">
										<li>
											<i class="fa fa-map-marker user-profile-icon"></i>
											&nbsp; ${vo.userAddr1} &nbsp;${vo.userAddr2}
										</li>

										<li>
											<i class="fa fa-briefcase user-profile-icon"></i>
											&nbsp;&nbsp;${vo.majorName}
										</li>
										<li>
											<i class="fa fa-university user-profile-icon">&nbsp;&nbsp;자바대학교</i>
										</li>
										<li>
											<i class="fa fa-phone user-profile-icon">&nbsp;&nbsp;${vo.userCellNum}</i>
										</li>
									</ul>
									<!-- 이미지 변경 모달  -->
									<button type="button" class="btn btn-success"
										data-toggle="modal" data-target=".bs-example-modal-sm">
										프로필 사진 바꾸기</button>
									<!-- 이미지 변경 모달끝  -->
									<br />
								</div>
								<div class="col-md-9 col-sm-9 col-xs-12">
									<div class="x_panel">
										<div class="x_title">
											<h2><i class="fa fa-bars"></i> 개인정보</h2>
											<div class="clearfix"></div>
										</div>
										<div class="x_content">
											<div class="" role="tabpanel"
												data-example-id="togglable-tabs">
												<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
													<li role="presentation" class="active">
														<a href="#tab_content1" id="home-tab" role="tab"
														data-toggle="tab" aria-expanded="true">개인정보</a>
													</li>
												</ul>
												<div id="myTabContent" class="tab-content">
													<div role="tabpanel" class="tab-pane fade active in"
														id="tab_content1" aria-labelledby="home-tab">
														<form action="empDetailUpdate" method="POST" name="empMypage" 
															onsubmit="return empMyChk();" class="form-horizontal form-label-left" >
															<span class="section">개인정보</span>
															<div class="row">
																<div class="col-md-offset-1 col-md-10">
																	<table class="table">
																		<tr>
																			<th class="control-label">
																				직원번호
																			</th>
																			<td>
																				<input type="text" class="input" required="required" name="userNumber" id="userNumber" 
																					 onkeyup="nextEmpPage();" value="${vo.userNumber}" placeholder="교번을 입력하시오" numberOnly = "numberOnly">
																				<input type="button" value="중복확인" name="numberChk" id="numberChk" >
																				<div id="displayTxt" ></div>
																			</td>
																			<th class="control-label">
																				한글성명
																			</th>
																			<td>
																				<input type="text" class="input" required="required" name="userName"
																					value="${vo.userName }" placeholder="성명을 입력하시오" korOnly="true" >
																			</td>
																		</tr>
																		<tr>
																			<th class="control-label">주민등록번호</th>
																				<td>
																					<c:set var="SsnArr" value="${fn:split(vo.getUserSsn(),'-')}"/>
																					<input class="input" type="text" name="jumin1" maxlength="6" style="width : 73px"
																							onkeyup ="empMyPageJumin1();" value="${SsnArr[0] }"  numberOnly="true"> -
																					 <input class="input" type="password" name="jumin2" maxlength="7"
																							style="width:80px;" onkeyup="empMyPageJumin2();" value="${SsnArr[1] }" numberOnly="true" readonly>
																				</td>
																			<th class="control-label">
																				영어성명
																			</th>
																			<td>
																				<input type="text" class="input" required="required" name="userEngName"
																					value="${vo.userEngName }" placeholder="성명을 입력하시오" engOnly="true">
																			</td>
																		</tr>
																		<tr>
																			<th class="control-label">성별</th>
																			<td>
																				남 <input type="radio" class="flat" name="gender" onclick="nextSex();"
																						id="genderM" value="남자" required 
																						<c:if test="${vo.gender eq '남자' }"> checked="checked"</c:if>  /> &nbsp;
																						
																				여 <input type="radio" class="flat" name="gender" id="genderF" onclick="nextSex();"
																						value="여자" <c:if test="${vo.gender eq '여자' }"> checked="checked"</c:if> />
																			</td>
																			<th class="control-label">휴대폰 연락처</th>
																			<td>
																				<c:set var="phArr" value="${fn:split(vo.getUserCellNum(),'-')}"/>
																				<input class="input" type="text" name="hp1" maxlength="3" numberOnly="true"
																			 	style= "width : 40px" onkeyup="empMyPagePh1();" value="${phArr[0] }">
																			 	-
																			 	<input class="input" type="text" name="hp2" maxlength="4" numberOnly="true"
																			 	style= "width : 50px" onkeyup="empMyPagePh2();" value="${phArr[1] }">
																			 	-
																			 	<input class="input" type="text" name="hp3" maxlength="4" numberOnly="true"
																			 	style= "width : 50px" onkeyup="empMyPagePh3();" value="${phArr[2] }">
																			</td>							
																			
																		</tr>
																		<tr>
																			<th class="control-label">이메일</th>
																				<td>
																					<c:set var="emailArr" value="${fn:split(vo.getUserEmail(),'@')}"/>
																					<input class="input" type="text" name="email1" maxlength="10" style="width : 65px"
																							value="${emailArr[0] }"> @
																					<input class="input" type="text" name="email2" maxlength="20" style="width : 83px"
																							value="${emailArr[1] }">
																					<select class ="input" name="email3" style="height:23px;" onchange="empMyPageEmailChk();">
																						<option value="0">직접입력</option>
																						<option value="naver.com">네이버</option>
																						<option value="gmail.com">구글</option>
																						<option value="hanmail.net">다음</option>
																						<option value="nate.com">네이트</option>
																					</select>
																				</td>
																				<th class="control-label">입사일</th>
																				<td><input type="date" class="input" value="${vo.empHiredDate}" name="empHiredDate"
																					style="width: 166px;" required="required" placeholder="입사일을 입력하시오">
																				</td>
																		</tr>
																		<tr>
																			
																			<th class="control-label">은행명</th>
																			<td><input type="text" class="input" value="${vo.bankName}"
																				name="bankName" required="required" placeholder="은행명을 입력하시오">
																			</td>
																			<th class="control-label">연차</th>
																			<td><input type="text" class="input" value="${vo.annualLevel}"
																				name="annualLevel" required="required" placeholder="연차를 입력하시오" numberOnly="true">
																			</td>
																		</tr>
																		<tr>
																			<th class="control-label">계좌번호</th>
																			<td><input type="text" class="input" value="${vo.accountNumber}"
																				name="accountNumber" required="required" placeholder="계좌번호를 입력하시오">
																			</td>
																			<th class="control-label">예금주</th>
															 				<td><input type="text" class="input" value="${vo.accountHolder}"
																				name="accountHolder" required="required" placeholder="예금주를 입력하시오">
																			</td>
																		</tr>
																		<tr>
																			<th class="control-label">주소</th>
																			<td colspan="3"><input type="text" name="userZipCode"
																				class="input" required="required"
																				value="${vo.userZipCode }" placeholder="입학일을 입력하시오">

																				<button type="button" name="zipSearch"
																					onclick="openZipSearch();">검색</button>
																				<br> 주소 :<input id="studentAddress1"
																				name="userAddr1" class="form-control col-md-7 col-xs-12"
																				value="${vo.userAddr1 }" data-validate-length-range="6"
																				data-validate-words="2" placeholder="" type="text"><br>
																				상세 :<input id="studentAddress2" name="userAddr2"
																				class="form-control col-md-7 col-xs-12"
																				value="${vo.userAddr2 }" data-validate-length-range="6"
																				data-validate-words="2" placeholder="" type="text"><br>
																			</td>
																		</tr>
																	</table>
																</div>
															</div>
															<div class="ln_solid"></div>
															<div class="form-group">
																<div class="col-md-6 col-md-offset-5">
																	<button type="button" class="btn btn-primary" onclick="window.location='empStdManagement'">뒤로</button>
																	<button id="send" type="submit" class="btn btn-success">수정</button>
																	<button type="button" class="btn btn-danger" 
																	onclick="window.location='stdDeletePro?userNumber=${vo.userNumber}'">삭제</button>
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
				</div>
			</div>
		</div>
	</div>
	<!-- /page content -->
	 <!-- 이미지 업로드 모달  -->
    <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel2">프로필 사진 바꾸기</h4>
                </div>
                <div class="modal-body">
                    <form action="proImgUpdate" method="post" enctype="multipart/form-data">  
                    	<input type="hidden" name="userNumber" value="${vo.userNumber}">
                    	<input class="btn btn-info" type="file" name="userImage" style="position:relative; right:11px;">
                    	<button type="reset" class="btn btn-default" data-dismiss="modal">취소</button>
                   		<button type="submit" class="btn btn-primary">변경</button>
                    </form>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <!-- 이미지 업로드 모달 끝 -->
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
 			
 			  $('#faculty').empty(); // 메이저 셀렉터 초기화
 			// 초기화 이후 들어갈 value와 text 설정
 			$('#faculty').append($('<option>', {
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
 					//JSONDATA(키 : 맵)의 리스트가 담겨있음
 					setMajors(data);
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
		
		
		
		//직원번호중복체크
		$(function() {
	    //idck 버튼을 클릭했을 때 
		var numberChk = 0;
	    $("#numberChk").click(function() {
	        
	        //userNum 을 param.
	        var userNum = $('#userNumber').val();
	        if(userNum.length != 8){
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
	                	 $("#userName").focus();
	                    
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
