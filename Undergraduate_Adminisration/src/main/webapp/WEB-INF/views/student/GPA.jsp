<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../Basic/settings.jsp"%>
<title>자바대학교 학사관리시스템</title>
</head>
<body class="nav-md">
   <%@ include file="../Basic/navbar.jsp"%>

   <!-- page content -->
   <div class="right_col" role="main">
      <div class="">
         <div class="page-title">
            <div class="title_left">
               <h3>전체 성적정보</h3>
            </div>
         </div>
      </div>
      <div class="clearfix"></div>


		<div class="row">
			<!-- Smart Wizard -->
			<div class="x_content">
				<p>■ 전체학기 성적 목록</p>
				<table class="table table-striped jambo_table bulk_action" style="text-align : center;">
					<thead>
						<tr class="headings">
							<TH class="text-center">번호</TH>
							<th class="text-center">학년도</th>
							<th class="text-center">학기</th>
							<th class="text-center">강의번호</th>
							<th class="text-center">과목명</th>
							<th class="text-center">학년</th>
							<th class="text-center">이수구분</th>
							<th class="text-center">교과학점</th>
							<th class="text-center">취득점수</th>
							<th class="text-center">취득학점</th>
						</tr>
					</thead>
					<tbody>
							<c:forEach var="dto" items="${dtos}">
						 	<c:if test="${!empty dtos}"> 
								<tr>
									<td>${dto.rownum}</td>
									<td>${dto.year}</td>
									<td>${dto.semester}</td>
									<td>${dto.lecCode}</td>
									<td>${dto.lectureName}</td>
									<td>${dto.grade}</td>
									<td><c:if test="${dto.lectureClassfication == 1}">
											전공
										</c:if> <c:if test="${dto.lectureClassfication == 2}">
											교양
										</c:if></td>
									<td>${dto.lectureScore}</td>
									<td>${dto.jscore}</td>
									<td>${dto.credit}</td>
								</tr>
							</c:if>
							</c:forEach>
							<c:if test="${empty dtos}">
								<th colspan="10" style="text-align :  center;">조회 할 성적이 없습니다.</th>
							</c:if>
					</tbody>
				</table>
				<table class="table table-striped jambo_table bulk_action"
					style="text-align: center; width: 300px; float: right">
					<thead>
						<tr class="headings">
							<th class="text-center">신청학점</th>
							<th class="text-center">취득학점</th>
							<th class="text-center">총점수</th>
							<th class="text-center">평균학점</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${applyCredit}</td>
							<c:forEach var="granted" items="${granted}">
							 <c:if test="${granted.totalJscore ne null}"> 
							<td>${granted.grantedCredit}</td>
							<td>${granted.totalJscore}</td>
							<td>
								<c:if test="${granted.totalJscore / granted.grantedCnt <100 &&
											granted.totalJscore / granted.grantedCnt >=95}">A+</c:if>
								<c:if test="${granted.totalJscore / granted.grantedCnt <95 &&
											granted.totalJscore / granted.grantedCnt >=90}">A</c:if>
								<c:if test="${granted.totalJscore / granted.grantedCnt <90 &&
											granted.totalJscore / granted.grantedCnt >=85}">B+</c:if>
								<c:if test="${granted.totalJscore / granted.grantedCnt <85 &&
											granted.totalJscore / granted.grantedCnt >80}">B</c:if>
								<c:if test="${granted.totalJscore / granted.grantedCnt <80 &&
											granted.totalJscore / granted.grantedCnt >=75}">C+</c:if>
								<c:if test="${granted.totalJscore / granted.grantedCnt <75 &&
											granted.totalJscore / granted.grantedCnt >=70}">C</c:if>
								<c:if test="${granted.totalJscore / granted.grantedCnt <70 &&
											granted.totalJscore / granted.grantedCnt >=65}">D+</c:if>
								<c:if test="${granted.totalJscore / granted.grantedCnt <65 &&
											granted.totalJscore / granted.grantedCnt >=60}">D</c:if>
								<c:if test="${granted.totalJscore / granted.grantedCnt <60}">F</c:if>			
							</td>
							</c:if>
							</c:forEach>
							 <c:if test="${empty granted}"> 
							<th colspan="3" style="text-align : center;">조회 할 성적이 없습니다.</th>
							</c:if>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- /page content -->

   <%@ include file="../Basic/footer.jsp"%>

   <script type="text/javascript">
      $(function() {

      });
   </script>
</body>
</html>