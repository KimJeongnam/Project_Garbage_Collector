<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <%@ include file="../Basic/settings.jsp" %>
    <title>Insert title here</title>
</head>

<body class="nav-md">
   <%@ include file="../Basic/navbar.jsp" %>

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
                                    <h3>${vo.getUserName()}</h3>

                                    <ul class="list-unstyled user_data">
                                        <li><i class="fa fa-map-marker user-profile-icon"></i> ${vo.getUserAddr1()}&nbsp;${vo.getUserAddr2()}
                                        </li>

                                        <li>
                                            <i class="fa fa-briefcase user-profile-icon"></i> 일본어학과 전임 교수
                                        </li>

                                        <li>
                                            <i class="fa fa-university user-profile-icon">Kwansei Gakuin 대학</i>
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


                                            <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                                <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">개인정보</a>
                                                    </li>
                                                    <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">교수소개</a>
                                                    </li>
                                                    <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">이력사항</a>
                                                    </li>
                                                </ul>




                                                <div id="myTabContent" class="tab-content">
                                                
                                                <!-- 자기소개  -->
                                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">


                                                        <form class="form-horizontal form-label-left" novalidate action="update" method="post">


                                                            <span class="section">개인정보</span>

                                                            <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">이름 <span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="이름을 입력하시오" required="required" value="${vo.getUserName()}" type="text">
                                                                </div>
                                                            </div>
                                                            <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">영문 이름 <span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input id="ename" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="ename" placeholder="이름을 입력하시오" required="required" value="${vo.getUserEngName()}" type="text">
                                                                </div>
                                                            </div>
                                                            <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Email <span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input placeholder="이메일을 입력하시오" type="email" id="email" name="email" required="required" class="form-control col-md-7 col-xs-12" value="${vo.getUserEmail()}">
                                                                </div>
                                                            </div>
                                                            <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">주민번호<span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input type="email" id="ssn" name="ssn" required="required" class="form-control col-md-7 col-xs-12" readonly="readonly" value="${vo.getUserSsn()}">
                                                                </div>
                                                            </div>

                                                            <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="occupation">주소 <span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input placeholder="주소를 입력하시오" id="address1" type="text" name="address1" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12" value="${vo.getUserAddr1()}">
                                                                </div>
                                                            </div>
                                                              <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="occupation">상세주소 <span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input placeholder="상세주소를 입력하시오" id="address2" type="text" name="address2" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12" value="${vo.getUserAddr2()}">
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="occupation">비밀번호 <span class="required">*</span></label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input placeholder="비밀번호를 입력하시오" id="password" type="password" name="password" data-validate-length="6,8" class="form-control col-md-7 col-xs-12" required="required" value="${vo.getUserPassword()}">
                                                                </div>
                                                            </div>
                                                            <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="telephone">연락처 <span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input placeholder="연락처를 입력하시오" type="tel" id="telephone" name="telephone" required="required" data-validate-length-range="8,20" class="form-control col-md-7 col-xs-12" value="${vo.getUserCellNum()}">
                                                                </div>
                                                            </div>
                                                            <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="accountNumber">계좌번호 <span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-2 col-sm-2 col-xs-4">
                                                                	<input placeholder="은행명을 입력하시오."  id="bankName" name="bankName" required="required" data-validate-length-range="8,20" class="form-control col-md-7 col-xs-12" value="${vo.getBankName()}">
                                                                </div>
                                                                <div class="col-md-4 col-sm-4 col-xs-8">
                                                                	<input placeholder="계좌번호를 입력하시오."  id="accountNumber" name="accountNumber" required="required" data-validate-length-range="8,20" class="form-control col-md-7 col-xs-12" value="${vo.getAccountNumber()}">
                                                                </div>
                                                            </div>
                                                            
                                                        <div class="form-group">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <button type="reset" class="btn btn-primary">재작성</button>
                                                                <button type="submit" class="btn btn-success">수정</button>
                                                            </div>
                                                        </div>
                                                            
                                                        </form>

                                                    </div>
													<!-- 기본정보 끝  -->

	
													<!-- 자기소개  -->
                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                                                     <form class="form-horizontal form-label-left" novalidate action="introUpdate" method="post">
                                                       <span class="section">교수소개</span>
                                                        <textarea id="introduction" required="required" class="form-control" name="introduction" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="3500" 
                                                        data-parsley-minlength-message="20자 이상 작성하셔야 합니다!!" data-parsley-validation-threshold="10" style="height: 300px;">${vo.getIntroduction()}</textarea>
                                                       <br>
                                                       <div class="form-group">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <button type="reset" class="btn btn-primary">재작성</button>
                                                                <button type="submit" class="btn btn-success">수정</button>
                                                            </div>
                                                        </div>
                                                       </form>
                                                    </div>
                                                    
													<!-- 자기소개  끝 -->


													<!-- 이력사항 -->
                                                    <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">



                                                        <form class="form-horizontal form-label-left" novalidate>


                                                            <span class="section">이력사항</span>

                                                            <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">중학교 <span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input id="middleSchool" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="middleSchool" placeholder="출신 중학교를 입력하시오" required="required" type="text">
                                                                </div>
                                                            </div>
                                                            <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">고등학교 <span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input id="highSchool" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="highSchool" placeholder="출신 고등학교를 입력하시오" required="required" type="text">
                                                                </div>
                                                            </div>
                                                            <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">대학교 <span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input id="college" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="college" placeholder="출신 대학교를 입력하시오" required="required" type="text">
                                                                </div>
                                                            </div>
                                                            <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">전공 <span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input id="major1" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="major1" placeholder="전공를 입력하시오" required="required" type="text">
                                                                </div>
                                                            </div>
                                                            <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">대학원 <span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input id="major2" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="major2" placeholder="대학원를 입력하시오" required="required" type="text">
                                                                </div>
                                                            </div>
                                                            <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">박사과정 <span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input id="Phd" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="Phd" placeholder="박사과정을 입력하시오" required="required" type="text">
                                                                </div>
                                                            </div>
                                                            <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">경력사항 1 <span class="required"></span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input id="career1" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="career1" placeholder="경력사항 1 입력하시오" required="required" type="text">
                                                                </div>
                                                            </div>
                                                            <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">경력사항 2 <span class="required"></span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input id="career2" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="career2" placeholder="경력사항 2 입력하시오" required="required" type="text">
                                                                </div>
                                                            </div>
                                                            <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">경력사항 3 <span class="required"></span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input id="career3" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="career3" placeholder="경력사항 3 입력하시오" required="required" type="text">
                                                                </div>
                                                            </div>
                                                            <div class="item form-group">
                                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">경력사항 4 <span class="required"></span>
                                                                </label>
                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                    <input id="career4" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="career4" placeholder="경력사항 4 입력하시오" required="required" type="text">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                            <div class="col-md-6 col-md-offset-3">
                                                                <button type="reset" class="btn btn-primary">재작성</button>
                                                                <button type="submit" class="btn btn-success">수정</button>
                                                            </div>
                                                        </div>
                                                        </form>
                                                    </div>
                                                    <!-- 이력사항 끝 -->
                                                    
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
                    <form action="imageUpload" method="post" enctype="multipart/form-data">  
                    	<input class="btn btn-info" type="file" name="image" style="position:relative;right:11px;">
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


    <%@ include file="../Basic/footer.jsp" %>
</body>

</html>
