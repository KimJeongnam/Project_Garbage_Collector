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
						<h2>장학금 심사</h2>
									<div style="width: 1400px;">
									년<select>
										<option value=""></option>
									</select>
									월<select>
										<option value=""></option>
									</select>
									일<select>
										<option value=""></option>
									</select>
									~
									
									년<select>
										<option value=""></option>
									</select>
									월<select>
										<option value=""></option>
									</select>
									일<select>
										<option value=""></option>
									</select>
										<table class="table">
											<tr id="a" >
												<td style ="width:10%">
													학생명
												</td>
												<td style ="width:10%">
													학년
												</td>
												<td style ="width:10%">
													학기
												</td>
												<td style ="width:20%">
													장학금명
												</td>
												<td style ="width:20%">
													장학금 금액
												</td>
												<td style ="width:20%">
													지급 일자
												</td>
												
												<td style ="width:10%">
													합/불 여부
												</td> <!-- 불합격시 사유 e-mail 통보   -->
											</tr>
											
											<tr id="a" >
												<td style ="width:10%">
													박대근
												</td>
												<td style ="width:10%">
													1
												</td>
												<td style ="width:10%">
													1
												</td>
												<td style ="width:20%">
													한부모 가정
												</td>
												<td style ="width:20%">
													100000000
												</td>
												<td style ="width:20%">
													2006.01.01
												</td>
												
												<td style ="width:10%">
													합
												</td> <!-- 불합격시 사유 e-mail 통보   -->
											</tr>
											
										</table>
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