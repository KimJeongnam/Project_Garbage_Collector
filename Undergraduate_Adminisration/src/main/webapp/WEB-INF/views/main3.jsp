<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
    <link href="/project/resources/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet"/>

    <!-- Custom Theme Style -->
    <link href="/project/resources/build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col menu_fixed">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="#" class="site_title"><i class="fa fa-paw"></i> <span>Gentelella Alela!</span></a>
            </div>

            <div class="clearfix"></div>

          	<!-- menu profile quick info -->
					<div class="profile clearfix">
						<div class="profile_pic">
							<img src="/project/resources/images/img.jpg" alt="..."
								class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>환영합니다,</span>
							<h2>#로그인 아이디# 님!</h2>
						</div>
					</div>
					<!-- /menu profile quick info -->

            <br />

          <!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section active">
							<h3>여기엔 무얼 적어야 하는가</h3>
							<ul class="nav side-menu" style="">

								<li class=""><a><i class="fa fa-graduation-cap"></i>학사관리<span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none;">
										<li><a href="#">수업업무</a></li>
										<li><a href="#">성적업무</a></li>
										<li><a href="#">교직업무</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">6</a></li>
									</ul></li>
								<li><a><i class="fa fa-desktop"></i> 장학관리 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="">
										<li><a href="#">장학금 심사</a></li>
										<li><a href="#">장학금 등록</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">6</a></li>
									</ul></li>
								<li><a><i class="fa fa-users"></i> 인사관리<span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="">
										<li><a href="#">정보조회</a></li>
										<li><a href="#">교직원 관리</a></li>
										<li><a href="#">학적 관리</a></li>
										<li><a href="#">시간제 강사 관리</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">6</a></li>
									</ul></li>
								<li><a><i class="fa fa-bar-chart-o"></i> 회계관리<span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="">
										<li><a href="#">교직원 급여관리</a></li>
										<li><a href="#">시간제 강사 급여관리</a></li>
										<li><a href="#">장학금 수혜현황</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">6</a></li>
									</ul></li>

							</ul>
						</div>
						<div class="menu_section">
							<h3>여긴 무슨 메뉴인가?</h3>
							<ul class="nav side-menu">
								<li><a><i class="fa fa-bug"></i> 메뉴2 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="">
										<li><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">6</a></li>
									</ul></li>
								<li><a><i class="fa fa-windows"></i> 메뉴3 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="">
										<li><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">6</a></li>
									</ul></li>


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
							<li class=""><a href="javascript:;"
								class="user-profile dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"> <img
									src="/project/resources/images/img.jpg" alt="">로그인 아이디 <span
									class=" fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="javascript:;"> 메뉴1 </a></li>
									<li><a href="javascript:;"> <span>메뉴2</span>
									</a></li>
									<li><a href="javascript:;">메뉴3</a></li>
									<li><a href="logout"><i
											class="fa fa-sign-out pull-right"></i>로그아웃</a></li>
								</ul></li>

							<li role="presentation" class="dropdown"><a
								href="javascript:;" class="dropdown-toggle info-number"
								data-toggle="dropdown" aria-expanded="false"> <i
									class="fa fa-envelope-o"></i> <span class="badge bg-green">6</span>
							</a>
								<ul id="menu1" class="dropdown-menu list-unstyled msg_list"
									role="menu">
									<li><a> <span class="image"><img
												src="/project/resources/images/img.jpg" alt="Profile Image"></span>
											<span> <span>#보낸이름#</span> <span class="time">#몇분전#</span>
										</span> <span class="message"> #쪽지# </span>
									</a></li>
									<li><a> <span class="image"><img
												src="/project/resources/images/img.jpg" alt="Profile Image"></span>
											<span> <span>#보낸이름#</span> <span class="time">#몇분전#</span>
										</span> <span class="message"> #쪽지# </span>
									</a></li>
									<li><a> <span class="image"><img
												src="/project/resources/images/img.jpg" alt="Profile Image"></span>
											<span> <span>#보낸이름#</span> <span class="time">#몇분전#</span>
										</span> <span class="message"> #쪽지# </span>
									</a></li>
									<li><a> <span class="image"><img
												src="/project/resources/images/img.jpg" alt="Profile Image"></span>
											<span> <span>#보낸이름#</span> <span class="time">#몇분전#</span>
										</span> <span class="message"> #쪽지# </span>
									</a></li>
									<li>
										<div class="text-center">
											<a> <strong>모든 쪽지 보기</strong> <i
												class="fa fa-angle-right"></i>
											</a>
										</div>
									</li>
								</ul></li>
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
                <h3>Fixed Sidebar <small> Just add class <strong>menu_fixed</strong></small></h3>
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