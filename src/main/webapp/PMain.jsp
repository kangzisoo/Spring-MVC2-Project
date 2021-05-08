<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>방 내놓기 메인페이지</title>
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
<script type="text/javascript" src = "resources/js/jquery-3.6.0.js"></script>

<!-- Include the plugin's CSS and JS: -->
<script type="text/javascript" src="resources/js/bootstrap-multiselect.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap-multiselect.css" type="text/css"/>
<link rel="stylesheet" href="resources/css/product.css" type="text/css"/>
<!-- Initialize the plugin: -->
</head>
	<body>
			<!-- Navigation : 위에 부분-->
	<nav class="navbar navbar-light bg-light static-top">
		<div class="logo">
			<a class="navbar-brand" href="main.jsp">내 집은 신촌에 있나방</a>
		</div>
		<div id="menu">
			<a class="btn btn-primary btn-lg" href="productSummary.jsp">방찾기</a> 
			<a class="btn btn-primary btn-lg" href="mypage_main.jsp">마이페이지</a> 
			<a class="btn btn-primary btn-lg" href="PMain.jsp">방내놓기</a> 
			<a class="btn btn-primary btn-lg" href="qnamain.jsp">고객센터</a> 
			<!-- 세션처리 -->
			<% if(session.getAttribute("userid") == null){ %>
			<a class="btn btn-primary btn-lg" href="ruser_login.jsp">로그인</a>
			<% }else{ %>
			<a class="btn btn-primary btn-lg" href="ruser_logout.jsp">로그아웃</a><!-- href에 각자 만든 페이지 주소 넣어주기 -->
			<div class="btn btn-primary btn-lg">${userid}님 환영합니다.</div>
			<%} %>
		</div>
	</nav>
	<div class="center">
	<!-- div설정을 통해서 css를 활용해서 div내에 위치한 태그들을 화면 가운데 위치시킨다. -->
		<form action="select">
		매물거래시 연락 가능한 번호를 입력해주세요(-생략)<br> 
		<!-- 입력한 번호값을 controller의 가상주소 select로 보내준다. -->
		<div style="margin: 0px 0px 0px 45px;">
		<input name = "contact" style="text-align:center">
		<!-- 입력된 번호를 contact로 지정하여 받아줄때 사용한다. -->
		<button>방 내놓기</button>
		<!-- form 안에 있는 버튼은 default값이 submit이다. -->
		</div>
		</form>
	</div>
	</body>
</html>