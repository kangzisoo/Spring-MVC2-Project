<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String qid = request.getParameter("qid");
    	String qtype = request.getParameter("qtype");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="rinsert">
	<h2>문의하기</h2>
	<h5>궁금하신 점을 문의해주세요<br>문의내용과 답변은<span color="blue">'1:1 문의내역'</span>에서 확인하실 수 있습니다.</h5>
		문의 유형 : 
		<select name="qtype" readonly>
			<option selected><%= qtype %></option>
		</select><br>
		제목 : <input type="text" name="qtitle" readonly><br>
		내용 : <textarea rows="12" cols="30" name="qcontents" readonly></textarea><br>
		답변 : <textarea rows="12" cols="30" name="reply"></textarea><br>
		<button type="submit" value="제출버튼">답변하기</button>
	<input type="text" name="qid" value="<%= qid %>" style="display:none">
</form>
</body>
</html>

