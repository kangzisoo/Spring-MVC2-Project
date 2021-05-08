<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String userid = (String)session.getAttribute("userid");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<!-- 마이페이지 메인 부분 CSS - 버튼 설정-->
<style>
#btn1{
	border-top-left-radius: 15px; 
	border-bottom-left-radius: 15px;
	margin-right:-2.5px;
	}
#btn2{
	border-top-right-radius: 15px; 
	border-bottom-right-radius: 15px;
	margin-left:-2.5px;
	}
#btn_group button{
	border: 4px solid skyblue;
/* 	background-color: skyblue; */
	color: black;
	padding: 25px;
	font-size: 30px;
	}
#btn_group button:hover{
	color:white; 
	background-color: RGB(23, 108, 249);
	}
</style>

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
<!-- Initialize the plugin: -->
</head>
<body>
	<nav class="navbar navbar-light bg-light static-top">
		<div class="logo">
		<a class="navbar-brand" href="main.jsp">내 집은 신촌에 있나방</a>
		</div>
		<div id="menu">
		 <!-- 세션처리 -->
		<% if(session.getAttribute("userid") == null){ %>
		<a class="btn btn-primary btn-lg" href="ruser_login.jsp">로그인</a>
		<% }else{ %>
		 <a class="btn btn-primary btn-lg" href="productSummary.jsp">방찾기</a>
		 <a class="btn btn-primary btn-lg" href="mypage_main.jsp">마이페이지</a> <!-- href에 각자 만든 페이지 주소 넣어주기 -->
		 <a class="btn btn-primary btn-lg" href="#">방내놓기</a><!-- href에 각자 만든 페이지 주소 넣어주기 -->
		 <a class="btn btn-primary btn-lg" href="#">고객센터</a><!-- href에 각자 만든 페이지 주소 넣어주기 -->
		 <a class="btn btn-primary btn-lg" href="ruser_update.jsp">회원정보수정</a><!-- href에 각자 만든 페이지 주소 넣어주기 -->
		 <a class="btn btn-primary btn-lg" href="ruser_delete.jsp">회원탈퇴</a><!-- href에 각자 만든 페이지 주소 넣어주기 -->
		<div class="btn btn-primary btn-lg">${userid}님 환영합니다.</div>
		<a class="btn btn-primary btn-lg" href="ruser_logout.jsp">로그아웃</a><!-- href에 각자 만든 페이지 주소 넣어주기 -->
		<%} %>
		</div>
	</nav>
	<h3>마이페이지</h3>
	<hr>
	<!-- 버튼 클릭 시 userid세션을 가지고, 각 view 페이지로 이동 -->
	<div id="btn_group" align="center">
	<button id="btn1" onclick="location='recent_select?userid=<%=userid%>'">최근 본 상품 </button>
	<button id="btn2" onclick="location='liked_select?userid=<%=userid%>'">찜한 상품</button>
	</div>
</body>
</html>