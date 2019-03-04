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
						<h2>장학금 등록하기</h2>
						<form action="rigisterPro" name="inputform" onsubmit="return checkEditer();">	<!--  -->
							
						<div class="x_panel">
							<!-- 장학금명 폼 -->
							<div class="row"> 
							<div class="col-md-6"> <!--  container 안에서 grid system 사용 -->
							<div class="form-group"> 
							<label for="name">년 도</label> 
							<input type="text" class="form-control" name="year" id="year" onchange="dateFormat();" placeholder="Enter name"> 
							</div> 
							</div> 
							
							
							<!-- 년도 학기 입력 폼  -->
							<div class="col-md-6"> 
							<div class="form-group"> 
							<label for="date">학기</label> 
							<input type="text" class="form-control" name="semester" id="semester" onchange="dateFormat2();" placeholder="Enter date"> 
							</div> 
							</div> 
							
							</div>  <!-- container end -->
							
							<!-- 구분 폼 -->
							<div class="form-group"> 
							<label for="price">지급 금액</label> 
							<input type="text" class="form-control" name ="amount" id="amount" onchange="dateFormat3();" placeholder="Enter price"> 
							</div> 
							
							<!-- 금액 입력 폼 -->
							<div class="form-group"> 
							<label for="subject">장학금 명</label> 
							<input type="text" class="form-control" name ="scholarname" id="scholarname" placeholder="Enter title"> 
							</div> 
							
							<!-- 글내용 입력 폼  -->
							<div class="x_content">
			                  <div id="alerts"></div>
			                  <div class="btn-toolbar editor" data-role="editor-toolbar" data-target="#editor-one">
			                    <div class="btn-group">
			                      <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="fa fa-font"></i><b class="caret"></b></a>
			                      <ul class="dropdown-menu">
			                      </ul>
			                    </div>
			
			                    <div class="btn-group">
			                      <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
			                      <ul class="dropdown-menu">
			                        <li>
			                          <a data-edit="fontSize 5">
			                            <p style="font-size:17px">Huge</p>
			                          </a>
			                        </li>
			                        <li>
			                          <a data-edit="fontSize 3">
			                            <p style="font-size:14px">Normal</p>
			                          </a>
			                        </li>
			                        <li>
			                          <a data-edit="fontSize 1">
			                            <p style="font-size:11px">Small</p>
			                          </a>
			                        </li>
			                      </ul>
			                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="fa fa-bold"></i></a>
                      <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
                      <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="fa fa-strikethrough"></i></a>
                      <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="fa fa-underline"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="fa fa-list-ul"></i></a>
                      <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="fa fa-list-ol"></i></a>
                      <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="fa fa-dedent"></i></a>
                      <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="fa fa-indent"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
                      <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
                      <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a>
                      <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="fa fa-align-justify"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="fa fa-link"></i></a>
                      <div class="dropdown-menu input-append">
                        <input class="span2" placeholder="URL" type="text" data-edit="createLink" />
                        <button class="btn" type="button">Add</button>
                      </div>
                      <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="fa fa-cut"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="fa fa-picture-o"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a>
                      <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
                    </div>
                  </div>

                  <div id="editor-one" class="editor-wrapper"></div>

                  <!-- <textarea name="descr" id="descr" style="display:none;"></textarea> -->
                  
                </div>
							<input type="text" hidden="hidden" id="scholarContent" name="scholarContent" value="">
							
							<div style="text-align: center">
							<input class="btn btn-primary" type="submit" value="작성">
							<input class="btn btn-primary" type="reset" value="취소">
							<input class="btn btn-primary" type="button" value="목록"
							onclick="history.back();">
							</div>
							
						</div>
						</form>
                       </div>
                   </div>
               </div>
           </div>
           
           
            <!-- /page content -->
            
	<%@ include file="../Basic/footer.jsp" %>
	
	<script type="text/javascript">
		var scholarContent = $('#editor-one')[0].innerHTML
		$('#scholarContent').val = scholarContent;
		
		/* function checkEditer(){
			var scholarContent = $('#editor-one')[0].innerHTML
			$('#scholarContent').val(scholarContent);
			if($('#scholarContent').val().length > 0) return true;
			else return false;
		} */
	</script>
	
	<script type="text/javascript">
		$(function (){
			
		});
		//날짜형식
		function dateFormat() {
		 var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/; 
		 var obj = document.inputform.year.value;
		 if(!date_pattern .test(obj)){
			alert("날짜 형식이 잘못되었습니다");
		 return;
		 }
		 //숫자 형식  
		}
		
		function dateFormat2() {
		 var obj = document.inputform.semester.value;
		 
		 if(!(obj == 1 || obj == 2)){
			alert("학기 데이터 형식 잘못되었습니다");
		 return;
		 }
		}
		
		function dateFormat3() {
		var obj = document.inputform.amount.value;
		
		 if(!(obj >= 100000 && obj < 10000000)){
			alert("장학금 금액을 잘못 입력 하셨습니다");
		 return;
		 }
		} 
		
	  function checkEditer() {
		var scholarname = document.inputform.scholarname.value;
		var content = $('#editor-one')[0].innerHTML
		 if(!scholarname){
			alert("장학금 명을 입력해주세요");
			return false;
		 }
		if(content==0){
			alert("장학금 내용을 입력해주세요");
			return false;
		 }
		var scholarContent = $('#editor-one')[0].innerHTML
		$('#scholarContent').val(scholarContent);
		if($('#scholarContent').val().length > 0) return true;
		else return false;
		
		} 
		
	</script>
</body>
</html>