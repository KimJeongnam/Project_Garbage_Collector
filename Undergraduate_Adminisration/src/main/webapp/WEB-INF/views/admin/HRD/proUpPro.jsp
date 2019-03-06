<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@ include file="../../Basic/settings.jsp" %>
<title>자바대학교 학사관리시스템</title>
</head>
<body class="nav-md">
	<%@ include file="../../Basic/navbar.jsp" %>
	
			<!-- page content -->
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                           <c:if test="${proUpResult == 0}">
							<script type="text/javascript">
								alert("수정 실패!");
							</script>
							</c:if>
							
							<c:if test="${proUpResult != 0}">
							
							<script type="text/javascript">
								alert("수정완료");
								window.location="/admin/proDetailUpdate?userNum=${userNum}";
							</script>
							</c:if>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /page content -->
            
	<%@ include file="../../Basic/footer.jsp" %>
</body>
</html>