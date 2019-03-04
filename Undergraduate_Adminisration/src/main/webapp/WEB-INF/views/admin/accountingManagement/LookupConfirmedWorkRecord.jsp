<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="staticPath" value="/project/resources" />
<html>
<body>
	<div class="modal-header">
		<!-- 닫기(x) 버튼 -->
		<button type="button" class="close" data-dismiss="modal">×</button>
		<!-- header title -->
		<h4 class="modal-title">근무기록보기</h4>
	</div>

	<div class="modal-body">
		<table id="datatable"
			class="table table-striped jambo_table bulk_action">
			<thead>
				<tr class="headings">
					<th><input type="checkbox" id="allCheck1"></th>
					<th>교직원번호</th>
					<th>교직원명</th>
					<th>부서/전공</th>
					<th
						title="추가근무수당 : 주 40시간 초과 근무 했을 시 부여&#10;(시간외수당) = (통상 시급) * 1.5 (초과 근무 시간)&#10;(통상시급) = (기본급) / 160(주 40시간 * 4주)">추가수당시간(hr)</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${dtosF}" varStatus="status">
					<tr>
						<td><input type="checkbox" class="checkbox1"></td>
						<td>${dto.empNumber}</td>
						<td>${dto.userName}</td>
						<td>${dto.majorName}</td>
						<td><input type="text" class="checkboxResult${status.index}"
							name="overtime"
							value="<fmt:formatNumber value="${dto.overtime}"/>"
							style="width: 80px; text-align: right"></td>
					</tr>
					<input hidden="true" type="text" name="empNumber"
						value="${dto.empNumber}">

				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- Footer -->
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	</div>
</body>
<script src="${staticPath}/build/js/custom2.js"></script>
<%-- <script src="${staticPath}/js/account/accountManage.js"
	type="text/javascript"></script> --%>
</html>