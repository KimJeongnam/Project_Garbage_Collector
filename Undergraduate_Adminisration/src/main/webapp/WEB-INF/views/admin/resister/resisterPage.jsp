<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="../../Basic/settings.jsp"%>
<title>자바대학교 학사관리시스템</title>
</head>
<body class="nav-md">
	<%@ include file="../../Basic/navbar.jsp"%>
	
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
											
											<div id="registrationList" class=""></div>
										</div>
									<div>
											
											<label for="heard">합/불 검색:</label>
					                         <select id="auditList" class="form-control" 
					                         onchange="adminjudgeList();" required>
					                           <option value="all" selected="selected">전체</option>
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
	<div class="modal fade" id="scholar-modify-modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- header -->
			<form action="rigisterupdate" name="inputform" method="post"
				onsubmit="return checkEditer();">
				<input type="text" hidden="hidden" id="scholarpk" name="scholarpk">
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">
						글제목 : <span id="modify-scholartitle"></span>
					</h4>
				</div>
				<!-- body -->
				<div class="modal-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="subject">장학금 명</label> <input type="text"
									class="form-control" name="scholarname" id="modify-scholarname"
									placeholder="장학금명을 입력하세요" value="">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="modify-amount">지급 금액</label> <input type="text"
									id="modify-amount" class="form-control" onkeyup="AutoComma(this);">
								<input type="text" hidden="hidden" name="amount" id="a_mount" >
							</div>
						</div>
					</div>

					<!-- 글내용 입력 폼  -->
					<div class="x_content">
						<div id="alerts"></div>
						<div class="btn-toolbar editor" data-role="editor-toolbar"
							data-target="#modify-editor">
							<div class="btn-group">
								<a class="btn dropdown-toggle" data-toggle="dropdown"
									title="Font"><i class="fa fa-font"></i><b class="caret"></b></a>
								<ul class="dropdown-menu">
								</ul>
							</div>

							<div class="btn-group">
								<a class="btn dropdown-toggle" data-toggle="dropdown"
									title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b
									class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><a data-edit="fontSize 5">
											<p style="font-size: 17px">Huge</p>
									</a></li>
									<li><a data-edit="fontSize 3">
											<p style="font-size: 14px">Normal</p>
									</a></li>
									<li><a data-edit="fontSize 1">
											<p style="font-size: 11px">Small</p>
									</a></li>
								</ul>
							</div>

							<div class="btn-group">
								<a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i
									class="fa fa-bold"></i></a> <a class="btn" data-edit="italic"
									title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a> <a
									class="btn" data-edit="strikethrough" title="Strikethrough"><i
									class="fa fa-strikethrough"></i></a> <a class="btn"
									data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i
									class="fa fa-underline"></i></a>
							</div>

							<div class="btn-group">
								<a class="btn" data-edit="insertunorderedlist"
									title="Bullet list"><i class="fa fa-list-ul"></i></a> <a
									class="btn" data-edit="insertorderedlist" title="Number list"><i
									class="fa fa-list-ol"></i></a> <a class="btn" data-edit="outdent"
									title="Reduce indent (Shift+Tab)"><i class="fa fa-dedent"></i></a>
								<a class="btn" data-edit="indent" title="Indent (Tab)"><i
									class="fa fa-indent"></i></a>
							</div>

							<div class="btn-group">
								<a class="btn" data-edit="justifyleft"
									title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
								<a class="btn" data-edit="justifycenter"
									title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
								<a class="btn" data-edit="justifyright"
									title="Align Right (Ctrl/Cmd+R)"><i
									class="fa fa-align-right"></i></a> <a class="btn"
									data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i
									class="fa fa-align-justify"></i></a>
							</div>

						</div>


						<div id="modify-editor" class="editor-wrapper"></div>


					</div>
					<input type="text" hidden="hidden" id="modify-scholarContent"
						name="scholarContent">
					<div class="modal-footer">
						<input class="btn btn-primary" type="submit" value="수정">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
				<!-- Footer -->
			</form>
		</div>
	</div>
</div>
	
	
	<!-- /page content -->
	<%@ include file="../../Basic/footer.jsp"%>
	
	<script type="text/javascript">
		$(function() {
			$('#modify-editor').wysiwyg();
		adminregistrationList('${userNumber}',1); 
		adminjudgeList();
		});
	
	</script>
	
<script type="text/javascript">
//값 입력시 콤마찍기
function AutoComma(obj) {
	obj.value = comma(uncomma(obj.value));
}

// 콤마찍기
function comma(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

// 콤마풀기
function uncomma(str) {
	str = String(str);
	return str.replace(/[^\d]+/g, '');
}

function openModifyModal(){
	$('#scholar-modify-modal').modal();
	if(arguments.length>0){
		$('#scholarpk').val(arguments[0]);
		$('#modify-scholarname').val(arguments[1].trim());
		$('#modify-amount').val(arguments[2].trim());
		$('#a_mount').val(uncomma($('#modify-amount').val()));
		$('#modify-editor').html($('#scholarContent'+arguments[3]).val());
	}
}
	 
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
	
	function checkEditer() {
		$('#scholarpk').val();
		$('#a_mount').val(uncomma($('#modify-amount').val()));
		
		if ($('#modify-scholarname').val().length==0) {
			alert("장학금 명을 입력해주세요");
			return false;
		}
		if ($('#modify-editor').html().length == 0) {
			alert("장학금 내용을 입력해주세요");
			return false;
		}
		if (!($('#a_mount').val() >= 100000 && $('#a_mount').val() < 10000000)) {
			alert("제한 금액의 범위를 벗어났습니다.");
			return false;
		}
		
		var scholarContent = $('#modify-editor').html();
		$('#modify-scholarContent').val(scholarContent);
		
		return true;
	}
	
	
	
	</script>
</body>
</html>