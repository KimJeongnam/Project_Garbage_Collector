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
	
	<script type="text/javascript">
	function openMajorAdd(){
		/*
		 * 새창 열기
		 *  window.open("파일명", "윈도우 명", "창 속성");
		 *  url="주소?속성="+속성값; -- get방식
		 */
		var url = "${contextPath}/openMajorAdd";
		window.open(url, "openMajorAdd", "menubar=no,"+
				"toolbar=no,"+
				"location=no,"+
				"resizable=no,"+
				"status=no,"+
				"top=200, left=1280, width=460, height=460");
	}
	</script>
		 <!-- page content -->
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3>교직업무</h3>
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
                        <div class="col-md-4 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>학과<small></small></h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <p class="text-muted font-13 m-b-30">
                                    </p>
                                    <table class="table table-striped jambo_table bulk_action">
                                        <thead>
                                            <tr class="headings">
                                                <th class="text-center">학과코드</th>
                                                <th class="text-center">단과대</th>
                                                <th class="text-center">학과명</th>
                                                <th class="text-center">학년별 최대 인원수</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="text-center">A8157</td>
                                                <td class="text-center">공과대</td>
                                                <td class="text-center">컴퓨터공학과</td>
                                                <td class="text-center">120</td>
                                            </tr>
                                            <tr>
                                                <td class="text-center">A8158</td>
                                                <td class="text-center">무도대학</td>
                                                <td class="text-center">유도학과</td>
                                                <td class="text-center">150</td>
                                            </tr>
                                            <tr>
                                                <td class="text-center">A8159</td>
                                                <td class="text-center">무도대학</td>
                                                <td class="text-center">유도학과</td>
                                                <td class="text-center">150</td>
                                            </tr>
                                            <tr>
                                                <td class="text-center">A8110</td>
                                                <td class="text-center">무도대학</td>
                                                <td class="text-center">유도학과</td>
                                                <td class="text-center">150</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <input type="button" class="btn btn-primary" onclick="openMajorAdd();" value="신규">
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-8 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>강의<small></small></h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
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
                                    <input type="button" class="btn btn-primary" value="신규">
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