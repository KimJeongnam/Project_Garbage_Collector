<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="staticPath" value="/project/resources" />
<!-- page content -->
<div role="main" style="margin-left: 0px;">
	<div class="">
		<div class="clearfix"></div>
		<div class="x_panel">
			<div class="row">
				<div class="x_content">
					<div style="text-align: center;">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings">
									<th class="" style="width: 10%; text-align: center;">선택</th>
									<th class="" style="width: 13%; text-align: center;">글 번호</th>
									<th class="" style="width: 25%; text-align: center;">장학금 명</th>
									<th class="" style="width: 28%; text-align: center;">지급 금액</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${cnt > 0}">
									<c:forEach var="dto" items="${dtos}" varStatus="status">
										<tr class="even pointer" style="text-align: center;">
											<td><input type="checkbox" class="flat table_records"
												name="table_records" value="${dto.scholarpk}"></td>
											<td class=" ">${dto.scholarpk}</td>
											<td class=" " style="cursor: pointer"
												onclick="openModifyModal('${dto.scholarpk}', '${dto.scholarname}', '${dto.amount}', ${status.index });">
												<input type="text" hidden="hidden" id="scholarContent${status.index }" value="<c:out value="${dto.scholarcontent}" />">
												<a>${dto.scholarname}</a>
											</td>
											<td class=" ">${dto.amount}원</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${cnt == 0}">
									<tr class="even pointer" style="text-align: center;">
										<td colspan="6">해당하는 장학금이 없습니다.</td>
								</c:if>
							</tbody>
						</table>

						<!-- 페이지 컨트롤 -->
						<div class="row">
							<div class="col-sm-6">
								<div class="text-left">
									<ul class="pagination">
										<c:if test="${cnt > 0 }">
											<c:if test="${startPage > pageBlock }">
												<li class="paginate_button previous"
													style="cursor: pointer;" id="datatable_previous"
													onclick="adminregistrationList('${userNumber}', 1);">
													<a aria-controls="datatable" data-dt-idx="0" tabindex="0">Frist</a>
												</li>
												<li class="paginate_button previous"
													style="cursor: pointer;"
													onclick="adminregistrationList('${userNumber}', ${startPage - pageBlock});"
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
														<li class="paginate_button" style="cursor: pointer;"
															onclick="adminregistrationList('${userNumber}', ${page });">
															<a aria-controls="datatable" tabindex="0">${page }</a>
														</li>
													</c:otherwise>
												</c:choose>
											</c:forEach>

											<c:if test="${pageCount > endPage }">
												<li class="paginate_button next" id="datatable_next"
													style="cursor: pointer;"
													onclick="adminregistrationList('${userNumber}', ${startPage + pageBlock });">
													<a aria-controls="datatable" tabindex="0">Next</a>
												</li>
												<li class="paginate_button next" id="datatable_next"
													style="cursor: pointer;"
													onclick="adminregistrationList('${userNumber}', ${pageCount });">
													<a aria-controls="datatable" tabindex="0">Last</a>
												</li>
											</c:if>
										</c:if>
									</ul>
								</div>
							</div>
							<div class="col-md-6">
								<div class="text-right">
									<input type="button" class="btn btn-info" value="글쓰기"
										onclick="window.location='registration'"> <input
										type="button" class="btn btn-info" value="글 삭제" name="aaaa"
										onclick="delete_scholar();">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:forEach items="${dtos}" var="dto" varStatus="status">
</c:forEach>





