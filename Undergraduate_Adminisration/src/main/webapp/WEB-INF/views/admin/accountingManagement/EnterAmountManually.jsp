<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="staticPath" value="/project/resources" />
<html>
<body>
	<div class="modal-body">
		<table id="datatable-fixed-header"
			class="table table-striped jambo_table bulk_action">
			<thead>
				<tr class="headings">
					<th><input type="checkbox" id="allCheck2" onclick="allCheck2_event();"></th>
					<th>교직원번호</th>
					<th>교직원명</th>
					<th>부서/전공</th>
					<th>기본급</th>
					<th
						title="추가근무수당 : 주 40시간 초과 근무 했을 시 부여&#10;(시간외수당) = (통상 시급) * 1.5 (초과 근무 시간)&#10;(통상시급) = (기본급) / 160(주 40시간 * 4주)">추가근무수당</th>
					<th>식대</th>
					<th>차량유지비</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${dtosF}" varStatus="status">
					<tr>
						<td><input type="checkbox" class="checkbox2"></td>
						<td>${dto.empNumber}</td>
						<td>${dto.userName}</td>
						<td>${dto.majorName}</td>
						<td><input type="text" class="basicPay${status.index}"
							name="basicPay" onkeyup="AutoComma(this);"
							style="width: 80px; text-align: right"
							value="<fmt:formatNumber value="${dto.basicPay}"  />">원</td>
						<td><input type="text" class="extraPay${status.index}"
							name="extraPay" onkeyup="AutoComma(this);"
							style="width: 80px; text-align: right"
							value="<fmt:formatNumber value="${dto.extraPay}" />">원</td>
						<td><input type="text" class="foodExpenses${status.index}"
							name="foodExpenses" onkeyup="AutoComma(this);"
							style="width: 80px; text-align: right"
							value="<fmt:formatNumber value="${dto.foodExpenses}" />">원</td>
						<td><input type="text" class="vehicleCost${status.index}"
							name="vehicleCost" onkeyup="AutoComma(this);"
							style="width: 80px; text-align: right"
							value="<fmt:formatNumber value="${dto.vehicleCost}" />">원</td>
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
			onclick="SaveEnterAmountManually()">저장</button>
		<button type="reset" class="btn btn-warning" onclick="ResetSaveEnterAmountManually();">취소</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	</div>
</body>
<!--  Custome Theme Scripts -->
<script src="${staticPath}/build/js/custom2.js"></script>
</html>