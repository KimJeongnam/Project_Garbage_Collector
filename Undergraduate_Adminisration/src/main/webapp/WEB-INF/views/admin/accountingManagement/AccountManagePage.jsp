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
							<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link"><i
										class="fa fa-chevron-up"></i></a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-expanded="false"><i
										class="fa fa-wrench"></i></a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#">Settings 1</a></li>
										<li><a href="#">Settings 2</a></li>
									</ul></li>
								<li><a class="close-link"><i class="fa fa-close"></i></a></li>
							</ul>
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
										<th>상여금</th>

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
													class="fa fa-edit m-right-xs"></i>근무기록확정</a></th>
											<td style="vertical-align: middle"><a onclick=""
												class="btn btn-success"
												data-target="#Lookup-workRecord" data-toggle="modal"><i
													class="glyphicon glyphicon-search"></i>조회</a> <a onclick=""
												class="btn btn-success" 
												data-target="#Specification-workRecord" data-toggle="modal">
												<i
													class="glyphicon glyphicon-list-alt"
													></i>명세서</a> <br> <a
												onclick="" class="btn btn-success"><i
													class="glyphicon glyphicon-ok"></i>확정</a> <a onclick=""
												class="btn btn-danger"><i
													class="glyphicon glyphicon-trash"></i>삭제</a></td>
											<td style="vertical-align: middle">${dto.totalPayment}</td>
										</tr>
									</c:forEach>
								</tbody>

							</table>
							<button>조회</button>
							<button>명세서 출력</button>
							<button>수정</button>
						</div>
					</div>
				</div>




			</div>
		</div>
	</div>
	<!-- /page content -->

	<div class="modal fade" id="Confirmation-workRecord">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">근무기록확정</h4>
				</div>
				<!-- body -->
				<div class="modal-body">

					<table class="table table-striped jambo_table bulk_action">
						<thead>
							<tr class="headings">
								<th><input type="checkbox"></th>
								<th>교직원번호</th>
								<th>교직원명</th>
								<th>부서/전공</th>
								<th>야근수당시간</th>
								<th>주말근무수당시간</th>
								<th>연차수당일수</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${dtosF}">
							<tr>
								<td><input type="checkbox"></td>
								<td>${dto.empNumber}</td>
								<td>${dto.accountHolder}</td>
								<td>${dto.majorName}</td>
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
	
	<div class="modal fade" id="Lookup-workRecord">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">날짜</h4>
				</div>
				<!-- body -->
				<div class="modal-body">

					<table class="table table-striped jambo_table bulk_action">
						<thead>
							<tr class="headings">
								<th><input type="checkbox">성명</th>
								<th>교번</th>
								<th>입사일</th>
								<th>연차</th>
								<th>기본급</th>
								<th>야근수당</th>
								<th>주말근무수당</th>
								<th>연차수당</th>
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
	<%@ include file="../../Basic/footer.jsp"%>
	<script src="${staticPath }/js/account/accountManagejs"
		type="text/javascript"></script>
	<script>
		$(function() {
		});
	</script>
</body>
</html>