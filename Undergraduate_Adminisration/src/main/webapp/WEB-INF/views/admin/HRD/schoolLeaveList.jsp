<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@ include file="../../Basic/settings.jsp" %>
<title>자바대학교 학사관리시스템</title>
</head>
<body class="nav-md">
	<%@ include file="../../Basic/navbar.jsp" %>
	
			<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>학적관리</h3>
            </div>

            <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="학과 검색">
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
                        <h2>휴복학 관리<small></small></h2>
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
                            휴복학 확인하는 페이지
                        </p>
                        <table class="table table-striped jambo_table bulk_action">
                            <thead>
                                <tr class="headings">
                                    <th>
                                        <input type="checkbox" id="check-all" class="flat" name="table_records">
                                    </th>
                                    <th>학적코드</th>
                                    <th>학적구분</th>
                                    <th>기간</th>
                                    <th>신청인</th>
                                    <th>승인여부</th>
                                    <th>구분</th>
                                </tr>
                            </thead>
                            <tbody>
                               <c:forEach var="getSL" items="${getSL}">
                                <tr>
                                    <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
                                    <td>
	                                    <c:if test = "${getSL.schoolLeaveStateCode == 0}">
														
										</c:if> 
										<c:if test = "${getSL.schoolLeaveStateCode == 1}">
														심사중
										</c:if> 
										<c:if test = "${getSL.schoolLeaveStateCode == 2}">
														승인완료
										</c:if> 
                                    </td>
                                    <td>${getSL.kind}</td>
                                    <td>${getSL.leaveStart} - ${getSL.leaveEnd}</td>
                                    <td>${getSL.userName}</td>
                                    <td>${getSL.leaveStatus}</td>
                                    <td><button>조회</button>
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->
            
	<%@ include file="../../Basic/footer.jsp" %>
	
	<script type="text/javascript">
		$(function (){
			
		});
	</script>
</body>
</html>