<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<input type="hidden" id="lecturePageNum" value="${pageNum}">
<table class="table table-striped jambo_table bulk_action">
	<thead>
		<tr class="headings">
			<th class="text-center">구분</th>
			<th class="text-center">학과</th>
			<th class="text-center">강의명</th>
			<th class="text-center">학년</th>
			<th class="text-center">학기</th>
			<th class="text-center">학점</th>
			<th class="text-center">담당 교수</th>
			<th class="text-center">인원수</th>
			<th class="text-center">시간표</th>
			<th class="text-center">강의 상태</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dto" items="${dtos }">
		<tr>
			<td class="text-center" style="vertical-align: middle;">
				<c:choose>
					<c:when test='${dto.lectureClassfication == "1"}'>
					전공
					</c:when>
					<c:otherwise>
					교양
					</c:otherwise>
				</c:choose>
			</td>
			<td class="text-center" style="vertical-align: middle;">${dto.majorName }</td>
			<td class="text-center" style="vertical-align: middle;">${dto.lectureName }</td>
			<td class="text-center" style="vertical-align: middle;">${dto.grade }</td>
			<td class="text-center" style="vertical-align: middle;">${dto.grantedSemester }</td>
			<td class="text-center" style="vertical-align: middle;">${dto.lectureScore }</td>
			<td class="text-center" style="vertical-align: middle;">${dto.userName }</td>
			<td class="text-center" style="vertical-align: middle;">${dto.maximumCapacity }</td>
			<td class="text-center" style="vertical-align: middle;">
				<input class="btn btn-info" type="button" value="보기">
			</td>
			<td class="text-center" style="vertical-align: middle;">
				<c:choose>
					<c:when test="${dto.lectureScore == 0 }">
						수강신청 기간
					</c:when>
					<c:when test="${dto.lectureScore == 1 }">
						개강
					</c:when>
					<c:when test="${dto.lectureScore == 2 }">
						학점 입력 기간
					</c:when>
					<c:when test="${dto.lectureScore == 3 }">
						종강
					</c:when>
				</c:choose>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>



<div class="row">
	<div class="col-sm-6">
		<div class="dataTables_info" id="datatable_info" role="status"
			aria-live="polite">Showing 
			<c:choose>
				<c:when test="${number < pageSize }">
					1
				</c:when>
				<c:otherwise>
					${number-pageSize+1}
				</c:otherwise>
			</c:choose>
			to ${number} of ${cnt} entries</div>
	</div>

	<div class="col-sm-6">
		<div class="text-right">
			<ul class="pagination">
				<c:if test="${cnt > 0 }">
					<c:if test="${startPage > pageBlock }">				
						<li class="paginate_button previous disabled"  style="cursor:pointer;"
							onclick="getLectureList();"
							id="datatable_previous"><a aria-controls="datatable"
							data-dt-idx="0" tabindex="0">Frist</a></li>
						<li class="paginate_button previous disabled"  style="cursor:pointer;"
							onclick="getLectureList(${startPage - pageBlock});"
							id="datatable_previous"><a aria-controls="datatable"
							data-dt-idx="0" tabindex="0">Previous</a></li>
					</c:if>
					<c:forEach var="page" begin="${startPage }" end="${endPage }">
						<c:choose>
							<c:when test="${pageNum == page }">
								<li class="paginate_button active"><a href="#"
									aria-controls="datatable" tabindex="0">${page }</a></li>
							</c:when>
							<c:otherwise>
								<li class="paginate_button" style="cursor:pointer;"
									onclick="getLectureList(${page });">
									<a aria-controls="datatable" tabindex="0">${page }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:if test="${pageCount > endPage }">
						<li class="paginate_button next" id="datatable_next" style="cursor:pointer;"
							onclick="getLectureList(${startPage + pageBlock });">
							<a aria-controls="datatable" tabindex="0">Next</a></li>
						<li class="paginate_button next" id="datatable_next" style="cursor:pointer;"
							onclick="getLectureList(${pageCount });">
							<a aria-controls="datatable" tabindex="0">Last</a></li>
					</c:if>
				</c:if>
			</ul>
		</div>
	</div>
</div>