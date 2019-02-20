<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="x_panel" >
	<div class="x_title">
		<div class="col-md-3">
			<img src="/project/resources${msg.senduserimage }" alt="..." class="img-circle profile_img">
		</div>
		<div class="col-md-3">
			<h2>
				<c:if test="${msg.notifyStatus == 1 }">
					<span class="fa fa-bullhorn"></span>
				</c:if>
					${msg.sendUser } <small>${msg.sendYear }-${msg.sendMonth }-${msg.sendDay }&nbsp;&nbsp;
					${msg.sendHour }:${msg.sendMin }:${msg.sendSec }</small>
			</h2>
		</div>
		<ul class="nav navbar-right panel_toolbox">
			<li onclick="$('#show-msg-panel').html('');"><a class="close-link"><i class="fa fa-close"></i></a></li>
		</ul>
		<div class="clearfix"></div>
	</div>
	<div class="x_content" style="font-size: 15px;">
		${msg.message }
	</div>
	<div class="col-md-12" style="margin-top: 15px;">
		<input type="button" class="btn btn-success" value="답장" onclick="toggleMessageModal('${msg.sendUser}');">
	</div>
</div>