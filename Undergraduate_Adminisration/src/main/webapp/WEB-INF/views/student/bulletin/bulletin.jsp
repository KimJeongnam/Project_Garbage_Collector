<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@ include file="../../Basic/settings.jsp" %>
<title>Insert title here</title>

	<style>
	.toggle-off{
		margin-bottom:0px;
		margin-right:0px;
	}
	</style>
</head>
<body class="nav-md">
			<!-- page content -->
            <div class="" role="main" style="width: 1800px;">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">
							<h2>장학금 신청 글</h2>
							
						</div>
					</div>
					
					<div class="clearfix"></div>
					<div class="x_panel">
                    <div class="row">
						<div class="x_content">
		                    <div class="table-responsive" style="text-align: center;">
		                      <table class="table table-striped jambo_table bulk_action">
		                        <thead>
		                          <tr class="headings">
		                            <th class=""  style="width: 15%; text-align: center;">글 번호</th>
		                            <th class=""  style="width: 15%; text-align: center;">년도</th>
		                            <th class=""  style="width: 15%; text-align: center;">학기</th>
		                            <th class=""  style="width: 25%; text-align: center;">장학금 명</th>
		                            <th class=""  style="width: 25%; text-align: center;">지급 금액</th>
		                            <!-- <th class="column-title">조회</th> -->
		                          </tr>
		                        </thead>
		                        <tbody>
		                        <c:if test = "${cnt > 0}">
									<c:forEach var="dto" items="${dtos}">
			                         
			                         <tr class="even pointer">
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
		                      
		                      <div class="row">
								<div class="col-sm-5">
									<div class="dataTables_info" id="datatable_info" role="status"
										aria-live="polite">Showing ${number} to ${number+pageCount} of
										${cnt} entries</div>
								</div>
							
								<div class="col-sm-7">
									<div class="text-right">
										<ul class="pagination">
											<c:if test="${cnt > 0 }">
												<c:if test="${startPage > pageBlock }">
													<a href="/student/bulletin">[◀◀]</a>
													<a href="/student/bulletin?pageNum=${startPage - pageBlock }">[◀&nbsp;prev]</a>
							
													<li class="paginate_button previous disabled"
														style="cursor: pointer;" id="datatable_previous"><a
														onclick="studentBulletinlist('${userNumber}', 1);"
														aria-controls="datatable" data-dt-idx="0" tabindex="0">Frist</a></li>
													<li class="paginate_button previous disabled"
														style="cursor: pointer;"
														onclick="studentBulletinlist('${userNumber}', ${startPage - pageBlock});"
														id="datatable_previous"><a aria-controls="datatable"
														data-dt-idx="0" tabindex="0">Previous</a></li>
												</c:if>
												<c:forEach var="page" begin="${startPage }" end="${endPage }">
													<c:choose>
														<c:when test="${pageNum == page }">
															<li class="paginate_button active"><a href="#"
																aria-controls="datatable" tabindex="0">${page }</a></li>
														</c:when>
														<c:otherwise>
															<li class="paginate_button" style="cursor: pointer;"
																onclick="studentBulletinlist('${userNumber}', ${page });"><a
																aria-controls="datatable" tabindex="0">${page }</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
							
												<c:if test="${pageCount > endPage }">
													<li class="paginate_button next" id="datatable_next"
														style="cursor: pointer;"
														onclick="studentBulletinlist('${userNumber}', ${startPage + pageBlock });">
														<a aria-controls="datatable" tabindex="0">Next</a>
													</li>
													<li class="paginate_button next" id="datatable_next"
														style="cursor: pointer;"
														onclick="studentBulletinlist('${userNumber}', ${pageCount });">
														<a aria-controls="datatable" tabindex="0">Last</a>
													</li>
												</c:if>
											</c:if>
										</ul>
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
            
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	
	
	
    <script type="text/javascript">
		<%@ include file="../../Basic/datePickerJS.jsp"%>
	</script>
	
</body>
</html>