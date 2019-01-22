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
                <h3>학생관리</h3>
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
                        <h2>학생 리스트 및 수정<small></small></h2>
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
                            학생 확인해보자
                        </p>
                        <table class="table table-striped jambo_table bulk_action">
                            <thead>
                                <tr class="headings">
                                    <th>
                                        <input type="checkbox" id="check-all" class="flat" name="table_records">
                                    </th>
                                    <th>학번</th>
                                    <th>단과대명</th>
                                    <th>학과명</th>
                                    <th>입학년도</th>
                                    <th>학년</th>
                                    <th>현황</th>
                                   <th>이름</th>

                                </tr>
                            </thead>


                            <tbody>
                                <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>200838057</td>
                                    <td>무도대학</td>
                                    <td>유도학과</td>
                                    <td>2008년3월</td>
                                    <td>8학년</td>
                                    <td>재학</td>
                                    <td>정치호</td>
                                </tr>
                                     <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>200838057</td>
                                    <td>무도대학</td>
                                    <td>유도학과</td>
                                    <td>2008년3월</td>
                                    <td>8학년</td>
                                    <td>재학</td>
                                    <td>정치호</td>
                                </tr>
                     
     <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>200838057</td>
                                    <td>무도대학</td>
                                    <td>유도학과</td>
                                    <td>2008년3월</td>
                                    <td>8학년</td>
                                    <td>재학</td>
                                    <td>정치호</td>
                                </tr>
                     
                                     <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>200838057</td>
                                    <td>무도대학</td>
                                    <td>유도학과</td>
                                    <td>2008년3월</td>
                                    <td>8학년</td>
                                    <td>재학</td>
                                    <td>정치호</td>
                                </tr>
                     
                                     <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>200838057</td>
                                    <td>무도대학</td>
                                    <td>유도학과</td>
                                    <td>2008년3월</td>
                                    <td>8학년</td>
                                    <td>재학</td>
                                    <td>정치호</td>
                                </tr>
                     
                                     <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>200838057</td>
                                    <td>무도대학</td>
                                    <td>유도학과</td>
                                    <td>2008년3월</td>
                                    <td>8학년</td>
                                    <td>재학</td>
                                    <td>정치호</td>
                                </tr>
                     
                                     <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>200838057</td>
                                    <td>무도대학</td>
                                    <td>유도학과</td>
                                    <td>2008년3월</td>
                                    <td>8학년</td>
                                    <td>재학</td>
                                    <td>정치호</td>
                                </tr>
                     
                                
                     
                                         
      


                            </tbody>
                        </table>

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