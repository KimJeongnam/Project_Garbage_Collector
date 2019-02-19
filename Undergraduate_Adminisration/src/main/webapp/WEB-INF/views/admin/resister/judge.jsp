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
            <div class="" role="main">
                <div class="">
                    <div class="">
                        <div class="title_left">
                        <div class="col-sm-6">
                        
                        
					<div class="clearfix"></div>
					<div class="x_panel">
                    <div class="row">
						<div class="x_content">
						<div style="float: right;">
						<button class="btn btn-success" onclick="toggleOn()">합격</button>
						<button class="btn btn-danger" onclick="toggleOff()">불 합격</button>
						</div>
		                    <div class="">
		                      <table class="table table-striped jambo_table bulk_action" style="text-align: center">
		                        <thead>
		                          <tr class="headings">
		                          	<th style="text-align: center">선택</th>
		                            <th style="text-align: center">학생명 </th>
		                            <th style="text-align: center">학년</th>
		                            <th style="text-align: center">학기</th>
		                            <th style="text-align: center">장학금 명</th>
		                            <th style="text-align: center">지급 일자</th>
		                            <th style="text-align: center">장학금 금액(원)</th>
		                            <th style="text-align: center">합/불여부</th>
		                          </tr>
		                        </thead>
		
		                        <tbody>
		                            <c:forEach var="dto" items="${audit}" varStatus="num">
		                            <tr class="even pointer">
		                            <td>
                                        <input type="checkbox" class="flat table_records2" name="table_records2" value="${dto.schinfopk}">
                                    </td>
		                             
			                            <td class=" ">${dto.userName}</td>
			                            <td class=" ">${dto.grade}</td>
			                            <td class=" ">${dto.semester}</td>
			                            <td class=" ">${dto.scholarName}</td>
			                            <td class=" ">${dto.year}</td>
			                            <td class=" ">${dto.amount}</td>
			                            <c:if test="${dto.scholarstatus == '합'}">
			                          	<td>
			                            <input class="toggle-event" type="checkbox" data-toggle="toggle" data-off="불" data-on="합"" checked="checked"></td>
		                            	</tr>
		                            	</c:if>
		                            	
		                            	<c:if test="${dto.scholarstatus == '불'}">
			                          	<td>
			                            <input class="toggle-event" type="checkbox" data-toggle="toggle" data-off="불" data-on="합"></td>
		                            	</tr>
		                            	</c:if>
		                            
		                            </c:forEach>
		                          
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
            
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	
	
	
    <script type="text/javascript">
		<%@ include file="../../Basic/datePickerJS.jsp"%>
		
		
		/*  function toggleOn(){
			var list = [];
			var list_size = 0;
			
			var form = document.createElement("form");
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "POST");
			form.setAttribute("action", "../admin/auditPro");
			
			var cnt = 0;
			
			for(var i=0; i<$('.table_records2').size(); i++){
				if($('.table_records2')[i].checked){
					//list[list_size++] = $('.table_records')[i].value;
					var field = document.createElement("input");
					field.setAttribute("type", "hidden");
					field.setAttribute("name", "chk");
					field.setAttribute("value", $('.table_records2')[i].value);
					form.appendChild(field);
				}
			}
			
			document.body.appendChild(form);
			
			form.submit();
		}  */
		 
		 function toggleOn(){
				var list = [];
				var list_size = 0;
				
				var form = document.createElement("form");
				form.setAttribute("charset", "UTF-8");
				form.setAttribute("method", "POST");
				form.setAttribute("action", "../admin/auditPro");
				
				var cnt = 0;
				
				for(var i=0; i<$('.table_records2').size(); i++){
					if($('.table_records2')[i].checked){
						//list[list_size++] = $('.table_records')[i].value;
						var field = document.createElement("input");
						field.setAttribute("type", "hidden");
						field.setAttribute("name", "chk");
						field.setAttribute("value", $('.table_records2')[i].value);
						form.appendChild(field);
					}
				}
				
				document.body.appendChild(form);
				
				form.submit();
			} 
		 
		  function toggleOff(){
				var list = [];
				var list_size = 0;
				var a = $('.table_records2')[0].checked
				
				
				
				var form = document.createElement("form");
				form.setAttribute("charset", "UTF-8");
				form.setAttribute("method", "POST");
				form.setAttribute("action", "../admin/auditPro");
				
				var cnt = 0;
				
				for(var i=0; i<$('.table_records2').size(); i++){
					if($('.table_records2')[i].checked){
						//list[list_size++] = $('.table_records')[i].value;
						var field = document.createElement("input");
						field.setAttribute("type", "hidden");
						field.setAttribute("name", "chk2");
						field.setAttribute("value", $('.table_records2')[i].value);
						form.appendChild(field);
					}
				}
				
				document.body.appendChild(form);
				
				form.submit();
			}  
		
	</script>
	
	
	
</body>
</html>