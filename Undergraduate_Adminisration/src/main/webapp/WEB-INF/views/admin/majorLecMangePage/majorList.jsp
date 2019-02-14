<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-striped jambo_table bulk_action">
	<thead>
		<tr class="headings">
			<th class="text-center">학과코드</th>
			<th class="text-center">단과대</th>
			<th class="text-center">학과명</th>
			<th class="text-center">학년별 최대 인원수</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="major" items="${majors }">
			<tr>
				<td class="text-center" style="vertical-align: middle;">${major.majorNum}</td>
				<td class="text-center" style="vertical-align: middle;">${major.faculty }</td>
				<td class="text-center" style="vertical-align: middle;">${major.majorName }</td>
				<td class="text-center" style="vertical-align: middle;">${major.maxNum }</td>
				<td>
					<input class="btn btn-info" type="button" value="수정"
						onclick="openMajorModal('수정'
							, '${major.majorNum}'
							, '${major.faculty }'
							, '${major.majorName }'
							, '${major.maxNum }');">
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
