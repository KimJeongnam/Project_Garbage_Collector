<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#a{
text-align: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>장학금 신청 조회</h2>
	<div>
	<input type="button" value="조회">
		<table border="1">
			<tr id="a" >
				<td width="100px">
					학생명
				</td>
				<td width="100px">
					학년
				</td>
				<td width="100px">
					학기
				</td>
				<td width="200px">
					장학금명
				</td>
				<td width="200px">
					장학금 금액
				</td>
				<td width="200px">
					지급 일자
				</td>
				
				<td width="200px">
					합/불 여부
				</td> <!-- 불합격시 사유 e-mail 통보   -->
			</tr>
			
		</table>
	</div>
</body>
</html>