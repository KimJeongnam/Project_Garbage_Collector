<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../../Basic/settings.jsp"%>
<title>급여</title>
</head>
<body class="nav-md">
	<%@ include file="../../Basic/navbar.jsp"%>

	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>교직원 급여관리</h3>
				</div>
			</div>

			<div class="clearfix"></div>

			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>
								급여계산/대장<small></small>
							</h2>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<p class="text-muted font-13 m-b-30">교직원의 급여를 확인, 수정하는 페이지</p>
							<table id="PayrollListTable"
								class="table table-striped jambo_table bulk_action">
								<thead>
									<tr class="headings">
										<th>신고귀속</th>
										<th>구분</th>
										<th>대장 명칭</th>
										<th>지급일</th>
										<th>지급연월</th>
										<th>사전작업</th>
										<th>급여대장</th>
										<th>지급총액</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="dto" items="${dtos}">
										<tr>
											<td style="vertical-align: middle" id="confirmYear">${dto.imputedYear}</td>
											<td style="vertical-align: middle"
												id="confirmPaymentClassfication">${dto.paymentClassfication}</td>
											<td style="vertical-align: middle">${dto.registerName}</td>
											<td style="vertical-align: middle">${dto.paymentDate}</td>
											<td style="vertical-align: middle">${dto.paymentYear}</td>
											<th style="vertical-align: middle"><input hidden="true"
												type="text" name="PayrollStatus" value="${dto.status}">
												<c:if test="${dto.status == 1}">
													<a class="btn btn-primary"
														onclick="openAccountModal('근무기록확정','${dto.imputedYear}','${dto.status}');"
														data-target="#ConfirmationWorkRecord"
														data-toggle="modal"><i class="fa fa-edit m-right-xs"></i>근무기록보기</a>
												</c:if> <c:if test="${dto.status != 1}">
													<a class="btn btn-success"
														onclick="openAccountModal('근무기록확정','${dto.imputedYear}');"
														data-target="#ConfirmationWorkRecord" data-toggle="modal"><i
														class="fa fa-edit m-right-xs"></i>근무기록확정</a>
													<a
														onclick="openAccountModal('금액직접입력','${dto.imputedYear}');"
														class="btn btn-success" data-target="#EnterAmountManually"
														data-toggle="modal"><i class="fa fa-edit m-right-xs"></i>금액직접입력</a>
												</c:if></th>
											<td style="vertical-align: middle"><a
												onclick="openAccountModal('조회','${dto.imputedYear}');"
												class="btn btn-success" data-target="#LookupWorkRecord"
												data-toggle="modal"><i
													class="glyphicon glyphicon-search"></i>조회</a> <!-- <a onclick=""
												class="btn btn-success"
												data-target="#Specification-workRecord" data-toggle="modal">
													<i class="glyphicon glyphicon-list-alt"></i>명세서
											</a> --> <c:if test="${dto.status == 1}">
													<a class="btn btn-primary"><i
														class="fa fa-check-square-o">확정됨</i></a>
												</c:if> <c:if test="${dto.status != 1}">
													<a
														onclick="Confirm('${dto.imputedYear}','${dto.paymentClassfication}');"
														class="btn btn-success"><i
														class="glyphicon glyphicon-ok"></i>확정</a>
													<a
														onclick="Delete('${dto.imputedYear}','${dto.paymentClassfication}');"
														class="btn btn-danger"><i
														class="glyphicon glyphicon-trash"></i>삭제</a>
												</c:if></td>
											<td style="vertical-align: middle" id="total"><input
												type="text" style="text-align: right; width: 100px"
												value="<fmt:formatNumber value="${dto.totalAmount}" pattern="#,###" />"
												readonly>원</td>
										</tr>
									</c:forEach>
								</tbody>

							</table>
							<button type="button" class="btn btn-primary"
								data-target="#Insert-payroll" data-toggle="modal">신규</button>
							<button type="button" class="btn btn-default"
								data-target="#Copy-payroll" data-toggle="modal">복사</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /page content -->
	<div class="modal fade" id="ConfirmationWorkRecord">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 880px">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">근무기록확정</h4>
				</div>
				<!-- body -->
				<div id="ConfirmOvertime"></div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="EnterAmountManually">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 880px">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">금액직접입력</h4>
					<div class="row form-inline"
						style="margin: 0px; vertical-align: middle">
						<div style="float: right">
							<select class="form-control input-sm" id="kindsofpay"
								style="width: 150px; height: 30px; margin-bottom: 3px">
								<option value="기본급" selected="selected">기본급</option>
								<option value="추가근무수당">추가근무수당</option>
								<option value="식대">식대</option>
								<option value="차량유지비">차량유지비</option>
							</select> <input type="text" id="payamount"
								style="text-align: right; height: 30px; margin-right: 4px"
								onkeyup="AutoComma(this);">
							<button class="btn btn-primary" onclick="fixSetting2();">확정</button>
						</div>
					</div>
					<br> <br>
				</div>
				<!-- body -->
				<div id="EnterAmountManuallyList"></div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="LookupWorkRecord">
		<div class="modal-dialog" style="width: 1300px">
			<div class="modal-content">
				<!-- header -->
				<!-- 
						<button class="btn btn-primary"
							onclick="window.print('$(#Lookup-workRecord-print)')">인쇄</button>
						<button class="btn btn-default">Excel</button>
						<button class="btn btn-default">미리보기</button>
						<button class="btn btn-default">명쇄서인쇄</button>
					
				 -->
				<!-- body -->
				<div class="modal-body">
					<div id="LookupWorkRecordList"></div>
				</div>
				<!-- Footer -->
				<div class="modal-footer">
					Footer
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>




	<div class="modal fade" id="Specification-workRecord">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">명세서인쇄</h4>
				</div>
				<!-- body -->
				<div class="modal-body">
					<table class="table table-striped jambo_table bulk_action">
						<thead>
							<tr class="headings">
								<th><input type="checkbox"></th>
								<th>신고귀속</th>
								<th>구분</th>
								<th>교직원번호</th>
								<th>교직원명</th>
								<th>전공명</th>
								<th>지급총액</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="">
								<tr>
									<td><input type="checkbox"></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- Footer -->
				<div class="modal-footer">
					Footer
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="Insert-payroll">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 730px">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">급여정보입력</h4>
				</div>
				<!-- body -->
				<div class="modal-body">
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">신고귀속
						</label>
						<div style="display: -webkit-inline-box;">
							<select id="imputedYear" onchange="autoComplete();"
								class="form-control col-md-3 col-sm-3 col-xs-12">
								<option value="2019" selected="selected">2019</option>
								<option value="2018">2018</option>
								<option value="2017">2017</option>
								<option value="2016">2016</option>
								<option value="2015">2015</option>
								<option value="2014">2014</option>
								<option value="2013">2013</option>
								<option value="2012">2012</option>
								<option value="2011">2011</option>
								<option value="2010">2010</option>
							</select> <select id="imputedMonth" onchange="autoComplete();"
								class="form-control col-md-3 col-sm-3 col-xs-12">
								<option value="01">1월</option>
								<option value="02">2월</option>
								<option value="03" selected="selected">3월</option>
								<option value="04">4월</option>
								<option value="05">5월</option>
								<option value="06">6월</option>
								<option value="07">7월</option>
								<option value="08">8월</option>
								<option value="09">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">급여구분
						</label>
						<div style="display: -webkit-inline-box;">
							<select id="paymentClassfication"
								class="form-control col-md-3 col-sm-3 col-xs-12">
								<option value="급여" selected="selected">급여</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">대상기간
						</label>
						<div style="display: -webkit-inline-box;">
							<input type="date" id="beginningPeriod" required>~<input
								type="date" id="endPeriod" required>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">지급일
						</label>
						<div style="display: -webkit-inline-box;">
							<input type="date" id="paymentDate" required>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">지급연월
						</label>
						<div style="display: -webkit-inline-box;">
							<select id="paymentYear"
								class="form-control col-md-3 col-sm-3 col-xs-12">
								<option value="2019" selected="selected">2019</option>
								<option value="2018">2018</option>
								<option value="2017">2017</option>
								<option value="2016">2016</option>
								<option value="2015">2015</option>
								<option value="2014">2014</option>
								<option value="2013">2013</option>
								<option value="2012">2012</option>
								<option value="2011">2011</option>
								<option value="2010">2010</option>
							</select> <select id="paymentMonth"
								class="form-control col-md-3 col-sm-3 col-xs-12">
								<option value="01" selected="selected">1월</option>
								<option value="02">2월</option>
								<option value="03">3월</option>
								<option value="04">4월</option>
								<option value="05">5월</option>
								<option value="06">6월</option>
								<option value="07">7월</option>
								<option value="08">8월</option>
								<option value="09">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">급여대장명칭
						</label>
						<div style="display: -webkit-inline-box;">
							<input type="text" id="registerName"
								class="form-control col-md-3 col-sm-3 col-xs-12" required>
						</div>
					</div>
				</div>
				<!-- Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="InsertPayroll();">저장</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="Copy-payroll">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 730px">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">급여복사</h4>
				</div>
				<!-- body -->
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<td>기준월(From)</td>
								<td><i class="fa fa-arrow-right"></i></td>
								<td>복사월(To)</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><select id="copyPayrollFrom"
									class="form-control col-md-3 col-sm-3 col-xs-12">
										<option value="0" selected="selected">▼선택</option>
										<c:forEach var="dto" items="${dtosC}">
											<option value="${dto.paylistNum}">${dto.imputedYear}-${dto.paymentClassfication}</option>
										</c:forEach>
								</select></td>
								<td><i class="fa fa-arrow-right"></i></td>
								<td><select id="copyPayrollTo"
									class="form-control col-md-3 col-sm-3 col-xs-12">
										<option value="0" selected="selected">▼선택</option>
										<c:forEach var="dto" items="${dtosC}">
											<option value="${dto.paylistNum}">${dto.imputedYear}-${dto.paymentClassfication}</option>
										</c:forEach>
								</select></td>
							</tr>
						</tbody>
					</table>

				</div>
				<!-- Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="CopyPayroll();">복사</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="../../Basic/footer.jsp"%>
	<script src="${staticPath }/js/account/accountManage.js"
		type="text/javascript">
		$(function() {
		});
	</script>
</body>
</html>