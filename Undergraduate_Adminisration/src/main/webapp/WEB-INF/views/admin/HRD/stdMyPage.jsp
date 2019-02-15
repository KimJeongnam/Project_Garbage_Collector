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
					<h3>학생 상세정보</h3>
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
													<li role="presentation" class="">
													<a href="#tab_content3" role="tab" id="profile-tab2"
														data-toggle="tab" aria-expanded="false">과제관리</a>
													</li>
												</ul>
												<!-- 학생정보 상세페이지 -->
												
												<div id="myTabContent" class="tab-content">
													<div role="tabpanel" class="tab-pane fade active in"
														id="tab_content1" aria-labelledby="home-tab">
														<form action="stdDetailUpdate" method="POST" class="form-horizontal form-label-left" novalidate>
															<span class="section">학생정보</span>
															<div class="row">
																<div class="col-md-offset-1 col-md-10">
																	<table class="table">
																		<tr>
																			<th class="control-label">
																				학번
																			</th>
																			<td>
																				<input type="text" class="input" required="required" name="userNumber"
																					value="${vo.userNumber}" placeholder="학번을 입력하시오">
																			</td>
																			<th class="control-label">
																				한글성명
																			</th>
																			<td>
																				<input type="text" class="input" required="required" name="userName"
																					value="${vo.userName }" placeholder="성명을 입력하시오">
																			</td>
																		</tr>
																		<tr>
																			<th class="control-label">
																				주민등록번호
																			</th>
																			<td>
																				<input type="text" class="input" required="required" name="userSsn"
																					value="${vo.userSsn }" placeholder="주민등록번호를 입력하시오">
																			</td>
																			<th class="control-label">
																				영어성명
																			</th>
																			<td>
																				<input type="text" class="input" required="required" name="userEngName"
																					value="${vo.userEngName }" placeholder="성명을 입력하시오">
																			</td>
																		</tr>
																		<tr>
																			<th class="control-label">
																				성별
																			</th>
																			<td>
																				<input type="text" class="input" required="required" name="gender"
																					value="${vo.gender }" placeholder="성별을 입력하시오. 남 또는 여">
																			</td>
																			<th class="control-label">
																				단과대학
																			</th>
																			<td>
																				<select name="faculty" id ="faculty" style="height : 22px; width : 165px;" >
																		       			<option value="${vo.faculty}" selected>${vo.faculty}</option> 
																		       		<c:forEach var="fa" items="${outFandM}" >
																						<option value="${fa.faculty}" >${fa.faculty}</option> 
																					</c:forEach>	
																	      		</select>
																			</td>
																		</tr>
																		<tr>
																			<th class="control-label">
																				학적상태
																			</th>
																			<td>
																				<select name="graduation_state" style="height : 22px; width : 165px;"
																						selected="${vo.graduation_state}">
																					<option value="${vo.graduation_state}" selected>${vo.graduation_state}</option>	
																					<option value="0">재학중</option>
																					<option value="1">휴학중</option>
																					<option value="2">졸업</option>
																				</select>
																				<%-- <c:if test = "${vo.graduation_state ==0}">
																					<input type="text" class="input" required="required" 
																					name="graduation_state" value="재학중" placeholder="학적상태를 입력하시오 0 또는 1">
																				</c:if>
																				<c:if test = "${vo.graduation_state ==1}">
																					<input type="text" class="input" required="required" 
																					name="graduation_state" value="졸업" placeholder="학적상태를 입력하시오 0 또는 1">
																				</c:if> --%>
																			</td>
																			<th class="control-label">
																				학과(전공)
																			</th>
																			<td>
																				<select name="majorNum" id ="majorNum" selected ="${vo.majorNum}"
																						style="width : 165px; height : 22px;" >
																					<option value="${vo.majorNum}">${vo.majorNum} : ${vo.majorName}</option>	
																		  		</select>
																			</td>
																		</tr>
																		<tr>
																			<th class="control-label">
																				현재학기
																			</th>
																			<td>
																				<input type="text" class="input" required="required" name="semester"
																					value="${vo.semester }" placeholder="현재학기를 입력하시오. 1 또는 2">
																			</td>
																			<th class="control-label">
																				학년
																			</th>
																			<td>
																				<input type="text" class="input" required="required" name="grade"
																					value="${vo.grade }" placeholder="학년을 입력하시오. 1,2,3,4">
																			</td>
																		</tr>
																		<tr>
																			<th class="control-label">
																				이메일
																			</th>
																			<td>
																				<input type="text" class="input" required="required" name="userEmail"
																					value="${vo.userEmail }" placeholder="이메일을 입력하시오">
																			</td>
																			<th class="control-label">
																				졸업 예정일
																			</th>
																			<td>
																				<input type="date" class="input" required="required" style="width: 166px;"
																					name="graDate" value="${vo.graDate}" placeholder="졸업예정일을 입력하시오">
																			</td>
																		</tr>
																		<tr>
																			<th class="control-label">
																				주소
																			</th>
																			<td >
																				<input type="text" name="userZipCode" class="input" required="required" 
																					value="${vo.userZipCode }" placeholder="입학일을 입력하시오">
																					
																				<button type="button" name="ZipCode" onclick="openZipSearch();">검색</button><br>
																				주소 :<input id="userAddr1" name="userAddr1"class="form-control col-md-7 col-xs-12"
																					data-validate-length-range="6" data-validate-words="2"
																					value="${vo.userAddr1 }" placeholder="" type="text"><br>
																				상세 :<input id="userAddr2" name="userAddr2" class="form-control col-md-7 col-xs-12"
																					data-validate-length-range="6" data-validate-words="2"
																					value="${vo.userAddr2 }" placeholder="" type="text"><br>
																			</td>
																			<th class="control-label">
																				연락처
																			</th>
																			<td>
																				<input type="text" class="input" required="required" name="userCellNum"
																					value="${vo.userCellNum}" placeholder="연락처를 입력하시오">
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
																	<th>#</th>
																	<th>강의명</th>
																	<th>교수명</th>
																	<th class="hidden-phone">교수 연락처</th>
																	<th>학업 진행상황</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>1</td>
																	<td>경제학개론</td>
																	<td>김민섭</td>
																	<td class="hidden-phone">010-2265-4578</td>
																	<td class="vertical-align-mid">
																		<div class="progress">
																			<div class="progress-bar progress-bar-success"
																				data-transitiongoal="35"></div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>2</td>
																	<td>정치학개론</td>
																	<td>정치호</td>
																	<td class="hidden-phone">010-2265-4578</td>
																	<td class="vertical-align-mid">
																		<div class="progress">
																			<div class="progress-bar progress-bar-danger"
																				data-transitiongoal="15"></div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>3</td>
																	<td>초급 자바</td>
																	<td>김정남</td>
																	<td class="hidden-phone">010-2265-4578</td>
																	<td class="vertical-align-mid">
																		<div class="progress">
																			<div class="progress-bar progress-bar-success"
																				data-transitiongoal="45"></div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td>4</td>
																	<td>자동차 분해실습</td>
																	<td>박대근</td>
																	<td class="hidden-phone">010-2265-4578</td>
																	<td class="vertical-align-mid">
																		<div class="progress">
																			<div class="progress-bar progress-bar-success"
																				data-transitiongoal="75"></div>
																		</div>
																	</td>
																</tr>
															</tbody>
														</table>
														<!-- end user projects -->
													</div>
													<!-- 과제관리 상세페이지 -->
													<div role="tabpanel" class="tab-pane fade"
														id="tab_content3" aria-labelledby="profile-tab">
														<span class="section">과제관리</span>
														<!-- page content -->
															<div class="">
																<div class="clearfix"></div>
																<div class="row">
																	<div class="col-md-12">
																		<div class="x_panel">
																			<div class="x_title">
																				<h2>강의 1 과제 관리</h2>
																				<div class="btn-group" style="float: right">
																					<button data-toggle="dropdown"
																						class="btn btn-default dropdown-toggle" type="button">
																						진행중인 강의 선택 <span class="caret"></span>
																					</button>
																					<ul class="dropdown-menu">
																						<li><a href="#">운동역학</a></li>
																						<li><a href="#">운동 생리학</a></li>
																						<li><a href="#">운동 역학의 스포츠 적용</a></li>
																					</ul>
																				</div>
																				<div class="clearfix"></div>
																			</div>
																			<div class="x_content">
																				<div class="col-md-9 col-sm-9 col-xs-12">
																					<ul class="stats-overview">
																						<li><span class="name"> 총 수강인원 </span> <span
																							class="value text-success"> 30 </span></li>
																						<li><span class="name"> 과제 제출 인원 </span> <span
																							class="value text-success"> 3 </span></li>
																						<li class="hidden-phone"><span class="name">
																						과제 미제출 인원</span> 
																						<span class="value text-success">27</span></li>
																					</ul>
																					<div>
																						<h4>제출리스트</h4>
																						<!-- end of user messages -->
																						<ul class="messages">
																							<li><img src="${staticPath }${vo.userImage}" name="userImage" class="avatar" alt="Avatar">
																								<div class="message_date">
																									<h3 class="date text-info">24</h3>
																									<p class="month">1월</p>
																								</div>
																								<div class="message_wrapper">
																									<h4 class="heading">김설현</h4>
																									<blockquote class="message">운동역학의 이해 제출합니다.</blockquote>
																									<br />
																									<p class="url">
																										<span class="fs1 text-info" aria-hidden="true" data-icon=""></span>
																										 <a href="#"><i class="fa fa-paperclip"></i> 2019380527 김설현
																											운동역학의 이해.doc </a>
																									</p>
																								</div>
																							</li>
																							<li><img src="${staticPath }${vo.userImage}" name="userImage" class="avatar" alt="Avatar">
																								<div class="message_date">
																									<h3 class="date text-info">24</h3>
																									<p class="month">1월</p>
																								</div>
																								<div class="message_wrapper">
																									<h4 class="heading">김설현</h4>
																									<blockquote class="message">운동역학의 이해 제출합니다.</blockquote>
																									<br />
																									<p class="url">
																										<span class="fs1 text-info" aria-hidden="true" data-icon=""></span> 
																										<a href="#"><i class="fa fa-paperclip"></i> 2019380527 김설현
																											운동역학의 이해.doc </a>
																									</p>
																								</div>
																							</li>
																						</ul>
																						<!-- end of user messages -->
																					</div>
																				</div>
																				<!-- start project-detail sidebar -->
																				<div class="col-md-3 col-sm-3 col-xs-12">
																					<section class="panel">
																						<div class="x_title">
																							<h2>운동역학</h2>
																							<div class="clearfix"></div>
																						</div>
																						<div class="panel-body">
																							<h3 class="green">
																								<i class="fa fa-university"></i> 1주차 과제
																							</h3>
																							<p>
																								1주차 운동역학의 이해. 운동역학 p.1 - p.134 까지 읽고 운동역학의 정의와
																								개념, 목적, 필요성에 대해 서술하고 운동역학의 스포츠 적용 및 연구영역에 대해 자세히
																								서술하시오. <br>
																								<br> 한글 /폰트 크기 11 / 굴림 / 개요 를 준수.
																							</p>
																							<br />
																							<div class="project_detail">
																								<p class="title">교수</p> 
																								<p>정치호</p>
																								<p class="title">강의</p>
																								<p>운동역학</p>
																							</div>
																							<br />
																							<h5>참고자료</h5>
																							<ul class="list-unstyled project_files">
																								<li><a href=""><i class="fa fa-file-word-o"></i> 운동역학.docx</a></li>
																								<li><a href=""><i class="fa fa-file-pdf-o"></i> 운동역학의 스포츠적용.pdf</a></li>
																								<li><a href=""><i class="fa fa-mail-forward"></i> 운동역학의 역사.mln</a></li>
																								<li><a href=""><i class="fa fa-picture-o"></i> 이미지.png</a></li>

																							</ul>
																							<br />
																							<!-- Large modal -->
																							<div class="text-center mtop20">
																								<button type="button" class="btn btn-sm btn-primary"
																									data-toggle="modal" data-target=".bs-example-modal-lg1">과제 업로드
																								</button>
																								<!-- modal 여러개 사용시 위 data-target 과 밑 class 이름을 같게 수정하셈!! -->
																								<div class="modal fade bs-example-modal-lg1"
																									tabindex="-1" role="dialog" aria-hidden="true">
																									<div class="modal-dialog modal-lg">
																										<div class="modal-content">
																											<div class="modal-header">
																												<button type="button" class="close" data-dismiss="modal">
																													<span aria-hidden="true">×</span>
																												</button>
																												<h4 class="modal-title" id="myModalLabel">과제 업로드 </h4>
																											</div>
																											<div class="modal-body">
																												<form action="#" class="dropzone"></form>
																											</div>
																											<div class="modal-footer">
																												<button type="button" class="btn btn-default"
																													data-dismiss="modal">취소
																												</button>
																												<button type="button" class="btn btn-primary">저장</button>
																											</div>
																										</div>
																									</div>
																								</div>
																							</div>
																						</div>
																					</section>
																				</div>
																				<!-- end project-detail sidebar -->
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														<!-- /page content -->
													</div>
													<!-- END/과제관리 상세페이지 -->
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
                    <form action="userImgUpdate" method="post" enctype="multipart/form-data">  
                    	<input type="hidden" name="userNumber" value="${vo.userNumber}">
                    	<input class="btn btn-info" type="file" name="userImage" style="position:relative;right:11px;">
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
	</script>
</body>
</html>