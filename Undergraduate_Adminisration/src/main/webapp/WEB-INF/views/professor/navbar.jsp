<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="container body">
        <div class="main_container">
            <div class="col-md-3 left_col menu_fixed">
                <div class="left_col scroll-view">
                    <div class="navbar nav_title" style="border: 0;">
                        <a href="#" class="site_title"><i class="fa fa-paw"></i> <span>&nbsp;&nbsp;&nbsp;자바대학교</span></a>
                    </div>

                    <div class="clearfix"></div>

                    <!-- menu profile quick info -->
                    <div class="profile clearfix">
                        <div class="profile_pic">
                            <img src="/project/resources/images/img.jpg" alt="..." class="img-circle profile_img">
                        </div>
                        <div class="profile_info">
                            <span>환영합니다,</span>
                            <!-- 로그인 정보 뿌려줘야함 -->
                            <h2>#로그인 아이디# 교수님!</h2>
                        </div>
                    </div>
                    <!-- /menu profile quick info -->

                    <br />

                    <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                        <div class="menu_section active">
                            <h3>교직원 메뉴</h3>
                            <ul class="nav side-menu" style="">

        
                                <li><a><i class="fa fa-male"></i> 내 정보 관리 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="">
                                        <li><a href="${contextPath }/professor/myPage">마이페이지</a></li>
                                      
                                    </ul>
                                </li>
                                
                                 <li><a><i class="fa fa-university"></i> 내 강의 관리 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="">
                                        <li><a href="${contextPath }/professor/plan">강의계획서</a></li>
                                        <li><a href="${contextPath }/professor/list">학생 조회</a></li>
                                        <li><a href="${contextPath }/professor/score">학점입력</a></li>
                                        <li><a href="${contextPath }/professor/report">과제 관리</a></li>
                                      
                                    </ul>
                                </li>
                               

                            </ul>
                        </div>
                        <!-- <div class="menu_section">
                            <h3>여긴 무슨 메뉴인가?</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-bug"></i> 메뉴2 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="">
                                        <li><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">5</a></li>
                                        <li><a href="#">6</a></li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-windows"></i> 메뉴3 <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="">
                                        <li><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">5</a></li>
                                        <li><a href="#">6</a></li>
                                    </ul>
                                </li>


                            </ul>
                        </div> -->

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
                        <a data-toggle="tooltip" data-placement="top" title="Logout" href="login">
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
                            <li class=""><a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <img src="/project/resources/images/img.jpg" alt="">로그인 아이디 <span class=" fa fa-angle-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu pull-right">
                                    <li><a href="javascript:;"> 메뉴1 </a></li>
                                    <li><a href="javascript:;"> <span>메뉴2</span>
                                        </a></li>
                                    <li><a href="javascript:;">메뉴3</a></li>
                                    <li><a href="logout"><i class="fa fa-sign-out pull-right"></i>로그아웃</a></li>
                                </ul>
                            </li>

                            <li role="presentation" class="dropdown"><a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false"> <i class="fa fa-envelope-o"></i> <span class="badge bg-green">6</span>
                                </a>

                                <!-- #부분 스크립트 처리 -->

                                <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                                    <li><a> <span class="image"><img src="/project/resources/images/img.jpg" alt="Profile Image"></span>
                                            <span> <span>#보낸이름#</span> <span class="time">#몇분전#</span>
                                            </span> <span class="message"> #쪽지# </span>
                                        </a></li>
                                    <li><a> <span class="image"><img src="/project/resources/images/img.jpg" alt="Profile Image"></span>
                                            <span> <span>#보낸이름#</span> <span class="time">#몇분전#</span>
                                            </span> <span class="message"> #쪽지# </span>
                                        </a></li>
                                    <li><a> <span class="image"><img src="/project/resources/images/img.jpg" alt="Profile Image"></span>
                                            <span> <span>#보낸이름#</span> <span class="time">#몇분전#</span>
                                            </span> <span class="message"> #쪽지# </span>
                                        </a></li>
                                    <li><a> <span class="image"><img src="/project/resources/images/img.jpg" alt="Profile Image"></span>
                                            <span> <span>#보낸이름#</span> <span class="time">#몇분전#</span>
                                            </span> <span class="message"> #쪽지# </span>
                                        </a></li>
                                    <li>
                                        <div class="text-center">
                                            <a> <strong>모든 쪽지 보기</strong> <i class="fa fa-angle-right"></i>
                                            </a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- /top navigation -->