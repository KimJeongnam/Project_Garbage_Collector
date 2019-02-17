<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@ include file="../../Basic/settings.jsp" %>
<title>Insert title here</title>
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
		
		                    <div class="table-responsive">
		                      <table class="table table-striped jambo_table bulk_action">
		                        <thead>
		                          <a href="#">
		                          <tr class="headings">
		                            <th class="column-title">학년 </th>
		                            <th class="column-title">학기</th>
		                            <th class="column-title">학과</th>
		                            <th class="column-title">장학금 명</th>
		                            <th class="column-title">장학금 확정 금액</th>
		                            <th class="column-title">지급 일자</th>
		                          </tr></a>
		                        </thead>
		
		                        <tbody>
		                          <tr class="even pointer">
		                            <td class=" ">박대근</td>
		                            <td class=" ">1</td>
		                            <td class=" ">1</td>
		                            <td class=" ">다자녀 장학금</td>
		                            <td class=" ">5,000,000</td>
		                            <td class=" ">2018-04-20</td>
		                          </tr>
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