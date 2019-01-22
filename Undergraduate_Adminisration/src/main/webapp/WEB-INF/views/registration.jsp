<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@ include file="Basic/settings.jsp" %>
<title>Insert title here</title>
</head>
<body class="nav-md">
	<%@ include file="Basic/navbar.jsp" %>
	
			<!-- page content -->
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">
						<h2>장학금 등록하기</h2>

							<!-- 장학금명 폼 -->
							<div class="row"> 
							<div class="col-md-6"> <!--  container 안에서 grid system 사용 -->
							<div class="form-group"> 
							<label for="name">장학금 명</label> 
							<input type="text" class="form-control" name="name" id="name" placeholder="Enter name"> 
							</div> 
							</div> 
							
							
							<!-- 년도 학기 입력 폼  -->
							<div class="col-md-6"> 
							<div class="form-group"> 
							<label for="date">작성 일자</label> 
							<input type="text" class="form-control" name="date" id="date" placeholder="Enter date"> 
							</div> 
							</div> 
							
							</div>  <!-- container end -->
							
							<!-- 구분 폼 -->
							<div class="form-group"> 
							<label for="price">금액</label> 
							<input type="text" class="form-control" name ="price" id="price" placeholder="Enter price"> 
							</div> 
							
							<!-- 금액 입력 폼 -->
							<div class="form-group"> 
							<label for="subject">글제목</label> 
							<input type="text" class="form-control" name ="subject" id="subject" placeholder="Enter title"> 
							</div> 
							
							<!-- 글내용 입력 폼  -->
							<div class="form-group"> 
							<label for="content">Comment:</label> 
							<textarea class="form-control" rows="10" name="content" id="content"></textarea> 
							<!-- 글 내용이 많으므로 <textarea>태그를 쓴다 rows는 textarea의 높이 조절  -->
							</div> 
                        </div>
                    </div>
                </div>
            </div>
            <!-- /page content -->
            
	<%@ include file="Basic/footer.jsp" %>
	
	<script type="text/javascript">
		$(function (){
			
		});
	</script>
</body>
</html>