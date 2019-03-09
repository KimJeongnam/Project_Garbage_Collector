<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../Basic/settings.jsp"%>
<script src="${staticPath}/js/setRegister/setRegister.js"></script>
<title>자바대학교 학사관리시스템</title>

</head>
<body class="nav-md">
	<%@ include file="../../Basic/navbar.jsp"%>
	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>학생 마이페이지</h3>
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
									<li><a class="close-link"><i class="fa fa-close"></i></a></li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<div class="col-md-3 col-sm-3 col-xs-12 profile_left">
									<div class="profile_img">
										<div id="crop-avatar">
											<!-- Current avatar -->
											<img style="width: 180px; height: 218px;" name="userImage" class="img-responsive avatar-view"
												src="${staticPath }${vo.userImage}" alt="Avatar" title="Change the avatar">
										</div>
									</div>
									<h3>${vo.userName}</h3>
									<ul class="list-unstyled user_data">
										<li><i class="fa fa-map-marker user-profile-icon"></i>
											&nbsp; ${vo.userAddr1} &nbsp;${vo.userAddr2}
										</li>
										<li><i class="fa fa-briefcase user-profile-icon"></i>&nbsp;&nbsp;${vo.majorName}</li>
										<li><i class="fa fa-university user-profile-icon">&nbsp;&nbsp;자바대학교</i></li>
										<li><i class="fa fa-phone user-profile-icon">&nbsp;&nbsp;${vo.userCellNum}</i></li>
									</ul>
									  <!-- 이미지 변경 모달  -->
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target=".bs-example-modal-sm">프로필 사진 바꾸기</button>
                                    <!-- 이미지 변경 모달끝  -->
									<!-- <a class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>프로필 사진 변경</a> <br /> -->
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
														data-toggle="tab" aria-expanded="true">학생정보</a>
													</li>
													<li role="presentation" class="">
													<a href="#tab_content2" role="tab" id="profile-tab"
														data-toggle="tab" aria-expanded="false">수강중 강의</a>
													</li>
												</ul>
												<!-- 학생정보 상세페이지 -->
												
												<div id="myTabContent" class="tab-content">
													<div role="tabpanel" class="tab-pane fade active in"
														id="tab_content1" aria-labelledby="home-tab">
														<form action="stdDetailUpdate" method="POST" name="stdMypage" 
														onsubmit="return stdMyChk();" class="form-horizontal form-label-left" >
															<span class="section">학생정보</span>
															<div class="row">
																<div class="col-md-offset-1 col-md-10">
																	<table class="table">
																		<tr>
																			<th class="control-label">
																				학번
																			</th>
																			<td>
																				<input type="text" class="input" required="required" name="userNumber" id="userNumber"
																					 onkeyup="nextStdPage();" value="${vo.userNumber}" placeholder="학번을 입력하시오" numberOnly = "numberOnly">
																				<input type="button" value="중복확인" name="numberChk" id="numberChk" >
																				<div id="displayTxt" ></div>	
																			</td>
																			<th class="control-label">
																				한글성명
																			</th>
																			<td>
																				<input type="text" class="input" required="required" name="userName" id="userName" style="width: 270px;"
																					value="${vo.userName }" placeholder="성명을 입력하시오" korOnly="true" >
																			</td>
																		</tr>
																		<tr>
																			<th class="control-label">주민등록번호</th>
																				<td>
																					<c:set var="SsnArr" value="${fn:split(vo.getUserSsn(),'-')}"/>
																					<input class="input" type="text" name="jumin1" maxlength="6" style="width : 70px"
																							onkeyup ="stdMyPageJumin1();" value="${SsnArr[0] }" numberOnly="true" readOnly="ture"> -
																					 <input class="input" type="password" name="jumin2" maxlength="7"
																							style="width:77px;" onkeyup="stdMyPageJumin2();" value="${SsnArr[1] }" numberOnly="ture" readOnly="ture">
																				</td>
																			<th class="control-label">
																				영어성명
																			</th>
																			<td>
																				<input type="text" class="input" required="required" name="userEngName"
																					value="${vo.userEngName }" style="width: 270px;" placeholder="성명을 입력하시오">
																			</td>
																		</tr>
																		<tr>
																			<th class="control-label">
																				성별
																			</th>
																			<td>
																				남 <input type="radio" class="flat" name="gender" onclick="nextSex();"
																						id="genderM" value="남자" required 
																						<c:if test="${vo.gender eq '남자' }"> checked="checked"</c:if>  /> &nbsp;
																						
																				여 <input type="radio" class="flat" name="gender" id="genderF" onclick="nextSex();"
																						value="여자" <c:if test="${vo.gender eq '여자' }"> checked="checked"</c:if> />
																			</td>
																			<th class="control-label">
																				단과대학
																			</th>
																			<td>
																				<select name="faculty" id ="faculty" style="height : 22px; width : 270px;" >
																		       			<option value="${vo.faculty}" selected>${vo.faculty}</option> 
																		       		<c:forEach var="fa" items="${outFandM}" >
																						<option value="${fa.faculty}" >${fa.faculty}</option> 
																					</c:forEach>	
																	      		</select>
																			</td>
																		</tr>
																		<tr>
																			<th class="control-label">현재학기</th>
																			<td>
																				 <p>
															                        1학기 <input type="radio" class="flat" name="semester" id="semester" 
															                       			onchange="nextSemester();" value="1" checked required
															                       			<c:if test="${vo.semester == 1 }"> checked="checked"</c:if> /> &nbsp;
															                        2학기 <input type="radio" class="flat" name="semester" id="semester" 
															                     			 value="2"  <c:if test="${vo.semester == 2 }"> checked="checked"</c:if>/>
															                     </p>
																			</td>
																			<th class="control-label">학과(전공)</th>
																			<td>
																				<select name="majorNum" id ="majorNum" selected ="${vo.majorNum}"
																						style="width : 270px; height : 22px;"  >
																					<option value="${vo.majorNum}">${vo.majorNum} : ${vo.majorName}</option>	
																		  		</select>
																			</td>
																		
																		</tr>
																		<tr>
																			
																			<th class="control-label">
																				학년
																			</th>
																			<td>
															                       1학년 <input type="radio" class="flat" name="grade" id="grade1" value="1"  required
															                       				<c:if test="${vo.grade == 1 }">checked ="checked" </c:if> />&nbsp;  
															                       2학년 <input type="radio" class="flat" name="grade" id="grade3" value="2"
															                       				<c:if test="${vo.grade == 2 }">checked ="checked" </c:if>/> &nbsp; 
															                       3학년 <input type="radio" class="flat" name="grade" id="grade3" value="3"
															                       				<c:if test="${vo.grade == 3 }">checked ="checked" </c:if>/> &nbsp; 
															                       4학년 <input type="radio" class="flat" name="grade" id="grade3" value="4"
															                       				<c:if test="${vo.grade == 4 }">checked ="checked" </c:if>/> 
																			</td>
																			<th class="control-label">
																				졸업 예정일
																			</th>
																			<td>
																				<input type="date" class="input" required="required" style="width: 270px;"
																					name="graDate" value="${vo.graDate}" placeholder="졸업예정일을 입력하시오">
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
																					<select class ="input" name="email3" style="height:23px;" onchange="stdMyPageEmailChk();">
																						<option value="0">직접입력</option>
																						<option value="naver.com">네이버</option>
																						<option value="gmail.com">구글</option>
																						<option value="hanmail.net">다음</option>
																						<option value="nate.com">네이트</option>
																					</select>
																				</td>
																				
																				
																			<th class="control-label">휴대폰 연락처</th>
																				<td>
																					<c:set var="phArr" value="${fn:split(vo.getUserCellNum(),'-')}"/>
																					<input class="input" type="text" name="hp1" maxlength="3"
																				 	style= "width : 69px" onkeyup="StdMyPagePh1();" value="${phArr[0] }" numberOnly="true">
																				 	-
																				 	<input class="input" type="text" name="hp2" maxlength="4"
																				 	style= "width : 89px" onkeyup="StdMyPagePh2();" value="${phArr[1] }" numberOnly="true">
																				 	-
																				 	<input class="input" type="text" name="hp3" maxlength="4"
																				 	style= "width : 89px" onkeyup="StdMyPagePh3();" value="${phArr[2] }" numberOnly="true">
																				</td>	
																			
																		</tr>
																		<tr>
																			<th class="control-label">
																				주소
																			</th>
																			<td colspan="3">
																				<input type="text" name="userZipCode" class="input" required="required" 
																					value="${vo.userZipCode }" placeholder="우편번호를 입력하시오" style="width : 201px">

																				<button type="button" name="ZipCode" onclick="openZipSearch();">검색</button><br>
																				주소 : <br>
																				<input id="studentAddress1" name="userAddr1" type="text" 
																					style="margin-top: 5px; margin-bottom: 5px; width : 350px;"
																					value="${vo.userAddr1 }" placeholder="주소를 입력하시오" type="text"><br>
																				
																				상세 : <br>
																				<input id="studentAddress2" name="userAddr2" 
																					style="margin-top: 5px; margin-bottom: 5px; width : 350px;"
																					type="text" value="${vo.userAddr2 }" placeholder="상세주소를 입력하시오" type="text">
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
													<!-- 수강중 강의 상세페이지 -->
													<div role="tabpanel" class="tab-pane fade"
														id="tab_content2" aria-labelledby="profile-tab">
														<span class="section">수강중 강의</span>
														<!-- start user projects -->
														<table class="data table table-striped no-margin">
															<thead>
																<tr>
																	<th>강의코드</th>
																	<th>강의명</th>
																	<th>교수명</th>
																	<th class="hidden-phone">교수 연락처</th>
																	<th>이수학점</th>
																	<th>수강인원</th>
																</tr>
															</thead>
															<tbody>
															<c:forEach var="lec" items="${lecList }">
															<c:if test="${!empty lecList}">
																<tr>
																	<td>${lec.lecCode }</td>
																	<td>${lec.lectureName }</td>
																	<td>${lec.userName }</td>
																	<td class="hidden-phone">${lec.userCellNum }</td>
																	<td class="vertical-align-mid">${lec.lectureScore }</td>
																	<td>${lec.appliedStd} / ${lec.maximumCapacity}</td>
																</tr>
															</c:if>
															</c:forEach>	
															<c:if test="${empty lecList}">
																<tr>
																	<th colspan="6" style="text-align :center;">수강중인 강의가 없습니다.</th>
																</tr>
															</c:if>
															</tbody>
														</table>
														<!-- end user projects -->
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
                    <form action="stdImgUpdate" method="post" enctype="multipart/form-data">  
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
	<!-- /page content -->
	<%@ include file="../../Basic/footer.jsp"%>
	<script type="text/javascript">
	//다음 주소 이용한 주소검색
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
		
		
		//학번중복체크
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