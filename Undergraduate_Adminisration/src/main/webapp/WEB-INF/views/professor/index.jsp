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
                <div id="professerSchedule"></div>
            </div>
            <!-- /page content -->
            
	<%@ include file="../Basic/footer.jsp" %>
</body>

<script type="text/javascript">
function professerSchedule(userNumber,semester) {
    $.ajax({
        url: '/project/share/professor/getLecTime/'+userNumber+'/'+semester,
        type: 'GET',
        success: function(data) {
        	 $('#professerSchedule').html(data); 
        },
        error: function() {
        	swal({
				text:"Error! professerSchedule();",
				icon: "error",
				button:"확인",
			});
        }
    });
}

$(function() {
	professerSchedule('${userNumber}','${semester}');
});


</script>
</html>