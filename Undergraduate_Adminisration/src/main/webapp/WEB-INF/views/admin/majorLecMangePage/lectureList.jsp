<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-striped jambo_table bulk_action">
	<thead>
		<tr class="headings">
			<th class="text-center">구분</th>
			<th class="text-center">학과</th>
			<th class="text-center">강의명</th>
			<th class="text-center">학년</th>
			<th class="text-center">학기</th>
			<th class="text-center">학점</th>
			<th class="text-center">담당 교수</th>
			<th class="text-center">인원수</th>
			<th class="text-center">시간표</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dto" items="${dtos }">
		</c:forEach>
	</tbody>
</table>
<div>
	<input type="button" class="btn btn-primary" value="신규">
</div>