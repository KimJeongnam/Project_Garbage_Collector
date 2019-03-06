<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@ include file="../Basic/settings.jsp" %>
<title>Insert title here</title>
</head>
<c:if test="${!empty s_myClass}">
<body class="nav-md">

	<%@ include file="../Basic/navbar.jsp" %>
	
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>과제관리<small> 교수화면</small></h3>
            </div>

        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>강의  과제 관리</h2>

                        <div class="btn-group" style="float: right">
                            <select class="form-control input-sm"
								id="mystatus"
								onchange="p_reportlist(${userNumber}),re_contentform(${userNumber})">
									<c:forEach var="dto" items="${vo}">
										<option value="${dto.lecCode}">${dto.lectureName}</option>
									</c:forEach>
							</select>
                        </div>
                        




                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">
                    <div id="Personnel" class=""></div>
                    <div id="Personnel2" class=""> </div>
                    <div id="re_contentform" class=""> </div>
                    
                   


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../Basic/footer.jsp" %>
	
	<script type="text/javascript">
 	 $(function() {
		p_reportlist('${userNumber}');
		re_contentform('${userNumber}');
		document.getElementById("Personnel1").style.display="none"
		
	});
 	 
 	
 	 function hideshow(reportcode) {
 		
 	  var x = document.getElementById("Personnel");
 	 	var y = document.getElementById("Personnel2");
 	 	
	  if (x.style.display === "none") {
	    x.style.display = "none";
	    y.style.display = "block";
	  } else {
	    x.style.display = "none";
	    y.style.display = "block";
	  }
	  
	  report_Personnel2(reportcode,$("#mystatus").val());
	  
	}
 	</script>
</c:if>

<c:if test="${empty s_myClass}">
 <%@ include file="../Basic/footer.jsp" %>
    <script type="text/javascript">
        swal({
    		text:"수강기간이 아닙니다. 이전 페이지로 돌아갑니다.",
    		button:"확인",
    	}).then((value)=>{
    		if(value)
    			history.back();
    	});

    </script>
</c:if>
<!-- /page content -->




            
	
 	
 	 
	
	<!-- /* function p_reportlist(){
		
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "POST");
		form.setAttribute("action", "../professor/personnel");
		
		var cnt = 0;
		
		var field = document.createElement("input");
		field.setAttribute("hidden", "true");
		field.setAttribute("type", "text");
		field.setAttribute("name", "aaaaa");
		field.setAttribute("value", $('#mystatus').val());
		form.appendChild(field);
	
		document.body.appendChild(form);
		
		form.submit();
	} */ -->
	
	
	
	
</body>
</html>