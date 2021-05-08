<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
<link href="resources/css/qall.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		$('.del').click(function() {
			alert('삭제하시겠습니까?')
			$(this)
		})
	})
</script>

</head>
<body>
	<!-- Navigation : 맨 위 메뉴바 부분/ 모든 페이지에 공통적으로 들어갈 부분(메뉴바)-->
	<nav class="navbar navbar-light bg-light static-top">
		<div class="logo">
			<a class="navbar-brand" href="main.jsp">내 집은 신촌에 있나방</a>
		</div>
		<div id="menu">
			<!-- 세션처리 -->
			<a class="btn btn-primary btn-lg" href="productSummary2.jsp">방찾기</a>
			<a class="btn btn-primary btn-lg" href="mypage_main.jsp">마이페이지</a>
			<!-- href에 각자 만든 페이지 주소 넣어주기 -->
			<a class="btn btn-primary btn-lg" href="#">방내놓기</a>
			<!-- href에 각자 만든 페이지 주소 넣어주기 -->
			<a class="btn btn-primary btn-lg" href="qnamain.jsp">고객센터</a>
			<!-- href에 각자 만든 페이지 주소 넣어주기 -->
			<a class="btn btn-primary btn-lg" href="ruser_update.jsp">회원정보수정</a>
			<!-- href에 각자 만든 페이지 주소 넣어주기 -->
			<a class="btn btn-primary btn-lg" href="ruser_delete.jsp">회원탈퇴</a>
			<!-- href에 각자 만든 페이지 주소 넣어주기 -->
			<a class="btn btn-primary btn-lg" href="ruser_logout.jsp">로그아웃</a>
			<div class="btn btn-primary btn-lg">${userid}님환영합니다.</div>
			<!-- href에 각자 만든 페이지 주소 넣어주기 -->
		</div>
	</nav>
	<!-- navigation 종료 -->
	
	<!-- ********************header******************** -->
	<header>
		<div class="qna_header_div">
			<h1 class="qna_header_title">있나방 관리자페이지</h1>
		</div>
	</header>
	<!-- ********************header******************** -->
		
	<!-- ********************qna_table******************** -->	
	<div id="qna_table">
		<ul class="qna_table_title">
			<li class="qna_table_top">
				<div class="qna_table_menu">
					<div class="qna_table_category1">문의유형</div>
					<div class="qna_table_category2">제목</div>
					<div class="qna_table_category3">등록일</div>
				</div>
			</li>
		</ul>
		<!-- list에 저장된 데이터 값을 vo에 담아 출력 -->
		<c:forEach var="vo" items="${list}">
			<ul class="qna_list">
				<li class="qna_title">
					<p class="qna_accordion">
						<div class="qna_reply_category1">${vo.qtype}</div> <!-- 입력한 문의유형 -->
						<div class="qna_reply_category2">${vo.qtitle}</div> <!-- 입력한 제목 -->
						<div class="qna_reply_category3">${vo.qdate}</div> <!-- 자동등록된 등록일 -->
					</p>
				</li>
				<li>
					<div class="qna_table_contents">
						<p class="qna_contents_title">문의 내용</p>
						<div class="qna_contents">${vo.qcontents}</div> <!-- 입력한 문의내용 -->
						<div class="qna_update_delete">
							<a class="qna_update_button" href="reply.jsp?qid=${vo.qid}&qtype=${vo.qtype}&qtitle=${vo.qtitle}&qcontents=${vo.qcontents}&qdate=${vo.qdate}">답변</a>
							<!-- reply페이지로 vo에 담긴 qid, qtype, qtitle, qcontents, qdate 함께 전송 -->
							<p></p>
							<a class="qna_delete_button" href="qdelete?qid=${vo.qid}">삭제</a>
						</div>
						<div class="qna_table_reply">
							<p class="qna_reply_title">답변 내용</p>
							<div class="qna_reply">${vo.reply}</div>
							<!-- 관리자가 작성한 답변 -->
						</div>
					</div>
				</li>
			</ul>
		</c:forEach>
	</div>
		<!-- ********************qna_table******************** -->
</body>
</html>