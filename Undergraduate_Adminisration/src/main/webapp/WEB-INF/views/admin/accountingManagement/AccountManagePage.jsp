<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
												onclick="openAccountModal('근무기록확정', '${dto.imputedYear}','${dto.paymentClassfication}','${dto.registerName}','${dto.paymentDate}','${dto.paymentYear}');"
												class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>근무기록확정</a></th>
											<td style="vertical-align: middle"><a onclick=""
												class="btn btn-success"><i
													class="glyphicon glyphicon-search"></i>조회</a> <a onclick=""
												class="btn btn-success"><i
													class="glyphicon glyphicon-list-alt"></i>명세서</a> <br> <a
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

	<%@ include file="../../Basic/footer.jsp"%>
	<script src="${staticPath }/js/account/accountManagejs"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(function (){
			
		});
	</script>
</body>
</html>