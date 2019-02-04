<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Basic/settings.jsp"%>
<html>
<body>
	<h2>상품등록</h2>
	<c:if test="${stdInsertResult ==0}">
		<script type="text/javascript">
			alert("학생등록실패")
		</script>
	</c:if>
	<c:if test="${stdInsertResult !=0}">
		<script type="text/javascript">
			alert("학생등록완료")
		</script>
		<c:redirect url ="empStdManagement"/>
	</c:if>
	
</body>
</html>