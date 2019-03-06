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
							<table id="datatable" class="table table-striped table-bordered" style="text-align : center;">
								<thead>
									<tr>
										<th class="text-center">이름</th>
										<th class="text-center">교직원번호</th>
										<th class="text-center">학과(학과코드)</th>
										<th class="text-center">직책</th>
										<th class="text-center">연차</th>
										<th class="text-center">연락처</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="vo" items="${vo}" varStatus="status">
									<tr>
										<td>
											<c:if test = "${vo.majorNum != 0 }">
												<a href="proMyPage?userNumber=${vo.userNumber}">${vo.userName}</a>
											</c:if> 
											<c:if test = "${vo.majorNum == 0 }">
												<a href="empMyPage?userNumber=${vo.userNumber}">${vo.userName}</a>	
											</c:if>
											
										</td>
										<td>${vo.userNumber}</td>
										<td>
											<c:if test = "${vo.majorNum == 0 }">
													직원
											</c:if>
											${vo.majorName}(${vo.majorNum})
										</td>
										<td>
											 <c:if test = "${vo.majorNum != 0 }">
													교수
											</c:if> 
											<c:if test = "${vo.majorNum == 0 }">
													직원
											</c:if>
										</td>
										<td>${vo.annualLevel}</td>
										<td>${vo.userCellNum}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<div>
								<input class="btn btn-primary" type="button" value="등록"
									onclick="window.location='proInsert2'">
								<button type="button" class="btn btn-success" id="proSend">문자전송</button>
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
										<table id="datatable-keytable" style="text-align : center;"
											class="table table-striped table-bordered">
											<thead>
												<tr>
													<th class="text-center">이름</th>
													<th class="text-center">학번</th>
													<th class="text-center">학과(학과코드)</th>
													<th class="text-center">학년</th>
													<th class="text-center">연락처</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach var="dto" items="${dtos}" >
												<tr>
													<td><a href="stdMyPage?userNumber=${dto.userNumber}">${dto.userName}</a></td>
													<td>${dto.userNumber}</td>
													<td>${dto.majorName}(${dto.majorNum})</td>
													<td>${dto.grade}</td>
													<td>${dto.userCellNum}</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
										<div>
											<input class="btn btn-primary" type="button" value="등록"
												onclick="window.location='stdInsert2'">
											<button type="button" class="btn btn-success"  id="stdSend" >문자전송</button>
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
	<!--히든인 smsType 태그에 제이쿼리로 값을 할당  -->
    <input  id="smsType" type="hidden" value="">
    
     <!-- 문자전송 모달  -->
    <div class="modal fade sendModal" tabindex="-1" id="modal" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel2">단체문자 전송</h4>
                </div>
                <div class="modal-body">
                	
                    	<textarea rows="" cols=""  style="resize :none; width : 265px; height: 80px;" id="text"></textarea>
                    	<p id="textCnt">( 0 / 60 )</p>
                </div>
                <div class="modal-footer">
                    	<button type="reset" class="btn btn-default"  data-dismiss="modal">취소</button>
                   		<button type="button" id="sendSMSBtn" class="btn btn-primary" >전송</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 문자전송 모달 끝  -->
	<!-- /page content -->

	<%@ include file="../../Basic/footer.jsp"%>

	<script type="text/javascript">
	
	//학생-문자전송 클릭시 텍스트창 초기화
	$('#stdSend').click(function(){
		  $('#text').val("");
		  $('#textCnt').html("( 0 / 60 )");
		  var smsStdType = "";
		  
		  // html소스 내에  c:if 태그가 정의 되어 있을경우 스크립트 내에서 사용 가능 
		  <c:if test = "${!empty dtos && fn:length(dtos) > 0}">
		  	smsStdType = "${dtos[0].authority}";
		  </c:if>
		  if(smsStdType ==''){
			  alert('보낼 학생이 없습니다.');
		  }else{
			  //히든 타입인 smsType태그에 값을 넣어줌
			  $('#smsType').val(smsStdType);
			  //popopen
			  $('#modal').modal('show');
		  }
          
	}); 
	
	//교수 문자전송 클릭시 텍스트창 초기화
	$('#proSend').click(function(){
	  $('#text').val("");
	  $('#textCnt').html("( 0 / 60 )");
	  var smsProType = "";
	  <c:if test = "${!empty vo && fn:length(vo) > 0}">
	  	smsProType = "${vo[0].authority}";
	  </c:if>
      if(smsProType ==''){
		  alert('보낼 교수가 없습니다.');
	  }else{
		  $('#smsType').val(smsProType);
		//popopen
		  $('#modal').modal('show');
	  }
      	
	}); 
	
	//학생 단체문자전송
	$('#sendSMSBtn').click(function(){
		if($('#text').val().replace(" ", "").length == 0){
			alert("문자를 입력해주세요.")
		
		}else if($('#text').val().length > 60){
			alert('60자 이내로 입력해주세요.');
		}else{
			if(confirm("전송하시겠습니까?")){
				sendSMSMessage($('#smsType').val());
			
		 	}
		}
		
	});

	
	//Send SMS message (보내는 ROLE)
	function sendSMSMessage(authority){
	   var obj = new Object();
          obj.authority = authority;
          obj.msg =$('#text').val();
          
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
               },
               //성공이든 오류든 완료시점에 실행되는 액션정의
               complete : function(){
            	   $('#modal').modal('hide');
               }
               
           }); 
	}
	// 글자수 카운트
	$('#text').keydown(function(){
		setTextCnt($(this));
	});
	// 글자수 카운트
	$('#text').keyup(function(){
		setTextCnt($(this));
	});
	
	//위에 매개변수로 넣은 카운트 = obj
	function setTextCnt(obj){
		if(obj.val().length > 60){
			$('#textCnt').html("( " + "<span style='color : red'>" + obj.val().length + "</span> / 60 )");
			
		}else{
			$('#textCnt').html("( " + obj.val().length + " / 60 )");
		}
	}
	
	</script>
</body>
</html>