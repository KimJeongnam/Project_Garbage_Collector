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
                            <div class="col-md-6 col-sm-6 col-xs-12">
				             <div class="x_panel"  style="width: 1600px;">
				               <div class="x_title">
				                 <h2>글 제목 : ${dto.scholarname}</h2>
				                 
				                 <div class="clearfix"></div>
				               </div>
				               <div class="x_content">
				
				                 <div class="bs-example" data-example-id="simple-jumbotron">
				                   <div class="jumbotron">
				                     <p>${dto.scholarcontent}</p>
				                     
				                   </div>
				                 </div>
				                 <div style="text-align: center;">
				                 <input type = "button" value="신청하기" onclick="window.location='apply?scholarpk=${dto.scholarpk}'" >
				                 <input type = "button" value="취소" onclick="history.back()">
				                 </div>
				               </div>
				             </div>
				           </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /page content -->
            
	<%@ include file="../Basic/footer.jsp" %>
	
	<script type="text/javascript">
		$(function (){
			<%@ include file="../Basic/docReadyScripts.jsp" %>
		});
	</script>
</body>
</html>