<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="staticPath" value="/project/resources" />
<html>
<body>
	<form id="overtimeForm">
	<div class="modal-body">
		<div class="row form-inline"
			style="margin: 0px; vertical-align: middle">
			<div style="float: right">
				<input type="text" id="worktime"
					style="text-align: right; height: 30px; margin-right: 4px">
				<button class="btn btn-primary" onclick="fixSetting();">확정</button>
			</div>
		</div>
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
		<button type="button" class="btn btn-primary"
			onclick="saveOverTime();">저장</button>
		<button type="reset" class="btn btn-warning" onclick="resetOverTime();">취소</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	</div>
	</form>
</body>
<script src="${staticPath}/build/js/custom2.js"></script>
<script src="${staticPath}/js/account/accountManage.js"
	type="text/javascript"></script>
</html>