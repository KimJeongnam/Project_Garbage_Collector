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
	<%@ include file="navbar.jsp" %>
	
   <!-- page content -->
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3> 강의별 학점관리 <small>강의 선택 후 학생별 입력</small></h3>
                        </div>
                        <div class="btn-group" style="float: right">
                            <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button"> 진행중인 강의 선택 <span class="caret"></span> </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">운동역학</a>
                                </li>
                                <li><a href="#">운동 생리학</a>
                                </li>
                                <li><a href="#">운동 역학의 스포츠 적용</a>
                                </li>
                            </ul>
                        </div>






                    </div>

                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>선택한 강의명</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <!-- start project list -->
                                    <table class="table table-striped projects">
                                        <thead>
                                            <tr>
                                                <th style="width: 1%">#</th>
                                                <th style="width: 20%">이름</th>
                                                <th style="width: 1%">사진</th>
                                                <th>점수</th>
                                                <th style="width: 5%">학점</th>
                                                <th style="width: 20%">수정</th>
                                            </tr>
                                        </thead>
                                        <tbody>





                                            <tr>
                                                <td>1</td>
                                                <td>
                                                    <a>김설현</a>
                                                    <br />
                                                    <small>입력일자 01.22.2019</small>
                                                </td>
                                                <td>
                                                    <ul class="list-inline">
                                                        <li>
                                                            <img src="/project/resources/images/img.jpg" class="avatar" alt="Avatar" onclick="window.open('/project/resources/images/img.jpg')">
                                                        </li>

                                                    </ul>
                                                </td>
                                                <td class="project_progress">
                                                    <div class="progress progress_sm">
                                                        <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="50"></div>
                                                    </div>
                                                    <small>50점</small>
                                                </td>
                                                <td>
                                                    <h2>F</h2>
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i>입력</a>
                                                    <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i>수정</a>
                                                    <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 삭제 </a>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>1</td>
                                                <td>
                                                    <a>김설현</a>
                                                    <br />
                                                    <small>입력일자 01.22.2019</small>
                                                </td>
                                                <td>
                                                    <ul class="list-inline">
                                                        <li>
                                                            <img src="/project/resources/images/img.jpg" class="avatar" alt="Avatar" onclick="window.open('/project/resources/images/img.jpg')">
                                                        </li>

                                                    </ul>
                                                </td>
                                                <td class="project_progress">
                                                    <div class="progress progress_sm">
                                                        <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="50"></div>
                                                    </div>
                                                    <small>50점</small>
                                                </td>
                                                <td>
                                                    <h2>F</h2>
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i>입력</a>
                                                    <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i>수정</a>
                                                    <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 삭제 </a>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>1</td>
                                                <td>
                                                    <a>김설현</a>
                                                    <br />
                                                    <small>입력일자 01.22.2019</small>
                                                </td>
                                                <td>
                                                    <ul class="list-inline">
                                                        <li>
                                                            <img src="/project/resources/images/img.jpg" class="avatar" alt="Avatar" onclick="window.open('/project/resources/images/img.jpg')">
                                                        </li>

                                                    </ul>
                                                </td>
                                                <td class="project_progress">
                                                    <div class="progress progress_sm">
                                                        <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="50"></div>
                                                    </div>
                                                    <small>50점</small>
                                                </td>
                                                <td>
                                                    <h2>F</h2>
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i>입력</a>
                                                    <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i>수정</a>
                                                    <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 삭제 </a>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>1</td>
                                                <td>
                                                    <a>김설현</a>
                                                    <br />
                                                    <small>입력일자 01.22.2019</small>
                                                </td>
                                                <td>
                                                    <ul class="list-inline">
                                                        <li>
                                                            <img src="/project/resources/images/img.jpg" class="avatar" alt="Avatar" onclick="window.open('/project/resources/images/img.jpg')">
                                                        </li>

                                                    </ul>
                                                </td>
                                                <td class="project_progress">
                                                    <div class="progress progress_sm">
                                                        <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="50"></div>
                                                    </div>
                                                    <small>50점</small>
                                                </td>
                                                <td>
                                                    <h2>F</h2>
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i>입력</a>
                                                    <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i>수정</a>
                                                    <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 삭제 </a>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>1</td>
                                                <td>
                                                    <a>김설현</a>
                                                    <br />
                                                    <small>입력일자 01.22.2019</small>
                                                </td>
                                                <td>
                                                    <ul class="list-inline">
                                                        <li>
                                                            <img src="/project/resources/images/img.jpg" class="avatar" alt="Avatar" onclick="window.open('/project/resources/images/img.jpg')">
                                                        </li>

                                                    </ul>
                                                </td>
                                                <td class="project_progress">
                                                    <div class="progress progress_sm">
                                                        <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="50"></div>
                                                    </div>
                                                    <small>50점</small>
                                                </td>
                                                <td>
                                                    <h2>F</h2>
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i>입력</a>
                                                    <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i>수정</a>
                                                    <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 삭제 </a>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>1</td>
                                                <td>
                                                    <a>김설현</a>
                                                    <br />
                                                    <small>입력일자 01.22.2019</small>
                                                </td>
                                                <td>
                                                    <ul class="list-inline">
                                                        <li>
                                                            <img src="/project/resources/images/img.jpg" class="avatar" alt="Avatar" onclick="window.open('/project/resources/images/img.jpg')">
                                                        </li>

                                                    </ul>
                                                </td>
                                                <td class="project_progress">
                                                    <div class="progress progress_sm">
                                                        <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="50"></div>
                                                    </div>
                                                    <small>50점</small>
                                                </td>
                                                <td>
                                                    <h2>F</h2>
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i>입력</a>
                                                    <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i>수정</a>
                                                    <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 삭제 </a>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>1</td>
                                                <td>
                                                    <a>김설현</a>
                                                    <br />
                                                    <small>입력일자 01.22.2019</small>
                                                </td>
                                                <td>
                                                    <ul class="list-inline">
                                                        <li>
                                                            <img src="/project/resources/images/img.jpg" class="avatar" alt="Avatar" onclick="window.open('/project/resources/images/img.jpg')">
                                                        </li>

                                                    </ul>
                                                </td>
                                                <td class="project_progress">
                                                    <div class="progress progress_sm">
                                                        <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="50"></div>
                                                    </div>
                                                    <small>50점</small>
                                                </td>
                                                <td>
                                                    <h2>F</h2>
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i>입력</a>
                                                    <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i>수정</a>
                                                    <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 삭제 </a>
                                                </td>
                                            </tr>





                                        </tbody>
                                    </table>
                                    <!-- end project list -->

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /page content -->

	<%@ include file="../Basic/footer.jsp" %>
	
	<script type="text/javascript">
		$(function (){
			
		});
	</script>
</body>
</html>