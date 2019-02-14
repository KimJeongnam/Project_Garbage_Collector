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
	<%@ include file="../../Basic/navbar.jsp" %>
	
			<!-- page content -->
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">
							<h2>장학금 심사</h2>
							
						</div>
					</div>
					
					<div class="clearfix"></div>
					<div class="x_panel">
                    <div class="row">
						<div class="x_content">
							Date Range Picker
		                       <form class="form-horizontal">
		                         <fieldset>
		                           <div class="control-group">
		                             <div class="controls">
		                               <div class="input-prepend input-group">
		                                 <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
		                                 <input type="text" style="width: 200px" name="reservation" id="reservation" class="form-control" value="01/01/2019 - 01/25/2019" />
		                               </div>
		                             </div>
		                           </div>
		                         </fieldset>
		                       </form>

		                    <p>Add class <code>bulk_action</code> to table for bulk actions options on row select</p>
		
		                    <div class="table-responsive" style="text-align: center;">
		                      <table class="table table-striped jambo_table bulk_action">
		                        <thead>
		                          <tr class="headings">
		                          	<th class=""  style="width: 5%; text-align: center;">
                                        <input type="checkbox" id="check-all" class="flat">
                                    </th>
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
			                        <td>
                                        <input type="checkbox" class="flat table_records" name="table_records" value="${dto.scholarpk}">
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
		                      
		                      <!-- 페이지 컨트롤 -->
							<div class="col-sm-7">
									<div class="text-right">
										<ul class="pagination">
											<c:if test="${cnt > 0 }">
												<c:if test="${startPage > pageBlock }">
													<a href="/admin/registrationList">[◀◀]</a>
													<a href="/admin/registrationList?pageNum=${startPage - pageBlock }">[◀&nbsp;prev]</a>
							
													<li class="paginate_button previous disabled"
														style="cursor: pointer;" id="datatable_previous"><a
														onclick="adminregistrationListlist('${userNumber}', 1);"
														aria-controls="datatable" data-dt-idx="0" tabindex="0">Frist</a></li>
													<li class="paginate_button previous disabled"
														style="cursor: pointer;"
														onclick="adminregistrationListlist('${userNumber}', ${startPage - pageBlock});"
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
																onclick="adminregistrationListlist('${userNumber}', ${page });"><a
																aria-controls="datatable" tabindex="0">${page }</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
							
												<c:if test="${pageCount > endPage }">
													<li class="paginate_button next" id="datatable_next"
														style="cursor: pointer;"
														onclick="adminregistrationListlist('${userNumber}', ${startPage + pageBlock });">
														<a aria-controls="datatable" tabindex="0">Next</a>
													</li>
													<li class="paginate_button next" id="datatable_next"
														style="cursor: pointer;"
														onclick="adminregistrationList('${userNumber}', ${pageCount });">
														<a aria-controls="datatable" tabindex="0">Last</a>
													</li>
												</c:if>
											</c:if>
										</ul>
									</div>
								</div>
            <!-- /page content -->
            
	<%@ include file="../../Basic/footer.jsp" %>
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
    
	
    <script type="text/javascript">
		<%@ include file="../../Basic/datePickerJS.jsp"%>
		
	</script>
	
	<script type="text/javascript">
	function delete_scholar(){
		var list = [];
		var list_size = 0;
		
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "POST");
		form.setAttribute("action", "../../admin/deletePro");
		
		var cnt = 0;
		
		for(var i=0; i<$('.table_records').size(); i++){
			if($('.table_records')[i].checked){
				//list[list_size++] = $('.table_records')[i].value;
				var field = document.createElement("input");
				field.setAttribute("type", "hidden");
				field.setAttribute("name", "scholarpks");
				field.setAttribute("value", $('.table_records')[i].value);
				form.appendChild(field);
			}
		}
		
		document.body.appendChild(form);
		
		form.submit();
	}
	</script>
	
	
	
</body>
</html>