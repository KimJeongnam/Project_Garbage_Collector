<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@ include file="../Basic/settings.jsp" %>
<title>자바대학교 학사관리시스템</title>
</head>
<body class="nav-md">
	<%@ include file="../Basic/navbar.jsp" %>
	
			<!-- page content -->
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                           <h2> 교직원 관리</h2>
								<input class="inputButton" type="button" value="교직원 등록" onclick="window.location='proInsert'">
								<input class="inputButton" type="button" value="교직원 수정" onclick="window.location='proUpdate'">
								<input class="inputButton" type="button" value="교직원 삭제" onclick="window.location='proDelete'">
								
								<h2> 시간강사관리 </h2>
								<input class="inputButton" type="button" value="교직원 등록" onclick="window.location='tempLectuererInsert'">
								<input class="inputButton" type="button" value="교직원 수정" onclick="window.location='tempLectuererUpdate'">
								<input class="inputButton" type="button" value="교직원 삭제" onclick="window.location='tempLectuererDelete'">
                        </div>
                    </div>
                </div>
            </div>
            <!-- /page content -->
            
	<%@ include file="../Basic/footer.jsp" %>
	
	<script type="text/javascript">
		$(function (){
			
		});
	</script>
</body>
</html>