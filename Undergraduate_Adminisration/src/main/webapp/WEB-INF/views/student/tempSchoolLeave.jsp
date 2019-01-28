<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="Basic/settings.jsp"%>
<title>Insert title here</title>
</head>
<body class="nav-md">
	<%@ include file="Basic/stdNavbar.jsp"%>
	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>휴학신청</h3>
				</div>
				<div class="clearfix"></div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>휴학신청하기</h2>
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
											<img style="width: 180px; height: 218px;" class="img-responsive avatar-view"
												src="resources/images/user.png" alt="Avatar" title="Change the avatar">
										</div>
									</div>
									<h3>김설현</h3>
									<ul class="list-unstyled user_data">
										<li><i class="fa fa-map-marker user-profile-icon"></i>
											경기도 안양시 만안구 병목안로 179 금용아파트 1111호
										</li>
										<li><i class="fa fa-briefcase user-profile-icon"></i>중국어학과</li>
										<li><i class="fa fa-university user-profile-icon">경기대학교</i></li>
										<li><i class="fa fa-phone user-profile-icon">010-2458-7354</i></li>
									</ul>
								</div>
								<div class="col-md-9 col-sm-9 col-xs-12">
									<div class="x_panel">
										<div class="x_title">
											<h2><i class="fa fa-bars"></i> 학적상태</h2>
											<div class="clearfix"></div>
										</div>
										<div class="x_content">
											<div class="" role="tabpanel"
												data-example-id="togglable-tabs">
												<!-- 학생정보 상세페이지 -->
												<div id="myTabContent" class="tab-content">
													<div role="tabpanel" class="tab-pane fade active in"
														id="tab_content1" aria-labelledby="home-tab">
														<table class="data table table-striped no-margin">
															<tbody>
																<tr>
																	<th>학번</th>
																	<td>20091064</td>
																	<th>성별</th>
																	<td>남자</td>
																</tr>
																<tr>
																	<th>이름</th>
																	<td>이정섭</td>
																	<th>전공</th>
																	<td>심리학과</td>
																</tr>
																<tr>
																	<th>학년</th>
																	<td>4학년</td>
																	<th>학적상태</th>
																	<td>재학중</td>
																</tr>
																<tr>
																	<th>휴학기간</th>
																	<td>
																		<div class="col-md-4">
													                        <form class="form-horizontal">
													                          <fieldset>
													                            <div class="control-group">
													                              <div class="controls">
													                                <div class="input-prepend input-group">
													                                  <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
													                                  <input type="text" style="width: 200px" name="reservation" id="reservation" class="form-control" 
													                                  value="01/01/2016 - 01/25/2016" />
													                                </div>
													                              </div>
													                            </div>
													                          </fieldset>
													                        </form>
													                    </div>
																	</td>
																	<th>휴학신청</th>
																	<td>
																	<a class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>신청</a>
																	</td>
																</tr>
															</tbody>
														</table>
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
	<!-- /page content -->
	<%@ include file="Basic/footer.jsp"%>
	<script type="text/javascript">
		$(function (){
			
		});
	</script>
</body>
</html>