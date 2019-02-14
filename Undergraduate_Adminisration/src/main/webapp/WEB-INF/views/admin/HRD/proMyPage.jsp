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
									<h3>김설현</h3>
									<ul class="list-unstyled user_data">
										<li>
											<i class="fa fa-map-marker user-profile-icon"></i>
											경기도 안양시 만안구 병목안로 179 금용아파트 1111호
										</li>

										<li>
											<i class="fa fa-briefcase user-profile-icon"></i>
											중국어학과 전임 교수
										</li>
										<li>
											<i class="fa fa-university user-profile-icon">경기대학교</i>
										</li>
										<li>
											<i class="fa fa-phone user-profile-icon">010-2458-7354</i>
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
													<li role="presentation" class="">
														<a href="#tab_content2" role="tab" id="profile-tab"
														data-toggle="tab" aria-expanded="false">담당과목</a>
													</li>
													<li role="presentation" class="">
														<a href="#tab_content3" role="tab" id="profile-tab2"
														data-toggle="tab" aria-expanded="false">이력사항</a>
													</li>
												</ul>
												<div id="myTabContent" class="tab-content">
													<div role="tabpanel" class="tab-pane fade active in"
														id="tab_content1" aria-labelledby="home-tab">
														<form action="proDetailUpdate" method="POST" class="form-horizontal form-label-left" novalidate>
															<span class="section">개인정보</span>
															<div class="row">
																<div class="col-md-offset-1 col-md-10">
																	<table class="table">
																		<tr>
																			<th class="control-label">
																				교직원번호
																			</th>
																			<td>
																				<input type="text" class="input" required="required" name="userNumber"
																					value="${vo.userNumber}" placeholder="교번을 입력하시오">
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
																			<th class="control-label">주민등록번호</th>
																			<td><input type="text" class="input" value="${vo.userSsn }"
																				required="required" name="userSsn" placeholder="주민등록번호를 입력하시오">
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
																			<th class="control-label">성별</th>
																			<td><input type="text" class="input" value="${vo.gender }"
																				name="gender" required="required" placeholder="성별을 입력하시오">
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
																			<th class="control-label">이메일</th>
																			<td><input type="text" class="input" value="${vo.userEmail}"
																				name="userEmail" required="required" placeholder="이메일을 입력하시오">
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
																			<th class="control-label">연락처</th>
																			<td><input type="text" class="input" value="${vo.userCellNum}"
																				name="userCellNum" required="required" placeholder="연락처를 입력하시오">
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
																				name="annualLevel" required="required" placeholder="연차를 입력하시오">
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
																	<button type="submit" class="btn btn-primary">취소</button>
																	<button id="send" type="submit" class="btn btn-success">수정</button>
																	<button type="button" class="btn btn-danger" 
																	onclick="window.location='stdDeletePro?userNumber=${vo.userNumber}'">삭제</button>
																</div>
															</div>
														</form>
													</div>
													<div role="tabpanel" class="tab-pane fade"
														id="tab_content2" aria-labelledby="profile-tab">
														<table class="table table-striped jambo_table bulk_action">
					                                        <thead>
					                                            <tr class="headings">
					                                                <th class="text-center">구분</th>
					                                                <th class="text-center">학과</th>
					                                                <th class="text-center">강의명</th>
					                                                <th class="text-center">학년</th>
					                                                <th class="text-center">학기</th>
					                                                <th class="text-center">학점</th>
					                                                <th class="text-center">담당 교수</th>
					                                                <th class="text-center">인원수</th>
					                                            </tr>
					                                        </thead>
					                                        <tbody>
					                                            <tr>
					                                                <td class="text-center">전공</td>
					                                                <td class="text-center">컴퓨터공학과</td>
					                                                <td class="text-center">전공실기I</td>
					                                                <td class="text-center">1학년</td>
					                                                <td class="text-center">1학기</td>
					                                                <td class="text-center">3</td>
					                                                <td class="text-center">홍길동</td>
					                                                <td class="text-center">50</td>
					                                            </tr>
					                                        </tbody>
					                                    </table>
														<div class="ln_solid"></div>
														<div class="form-group">
															<div class="col-md-6 col-md-offset-5">
																<button type="submit" class="btn btn-primary">취소</button>
																<button id="send" type="submit" class="btn btn-success">수정</button>
															</div>
														</div>
													</div>
													<div role="tabpanel" class="tab-pane fade"
														id="tab_content3" aria-labelledby="profile-tab">
														<form class="form-horizontal form-label-left" novalidate>
															<span class="section">이력사항</span>
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="name">중학교 <span class="required">*</span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input id="name"
																		class="form-control col-md-7 col-xs-12"
																		data-validate-length-range="6" data-validate-words="2"
																		name="name" placeholder="출신 중학교를 입력하시오"
																		required="required" type="text">
																</div>
															</div>
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="name">고등학교 <span class="required">*</span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input id="name" class="form-control col-md-7 col-xs-12"
																		data-validate-length-range="6" data-validate-words="2"
																		name="name" placeholder="출신 고등학교를 입력하시오"
																		required="required" type="text">
																</div>
															</div>
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="name">대학교 <span class="required">*</span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input id="name" class="form-control col-md-7 col-xs-12"
																		data-validate-length-range="6" data-validate-words="2"
																		name="name" placeholder="출신 대학교를 입력하시오"
																		required="required" type="text">
																</div>
															</div>
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="name">전공 <span class="required">*</span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input id="name" class="form-control col-md-7 col-xs-12"
																		data-validate-length-range="6" data-validate-words="2"
																		name="name" placeholder="전공를 입력하시오"
																		required="required" type="text">
																</div>
															</div>
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="name">대학원 <span class="required">*</span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input id="name" class="form-control col-md-7 col-xs-12"
																		data-validate-length-range="6" data-validate-words="2"
																		name="name" placeholder="대학원를 입력하시오"
																		required="required" type="text">
																</div>
															</div>
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="name">박사과정 <span class="required">*</span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input id="name" class="form-control col-md-7 col-xs-12"
																		data-validate-length-range="6" data-validate-words="2"
																		name="name" placeholder="박사과정을 입력하시오"
																		required="required" type="text">
																</div>
															</div>
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="name">경력사항 1 <span class="required"></span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input id="name" class="form-control col-md-7 col-xs-12"
																		data-validate-length-range="6" data-validate-words="2"
																		name="name" placeholder="경력사항 1 입력하시오"
																		required="required" type="text">
																</div>
															</div>
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="name">경력사항 2 <span class="required"></span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input id="name" class="form-control col-md-7 col-xs-12"
																		data-validate-length-range="6" data-validate-words="2"
																		name="name" placeholder="경력사항 2 입력하시오"
																		required="required" type="text">
																</div>
															</div>
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="name">경력사항 3 <span class="required"></span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input id="name" class="form-control col-md-7 col-xs-12"
																		data-validate-length-range="6" data-validate-words="2"
																		name="name" placeholder="경력사항 3 입력하시오"
																		required="required" type="text">
																</div>
															</div>
															<div class="item form-group">
																<label class="control-label col-md-3 col-sm-3 col-xs-12"
																	for="name">경력사항 4 <span class="required"></span>
																</label>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input id="name" class="form-control col-md-7 col-xs-12"
																		data-validate-length-range="6" data-validate-words="2"
																		name="name" placeholder="경력사항 4 입력하시오"
																		required="required" type="text">
																</div>
															</div>
															<div class="ln_solid"></div>
															<div class="form-group">
																<div class="col-md-6 col-md-offset-5">
																	<button type="submit" class="btn btn-primary">취소</button>
																	<button id="send" type="submit" class="btn btn-success">수정</button>
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
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel2">프로필 사진 바꾸기</h4>
				</div>
				<div class="modal-body">
					<form action="#" class="dropzone"></form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">변경</button>
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
    </script>
</body>

</html>
