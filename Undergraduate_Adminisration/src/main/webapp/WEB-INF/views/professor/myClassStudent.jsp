<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${!empty vo}">
<c:forEach var="vo3" items="${vo}">


	<div class="col-md-3 col-sm-3 col-xs-12 profile_details">
		<div class="well profile_view">
			<div class="col-sm-12" style="height: 200px;">
				<h2>
					<strong>No. ${vo3.stdNumber}</strong>
				</h2>
				<div class="left col-xs-7">
					<h2>${vo3.userName}</h2>
					${vo3.userEngName}<br>
					<ul class="list-unstyled">
						<li><i class="fa fa-phone"> &nbsp; &nbsp;</i>${vo3.userCellNum}</li>
						<li><i class="fa fa-send"> &nbsp; &nbsp;</i>${vo3.userEmail}</li>
					</ul>
				</div>
				<div class="right col-xs-5 text-center">
					<img src="/project/resources${vo3.userImage}" alt=""
						class="img-circle img-responsive" style="height: 152px; width: 126px;">
				</div>
			</div>
			<div class="col-xs-12 bottom text-center">
				<div class="col-xs-12 col-sm-6 emphasis">
					<p>
						<strong>${vo3.grade} 학년&nbsp;</strong>&nbsp;${vo3.faculty }&nbsp;${vo3.majorName}
					</p>
				</div>

				<div class="col-xs-12 col-sm-6 emphasis">
					<!-- id만 compose 입력하면 메세지창 뜨으으음 갸꿀!!!!-->
					<button type="button" class="btn btn-success btn-xs"
						onclick="toggleMessageModal('${vo3.stdNumber}', '${userNumber}');">
						<i class="fa fa-comments-o">&nbsp;메세지&nbsp; </i>
					</button>
					<button type="button"
						onclick="window.location.href='/project/professor/score'"
						class="btn btn-primary btn-xs">
						<i class="fa fa-user"> </i>학점입력
					</button>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
	</c:if>
	<c:if test="${empty vo}">
		<h2 style="text-align: center;">수강중인 학생이 없습니다.</h2>
	</c:if>