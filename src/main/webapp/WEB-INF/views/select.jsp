<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 사용하기 위해서 c를 정의해준다. -->
<html>
<head>
<meta charset="UTF-8">
<title>매물 등록 현황</title>
<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<!-- Custom fonts for this template -->
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="resources/vendor/fontawesome-free/css/all.min.css/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="resources/css/landing-page.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/landing-page.css" rel="stylesheet" type="text/css">

<!-- 제이쿼리 -->
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>

<!-- Include the plugin's CSS and JS: -->
<script type="text/javascript" src="resources/js/bootstrap-multiselect.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap-multiselect.css" type="text/css" />
<link rel="stylesheet" href="resources/css/product.css" type="text/css" />
<!-- Initialize the plugin: -->
</head>
<body>
	<!-- Navigation : 위에 부분-->
	<nav class="navbar navbar-light bg-light static-top">
		<div class="logo">
			<a class="navbar-brand" href="main.jsp">내 집은 신촌에 있나방</a>
		</div>
		<div id="menu">
			<a class="btn btn-primary btn-lg" href="productSummary2.jsp">방찾기</a>
			<a class="btn btn-primary btn-lg" href="mypage_main.jsp">마이페이지</a> <a
				class="btn btn-primary btn-lg" href="PMain.jsp">방내놓기</a> <a
				class="btn btn-primary btn-lg" href="qnamain.jsp">고객센터</a>
			<!-- 세션처리 -->
			<%
				if (session.getAttribute("userid") == null) {
			%>
			<a class="btn btn-primary btn-lg" href="ruser_login.jsp">로그인</a>
			<%
				} else {
			%>
			<a class="btn btn-primary btn-lg" href="ruser_logout.jsp">로그아웃</a>
			<!-- href에 각자 만든 페이지 주소 넣어주기 -->
			<div class="btn btn-primary btn-lg">${userid}님 환영합니다.</div>
			<%
				}
			%>
		</div>
	</nav>
	<div style="margin: 0px 0px 0px 15px">
	<h3>등록된 매물 현황</h3>
	<!-- 등록된 매물 전체를 보여주는 페이지로 간략 정보만 노출 -->
	<hr color="green">
	<table>
		<tr>
			<th>등록번호</th>
			<th>매물 종류</th>
			<th>계약 종류</th>
			<th>매물 이름</th>
			<th>가격(만원)</th>
			<th>매물 크기(단위㎡)</th>
			<th>수정/삭제</th>
			<!-- 대표 목록은 굵은 글씨 포인트 주기위해 th 사용 -->
		</tr>
		<c:forEach var="vo" items="${userCon}">
			<!-- jstl로 foreach문 사용 가능! 변수를 vo로 사용하고 가져올 data정보는 userCon에서 가져온다. -->
			<tr class="mouseon" onclick="location.href='pdetail?pnum=${vo.pnum}'">
			<!-- tr에 class를 지정해줘서 css를 사용할 수 있다. tr영역에 마우스 올리면 색상변경 hover 사용 -->
				<td>${vo.pnum}</td>
				<td>${vo.ptype}</td>
				<td>${vo.ctype}</td>
				<td>${vo.pname}</td>
				<td>${vo.price}</td>
				<td>${vo.rsize}</td>
				<td onclick="event.cancelBubble=true">
				<!-- 수정/삭제 td에는 hover이벤트를 예외처리해서 수정과 삭제 페이지로 넘어가게 진행 -->
					<button onclick="location.href='PUpdate.jsp?pnum=${vo.pnum}&pname=${vo.pname}&ptype=${vo.ptype}&ctype=${vo.ctype}&price=${vo.price}&address=${vo.address}&contact=${vo.contact}&floor=${vo.floor}&rsize=${vo.rsize}&room=${vo.room}&total=${vo.total}&placetype=${vo.placetype}&roomimg=${vo.roomimg}&pinfo=${vo.pinfo}&dstatue=${vo.dstatue}&address2=${vo.address2}'">수정</button>
					<!-- 수정버튼 클릭시 userCon에 있는 data를 전부 PUpdate 페이지로 넘겨준다. -->
					<button onclick="location.href='PDelete.jsp?pnum=${vo.pnum}&contact=${vo.contact}'">삭제</button>
					<!-- 수정버튼 클릭시 userCon에 있는 pnum과 contact값을 PDelete 페이지로 넘겨준다. -->
				</td>
			</tr>
		</c:forEach>
		<!-- foreach 반복문을 통해 조건에 많는 row를 다 가져온다. -->
	</table>
		<button onclick="location.href='PCreate3.jsp'">방 내놓기</button> <!-- 방 내놓기 버튼 클릭시 a태그를 사용해 PCreate 페이지로 이동 -->
		<button onclick="location.href='PMain.jsp'">다른 번호 매물확인하기</button> <!-- 다른 번호 매물확인하기 버튼 클릭시 a태그를 사용해 PMain 페이지로 이동 -->
	</div>
</body>
</html>