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
							<table class="table table-striped jambo_table bulk_action">
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
											<td style="vertical-align: middle">${dto.imputedYear}</td>
											<td style="vertical-align: middle">${dto.paymentClassfication}</td>
											<td style="vertical-align: middle">${dto.registerName}</td>
											<td style="vertical-align: middle">${dto.paymentDate}</td>
											<td style="vertical-align: middle">${dto.paymentYear}</td>
											<th style="vertical-align: middle"><a
												class="btn btn-success"
												<%-- onclick="ConfirmationWorkRecord(${dto.imputedYear});" --%>
												data-target="#ConfirmationWorkRecord"
												data-toggle="modal"><i class="fa fa-edit m-right-xs"></i>근무기록확정</a><br>
												<a class="btn btn-success" data-target="#Insert-workRecord"
												data-toggle="modal"><i class="fa fa-edit m-right-xs"></i>금액직접입력</a></th>
											<td style="vertical-align: middle"><a
												<%-- onclick="lookupWorkRecord('${dto.imputedYear}')" --%>
												class="btn btn-success"
												data-target="#Lookup-workRecord" data-toggle="modal"><i
													class="glyphicon glyphicon-search"></i>조회</a> <a onclick=""
												class="btn btn-success"
												data-target="#Specification-workRecord" data-toggle="modal">
													<i class="glyphicon glyphicon-list-alt"></i>명세서
											</a> <br> <a onclick="Confirm();" class="btn btn-success"><i
													class="glyphicon glyphicon-ok"></i>확정</a> <a
												onclick="Delete();" class="btn btn-danger"><i
													class="glyphicon glyphicon-trash"></i>삭제</a></td>
											<td style="vertical-align: middle" id="total"></td>
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
									<td><input type="text"
										class="checkboxResult${status.index}" name="overtime"
										value="<fmt:formatNumber value="${dto.overtime}"/>"
										style="width: 80px; text-align: right"></td>
								</tr>
								<input type="hidden" name="empNumber" value="${dto.empNumber}">
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="saveOverTime()">저장</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>



	<div class="modal fade" id="Insert-workRecord">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 800px">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">금액직접입력</h4>
				</div>
				<!-- body -->
				<div class="modal-body">
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
					<table class="table table-striped jambo_table bulk_action">
						<thead>
							<tr class="headings">
								<th><input type="checkbox" id="allCheck2"></th>
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
								<input type="hidden" name="empNumber" value="${dto.empNumber}">
							</c:forEach>
						</tbody>
					</table>
				</div>



				<!-- Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="SaveEnterAmountManually()">저장</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="Lookup-workRecord">
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
												<c:set var="ActualPayment"
													value="${dto.basicPay + dto.extraPay + dto.foodExpenses + dto.vehicleCost}" />
												<td><fmt:formatNumber value="${ActualPayment}"
														pattern="#,###" />원</td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
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
			<form action="insertPayroll" method="post">
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
								<select name="imputedYear"
									class="form-control col-md-3 col-sm-3 col-xs-12">
									<option value="2018" selected="selected">2019</option>
									<option value="2017">2017</option>
									<option value="2016">2016</option>
									<option value="2015">2015</option>
									<option value="2014">2014</option>
									<option value="2013">2013</option>
									<option value="2012">2012</option>
									<option value="2011">2011</option>
									<option value="2010">2010</option>
								</select> <select name="imputedMonth"
									class="form-control col-md-3 col-sm-3 col-xs-12">
									<option value="-01" selected="selected">1월</option>
									<option value="-02">2월</option>
									<option value="-03">3월</option>
									<option value="-04">4월</option>
									<option value="-05">5월</option>
									<option value="-06">6월</option>
									<option value="-07">7월</option>
									<option value="-08">8월</option>
									<option value="-09">9월</option>
									<option value="-10">10월</option>
									<option value="-11">11월</option>
									<option value="-12">12월</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">급여구분
							</label>
							<div style="display: -webkit-inline-box;">
								<select name="paymentClassfication"
									class="form-control col-md-3 col-sm-3 col-xs-12">
									<option value="급여" selected="selected">급여</option>
									<option value="상여">상여</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">대상기간
							</label>
							<div class="input-prepend input-group">
								<span class="add-on input-group-addon"><i
									class="glyphicon glyphicon-calendar fa fa-calendar"></i></span> <input
									type="text" style="width: 200px" name="reservation"
									id="reservation" class="form-control"
									value="01/01/2016 - 01/25/2016" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">지급일
							</label>
							<div class="input-prepend input-group">
							<div class="col-md-12 xdisplay_inputx form-group has-feedback">
								<input type="text" class="form-control has-feedback-left"
									id="single_cal2" placeholder="First Name"
									aria-describedby="inputSuccess2Status2"> <span
									class="fa fa-calendar-o form-control-feedback left"
									aria-hidden="true"></span> <span id="inputSuccess2Status2"
									class="sr-only">(success)</span>
							</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">지급연월
							</label>
							<div style="display: -webkit-inline-box;">
								<select name="imputedYear"
									class="form-control col-md-3 col-sm-3 col-xs-12">
									<option value="2018" selected="selected">2019</option>
									<option value="2017">2017</option>
									<option value="2016">2016</option>
									<option value="2015">2015</option>
									<option value="2014">2014</option>
									<option value="2013">2013</option>
									<option value="2012">2012</option>
									<option value="2011">2011</option>
									<option value="2010">2010</option>
								</select> <select name="imputedMonth"
									class="form-control col-md-3 col-sm-3 col-xs-12">
									<option value="-01" selected="selected">1월</option>
									<option value="-02">2월</option>
									<option value="-03">3월</option>
									<option value="-04">4월</option>
									<option value="-05">5월</option>
									<option value="-06">6월</option>
									<option value="-07">7월</option>
									<option value="-08">8월</option>
									<option value="-09">9월</option>
									<option value="-10">10월</option>
									<option value="-11">11월</option>
									<option value="-12">12월</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">급여대장명칭
							</label>
							<div style="display: -webkit-inline-box;">
							<input type="text" name="registerName" class="form-control col-md-3 col-sm-3 col-xs-12">
							</div>
						</div>


						<table border="1">
							<tr>
								<td>신고귀속</td>
								<td><select name="imputedYear">
										<option value="2018" selected="selected">2019</option>
										<option value="2017">2017</option>
										<option value="2016">2016</option>
										<option value="2015">2015</option>
										<option value="2014">2014</option>
										<option value="2013">2013</option>
										<option value="2012">2012</option>
										<option value="2011">2011</option>
										<option value="2010">2010</option>
								</select> <select name="imputedMonth">
										<option value="-01" selected="selected">1월</option>
										<option value="-02">2월</option>
										<option value="-03">3월</option>
										<option value="-04">4월</option>
										<option value="-05">5월</option>
										<option value="-06">6월</option>
										<option value="-07">7월</option>
										<option value="-08">8월</option>
										<option value="-09">9월</option>
										<option value="-10">10월</option>
										<option value="-11">11월</option>
										<option value="-12">12월</option>
								</select></td>
							</tr>
							<tr>
								<td>급여구분</td>
								<td><select name="paymentClassfication">
										<option value="급여" selected="selected">급여</option>
										<option value="상여">상여</option>
								</select></td>
							</tr>
							<tr>
								<td>대상기간</td>
								<td><input type="date" name="beginningPeriod">~<input
									type="date" name="endPeriod"></td>
							</tr>
							<tr>
								<td>지급일</td>
								<td><input type="date" name="paymentDate"></td>
							</tr>
							<tr>
								<td>지급연월</td>
								<td><select name="paymentYear">
										<option value="2018" selected="selected">2019</option>
										<option value="2017">2017</option>
										<option value="2016">2016</option>
										<option value="2015">2015</option>
										<option value="2014">2014</option>
										<option value="2013">2013</option>
										<option value="2012">2012</option>
										<option value="2011">2011</option>
										<option value="2010">2010</option>
								</select> <select name="paymentMonth">
										<option value="-01" selected="selected">1월</option>
										<option value="-02">2월</option>
										<option value="-03">3월</option>
										<option value="-04">4월</option>
										<option value="-05">5월</option>
										<option value="-06">6월</option>
										<option value="-07">7월</option>
										<option value="-08">8월</option>
										<option value="-09">9월</option>
										<option value="-10">10월</option>
										<option value="-11">11월</option>
										<option value="-12">12월</option>
								</select></td>
							</tr>
							<tr>
								<td>급여대장명칭</td>
								<td><input type="text" name="registerName"></td>
							</tr>
						</table>

					</div>
					<!-- Footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">저장</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div class="modal fade" id="Copy-payroll">
		<div class="modal-dialog">
			<form action="insertPayroll" method="post">
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
						<table border="1">
							<tr>
								<td>기준월(From)</td>
								<td><i class="fa fa-arrow-right"></i></td>
								<td>복사월(To)</td>
							</tr>
							<tr>
								<td><select>
										<option value="0" selected="selected">▼선택</option>
										<c:forEach var="dto" items="${dtosC}">
											<option
												value="${dto.imputedYear}-${dto.paymentClassfication}">${dto.imputedYear}-${dto.paymentClassfication}</option>
										</c:forEach>
								</select></td>
								<td><i class="fa fa-arrow-right"></i></td>
								<td><select>
										<option value="0" selected="selected">▼선택</option>
										<c:forEach var="dto" items="${dtosC}">
											<option
												value="${dto.imputedYear}-${dto.paymentClassfication}">${dto.imputedYear}-${dto.paymentClassfication}</option>
										</c:forEach>
								</select></td>
							</tr>
						</table>

					</div>
					<!-- Footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">저장</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</form>
		</div>
	</div>


	<%@ include file="../../Basic/footer.jsp"%>
	<script src="${staticPath }/js/account/accountManagejs"></script>
	<script type="text/javascript">
		//전체선택 체크박스 클릭 
		$("#allCheck1").click(function() {
			// 만약 전체 선택 체크박스가 체크된상태일경우
			if ($("#allCheck1").prop("checked")) {
				// 해당화면에 전체 checkbox들을 체크해준다
				$(".checkbox1").prop("checked", true);
				// 전체선택 체크박스가 해제된 경우
			} else {
				// 해당화면에 모든 checkbox들의 체크를해제시킨다.
				$(".checkbox1").prop("checked", false);
			}
		})

		// 전체선택 체크박스 클릭
		$("#allCheck2").click(function() {
			// 만약 전체 선택 체크박스가 체크된상태일경우
			if ($("#allCheck2").prop("checked")) {
				// 해당화면에 전체 checkbox들을 체크해준다
				$(".checkbox2").prop("checked", true);
				// 전체선택 체크박스가 해제된 경우
			} else {
				// 해당화면에 모든 checkbox들의 체크를해제시킨다.
				$(".checkbox2").prop("checked", false);
			}
		})

		function fixSetting() {
			var worktime = $("#worktime").get(0).value;
			for (var i = 0; i < $(".checkbox1").size(); i++) {
				if ($(".checkbox1")[i].checked) {
					$(".checkboxResult" + i).val(worktime)
				}
			}
		}
		function fixSetting2() {
			var payamount = $("#payamount").get(0).value;
			for (var i = 0; i < $(".checkbox2").size(); i++) {
				if ($(".checkbox2")[i].checked) {
					if ($("#kindsofpay").val() == '기본급') {
						$(".basicPay" + i).val(payamount)
					}
					if ($("#kindsofpay").val() == '추가근무수당') {
						$(".extraPay" + i).val(payamount)
					}
					if ($("#kindsofpay").val() == '식대') {
						$(".foodExpenses" + i).val(payamount)
					}
					if ($("#kindsofpay").val() == '차량유지비') {
						$(".vehicleCost" + i).val(payamount)
					}
				}
			}
		}

		function saveOverTime() {
			var list = [];
			var list_size = 0;

			var listObj = [];

			var form = document.createElement("form");
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "POST");
			form.setAttribute("action", "../admin/ConfirmationWorkRecord");

			var cnt = 0;

			for (var i = 0; i < $('input[name=overtime]').size(); i++) {
				//var obj = new Object();
				//list[list_size++] = $('.table_records')[i].value;
				var field = document.createElement("input");
				field.setAttribute("type", "text");
				field.setAttribute("name", "overtime");
				field.setAttribute("value", $('input[name=overtime]')[i].value);
				form.appendChild(field);

				//obj.overtime = $('input[name=overtime]')[i].value;

				var field2 = document.createElement("input");
				field2.setAttribute("type", "hidden");
				field2.setAttribute("name", "empNumber");
				field2.setAttribute("value",
						$('input[name=empNumber]')[i].value);
				form.appendChild(field2);

				//obj.overpaycode = $('input[name=overpaycode]')[i].value;

				//listObj.push(obj);

			}

			document.body.appendChild(form);

			form.submit();
		}

		function SaveEnterAmountManually() {
			var form = document.createElement("form");
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "POST");
			form.setAttribute("action", "../admin/SaveEnterAmountManually");

			for (var i = 0; i < $('input[name=basicPay]').size(); i++) {
				var field = document.createElement("input");
				field.setAttribute("type", "text");
				field.setAttribute("name", "basicPay");
				field.setAttribute("value", $('input[name=basicPay]')[i].value);
				form.appendChild(field);
				var field2 = document.createElement("input");
				field2.setAttribute("type", "text");
				field2.setAttribute("name", "extraPay");
				field2
						.setAttribute("value",
								$('input[name=extraPay]')[i].value);
				form.appendChild(field2);
				var field3 = document.createElement("input");
				field3.setAttribute("type", "text");
				field3.setAttribute("name", "foodExpenses");
				field3.setAttribute("value",
						$('input[name=foodExpenses]')[i].value);
				form.appendChild(field3);
				var field4 = document.createElement("input");
				field4.setAttribute("type", "text");
				field4.setAttribute("name", "vehicleCost");
				field4.setAttribute("value",
						$('input[name=vehicleCost]')[i].value);
				form.appendChild(field4);
				var field5 = document.createElement("input");
				field5.setAttribute("type", "hidden");
				field5.setAttribute("name", "empNumber");
				field5.setAttribute("value",
						$('input[name=empNumber]')[i].value);
				form.appendChild(field5);

			}
			document.body.appendChild(form);
			form.submit();
		}
		function Confirm() {
			var texto1 = $(this).parent().children().eq(0).text();
			var texto2 = $(this).parent().children().eq(1).text();
			if (confirm(texto1 + texto2
					+ "를 확정처리하겠습니까?\n확정처리된 급여는 수정/삭제할 수 없습니다.")) {
			} else {
			}
		}
		function Delete() {
			var texto1 = $(this).parent().children().eq(0).text();
			var texto2 = $(this).parent().children().eq(1).text();
			if (confirm(texto1 + texto2 + "가 전체 삭제됩니다.\n삭제하겠습니까?")) {
			} else {
			}
		}

		function calcTotalTable() {
			var total = 0;
			$('.totalPayment').each(function() {
				// add some validation 
				total += $j(this).val();
			});

			$('#total').val(total);
		}
		//콤마찍기
		function comma(str) {
			str = String(str);
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}

		//콤마풀기
		function uncomma(str) {
			str = String(str);
			return str.replace(/[^\d]+/g, '');
		}

		//값 입력시 콤마찍기
		function AutoComma(obj) {
			obj.value = comma(uncomma(obj.value));
		}

		$(function() {

		});
	</script>
</body>
</html>