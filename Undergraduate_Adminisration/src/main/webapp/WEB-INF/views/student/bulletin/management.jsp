<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../Basic/settings.jsp"%>
<title>자바대학교 학사관리시스템</title>
</head>
<body class="nav-md">
	<!-- page content -->
	<div role="main">
		<div class="col-md-12">

			<div class="clearfix"></div>
			<div class="x_panel" style="margin-top: 15px;">
				<div class="row">
					<div class="x_content">
						<div class="table-responsive">
							<table class="table table-striped jambo_table bulk_action">
								<thead>
									<a href="#">
										<tr class="headings">
											<th class="column-title text-center">장학금 명</th>
											<th class="column-title text-center">장학금 확정 금액</th>
											<th class="column-title text-center">신청일</th>
											<th class="column-title text-center">지급 일자</th>
											<th class="column-title text-center">상태</th>
										</tr>
									</a>
								</thead>

								<tbody>
								<c:choose>
									<c:when test="${dtos.size() > 0}">
										<c:forEach var="dto" items="${dtos}">
											<tr class="even pointer">
												<td class="text-center">${dto.scholarname}</td>
												<td class="text-center">${dto.amount}원</td>
												<td class="text-center">${dto.applyDay}</td>
												<td class="text-center">${dto.paymentDay}</td>
												<td class="text-center">${dto.strStat}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr class="even pointer">
											<td class=" " colspan="5" style="text-align: center;">장학금
												수혜 내역이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
						</div>


					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- /page content -->

	<script type="text/javascript">
	<%@ include file="../../Basic/datePickerJS.jsp"%>
	</script>
</body>
</html>