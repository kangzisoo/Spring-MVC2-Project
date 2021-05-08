<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    response.sendRedirect("qall");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
문의 유형 : ${bag2.qtype}<br>
제목 : ${bag2.qtitle}<br>
등록일 : ${bag2.qdate}<br>
<a href="qnaupdate.jsp?qtype=${bag2.qtype}&qtitle=${bag2.qtitle}&qdate=${bag2.qdate}">수정</a>
<input id="delete" type="button" value="삭제">
</body>
</html>