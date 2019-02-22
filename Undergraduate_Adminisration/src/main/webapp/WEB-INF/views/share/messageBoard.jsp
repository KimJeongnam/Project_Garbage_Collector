<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
	<ul class="list-unstyled msg_list">
		<c:forEach var="msg" items="${dtos }">
			<c:choose>
				<c:when test="${msg.notifyStatus==1}">
					<li style="cursor: pointer;" class="alert alert-info"
					onclick="showMessageInPage(${msg.messageCode}, '${userNumber }', ${pageNum });">
				</c:when>
				<c:otherwise>
					<li style="cursor: pointer;"
						onclick="showMessageInPage(${msg.messageCode}, '${userNumber }', ${pageNum });">
				</c:otherwise>
			</c:choose>
			
				<a style="width: 600px;"> 
					<span class="image"> 
						<img src="/project/resources${msg.senduserimage }" alt="img" style="width:26px;"/>
					</span> 
					<span> 
					<span>
						<c:if test="${msg.notifyStatus == 1 }">
							<span class="fa fa-bullhorn"></span>
						</c:if>
						${msg.sendUser }
					</span> <span class="time" style="margin-right: 10px;">
						<c:if test="${msg.readStatus > 0 }">
							<span class="fa fa-check"></span>
						</c:if>
						${msg.sendYear }-${msg.sendMonth }-${msg.sendDay }&nbsp;&nbsp;
						${msg.sendHour }:${msg.sendMin }:${msg.sendSec }
						</span>
					</span> 
					<span class="message"> ${msg.message }</span>
				</a>
			</li>
		</c:forEach>
	</ul>
</div>

<div class="row">
	<div class="col-sm-5">
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

	<div class="col-sm-7">
		<div class="text-right">
			<ul class="pagination">
				<c:if test="${cnt > 0 }">
					<c:if test="${startPage > pageBlock }">
						<li class="paginate_button previous disabled"  style="cursor:pointer;"
							id="datatable_previous"><a onclick="getMessages('${userNumber}', 1);" 
							onclick="getMessages('${userNumber}', 1);" aria-controls="datatable"
							data-dt-idx="0" tabindex="0">Frist</a></li>
						<li class="paginate_button previous disabled"  style="cursor:pointer;"
							onclick="getMessages('${userNumber}', ${startPage - pageBlock});"
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
									onclick="getMessages('${userNumber}', ${page });">
									<a aria-controls="datatable" tabindex="0">${page }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:if test="${pageCount > endPage }">
						<li class="paginate_button next" id="datatable_next" style="cursor:pointer;"
							onclick="getMessages('${userNumber}', ${startPage + pageBlock });">
							<a aria-controls="datatable" tabindex="0">Next</a></li>
						<li class="paginate_button next" id="datatable_next" style="cursor:pointer;"
							onclick="getMessages('${userNumber}', ${pageCount });">
							<a aria-controls="datatable" tabindex="0">Last</a></li>
					</c:if>
				</c:if>
			</ul>
		</div>
	</div>
</div>
