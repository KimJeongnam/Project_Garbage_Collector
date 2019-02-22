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
					<h3>마이페이지</h3>
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
                                            <img style="width: 180px; height: 218px;" id="pimage" name="pimage" class="img-responsive avatar-view" src="${staticPath }${vo.getUserImage()}" alt="Avatar" title="Change the avatar">
                                        </div>
                                    </div>
                                    <h3></h3>

                                    <ul class="list-unstyled user_data">
                                        <li><i class="fa fa-map-marker user-profile-icon"></i> ${vo.getUserAddr1()}${vo.getUserAddr2()}
                                        </li>

                                        <li>
                                            <i class="fa fa-briefcase user-profile-icon"></i> 자바대학교
                                        </li>

                                        <li>
                                            <i class="fa fa-university user-profile-icon">${vo.getMajorName()}</i>
                                        </li>
                                        <li>
                                            <i class="fa fa-phone user-profile-icon"> ${vo.getUserCellNum()}</i>
                                        </li>

                                    </ul>
                                   

                                    <!-- 이미지 변경 모달  -->
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target=".bs-example-modal-sm">프로필 사진 바꾸기</button>
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
														<form action="s_infoupdate" class="form-horizontal form-label-left" novalidate>
															<span class="section">학생정보</span>
															<div class="row">
																<div class="col-md-offset-1 col-md-10">
																	<table class="table">
																		<tr>
																			<th class="control-label">
																				학번
																			</th>
																			<td>
																				${vo.getUserNumber()}
																			</td>
																			<th class="control-label">
																				성명
																			</th>
																			<td>
																				<input type="text" class="input" required="required" 
																					name = "name" placeholder="성명을 입력하시오" value="${vo.getUserName()}">
																			</td>
																		</tr>
																		<tr>
																			<th class="control-label">
																				주민등록번호
																			</th>
																			<td>
																				${vo.getUserSsn()}
																			</td>
																			
																			<th class="control-label">
																				성별
																			</th>
																			<td>
																				${vo.getGender()}
																			</td>
																		</tr>
																		<tr>
																			<th class="control-label">
																				단과대학
																			</th>
																			<td>
																				 ${vo.getFaculty()}
																			</td>
																			<th class="control-label">
																				학과(전공)
																			</th>
																			<td>
																				${vo.getMajorName()}
																			</td>
																		</tr>
																		<tr>
																			<th class="control-label">
																				학적상태
																			</th>
																			<c:if test = "${vo.getGraduation_state() == 0}">
																			<td>
																				재학
																			</td>
																			</c:if>
																			
																			<c:if test = "${vo.getGraduation_state() == 1}">
																			<td>
																				휴학
																			</td>
																			</c:if>
																			
																			<c:if test = "${vo.getGraduation_state() == 2}">
																			<td>
																				졸업
																			</td>
																			</c:if>
																			<th class="control-label">
																				학년
																			</th>
																			<td>
																					${vo.getGrade()}
																			</td>
																		</tr>
																		<tr>
																			<th class="control-label">
																				현재학기
																			</th>
																			<td>
																				${vo.getSemester()}
																			</td>
																			<th class="control-label">
																				연락처
																			</th>
																			<td>
																				<input type="text" class="input" required="required" 
																					name = "telephone"placeholder="연락처를 입력하시오" value="${vo.getUserCellNum()}">
																			</td>
																		</tr>
																		<tr>
																			<th class="control-label">
																				주소
																			</th>
																			<td colspan="3">
																				<input type="text" name="zip" class="input" required="required" 
																					placeholder="ex)43085">
																					
																	<button type="button" name="zipSearch" onclick="openZipSearch();">검색</button><br>
																	주소 :<input id="studentAddress1" name="addr1"class="form-control col-md-7 col-xs-12"
																		data-validate-length-range="6" data-validate-words="2"
																		placeholder="" name="studentAddress1" type="text" value="${vo.getUserAddr1()}"><br>
																	상세 :<input id="studentAddress2" name="addr2" class="form-control col-md-7 col-xs-12"
																		data-validate-length-range="6" data-validate-words="2"
																		placeholder="" name="studentAddress2" type="text" value="${vo.getUserAddr2()}"><br>
																			</td>
																		</tr>
																	</table>
																</div>
															</div>
															<div class="ln_solid"></div>
															<div class="form-group">
																<div class="col-md-6 col-md-offset-3">
																	<button type="submit" class="btn btn-primary">취소</button>
																	<button id="send" type="submit" class="btn btn-success">수정</button>
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
																	<th>강의 코드</th>
																	<th>강의명</th>
																	<th>교수명</th>
																	<th class="hidden-phone">교수 연락처</th>
																	<th>시간표</th>
																</tr>
															</thead>
															<tbody>
															<c:forEach var="dto" items="${dtos}">
																<tr>
																	<td>${dto.lecCode}</td>
																	<td>${dto.lectureName}</td>
																	<td>${dto.username}</td>
																	<td class="hidden-phone">${dto.userCellNum}</td>
																	<td>${dto.classTime}</td>
																</tr>
																</c:forEach>
																
															</tbody>
														</table>
														<!-- end user projects -->
													</div>
													<!-- 과제관리 상세페이지 -->
													<div role="tabpanel" class="tab-pane fade"
														id="tab_content3" aria-labelledby="profile-tab">
														<!-- page content -->
															<div class="">
																<div class="clearfix"></div>
																<div class="row">
																	<div class="col-md-12">
																		<div class="x_panel">
																			<div class="x_title">
																				<h2>과제 관리</h2>
																				<div class="btn-group" style="float: right">
																					<select class="form-control input-sm"
																						id="mystatus"
																						onchange="reportlist('${userNumber}');">
																							<c:forEach var="dto" items="${dtos}">
																								<option value="${dto.lectureName}">${dto.lectureName}</option>
																							</c:forEach>
																					</select>
																					</ul>
																				</div>
																				<div class="clearfix"></div>
																			</div>
																			<div class="x_content">
																				<div class="col-md-9 col-sm-9 col-xs-12">
																					<div>
																						<h4>과제리스트</h4>
																						<!-- end of user messages -->
																						<%-- <table class="data table table-striped no-margin">
																							<thead>
																								<tr>
																									<th>과제 번호</th>
																									<th>년도</th>
																									<th>과제명</th>
																									<th>과제 마감일</th>
																									<th>진행 상태</th>
																								</tr>
																							</thead>
																							<div id="rerortList" class=""></div>
																							<tbody>
																							<c:forEach items="${dtos2}" var="dto">
																							<c:forEach var="dto" items="${dtos}">
																								<tr>
																									<td>${dto.lecCode}</td>
																									<td>${dto.year}</td>
																									<td>${dto.reportName}</td>
																									<td>${dto.endDate}</td>
																									<c:if test="${dto.progress >= 0}">
																									<td>제출 가능</td>
																									</c:if>
																									
																									<c:if test="${dto.progress < 0}">
																									<td>마감</td>
																									</c:if>
																								</tr>
																							</c:forEach>
																							</tbody>
																						</table> --%>
																						<!-- <ul class="messages">
																							<li><img src="../resources/images/img.jpg" class="avatar" alt="Avatar">
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
																							<li><img src="../resources/images/img.jpg" class="avatar" alt="Avatar">
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
																						</ul> --><div id="reprotList" class=""></div>
																						<!-- end of user messages -->
																					</div>
																				</div>
																				<div id="reportcontent" class=""></div>
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
                    <form action="../student/imageUpload" method="post" enctype="multipart/form-data">  
                    	<input class="btn btn-info" type="file" name="image" style="position:relative;right:11px;" required="required">
                    	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
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
	<%@ include file="../Basic/footer.jsp"%>
	<script type="text/javascript">
	//다음 주소 이용한 주소검색
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
	
	
	$("#mystatus option:eq(0)").prop("selected", true);
	
	$(function() {
		reportlist('${userNumber}');
		});

	</script>
</body>
</html>