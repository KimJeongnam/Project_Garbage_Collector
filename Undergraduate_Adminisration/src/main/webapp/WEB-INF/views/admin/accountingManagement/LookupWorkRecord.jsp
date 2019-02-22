<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="staticPath" value="/project/resources" />
<html>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					Button Example <small>Users</small>
				</h2>
				<ul class="nav navbar-right panel_toolbox">
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<table id="datatable-buttons"
					class="table table-striped table-bordered" style="width: 100%">
					<thead>
						<tr>
							<th>교번</th>
							<th>성명</th>
							<th>전공/부서</th>
							<th>기본급</th>
							<th>추가근무수당</th>
							<th>식대</th>
							<th>차량유지비</th>
							<th>실지급액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${dtosF}">
							<tr>
								<td>${dto.empNumber}</td>
								<td>${dto.userName}</td>
								<td>${dto.majorName}</td>
								<td><fmt:formatNumber value="${dto.basicPay}"
										pattern="#,###" />원</td>
								<td><fmt:formatNumber value="${dto.extraPay}"
										pattern="#,###" />원</td>
								<td><fmt:formatNumber value="${dto.foodExpenses}"
										pattern="#,###" />원</td>
								<td><fmt:formatNumber value="${dto.vehicleCost}"
										pattern="#,###" />원</td>
								<td><fmt:formatNumber value="${dto.personnelTotalPay}"
										pattern="#,###" />원</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<!--  Custome Theme Scripts -->
<script src="${staticPath}/build/js/custom2.js"></script>
<script src="${staticPath }/js/account/accountManage.js"></script>
</html>