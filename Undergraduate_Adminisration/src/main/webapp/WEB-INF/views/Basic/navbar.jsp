<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<c:set var="authPath" value="${contextPath }/admin"/>
    <div class="container body">
        <div class="main_container">
            <div class="col-md-3 left_col menu_fixed">
                <div class="left_col scroll-view">
                    <div class="navbar nav_title" style="border: 0;">
                        <a href="${authPath }/index" class="site_title"><i class="fa fa-paw"></i> <span>&nbsp;&nbsp;&nbsp;자바대학교</span></a>
                    </div>

                    <div class="clearfix"></div>

                    <!-- menu profile quick info -->
                    <div class="profile clearfix">
                        <div class="profile_pic">
                            <img src="${staticPath}${user.userImage }" alt="..." class="img-circle profile_img">
                        </div>
                        <div class="profile_info">
                            <span>환영합니다,</span>
                            <!-- 로그인 정보 뿌려줘야함 -->
                            <h2>${user.userName} 관리자님!</h2>
                        </div>
                    </div>
                    <!-- /menu profile quick info -->

                    <br />

                    <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                        <div class="menu_section active">
                            <h3>교번 : '${userNumber }'</h3>
                            <ul class="nav side-menu" style="">

                                <li class=""><a><i class="fa fa-graduation-cap"></i>학사관리<span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none;">
                                        <li><a>수업업무<span class="fa fa-chevron-down"></span></a>
                                            <ul class="nav child_menu">
                                                <li class="sub_menu">
                                                    <a href="#">수강 신청 관리</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">성적업무</a></li>
                                        <!-- <li><a href="menu2">교직업무</a></li> -->
                                        <li><a>교직업무<span class="fa fa-chevron-down"></span></a>
                                            <ul class="nav child_menu">
                                                <li class="sub_menu">
                                                    <a href="${authPath }/majorLectureManagement">학과/강의 관리</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-desktop"></i> 장학관리 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="">
                                        <li><a href="${authPath }/registrationList">장학금 등록 & 심사</a></li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-users"></i> 인사관리<span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="">
                                        <li><a href="${authPath }/empStdManagement">교직원/학생 관리</a></li>
                                        <li><a href="${authPath }/schoolLeaveList">학적 관리</a></li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-bar-chart-o"></i> 회계관리<span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="">
                                        <li><a href="${authPath }/menu5">교직원 급여관리</a></li>
                                        <li><a href="${authPath }/menu6">시간제 강사 급여관리</a></li>
                                        <li><a href="#">장학금 수혜현황</a></li>
                                    </ul>
                                </li>

                            </ul>
                        </div>
                    </div>
                    <!-- /sidebar menu -->
                    <!-- /menu footer buttons -->
                    <div class="sidebar-footer hidden-small">
                        <a data-toggle="tooltip" data-placement="top" title="Settings">
                            <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                            <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="Lock">
                            <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="Logout" href="${contextPath}/logout">
                            <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                        </a>
                    </div>
                    <!-- /menu footer buttons -->
                </div>
            </div>

            <!-- top navigation -->
            <div class="top_nav">
                <div class="nav_menu">
                    <nav>
                        <div class="nav toggle">
                            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                        </div>

                        <ul class="nav navbar-nav navbar-right">
                            <li class=""><a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <img src="${staticPath}${user.userImage }" alt="">로그인 아이디 <span class=" fa fa-angle-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu pull-right">
                                    <li><a href="javascript:;"> 메뉴1 </a></li>
                                    <li><a href="javascript:;"> <span>메뉴2</span>
                                        </a></li>
                                    <li><a href="javascript:;">메뉴3</a></li>
                                    <li><a href="${contextPath}/logout"><i class="fa fa-sign-out pull-right"></i>로그아웃</a></li>
                                </ul>
                            </li>

                            <%@ include file="messageNav.jsp" %>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- /top navigation -->
</sec:authorize>
<sec:authorize access="hasRole('ROLE_PROFESSOR')">
<c:set var="authPath" value="${contextPath }/professor"/>
    <div class="container body">
        <div class="main_container">
            <div class="col-md-3 left_col menu_fixed">
                <div class="left_col scroll-view">
                    <div class="navbar nav_title" style="border: 0;">
                        <a href="${authPath }/index" class="site_title"><i class="fa fa-paw"></i> <span>&nbsp;&nbsp;&nbsp;자바대학교</span></a>
                    </div>

                    <div class="clearfix"></div>

                    <!-- menu profile quick info -->
                    <div class="profile clearfix">
                        <div class="profile_pic">
                            <img src="${staticPath }${user.userImage }" alt="..." class="img-circle profile_img">
                        </div>
                        <div class="profile_info">
                            <span>환영합니다,</span>
                            <!-- 로그인 정보 뿌려줘야함 -->
                            <h2>${user.userName} 교수님!</h2>
                        </div>
                    </div>
                    <!-- /menu profile quick info -->

                    <br />

                    <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                        <div class="menu_section active">
                            <h3>교번 : '${userNumber }'</h3>
                            <ul class="nav side-menu" style="">


                                <li><a><i class="fa fa-male"></i> 내 정보 관리 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="">
                                        <li><a href="${authPath }/myPage">마이페이지</a></li>

                                    </ul>
                                </li>

                                <li><a><i class="fa fa-university"></i> 내 강의 관리 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="">
                                        <li><a href="${authPath }/plan">강의계획서</a></li>
                                        <li><a href="${authPath }/list">학생 조회</a></li>
                                        <li><a href="${authPath }/score">학점입력</a></li>
                                        <li><a href="${authPath }/report">과제 관리</a></li>

                                    </ul>
                                </li>


                            </ul>
                        </div>

                    </div>
                    <!-- /sidebar menu -->
                    <!-- /menu footer buttons -->
                    <div class="sidebar-footer hidden-small">
                        <a data-toggle="tooltip" data-placement="top" title="Settings">
                            <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                            <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="Lock">
                            <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="Logout" href="${contextPath}/logout">
                            <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                        </a>
                    </div>
                    <!-- /menu footer buttons -->
                </div>
            </div>

            <!-- top navigation -->
            <div class="top_nav">
                <div class="nav_menu">
                    <nav>
                        <div class="nav toggle">
                            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                        </div>

                        <ul class="nav navbar-nav navbar-right">
                            <li class=""><a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <img src="${staticPath}${user.userImage }" alt="">로그인 아이디 <span class=" fa fa-angle-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu pull-right">
                                    <li><a href="javascript:;"> 메뉴1 </a></li>
                                    <li><a href="javascript:;"> <span>메뉴2</span>
                                        </a></li>
                                    <li><a href="javascript:;">메뉴3</a></li>
                                    <li><a href="${contextPath}/logout"><i class="fa fa-sign-out pull-right"></i>로그아웃</a></li>
                                </ul>
                            </li>

                            <%@ include file="messageNav.jsp" %>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- /top navigation -->
</sec:authorize>
<sec:authorize access="hasRole('ROLE_STUDENT')">
<c:set var="authPath" value="${contextPath }/student"/>
    <div class="container body">
        <div class="main_container">
            <div class="col-md-3 left_col menu_fixed">
                <div class="left_col scroll-view">
                    <div class="navbar nav_title" style="border: 0;">
                        <a href="${authPath }/index" class="site_title"><i class="fa fa-paw"></i> <span>&nbsp;&nbsp;&nbsp;자바대학교</span></a>
                    </div>
                    <div class="clearfix"></div>
                    <!-- menu profile quick info -->
                    <div class="profile clearfix">
                        <div class="profile_pic">
                            <img src="${staticPath}${user.userImage }" alt="..." class="img-circle profile_img">
                        </div>
                        <div class="profile_info">
                            <span>환영합니다,</span>
                            <!-- 로그인 정보 뿌려줘야함 -->
                            <h2> ${user.userName} 님!</h2>
                        </div>
                    </div>
                    <!-- /menu profile quick info -->
                    <br />
                    <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                        <div class="menu_section active">
                            <h3>학번 : '${userNumber }'</h3>
                            <ul class="nav side-menu" style="">
                                <li><a><i class="fa fa-desktop"></i>개인정보<span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none;">
                                        <li><a href="${authPath }/personalProfile">학생개인정보<span class="fa fa-chevron-down"></span></a>
                                        </li>
                                    </ul>
                                </li>
                                <li class=""><a><i class="fa fa-graduation-cap"></i>학사관리<span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none;">
                                        <li><a href="${authPath }/lectureList">수강신청 / 시간표</a>
                                        </li>
                                        <li><a href="GPA">성적조회</a></li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-users"></i> 학적<span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="">
                                        <li><a href="${authPath }/tempSchoolLeave">휴학신청</a></li>
                                        <li><a href="${authPath }/backToSchool">복학신청</a></li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-desktop"></i> 장학관리 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="">
                                        <li><a href="${authPath }/bulletin">장학금 신청</a></li>
                                        <li><a href="${authPath }/management">장학금 수혜내역</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- /sidebar menu -->
                    <!-- /menu footer buttons -->
                    <div class="sidebar-footer hidden-small">
                        <a data-toggle="tooltip" data-placement="top" title="Settings">
                            <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                            <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="Lock">
                            <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="Logout" href="${contextPath}/logout">
                            <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                        </a>
                    </div>
                    <!-- /menu footer buttons -->
                </div>
            </div>
            <!-- top navigation -->
            <div class="top_nav">
                <div class="nav_menu">
                    <nav>
                        <div class="nav toggle">
                            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                        </div>
                        <ul class="nav navbar-nav navbar-right">
                            <li class=""><a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <img src="${staticPath}${user.userImage }" alt="">로그인 아이디 <span class=" fa fa-angle-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu pull-right">
                                    <li><a href="javascript:;"> 메뉴1 </a></li>
                                    <li><a href="javascript:;"> <span>메뉴2</span>
                                        </a></li>
                                    <li><a href="javascript:;">메뉴3</a></li>
                                    <li><a href="${contextPath}/logout"><i class="fa fa-sign-out pull-right"></i>로그아웃</a></li>
                                </ul>
                            </li>
                            <%@ include file="messageNav.jsp" %>
                
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- /top navigation -->
</sec:authorize>
