<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@ include file="Basic/settings.jsp" %>
<title>Insert title here</title>
</head>
<body class="nav-md">
	<%@ include file="Basic/navbar.jsp" %>
	
		 <!-- page content -->
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3>수업업무</h3>
                        </div>

                        <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="학생 검색">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">검색</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>학과 추가 및 수정<small></small></h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">Settings 1</a>
                                                </li>
                                                <li><a href="#">Settings 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <p class="text-muted font-13 m-b-30">
                                        학과를 추가 및 수정 해보자
                                    </p>
                                    <table class="table table-striped jambo_table bulk_action">
                                        <thead>
                                            <tr class="headings">
                                                <th>
                                                    <input type="checkbox" id="check-all" class="flat" name="table_records">
                                                </th>
                                                <th>학과코드</th>
                                                <th>학과명</th>
                                                <th>소속 단과대</th>
                                                <th>총원</th>
                                                <th>소속 교직원 수</th>

                                            </tr>
                                        </thead>


                                        <tbody>
                                            <tr>
                                                <td>
                                                    <input type="checkbox" class="flat" name="table_records">
                                                </td>
                                                <td>A8157</td>
                                                <td>유도학과</td>
                                                <td>무도대학</td>
                                                <td>536</td>
                                                <td>8</td>

                                            </tr>






                                        </tbody>
                                    </table>
                                    <button>신규</button><button>수정</button><button>삭제</button>
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

            
	<%@ include file="Basic/footer.jsp" %>
	
	<script type="text/javascript">
		$(function (){
			
		});
	</script>
</body>
</html>