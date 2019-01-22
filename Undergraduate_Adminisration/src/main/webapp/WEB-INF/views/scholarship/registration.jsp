<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>장학금 등록하기</h2>

<table border="1">
		<tr>
			<th>글 제목</th>
			<td colspan="3">
				<input type="text" maxlength="20" placeholder="글제목을 입력하세요" autofocus required>
			</td>
		</tr>
		
		<tr>
			<th>장학금 명</th>
			<td>
			<input type="text" maxlength="10" placeholder="장학금명을 입력하세요" autofocus required>
			</td>
			<th>유형  </th>
			<td colspan="3">
			<input type="text" maxlength="10" placeholder="장학금명을 입력하세요" autofocus required>
			</td>
		</tr>
		
		<tr>
			<th>파일</th><!--ex)다자녀,한부모 등등  -->
			<td colspan="3">
			<input type="file" name="image" type="button" type="button" readonly>
			</td>
		</tr>
		
		
		<tr>
			<th>내용</th>
			<td colspan="3">
			<textarea class="input" rows="20" cols="50" style="width:750" word-break-all></textarea>
			</td>
		</tr>
		
		<tr>
			<th colspan="4">
				<input class="inputButton" type="submit" value="작성">
				<input class="inputButton" type="reset" value="취소">
				<input class="inputButton" type="button" value="목록"
				onclick="window.location='boardList.bo?pageNum=${pageNum}'">
			</th>
		</tr>
	
		
	
	</table>
</body>
</html>