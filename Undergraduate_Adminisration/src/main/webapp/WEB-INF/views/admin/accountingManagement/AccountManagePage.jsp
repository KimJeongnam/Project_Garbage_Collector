<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../../Basic/settings.jsp"%>
<title>Insert title here</title>
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
												data-target="#Confirmation-workRecord" data-toggle="modal"><i
													class="fa fa-edit m-right-xs"></i>근무기록확정</a><br> <a
												class="btn btn-success" data-target="#Insert-workRecord"
												data-toggle="modal"><i class="fa fa-edit m-right-xs"></i>금액직접입력</a></th>
											<td style="vertical-align: middle"><a
												onclick="lookupWorkRecord('${dto.imputedYear}')"
												class="btn btn-success" data-target="#Lookup-workRecord"
												data-toggle="modal"><i
													class="glyphicon glyphicon-search"></i>조회</a> <a onclick=""
												class="btn btn-success"
												data-target="#Specification-workRecord" data-toggle="modal">
													<i class="glyphicon glyphicon-list-alt"></i>명세서
											</a> <br> <a onclick="" class="btn btn-success"><i
													class="glyphicon glyphicon-ok"></i>확정</a> <a onclick=""
												class="btn btn-danger"><i
													class="glyphicon glyphicon-trash"></i>삭제</a></td>
											<td style="vertical-align: middle">${dto.totalAmount}</td>
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

	<div class="modal fade" id="Confirmation-workRecord">
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
						<%-- <div class="col-sm-2">
							<select class="form-control input-sm"
								id="faculty-major-confirmation"
								onchange="facultyMajorConfirmation();">
								<option value="0" selected="selected">부서/전공 조회</option>
								<c:if test="${!empty dtosM}">
									<c:forEach var="dto" items="${dtosM}" varStatus="i">
										<option value="${dto.majorName}">${dto.majorName}</option>
									</c:forEach>
								</c:if>
							</select>
						</div> --%>

						<div style="float: right">
							<input type="text" style="height: 30px; margin-right: 4px">
							<button class="btn btn-primary">확정</button>
						</div>
					</div>

					<table class="table table-striped jambo_table bulk_action">
						<thead>
							<tr class="headings">
								<th><input type="checkbox" id="checkAll"
									onclick="checkAll();"></th>
								<th>교직원번호</th>
								<th>교직원명</th>
								<th>부서/전공</th>
								<th>추가수당시간</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${dtosF}">
								<tr>
									<td><input type="checkbox" class="checkbox"></td>
									<td>${dto.empNumber}</td>
									<td>${dto.accountHolder}</td>
									<td>${dto.majorName}</td>
									<td><input type="text" value="0.00"
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
	</div>



	<div class="modal fade" id="Insert-workRecord">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 730px">
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
						<%-- <div class="col-sm-2">
							<select class="form-control input-sm" id="faculty-major-insert"
								onchange="accountFacultyList();">
								<option value="0" selected="selected">부서/전공 조회</option>
								<c:if test="${!empty dtosM}">
									<c:forEach var="dto" items="${dtosM}" varStatus="i">
										<option value="${dto.majorName}">${dto.majorName}</option>
									</c:forEach>
								</c:if>
							</select>
						</div> --%>

						<div style="float: right">
							<select class="form-control input-sm" id="lectureList-grade"
								onchange=""
								style="width: 150px; height: 30px; margin-bottom: 3px">
								<option value="야근수당시간" selected="selected">야근수당시간</option>
								<option value="주말근무수당시간">주말근무수당시간</option>
								<option value="연차수당일수">연차수당일수</option>
							</select> <input type="text" style="height: 30px; margin-right: 4px">
							<button class="btn btn-primary">확정</button>
						</div>
					</div>
					<table class="table table-striped jambo_table bulk_action">
						<thead>
							<tr class="headings">
								<th><input type="checkbox" id="checkAll"
									onclick="checkAll();"></th>
								<th>교직원번호</th>
								<th>교직원명</th>
								<th>부서/전공</th>
								<th>기본급</th>
								<th>추가근무수당</th>
								<th>식대</th>
								<th>차량유지비</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${dtosF}">
								<tr>
									<td><input type="checkbox" class="checkbox"></td>
									<td>${dto.empNumber}</td>
									<td>${dto.accountHolder}</td>
									<td>${dto.majorName}</td>
									<td><input type="text"
										style="width: 80px; text-align: right"></td>
									<td><input type="text"
										style="width: 80px; text-align: right"></td>
									<td><input type="text"
										style="width: 80px; text-align: right"></td>
									<td><input type="text"
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
	</div>

	<div class="modal fade" id="Lookup-workRecord">
		<div class="modal-dialog" style="width: 1300px">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<div class="row form-inline"
						style="margin: 0px; vertical-align: middle">
						<button class="btn btn-primary"
							onclick="window.print('$(#Lookup-workRecord-print)')">인쇄</button>
						<button class="btn btn-default">Excel</button>
						<button class="btn btn-default">미리보기</button>
						<button class="btn btn-default">명쇄서인쇄</button>
					</div>
				</div>
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
											<th>Name</th>
											<th>Position</th>
											<th>Office</th>
											<th>Age</th>
											<th>Start date</th>
											<th>Salary</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Tiger Nixon</td>
											<td>System Architect</td>
											<td>Edinburgh</td>
											<td>61</td>
											<td>2011/04/25</td>
											<td>$320,800</td>
										</tr>
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
	<script src="${staticPath }/js/account/accountManagejs"
		type="text/javascript"></script>
	<script>
		function checkAll() {
			$('.checkbox').prop('checked', true).change()
		}

		$(function() {

		});
	</script>
</body>
</html>