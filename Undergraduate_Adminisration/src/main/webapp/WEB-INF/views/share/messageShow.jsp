<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="x_panel" >
	<div class="x_title">
		<div class="col-md-3">
			<img src="/project/resources${msg.senduserimage }" alt="..." class="img-circle profile_img">
		</div>
		<div class="col-md-3">
			<h2>
				${msg.sendUser } <small>${msg.sendYear }-${msg.sendMonth }-${msg.sendDay }&nbsp;&nbsp;
					${msg.sendHour }:${msg.sendMin }:${msg.sendSec }</small>
			</h2>
		</div>
		<ul class="nav navbar-right panel_toolbox">
			<li onclick="$('#show-msg-panel').html('');"><a class="close-link"><i class="fa fa-close"></i></a></li>
		</ul>
		<div class="clearfix"></div>
	</div>
	<div class="x_content">
		${msg.message }
	</div>
</div>