<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<i class="fa fa-sort-amount-desc"> &nbsp;&nbsp;</i>내 강의 수강목록
<br>
<c:forEach var="lec" items="${search_student_click}">
&nbsp;&nbsp;&nbsp;<i class="fa fa-check"> &nbsp;&nbsp;</i>
	${lec.lectureName}<br>
</c:forEach>
