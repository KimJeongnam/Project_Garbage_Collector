<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<input type="hidden" id="majorPageNum" value="${pageNum}">

<div class="row">
	<table class="table table-striped jambo_table bulk_action">
		<thead>
			<tr class="headings">
				<th class="text-center">학과코드</th>
				<th class="text-center">단과대</th>
				<th class="text-center">학과명</th>
				<th class="text-center">학년별 최대 인원수</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="major" items="${majors }">
				<tr>
					<td class="text-center" style="vertical-align: middle;">${major.majorNum}</td>
					<td class="text-center" style="vertical-align: middle;">${major.faculty }</td>
					<td class="text-center" style="vertical-align: middle;">${major.majorName }</td>
					<td class="text-center" style="vertical-align: middle;">${major.maxNum }</td>
					<td>
						<input class="btn btn-info" type="button" value="수정"
							onclick="openMajorModal('수정'
								, '${major.majorNum}'
								, '${major.faculty }'
								, '${major.majorName }'
								, '${major.maxNum }');">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>


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
							onclick="getMajors();"
							id="datatable_previous"><a aria-controls="datatable"
							data-dt-idx="0" tabindex="0">Frist</a></li>
						<li class="paginate_button previous disabled"  style="cursor:pointer;"
							onclick="getMajors(${startPage - pageBlock});"
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
									onclick="getMajors(${page });">
									<a aria-controls="datatable" tabindex="0">${page }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:if test="${pageCount > endPage }">
						<li class="paginate_button next" id="datatable_next" style="cursor:pointer;"
							onclick="getMajors(${startPage + pageBlock });">
							<a aria-controls="datatable" tabindex="0">Next</a></li>
						<li class="paginate_button next" id="datatable_next" style="cursor:pointer;"
							onclick="getMajors(${pageCount });">
							<a aria-controls="datatable" tabindex="0">Last</a></li>
					</c:if>
				</c:if>
			</ul>
		</div>
	</div>
</div>