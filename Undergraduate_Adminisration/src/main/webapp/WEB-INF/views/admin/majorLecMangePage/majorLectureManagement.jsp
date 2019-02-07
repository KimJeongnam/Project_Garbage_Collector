<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../Basic/settings.jsp"%>
<title>Insert title here</title>
</head>
<body class="nav-md">
	<%@ include file="../../Basic/navbar.jsp"%>

	<script type="text/javascript">
	var setFacultys = function(facultys){
		$('#college').empty();
		
		$('#college').append($('<option>', {
			text : '선택하세요',
			disabled : 'disabled',
			selected : 'selected'
		}));
		
		for(var i=0; i<facultys.length; i++){
			$('#college').append($('<option>', { 
		        value: facultys[i],
		        text : facultys[i] 
		    }));
		}
	}
	
	var setMajorCode = function(code){
		$('#majorCode').val(code);
		$('#majorCode_view').val(code);
	}
	
	function openMajorAdd(){
		$('#majorName').val('');
		$('#count').val('');
		getFacultys(setFacultys);
		getMajorCurrval(setMajorCode);
		$('#majorAdd-Modal').modal();
	}
	</script>
	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>교직업무</h3>
				</div>

				<div class="title_right">
					<div
						class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="학생 검색">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">검색</button>
							</span>
						</div>
					</div>
				</div>
			</div>

			<div class="clearfix"></div>

			<div class="row">
				<div class="col-md-4 col-sm-12 col-xs-12" id="majorList">
					
				</div>

				<div class="col-md-8 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>
								강의<small></small>
							</h2>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<table class="table table-striped jambo_table bulk_action">
								<thead>
									<tr class="headings">
										<th class="text-center">구분</th>
										<th class="text-center">학과</th>
										<th class="text-center">강의명</th>
										<th class="text-center">학년</th>
										<th class="text-center">학기</th>
										<th class="text-center">학점</th>
										<th class="text-center">담당 교수</th>
										<th class="text-center">인원수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-center">전공</td>
										<td class="text-center">컴퓨터공학과</td>
										<td class="text-center">전공실기I</td>
										<td class="text-center">1학년</td>
										<td class="text-center">1학기</td>
										<td class="text-center">3</td>
										<td class="text-center">홍길동</td>
										<td class="text-center">50</td>
									</tr>
								</tbody>
							</table>
							<div>
								<input type="button" class="btn btn-primary" value="신규">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /page content -->

	<div class="modal fade" id="majorAdd-Modal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>

					<div class="modal-title row">
						<div class="col-md6" id="msgModal-sendUser">
							<h4>학과 등록</h4>
						</div>
					</div>
				</div>
				<div class="modal-body">
					<form id="demo-form2" data-parsley-validate
						class="form-horizontal form-label-left">

						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="majorCode">학과 코드 <span class="required">*</span>
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="majorCode_view" disabled="disabled"
									class="form-control col-md-7 col-xs-12"> <input
									hidden="true" type="text" id="majorCode" name="majorCode"
									required="required" class="form-control col-md-7 col-xs-12">

							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="college">단과대 <span class="required">*</span>
							</label>
							<div class="col-md-3 col-sm-3 col-xs-8">
								<select id="college" name="last-name" required="required"
									class="form-control col-md-6 col-xs-12">
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="middle-name"
								class="control-label col-md-3 col-sm-3 col-xs-12"
								for="majorName">학과명</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input id="majorName" class="form-control col-md-7 col-xs-12"
									type="text" name="majorName" required="required">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="count">학년별 최대 인원수 <span class="required">*</span>
							</label>
							<div class="col-md-3 col-sm-3 col-xs-8">
								<input type="number" id="count"
									class="date-picker form-control col-md-7 col-xs-12"
									required="required" type="text" min="0">
							</div>
						</div>
						<div class="ln_solid"></div>
						<div class="form-group">
							<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
								<button type="submit" class="btn btn-success">등록</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="../../Basic/footer.jsp"%>
	<script>
	var init_collegeSelector = function(facultys){
		for(var i=0; i<facultys.length; i++)
			$('#collegeSelector').append($('<option>', {
				value: facultys[i],
				text: facultys[i]
			}));
	}
	
	$(function(){
		getFacultys(init_collegeSelector);
	});
	</script>
</body>
</html>