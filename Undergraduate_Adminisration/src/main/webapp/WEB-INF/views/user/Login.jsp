<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<meta charset="utf-8">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
.container {
  width: 1120px !important;
}
.main{margin-top:70px; 
-webkit-box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.24);
-moz-box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.24);
box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.24);
padding:0px;
background:#2196f3;
}
.fb:focus, .fb:hover{color:FFF !important;}
body{
font-family: 'Raleway', sans-serif;
}

.left-side{
   padding:0px 0px 0px;
   
   background-size:cover;
}
.left-side h3{
   font-size: 30px;
    font-weight: 900;
   color:#FFF;
   padding: 50px 10px 00px 26px;
   }
   
   .left-side p{
    font-weight:600;
   color:#FFF;
   padding:10px 10px 10px 26px;
   }

   
   .fb{background: #2d6bb7;
    color: #FFF;
    padding: 10px 15px;
    border-radius: 18px;
    font-size: 12px;
    font-weight: 600;
    margin-right: 15px;
   margin-left:26px;-webkit-box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.24);
-moz-box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.24);
box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.24);}
   .tw{background: #20c1ed;
    color: #FFF;
    padding: 10px 15px;
    border-radius: 18px;
    font-size: 12px;
    font-weight: 600;
    margin-right: 15px;-webkit-box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.24);
-moz-box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.24);
box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.24);}
   
   .right-side{
   padding:0px 0px 0px;
   background:#FFF;
   background-size:cover;
   min-height:514px;
}
   .right-side h3{
   font-size: 30px;
    font-weight: 700;
   color:#000;
   padding: 50px 10px 00px 50px;
   }
   .right-side p{
    font-weight:600;
   color:#000;
   padding:10px 50px 10px 50px;
   }
   .form{padding:10px 50px 10px 50px;}
    .form-control{box-shadow: none !important;
    border-radius: 0px !important;
    border-bottom: 1px solid #2196f3 !important;
    border-top: 1px !important;
    border-left: none !important;
    border-right: none !important;}
   .btn-deep-purple {
    background: #2196f3;
    border-radius: 18px;
    padding: 5px 19px;
    color: #FFF;
    font-weight: 600;
    float: right;
   -webkit-box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.24);
-moz-box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.24);
box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.24);
}

</style>

<!------ Include the above in your HEAD tag ---------->

      <div class="container">
       
      <div>
      <div class="col-xs-4 left-side" >
            <div class="text-right">
   
            <img src="../images/btn_login_student_on.gif"><br>
            <img src="../images/btn_login_teacher_on.gif"><br>
            <img src="../images/btn_login_staff_on.gif"><br>
   
            </div>

      </div><!--col-sm-6-->
      
      <div class="col-xs-6 right-side">
            
      <img src="images/login_text01.png" style="margin: 40 10 10 20">
      
<!--Form with header-->
<div class="form">

		<form action="/Tim/j_spring_security_check" method="post">
	        <div class="form-group">
	          <label for="form2">아이디</label>
	            <input type="text" id="form2" name="j_username" class="form-control input-lg" placeholder="아이디">
	            
	        </div>
	
	        <div class="form-group">
	          <label for="form4">비밀번호</label>
	            <input type="password" id="form4" name="j_password" class="form-control input-lg" placeholder="비밀번호">
	           
	        </div>
	
	        <div class="text-xs-center">
	            <input type="submit" class="btn btn-deep-purple" value="로그인">
	        </div>
	     
	           <div class="text-xs-center" style="float: left">
	            <button class="btn btn-deep-purple">비밀번호 찾기</button>
	        </div>
	        <div class="text-xs-center" style="float: left; padding-left: 10px;">
	            <button class="btn btn-deep-purple">아이디 찾기</button>
	        </div>
        </form>

</div>
            
<!--/Form with header-->

      </div><!--col-sm-6-->
      
      
        </div><!--col-sm-8-->
        
        </div><!--container-->
</body>
</html>