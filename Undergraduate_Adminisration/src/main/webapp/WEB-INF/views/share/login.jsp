<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../Basic/settings.jsp" %>
    <title>자바대학교::로그인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
</head>
<body class="login">
    <div>
        <div class="login_wrapper">
            <div class="animate form login_form">
                <section class="login_content">
                    <form action="${contextPath}/security_login" method="post">
                        <h1>자바대학교 로그인</h1>
                        <div>
                            <input type="text" class="form-control" placeholder="학번/교번을 입력하세요" name="id" required />
                        </div>
                        <div>
                            <input type="password" class="form-control" placeholder="패스워드를 입력하세요" name="pw" required />
                        </div>
                        <div>
                            <input type="submit" class="btn btn-primary" value="로그인">
                            <a class="reset_pass" href="#">비밀번호를 잊으셨습니까?</a>
                        </div>

                        <div class="clearfix"></div>

                        <div class="separator">
                            <div class="clearfix"></div>
                            <br />

                            <div>
                                <h2><i class="fa fa-paw"></i> 자바대학교 학사종합정보서비스</h2>
                                <p>©2019 All Rights Reserved. Garbage Collector is a Bootstrap 3 template. Privacy and Terms</p>
                            </div>
                        </div>
                    </form>
                </section>
            </div>
        </div>
    </div>
    
    <%@ include file="../Basic/scripts.jsp" %>
    <script type="text/javascript">
		$(function (){
			<%@ include file="../Basic/docReadyScripts.jsp" %>
		});
	</script>
</body>
</html>
