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
                            <h3>교직업무</h3>
                        </div>

                        <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
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
                        <div class="col-md-6 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>강의<small></small></h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <p class="text-muted font-13 m-b-30">
                                    	<div class="col-md-6">
	                                        <label for="selector-college">단과대</label>
	                                        <div class="col-md-3 col-sm-3 col-xs-8">
		                                        <select name="selector-college" class="col-md-6">
		                                        
		                                        </select>
	                                        </div>
	                                        
	                                        <label for="selector-major">학과</label>
	                                        <div class="col-md-3 col-sm-3 col-xs-8">
		                                        <select name="selector-major" class="col-md-6">
		                                        	<option>유도학과</option>
		                                        </select>
	                                        </div>
                                        </div>
                                    </p>
                                    <table class="table table-striped jambo_table bulk_action">
                                        <thead>
                                            <tr class="headings">
                                                <th>
                                                    <input type="checkbox" id="check-all" class="flat" name="table_records">
                                                </th>
                                                <th class="text-center">학과코드</th>
                                                <th class="text-center">단과대</th>
                                                <th class="text-center">학과명</th>
                                                <th class="text-center">학년별 최대 인원수</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <input type="checkbox" class="flat" name="table_records">
                                                </td>
                                                <td class="text-center">A8157</td>
                                                <td class="text-center">무도대학</td>
                                                <td class="text-center">유도학과</td>
                                                <td class="text-center">150</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <!-- <button>신규</button><button>수정</button><button>삭제</button> -->
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12 col-xs-12">
							<div class="x_panel">
                                <div class="x_title">
                                	<h2>학과 등록<small></small></h2>
                                	<div class="clearfix"></div>
                                </div>
                                
                                <div class="x_content">
										<form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="majorCode">학과 코드 <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="majorCode" required="required" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="college">단과대 <span class="required">*</span>
                                            </label>
                                            <div class="col-md-3 col-sm-3 col-xs-8">
                                                <select id="college" name="last-name" required="required" class="form-control col-md-6 col-xs-12">
                                                	<option disabled="disabled" selected="selected">선택하세요</option>
                                                	<option>체육과학대</option>
                                                	<option>공과대</option>
                                                	<option>인문대</option>
                                                	<option>사범대</option>
                                                	<option>경영대</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12" for="majorName">학과명</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="majorName" class="form-control col-md-7 col-xs-12" type="text" name="majorName">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="count">학년별 최대 인원수 <span class="required">*</span>
                                            </label>
                                            <div class="col-md-3 col-sm-3 col-xs-8">
                                                <input type="number" id="count" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text">
                                            </div>
                                        </div>
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                <button class="btn btn-primary" type="reset">초기화</button>
                                                <button type="submit" class="btn btn-success">수정/등록</button>
                                            </div>
                                        </div>
                                    </form>
	                            </div>
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