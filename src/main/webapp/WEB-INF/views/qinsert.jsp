<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    response.sendRedirect("qall");
    /* redirect로 all 페이지로 넘겨주기 */
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
문의 유형 : ${qnaVO.qtype}<br>
제목 : ${qnaVO.qtitle}<br>
등록일 : ${qnaVO.qdate}<br>
<a href="qnaupdate.jsp?qid=${bag2.qid}&qtype=${bag2.qtype}&qtitle=${bag2.qtitle}&qdate=${bag2.qdate}">수정</a>
<button id="del" value="삭제"></button>
</body>
</html>