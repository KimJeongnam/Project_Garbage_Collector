<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/css/bootstrap-select.min.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="../../Basic/settings.jsp"%>
<title>자바대학교 학사관리시스템</title>
</head>
<body class="nav-md">
	<%@ include file="../../Basic/navbar.jsp"%>
	<!-- page content -->
	
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left"></div>
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
							<div class="x_panel">
								<div class="x_title">
									<h2>장학 글 등록 & 심사</h2>
									<div class="clearfix"></div>
								</div>
								<div class= "row">
								<div class="x_content">
									<div class="row form-inline">
										<div class="col-sm-5">
											<label> 년도 <select class="form-control input-sm"
												id="registrationList-year"
												onchange="adminregistrationList('${userNumber}',1);">
													<option value="0" selected="selected">선택</option>
													<option value="2011">2011</option>
													<option value="2012">2012</option>
													<option value="2013">2013</option>
													<option value="2014">2014</option>
													<option value="2015">2015</option>
													<option value="2016">2016</option>
													<option value="2017">2017</option>
													<option value="2018">2018</option>
													<option value="2019">2019</option>
											</select>
											</label>
											
											<label> 학기 <select class="form-control input-sm"
												id="registrationList-semester"
												onchange="adminregistrationList('${userNumber}',1);">
													<option value="0" selected="selected">선택</option>
													<option value="1">1 학기</option>
													<option value="2">2 학기</option>
											</select>
											</label>
											<div id="registrationList" class=""></div>
										</div>
									<div>
											
											<label for="heard">합/불 검색:</label>
					                         <select id="auditList" class="form-control" 
					                         onchange="adminjudgeList('${userNumber}',1);" required>
					                           <option value="3" selected="selected">전체</option>
					                           <option value="1">합격자</option>
					                           <option value="0">불 합격자</option>
					                           <option value="2">심사 중</option>
					                         </select>

									</div>
										<div id="judgeList" class=""></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- /page content -->
	<%@ include file="../../Basic/footer.jsp"%>
	<script type="text/javascript">
		$(function() {
		adminregistrationList('${userNumber}',1); 
		adminjudgeList('${userNumber}',1);
		});
	
	</script>
	
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/js/bootstrap-select.min.js"></script>

<!-- (Optional) Latest compiled and minified JavaScript translation files -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/js/i18n/defaults-*.min.js"></script> -->
<script type="text/javascript">
	 
	function delete_scholar(){
		var list = [];
		var list_size = 0;
		
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "POST");
		form.setAttribute("action", "../admin/deletePro");
		
		var cnt = 0;
		
		for(var i=0; i<$('.table_records').size(); i++){
			if($('.table_records')[i].checked){
				//list[list_size++] = $('.table_records')[i].value;
				var field = document.createElement("input");
				field.setAttribute("type", "hidden");
				field.setAttribute("name", "scholarpks");
				field.setAttribute("value", $('.table_records')[i].value);
				form.appendChild(field);
			}
		}
		
		document.body.appendChild(form);
		
		form.submit();
	}
	
	function checkEditer(idx) {
		var scholarname = $('#scholarname'+idx).val();
		var content = $('#editor-one1'+idx)[0].innerHTML;
		var year = $('#year'+idx).val();
		var semester = $('#semester'+idx).val();
		
		if (!year) {
			alert("년도를 입력해 주세요");
			return false;
		}
		
		if (!semester) {
			alert("학기를 입력해 주세요");
			return false;
		}
		
		if (!scholarname) {
			alert("장학금 명을 입력해주세요");
			return false;
		}
		if (content == 0) {
			alert("장학금 내용을 입력해주세요");
			return false;
		}
		var scholarContent = $('#editor-one1'+idx)[0].innerHTML;
		$('#scholarContent'+idx).val(scholarContent);
		
		if ($('#scholarContent'+idx).val().length > 0)
			return true;
		else
			return false;
	}
	
	
	
	</script>
</body>
</html>