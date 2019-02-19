<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-striped jambo_table bulk_action">
	<thead>
		<tr class="headings">
			<th class="text-center">사진</th>
			<th class="text-center">교번</th>
			<th class="text-center">이름</th>
			<th class="text-center">단과대</th>
			<th class="text-center">학과명</th>
			<th class="text-center">이름</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="pro" items="${dtos }">
			<tr>
				<td class="text-center" style="vertical-align: middle;">
					<img src="/project/resources${pro.userImage}" class="img-thumbnail img-responsive" 
					style="height: 90px; width:80px; " alt="...">
				</td>
				<td class="text-center" style="vertical-align: middle;">${pro.userNumber}</td>
				<td class="text-center" style="vertical-align: middle;">${pro.userName}</td>
				<td class="text-center" style="vertical-align: middle;">${pro.faculty }</td>
				<td class="text-center" style="vertical-align: middle;">${pro.majorName }</td>
				<td class="text-center" style="vertical-align: middle;">
					<input class="btn btn-primary" type="button" value="선택"
						onclick="selectProfessor('${pro.userNumber}', '${pro.majorNum }');">
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
							onclick="professorList();"
							id="datatable_previous"><a aria-controls="datatable"
							data-dt-idx="0" tabindex="0">Frist</a></li>
						<li class="paginate_button previous disabled"  style="cursor:pointer;"
							onclick="professorList(${startPage - pageBlock});"
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
									onclick="professorList(${page });">
									<a aria-controls="datatable" tabindex="0">${page }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:if test="${pageCount > endPage }">
						<li class="paginate_button next" id="datatable_next" style="cursor:pointer;"
							onclick="professorList(${startPage + pageBlock });">
							<a aria-controls="datatable" tabindex="0">Next</a></li>
						<li class="paginate_button next" id="datatable_next" style="cursor:pointer;"
							onclick="professorList(${pageCount });">
							<a aria-controls="datatable" tabindex="0">Last</a></li>
					</c:if>
				</c:if>
			</ul>
		</div>
	</div>
</div>

<script type="text/javascript">
function selectProfessor(empNumber, majorNum){
	opener.initTime();
	$(opener.document).find("#majorNum").val(majorNum);
	$(opener.document).find("#empNumberButton").attr("value", empNumber);
	$(opener.document).find("#empNumberButton").attr("class", "form-control btn btn-success col-md-7 col-xs-12");
	$(opener.document).find("#empNumber").attr("value", empNumber);
	$(opener.document).find("#classTimeButton").attr("value", '강의 시간을 선택하세요.');
	$(opener.document).find("#classTimeButton").attr("class", "form-control btn btn-warning col-md-7 col-xs-12");
	$(opener.document).find("#classTimeButton").attr("onclick", "openTimeSelector('"+empNumber+"');");
	$(opener.document).find("#classTimeButton").removeAttr("disabled");
	self.close();
}
</script>