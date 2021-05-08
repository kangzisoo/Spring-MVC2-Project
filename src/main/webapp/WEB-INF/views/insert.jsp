<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	등록이 완료되었습니다.
	<!-- 맵퍼를 통해 DB에 data 저장이 완료되면 views를 통해서 보여줌. -->
	<a href="select?contact=${contact}">
		<button>목록으로</button>
	</a>
</body>
</html>