<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<li role="presentation" class="dropdown"><a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false"> <i class="fa fa-envelope-o"></i> <span id="messageCount" class="badge bg-green">6</span>
    </a>
    <!-- #부분 스크립트 처리 -->
    <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
        <%-- <li><a> <span class="image"><img
					src="${staticPath}${user.userImage }" alt="Profile Image"></span> <span>
					<span>#보낸이름#</span> <span class="time">#몇분전#</span>
			</span> <span class="message"> #쪽지# </span>
		</a></li> --%>
			<li>
				<a>
					<span class="image"><img src="" alt="Profile Image"></span>
					<span>#보낸이#</span><span class="time">#몇분전#</span>
					<span class="message">쪽지</span>
				</a>
			</li>
    </ul>
</li>
