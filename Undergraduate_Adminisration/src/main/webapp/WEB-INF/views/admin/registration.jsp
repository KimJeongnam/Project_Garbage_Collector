<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../Basic/settings.jsp"%>
<title>자바대학교 학사관리시스템</title>
</head>
<body class="nav-md">
	<%@ include file="../Basic/navbar.jsp"%>
	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h2>장학금 등록하기</h2>
					<form action="rigisterPro" name="inputform" onsubmit="submitUncomma();">
						<input type="hidden" name="amount" id="hiddenAmount">
						<div class="x_panel">
							<div class="row">
								<div class="form-group col-md-6">
									<label for="subject">장학금 명</label> <input type="text"
										class="form-control" name="scholarname" id="scholarname"
										placeholder="장학금 명을 입력하세요." required>
								</div>
								
								<div class="form-group col-md-6">
									<label for="price">지급 금액</label> <input type="text"
										class="form-control" name="amount2" id="amount"
										onchange="dateFormat3();" onkeyup="AutoComma(this);" 
										placeholder="100,000 ~ 10,000,000 사이의 금액을 입력하세요." required>
								</div>
							</div>
							
							<!-- 구분 폼 -->

							<!-- 글내용 입력 폼  -->
							<div class="x_content">
								<div id="alerts"></div>
								<div class="btn-toolbar editor" data-role="editor-toolbar"
									data-target="#editor-one">
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
											title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
										<a class="btn" data-edit="strikethrough" title="Strikethrough"><i
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
											title="Align Left (Ctrl/Cmd+L)"><i
											class="fa fa-align-left"></i></a> <a class="btn"
											data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i
											class="fa fa-align-center"></i></a> <a class="btn"
											data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i
											class="fa fa-align-right"></i></a> <a class="btn"
											data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i
											class="fa fa-align-justify"></i></a>
									</div>

									<div class="btn-group">
										<a class="btn dropdown-toggle" data-toggle="dropdown"
											title="Hyperlink"><i class="fa fa-link"></i></a>
										<div class="dropdown-menu input-append">
											<input class="span2" placeholder="URL" type="text"
												data-edit="createLink" />
											<button class="btn" type="button">Add</button>
										</div>
										<a class="btn" data-edit="unlink" title="Remove Hyperlink"><i
											class="fa fa-cut"></i></a>
									</div>

									<div class="btn-group">
										<a class="btn" title="Insert picture (or just drag & drop)"
											id="pictureBtn"><i class="fa fa-picture-o"></i></a>
									</div>

									<div class="btn-group">
										<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i
											class="fa fa-undo"></i></a> <a class="btn" data-edit="redo"
											title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
									</div>
								</div>


								<div id="editor-one" class="editor-wrapper"></div>

								<textarea name="descr" id="descr" style="display:none;"></textarea>
                  
                </div>
							<input type="text" hidden="hidden" id="scholarContent" name="scholarContent">

							<div style="text-align: center">
								<input class="btn btn-primary" type="submit" value="작성">
								<input class="btn btn-primary" type="reset" value="취소">
								<input class="btn btn-primary" type="button" value="목록"
									onclick="window.location='registrationList'">
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- /page content -->

	<%@ include file="../Basic/footer.jsp"%>

	<script type="text/javascript">
		
	</script>

	<script type="text/javascript">
		$(function() {

		});
		//날짜형식
		function dateFormat() {
			var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
			var obj = document.inputform.year.value;
			if (!date_pattern.test(obj)) {
				alert("날짜 형식이 잘못되었습니다");
				document.inputform.year.value = null;
				return;
			}
			//숫자 형식  
		}

		function dateFormat2() {
			var obj = document.inputform.semester.value;

			if (!(obj == 1 || obj == 2)) {
				alert("학기 데이터 형식 잘못되었습니다");
				document.inputform.semester.value = null;
				return;
			}
		}

		function submitUncomma() {
			$('#scholarContent').val($('#editor-one')[0].innerHTML);
			var amount = uncomma(document.inputform.amount2.value);
			$('#hiddenAmount').val(amount);
		}
		
		// 값 입력시 콤마찍기
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
		
		function dateFormat3() {
			var obj = uncomma(document.inputform.amount2.value);
			if (!(obj >= 100000 && obj < 10000000)) {
			alert("제한 금액의 범위를 벗어났습니다.");
			document.inputform.amount.value = null;
			return
			}
		}
	</script>
</body>
</html>