<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${message != null }">
	<%-- alert("${message}"); --%>
	
	<c:choose>
		<c:when test="${alertIcon != null }">
			<c:choose>
				<c:when test="${alertIcon eq 'success' }">
					swal({
						text:"${message}",
						icon: "success",
						button:"확인",
					});
					
				</c:when>
				<c:when test="${alertIcon eq 'error' }">
					swal({
						text:"${message}",
						icon: "error",
						button:"확인",
					});
				</c:when>
				<c:when test="${alertIcon eq 'warning' }">
					swal({
						text:"${message}",
						icon: "warning",
						button:"확인",
					});
				</c:when>
			</c:choose>
		</c:when>
		<c:otherwise>
			swal({
				text:"${message}",
				button:"확인",
			});
		</c:otherwise>
	</c:choose>
</c:if>
	ansycTaskMessage('${userNumber}');
	$('#send').click(function(){
		sendMessage();
	});