<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="Basic/settings.jsp"%>
<title>Insert title here</title>
</head>
<body class="nav-md">
	<%@ include file="Basic/stdNavbar.jsp"%>

	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>성적 조회</h3>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>

		<div class="row">
			<!-- Smart Wizard -->
			<p>성적 조회 메뉴입니다.</p>
			<div class="x_content">
				<p class="text-muted font-13 m-b-30">2019년 1학기의 성적을 조회합니다.</p>
				<div class="title_right">
					<div
						class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="학기검색 ex)1901"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">검색</button>
							</span>
						</div>
					</div>
				</div>


				<table class="table table-striped jambo_table bulk_action">
					<thead>
						<tr class="headings">
							<th>강의 구분</th>
							<th>강의번호</th>
							<th>강의명</th>
							<th>수강학기</th>
							<th>교수명</th>
							<th>학점</th>
							<th>취득점수</th>
							<th>성적</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>교양필수</td>
							<td>c304</td>
							<td>정치학개론</td>
							<td>2019년 1학기</td>
							<td>정치호</td>
							<td>3</td>
							<td>100</td>
							<td>A+</td>
						</tr>
							<tr>
							<td>교양필수</td>
							<td>c304</td>
							<td>정치학개론</td>
							<td>2019년 1학기</td>
							<td>정치호</td>
							<td>3</td>
							<td>100</td>
							<td>A+</td>
						</tr>
							<tr>
							<td>교양필수</td>
							<td>c304</td>
							<td>정치학개론</td>
							<td>2019년 1학기</td>
							<td>정치호</td>
							<td>3</td>
							<td>100</td>
							<td>A+</td>
						</tr>
							<tr>
							<td>교양필수</td>
							<td>c304</td>
							<td>정치학개론</td>
							<td>2019년 1학기</td>
							<td>정치호</td>
							<td>3</td>
							<td>100</td>
							<td>A+</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- /page content -->

	<%@ include file="Basic/footer.jsp"%>

	<script type="text/javascript">
		$(function (){
			
		});
	</script>
</body>
</html>