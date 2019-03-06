<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@ include file="../Basic/settings.jsp" %>
<title>자바대학교 학사관리시스템</title>
</head>
<body class="nav-md">
	<%@ include file="../Basic/navbar.jsp" %>
	
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
                        <h2>장학금 글 목록</h2>
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
                    <div class="x_content" style="text-align: center;">
                        <table class="table table-striped jambo_table bulk_action">
                            <thead>
                                <tr class="headings">
		                          	<th class=""  style="width: 10%; text-align: center;">
                                        <input type="checkbox" id="check-all" class="flat" name="table_records">
                                    </th>
		                            <th class=""  style="width: 15%; text-align: center;">글 번호</th>
		                            <th class=""  style="width: 15%; text-align: center;">년도</th>
		                            <th class=""  style="width: 15%; text-align: center;">학기</th>
		                            <th class=""  style="width: 25%; text-align: center;">장학금 명</th>
		                            <th class=""  style="width: 20%; text-align: center;">지급 금액</th>
		                            <!-- <th class="column-title">조회</th> -->
		                          </tr>
                            </thead>


                            <tbody>
                               <c:if test = "${cnt > 0}">
									<c:forEach var="dto" items="${dtos}">
			                         
			                         <tr class="">
			                        <td>
                                        <input type="checkbox" class="flat" name="table_records">
                                    </td>
			                            <td class=" ">${dto.scholarpk}</td>
			                            <td class=" ">${dto.year}</td>
			                            <td class=" ">${dto.semester}</td>
			                            <td class=" "><a href = "contentForm?scholarpk=${dto.scholarpk}">${dto.scholarname}</a></td>
			                            <td class=" ">${dto.amount}</td>
			                           
			                          </tr>
			                           
			                         </c:forEach>
			                      </c:if>


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
            
	<%@ include file="../Basic/footer.jsp" %>
	
	<script type="text/javascript">
		$(function (){
			
		});
	</script>
</body>
</html>