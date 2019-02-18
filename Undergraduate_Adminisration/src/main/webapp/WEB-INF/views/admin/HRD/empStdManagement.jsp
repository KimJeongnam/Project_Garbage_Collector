<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../Basic/settings.jsp"%>
<title>Insert title here</title>
</head>
<body class="nav-md">
	<%@ include file="../../Basic/navbar.jsp"%>

	<script type="text/javascript">
	function employeeInfo(name){
		
	}
	</script>
	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>정보 조회</h3>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>교직원</h2>
							<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link">
									<i class="fa fa-chevron-up"></i></a>
								</li>
								<li><a class="close-link"><i class="fa fa-close"></i></a></li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<table id="datatable" class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>이름</th>
										<th>직책</th>
										<th>학과(학과코드)</th>
										<th>연차</th>
										<th>입사일</th>
										<th>연봉</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="vo" items="${vo}" varStatus="status">
									<tr>
										<td><a href=".x_panel${status.index}" 
											   onclick="class_click('x_panel${status.index}', '${vo.userNumber}')">${vo.userName}</a></td>
										<td>
											 <c:if test = "${vo.authority eq 'ROLE_PROFESSOR'}">
													교수
											</c:if> 
											<%-- ${vo.authority} --%>
										</td>
										<td>${vo.majorName}(${vo.majorNum})</td>
										<td>${vo.annualLevel}</td>
										<td>${vo.empHiredDate}</td>
										<td>${vo.totalPayment}만원</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<div>
								<input class="btn btn-primary" type="button" value="등록"
									onclick="window.location='proInsert2'">
								<button type="button" class="btn btn-success" id="btnTest" data-toggle="modal" data-target=".bs-example-modal-sm">문자전송</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12">
					
					<div class="x_panel">
					
						<div class="x_title">
							<h2>학생</h2>
							<ul class="nav navbar-right panel_toolbox">
								<li>
									<a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
								</li>
								<li><a class="close-link"><i class="fa fa-close"></i></a></li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<div class="row">
								<div class="col-sm-12">
									<div class="card-box table-responsive">
										<table id="datatable-keytable"
											class="table table-striped table-bordered">
											<thead>
												<tr>
													<th>이름</th>
													<th>학번</th>
													<th>학과(학과코드)</th>
													<th>학년</th>
													<th>연락처</th>
													<th>학적상태</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach var="dto" items="${dtos}">
												<tr>
													<td><a href="stdMyPage?userNumber=${dto.userNumber}">${dto.userName}</a></td>
													<td>${dto.userNumber}</td>
													<td>${dto.majorName}(${dto.majorNum})</td>
													<td>${dto.grade}</td>
													<td>${dto.userCellNum}</td>
													<td><c:if test = "${dto.graduation_state ==0}">
															재학중
														</c:if>
														<c:if test = "${dto.graduation_state ==1}">
															휴학중
														</c:if>
														<c:if test = "${dto.graduation_state ==2}">
															졸업
														</c:if>
													</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
										<div>
											<input class="btn btn-primary" type="button" value="등록"
												onclick="window.location='stdInsert2'">
											<button type="button" class="btn btn-success" data-toggle="modal" data-target=".bs-example-modal-sm">문자전송</button>
											<!-- <input class="btn btn-primary" id="sendStudentBtn" type="button" value="문자전송"> -->
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	 <!-- 문자전송 모달  -->
    <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel2">단체문자 전송</h4>
                </div>
                <div class="modal-body">
                	<c:forEach var="stdDto" items="${dtos}">
                   		<input  id="smsType" type="hidden" value="${stdDto.authority}">
                    </c:forEach>
                    	<textarea rows="" cols=""  style="resize :none; width : 265px; height: 80px;" id="SMSArea"></textarea>
                </div>
                <div class="modal-footer">
                    	<button type="reset" class="btn btn-default" data-dismiss="modal">취소</button>
                   		<button type="button" id="sendSMSBtn" class="btn btn-primary">전송</button>
             
                </div>
            </div>
        </div>
    </div>
    <!-- 문자전송 모달 끝  -->
	<!-- /page content -->

	<%@ include file="../../Basic/footer.jsp"%>

	<script type="text/javascript">
		//학생문자전송버튼 클릭 시, 문자전송
	/* 	$('#sendStudentBtn').click(function(){
			if(confirm("전송하시겠습니까?")){
				sendSMSMessage("ROLE_STUDENT");
			}
			
			//todo: open modal pop
			//smsType = 'ROLE_STUDENT';
			//$('#smsType').val('ROLE_STUDENT');
		});
	
		$('#sendEmployeeBtn').click(function(){
			if(confirm("전송하시겠습니까?")){
				sendSMSMessage("employee");
			}
			//todo: open modal pop
			//smsType = 'employee';
			//$('#smsType').val('employee');
			
		}); */
		
		//todo: textarea 변경시 전송 버튼 이벤트
		 $('#sendSMSBtn').click(function(){
			if(confirm("전송하시겠습니까?")){
				//sendSMSMessage($('#smsType').val());
				//sendSMSMessage(smsType);
			 	if(confirm == true){
				$('.modal').remove();
				
			 	}
			}
		}); 
		
		
		//Send SMS message (보내는 ROLE)
		function sendSMSMessage(authority){
		   var obj = new Object();
           obj.authority = authority;
           
           //todo: textarea value 로 변경 필요
           obj.msg =$('#SMSArea').val();
           
            var jsonData = JSON.stringify(obj);
            
            //project/admin/ajax/sendSMSMessage 호출(ajax)
            $.ajax({
                url: '/project/admin/ajax/sendSMSMessage',
                type: 'POST',
                data: jsonData,
                contentType: 'application/json;charset=UTF-8',
                success: function(data) {
                	if(data.result == "success"){
                		alert("전송 성공");
                	}else{
                		alert("전송실패");
                	}
                },
                error: function() {
                	alert("Error!");
                }
            });
		}
			  function class_click(divid, userNum) {
		            var obj = new Object();
		            obj.userNum = userNum;
		            
		            console.log(userNum);
		            if($('#'+divid)!= null){
		            	
			            var jsonData = JSON.stringify(obj);
			            $.ajax({
			                url: '/project/admin/list/class_click',
			                type: 'POST',
			                data: jsonData,
			                contentType: 'application/json;charset=UTF-8',
			                success: function(data) {
			                	console.log(data);
			                   $('#'+divid).html(data);//#divid로 데이터를 뿌려라.
			                },
			                error: function() {
			                	alert("Error! class_click();");
			                }
			            });
		            }
		        }
	</script>
</body>
</html>