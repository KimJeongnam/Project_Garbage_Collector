<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
</head>
<body>
	<div class="modal-dialog">
		<div class="modal-content" style="width: 730px">
			<!-- header -->
			<div class="modal-header">
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">×</button>
				<!-- header title -->
				<h4 class="modal-title">근무기록확정</h4>
			</div>
			<!-- body -->
			<div class="modal-body">
				<div class="row form-inline"
					style="margin: 0px; vertical-align: middle">
					<div style="float: right">
						<input type="text" id="worktime"
							style="text-align: right; height: 30px; margin-right: 4px">
						<button class="btn btn-primary" onclick="fixSetting();">확정</button>
					</div>
				</div>

				<table class="table table-striped jambo_table bulk_action">
					<thead>
						<tr class="headings">
							<th><input type="checkbox" id="allCheck1"></th>
							<th>교직원번호</th>
							<th>교직원명</th>
							<th>부서/전공</th>
							<th>추가수당시간(hr)</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${dtosF}" varStatus="status">
							<tr>
								<td><input type="checkbox" class="checkbox1"></td>
								<td>${dto.empNumber}</td>
								<td>${dto.accountHolder}</td>
								<td>${dto.majorName}</td>
								<td><input type="text"
									class="checkboxResult${status.index}" pattern="#.##"
									value="<fmt:formatNumber value="${dto.overtime}" pattern="#.##" />"
									style="width: 80px; text-align: right"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">저장</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>

</body>
</html>