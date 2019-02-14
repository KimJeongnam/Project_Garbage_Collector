<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@ include file="../Basic/settings.jsp" %>
<title>Insert title here</title>
</head>
<body class="nav-md">
	<%@ include file="../Basic/navbar.jsp" %>
	
			<!-- page content -->
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                           <c:if test="${insertBoard == 0}">
							<script type="text/javascript">
								alert("글등록 실패!");
							</script>
							</c:if>
							
							<!-- 글쓰기 성공 -->
							
							<c:if test="${insertBoard != 0}">
							
							<script type="text/javascript">
								alert("글쓰기를 완료 했습니다");
								window.location="../admin/registrationList";
							</script>
							</c:if>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /page content -->
            
	<%@ include file="../Basic/footer.jsp" %>
</body>
</html>