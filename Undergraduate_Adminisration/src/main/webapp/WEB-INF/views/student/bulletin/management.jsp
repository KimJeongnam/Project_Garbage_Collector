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
			<div class="">
				<div class="title_left">
					<h2>장학금 수혜 내역</h2>

				</div>
			</div>

			<div class="clearfix"></div>
			<div class="x_panel" style="margin-top: 15px;">
				<div class="row">
					<div class="x_content">
						<div class="table-responsive">
							<table class="table table-striped jambo_table bulk_action">
								<thead>
									<a href="#">
										<tr class="headings">
											<th class="column-title">학년도</th>
											<th class="column-title">학기</th>
											<th class="column-title">장학금 명</th>
											<th class="column-title">장학금 확정 금액</th>
											<th class="column-title">지급 일자</th>
										</tr>
									</a>
								</thead>

								<tbody>
									<c:if test="${cnt > 0}">
										<c:forEach var="dto" items="${dtos}">
											<tr class="even pointer">
												<td class=" ">${dto.s_year}</td>
												<td class=" ">${dto.semester}</td>
												<td class=" ">${dto.scholarname}</td>
												<td class=" ">${dto.amount}원</td>
												<td class=" ">${dto.year}</td>
											</tr>
										</c:forEach>
									</c:if>

									<c:if test="${cnt == 0}">
										<tr class="even pointer">
											<td class=" " colspan="5" style="text-align: center;">장학금
												수혜 내역이 없습니다.</td>
										</tr>
									</c:if>
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