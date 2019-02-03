<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<li role="presentation" class="dropdown">
	<a href="javascript:;" class="dropdown-toggle info-number" id="messageCount" data-toggle="dropdown" aria-expanded="false"> 
		<i class="fa fa-envelope-o"></i> <!-- <span class="badge bg-green">0</span> -->
    </a>
    <!-- #부분 스크립트 처리 -->
    <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
    		<div id="messages">
				<!-- <li>
					<a>
						<span class="image"><img src="" alt="Profile Image"></span>
						<span>#보낸이#</span><span class="time">#몇분전#</span>
						<span class="message">쪽지</span>
					</a>
				</li> -->
			</div>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<li onclick="window.location='\
					/project/admin/messagePage';" style="cursor: pointer;">
				<div class="text-center">
					<a><strong>모든 쪽지 보기</strong> <i class="fa fa-angle-right"></i>
					</a>
				</div>
			</li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_PROFESSOR')">
			<li onclick="window.location='\
				/project/professor/messagePage';" style="cursor: pointer;">
				<div class="text-center">
					<a><strong>모든 쪽지 보기</strong> <i class="fa fa-angle-right"></i>
					</a>
				</div>
			</li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_STUDENT')">
			<li onclick="window.location='\
				/project/student/messagePage';" style="cursor: pointer;">
				<div class="text-center">
					<a><strong>모든 쪽지 보기</strong> <i class="fa fa-angle-right"></i>
					</a>
				</div>
			</li>
			</sec:authorize>
    </ul>
</li>
