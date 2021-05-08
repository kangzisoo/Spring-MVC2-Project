<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 집은 신촌에 있나방</title>
<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">

<!-- Custom fonts for this template -->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link href="resources/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<link
	href="resources/vendor/fontawesome-free/css/all.min.css/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="resources/css/landing-page.min.css" rel="stylesheet"
	type="text/css">
<link href="resources/css/landing-page.css" rel="stylesheet"
	type="text/css">
<link href="resources/css/qall.css" rel="stylesheet"
type="text/css">
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<!-- <link rel="stylesheet" href="resources/css/qnamain.css"/> -->
</head>
<body>
	<%
		if (session.getAttribute("userid") == null) {
	%>
	<!-- Navigation : 맨 위 메뉴바 부분/ 모든 페이지에 공통적으로 들어갈 부분(메뉴바)-->
	<nav class="navbar navbar-light bg-light static-top">
		<div class="logo">
			<a class="navbar-brand" href="main.jsp">내 집은 신촌에 있나방</a>
		</div>
		<div id="menu">
			<!-- 세션처리 -->
			<a class="btn btn-primary btn-lg" href="productSummary2.jsp">방찾기</a>
			<a class="btn btn-primary btn-lg" href="#">마이페이지</a>
			<!-- href에 각자 만든 페이지 주소 넣어주기 -->
			<a class="btn btn-primary btn-lg" href="#">고객센터</a>
			<!-- href에 각자 만든 페이지 주소 넣어주기 -->
			<a class="btn btn-primary btn-lg" href="ruser_select.jsp">회원정보검색</a>
			<!-- href에 각자 만든 페이지 주소 넣어주기 -->
			<a class="btn btn-primary btn-lg" href="ruser_login.jsp">로그인</a>
			<a class="btn btn-primary btn-lg" href="signup.jsp">회원가입</a>
		</div>
		<header>
		<div class="qna_header_div">
			<h1 class="qna_header_title">MY 있나방</h1>
		</div>
		<div class="qna_body">
			<div class="qna_table_body">
				<div class="qna_notice">
					<div class="qna_notice_list">
						<p>최근 6개월 이내의 문의 내역을 확인하실 수 있습니다. (2021년 3월 이전에 문의하신 내용은 이메일로
							답변을 발송하여 본 페이지에서 내역 확인이 불가합니다.)</p>
						<p>문의하신 내용에 대한 수정 및 삭제는 답변 등록 이전에 가능합니다.</p>
						<p>고객센터 답변 가능 시간 : 평일 10:00~18:30 (토, 일요일, 공휴일 휴무)</p>
					</div>
						<a href="ruser_login.jsp" id="qnainsert" class="qna_insert_button">1:1 문의하기</a>
						<a href="ruser_login.jsp" id="qall" class="qna_insert_button">문의내역</a>
				</div>
			</div>
		</div>
	</header>
	<%
			} else {
		%>
	<!-- Navigation : 맨 위 메뉴바 부분/ 모든 페이지에 공통적으로 들어갈 부분(메뉴바)-->
	<nav class="navbar navbar-light bg-light static-top">
		<div class="logo">
			<a class="navbar-brand" href="main.jsp">내 집은 신촌에 있나방</a>
		</div>
		<div id="menu">
			<!-- 세션처리 -->
			<a class="btn btn-primary btn-lg" href="productSummary2.jsp">방찾기</a>
			<a class="btn btn-primary btn-lg" href="#">마이페이지</a>
			<!-- href에 각자 만든 페이지 주소 넣어주기 -->
			<a class="btn btn-primary btn-lg" href="#">방내놓기</a>
			<!-- href에 각자 만든 페이지 주소 넣어주기 -->
			<a class="btn btn-primary btn-lg" href="qnamain.jsp">고객센터</a>
			<!-- href에 각자 만든 페이지 주소 넣어주기 -->
			<a class="btn btn-primary btn-lg" href="ruser_update.jsp">회원정보수정</a>
			<!-- href에 각자 만든 페이지 주소 넣어주기 -->
			<a class="btn btn-primary btn-lg" href="ruser_delete.jsp">회원탈퇴</a>
			<!-- href에 각자 만든 페이지 주소 넣어주기 -->
			<div class="btn btn-primary btn-lg">${userid}님환영합니다.</div>
			<a class="btn btn-primary btn-lg" href="ruser_logout.jsp">로그아웃</a>
			<!-- href에 각자 만든 페이지 주소 넣어주기 -->
		</div>
	</nav>
	
	<!-- navigation 종료 -->
	<header>
		<div class="qna_header_div">
			<h1 class="qna_header_title">MY 있나방</h1>
		</div>
		<div class="qna_body">
			<div class="qna_table_body">
				<div class="qna_notice">
					<div class="qna_notice_list">
						<p>최근 6개월 이내의 문의 내역을 확인하실 수 있습니다. (2021년 3월 이전에 문의하신 내용은 이메일로
							답변을 발송하여 본 페이지에서 내역 확인이 불가합니다.)</p>
						<p>문의하신 내용에 대한 수정 및 삭제는 답변 등록 이전에 가능합니다.</p>
						<p>고객센터 답변 가능 시간 : 평일 10:00~18:30 (토, 일요일, 공휴일 휴무)</p>
					</div>
						<% if (session.getAttribute("userid").equals("admin")) { %>
						<a href="admin" id="admin" class="qna_insert_button">관리자 문의내역</a>
						<% } else { %>
						<a href="qnainsert.jsp" id="qnainsert" class="qna_insert_button">1:1 문의하기</a>
						<a href="qall" id="qall" class="qna_insert_button">문의내역</a>
						<% } %>
				</div>
			</div>
		</div>
	</header>
	<%	}	%>
</body>
</html>