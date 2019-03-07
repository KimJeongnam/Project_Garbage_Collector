<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="staticPath" value="/project/resources" />
<style>
.toggle-off {
	margin-bottom: 0px;
	margin-right: 0px;
}
</style>
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
									<!-- <th class=""  style="width: 5%; text-align: center;">
                                        <input type="checkbox" id="check-all" class="flat">
                                    </th> -->
									<th class="" style="width: 10%; text-align: center;">선택</th>
									<th class="" style="width: 15%; text-align: center;">글 번호</th>
									<th class="" style="width: 15%; text-align: center;">년도</th>
									<th class="" style="width: 10%; text-align: center;">학기</th>
									<th class="" style="width: 25%; text-align: center;">장학금 명</th>
									<th class="" style="width: 25%; text-align: center;">지급 금액</th>
									<!-- <th class="column-title">조회</th> -->
								</tr>
							</thead>
							<tbody>
								<c:if test="${cnt > 0}">
									<c:forEach var="dto" items="${dtos}">

										<tr class="even pointer" style="text-align: center;">
											<td><input type="checkbox" class="flat table_records"
												name="table_records" value="${dto.scholarpk}"></td>
											<td class=" ">${dto.scholarpk}</td>
											<td class=" ">${dto.year}</td>
											<td class=" ">${dto.semester}</td>
											<td class=" " style="cursor: pointer"><a
												data-toggle="modal" data-target="#layerpop${dto.scholarpk}">${dto.scholarname}</a></td>
											<td class=" "><fmt:formatNumber value="${dto.amount}"/>원</td>
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
								<div class="text-right">
									<ul class="pagination">
										<c:if test="${cnt > 0 }">
											<c:if test="${startPage > pageBlock }">
												<a href="/admin/resister/adminregistrationList2">[◀◀]</a>
												<a
													href="/admin/resister/adminregistrationList2?pageNum=${startPage - pageBlock }">[◀&nbsp;prev]</a>

												<li class="paginate_button previous disabled"
													style="cursor: pointer;" id="datatable_previous"><a
													onclick="adminregistrationList('${userNumber}', 1);"
													aria-controls="datatable" data-dt-idx="0" tabindex="0">Frist</a></li>
												<li class="paginate_button previous disabled"
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
															onclick="adminregistrationList('${userNumber}', ${page });"><a
															aria-controls="datatable" tabindex="0">${page }</a></li>
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
						</div>




						<div style="float: right;">
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

<c:forEach items="${dtos}" var="dto" varStatus="status">

	<div class="modal fade" id="layerpop${dto.scholarpk}">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">글제목 : ${dto.scholarname}</h4>

				</div>
				<!-- body -->
				<div class="modal-body">
					<form action="rigisterupdate" name="inputform" method="post"
						onsubmit="return checkEditer('${status.index}');">
						<!--  -->

						<div class="x_panel">
							<!-- 장학금명 폼 -->
							<div class="row">
								<div class="col-md-6">
									<!--  container 안에서 grid system 사용 -->
									<div class="form-group">
										<label for="name">년
											도&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<input type="text" class="form-control" name="year" id="year${status.index}"
											placeholder="Enter name" value="${dto.year}">
									</div>
								</div>


								<!-- 년도 학기 입력 폼  -->
								<div class="col-md-6">
									<div class="form-group">
										<label for="date">학기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<input type="text" class="form-control" name="semester"
											id="semester${status.index}"
											placeholder="년도를 입력하세요" value="${dto.semester}">
									</div>
								</div>

							</div>
							<!-- container end -->

							<!-- 구분 폼 -->
							<div class="form-group">
								<label for="price">지급 금액</label> <br> <input type="text"
									class="form-control" name="amount1" id="amount1" 
									onchange="dateFormat3();" placeholder="금액을 입력하세요" value="<fmt:formatNumber value="${dto.amount}"
										pattern="#,###" />">
									<input type="hidden" name="amount" id="amount${status.index}" value="${dto.amount}">
										
							</div>

							<!-- 금액 입력 폼 -->
							<div class="form-group">
								<label for="subject" style="margin-left: 41px;">&emsp;&emsp;&emsp;장학금
									명</label><br> <input type="text" class="form-control"
									name="scholarname" id="scholarname${status.index}" style="margin-left: 83px;"
									placeholder="장학금명을 입력하세요" value="${dto.scholarname}">
							</div>

							<!-- 글내용 입력 폼  -->
							<div class="x_content">
								<div id="alerts"></div>
								<div class="btn-toolbar editor" data-role="editor-toolbar"
									data-target="#editor-one1${status.index}">
									<div class="btn-group">
										<a class="btn dropdown-toggle" data-toggle="dropdown"
											title="Font"><i class="fa fa-font"></i><b class="caret"></b></a>
										<ul class="dropdown-menu">
										</ul>
									</div>

									<div class="btn-group">
										<a class="btn dropdown-toggle" data-toggle="dropdown"
											title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b
											class="caret"></b></a>
										<ul class="dropdown-menu">
											<li><a data-edit="fontSize 5">
													<p style="font-size: 17px">Huge</p>
											</a></li>
											<li><a data-edit="fontSize 3">
													<p style="font-size: 14px">Normal</p>
											</a></li>
											<li><a data-edit="fontSize 1">
													<p style="font-size: 11px">Small</p>
											</a></li>
										</ul>
									</div>

									<div class="btn-group">
										<a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i
											class="fa fa-bold"></i></a> <a class="btn" data-edit="italic"
											title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
										<a class="btn" data-edit="strikethrough" title="Strikethrough"><i
											class="fa fa-strikethrough"></i></a> <a class="btn"
											data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i
											class="fa fa-underline"></i></a>
									</div>

									<div class="btn-group">
										<a class="btn" data-edit="insertunorderedlist"
											title="Bullet list"><i class="fa fa-list-ul"></i></a> <a
											class="btn" data-edit="insertorderedlist" title="Number list"><i
											class="fa fa-list-ol"></i></a> <a class="btn" data-edit="outdent"
											title="Reduce indent (Shift+Tab)"><i class="fa fa-dedent"></i></a>
										<a class="btn" data-edit="indent" title="Indent (Tab)"><i
											class="fa fa-indent"></i></a>
									</div>

									<div class="btn-group">
										<a class="btn" data-edit="justifyleft"
											title="Align Left (Ctrl/Cmd+L)"><i
											class="fa fa-align-left"></i></a> <a class="btn"
											data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i
											class="fa fa-align-center"></i></a> <a class="btn"
											data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i
											class="fa fa-align-right"></i></a> <a class="btn"
											data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i
											class="fa fa-align-justify"></i></a>
									</div>

								</div>


								<div id="editor-one1${status.index}" class="editor-wrapper">${dto.scholarcontent}</div>

								<textarea name="descr" id="descr" style="display: none;" value="asdasdadasdasdsadasdsa">123131312313123213</textarea>


								<!-- <textarea name="descr" id="descr" style="display:none;"></textarea> -->

							</div>
							<input type="hidden" id="scholarpk" name="scholarpk"
								value="${dto.scholarpk}">
								
							<input type="text" hidden="hidden" id="scholarContent${status.index}" name="scholarContent">
<div class="modal-footer">
				<input class="btn btn-primary" type="submit" value="수정">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>

						</div>
					</form>
				</div>
				<!-- Footer -->
				
			</div>
		</div>
	</div>
</c:forEach>





<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/js/i18n/defaults-*.min.js"></script>


<!-- Custom Theme Scripts -->
<script src="${staticPath}/build/js/custom2.js"></script>
