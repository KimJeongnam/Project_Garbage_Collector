<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@ include file="../Basic/settings.jsp" %>
<title>Insert title here</title>

	<style>
	.toggle-off{
		margin-bottom:0px;
		margin-right:0px;
	}
	</style>
</head>
<body class="nav-md">
	<%@ include file="../Basic/navbar.jsp" %>
	
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
                                        <input type="checkbox" id="check-all" class="flat" name="table_records">
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
                                        <input type="checkbox" class="flat" name="table_records" value=${dto.scholarpk}>
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
		                      <input type = "button" value="글쓰기" onclick="window.location='registration'" style="float: right">
		                      <input type = "button" value="글 삭제" onclick="window.location='deletePro?scholarpk=${dto.scholarpk}'" style="float: right">
		                    </div>
		                    
		                  </div>
		                  </div>
		              </div>
								
                </div>
            </div>
            <!-- /page content -->
            
	<%@ include file="../Basic/footer.jsp" %>
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	
	
	
    <script type="text/javascript">
		<%@ include file="../Basic/datePickerJS.jsp"%>
	</script>
	
</body>
</html>