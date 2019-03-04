<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../Basic/settings.jsp"%>
<title>Insert title here</title>

<style>
.toggle-off {
	margin-bottom: 0px;
	margin-right: 0px;
}
</style>
</head>
<body class="nav-md">
	<!-- page content -->
	<div class="col-md-9 col-sm-9 col-xs-12">

                            <ul class="stats-overview">
                                <li>
                                    <span class="name"> 총 수강인원 </span>
                                    <span class="value text-success"> ${cnt} </span>
                                </li>
                                <li>
                                    <span class="name"> 과제 제출 인원 </span>
                                   <c:if test="${reportcode != 0}"> 
                                    <span class="value text-success"> ${submitCnt}  </span>
                                   </c:if>
                                   
                                   <c:if test="${reportcode == 0}"> 
                                    <span class="value text-success"> 0  </span>
                                   </c:if>
                                </li>
                                <li class="hidden-phone">
                                    <span class="name">과제 미제출 인원</span>
                                     <c:if test="${reportcode != 0}"> 
                                    <span class="value text-success">  ${notCnt} </span>
                                    </c:if>
                                    
                                    <c:if test="${reportcode == 0}"> 
                                    <span class="value text-success"> ${cnt}  </span>
                                   </c:if>
                                </li>
                            </ul>
                            <div>

                                <h4>제출리스트</h4>

                                <!-- end of user messages -->
                                <ul class="messages">
									<c:forEach var="dto" items="${dtos}">
                                    <li>
                                        <img src="/project/resources/images/img.jpg" class="avatar" alt="Avatar">
                                        <div class="message_date">
                                            <h3 class="date text-info">${dto.day}일</h3>
                                            <p class="month">${dto.month}월</p>
                                        </div>
                                        <div class="message_wrapper">
                                            <h4 class="heading">${dto.userName}</h4>
                                            <blockquote class="message">${dto.reportName} 이해 제출합니다.</blockquote>
                                            <br />
                                            <p class="url">
                                                <span class="fs1 text-info" aria-hidden="true" data-icon="?"></span>
                                               <input type="hidden" id="IDX" value="${staticPath }${dto.fileName}">
                                                <a href="file?file=${dto.fileName}" name=file>${dto.stdNumber}&nbsp;${dto.userName}&nbsp;${dto.fileName2}<i class="fa fa-paperclip"></i></a>
                                                <!-- 2019380527 김설현 운동역학의 이해.doc -->
                                            </p>
                                        </div>
                                    </li>
                                    </c:forEach>
                                </ul>
                                <!-- end of user messages -->


                            </div>


                        </div>

	<!-- /page content -->

	<script
		src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	<script type="text/javascript">
	<%@ include file="../Basic/datePickerJS.jsp"%>
	</script>
	
	<script type="text/javascript">
	
	</script>
	
	<%-- /* function aaa() {
		if(${dtos.getProgress()} < 0){
			alert("마감되었습니다")
			self.close();
		}
	} */ --%>


</body>
</html>