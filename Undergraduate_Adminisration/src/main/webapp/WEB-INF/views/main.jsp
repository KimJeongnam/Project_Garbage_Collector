<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>자바대학교 종합행정서비스</title>

    <!-- Bootstrap -->
    <link href="/project/resources/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/project/resources/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/project/resources/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- jQuery custom content scroller -->
    <link href="/project/resources/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet" />

    <!-- Custom Theme Style -->
    <link href="/project/resources/build/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
    <%@ include file="Basic/navbar.jsp" %>
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

            <!-- page content -->
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3>안녕하세요 <small> 자바대종합정보서비스 <strong>볼드체</strong></small></h3>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /page content -->

            <!-- footer content -->
            <footer>
                <div class="pull-right">
                    자바대학교 - 종합정보서비스 <a href="#">by Garbage Collrector</a>
                </div>
                <div class="clearfix"></div>
            </footer>
            <!-- /footer content -->
        </div>
    </div>

    <!-- jQuery -->
    <script src="/project/resources/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/project/resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="/project/resources/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/project/resources/vendors/nprogress/nprogress.js"></script>
    <!-- jQuery custom content scroller -->
    <script src="/project/resources/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="/project/resources/build/js/custom.min.js"></script>
</body>

</html>
