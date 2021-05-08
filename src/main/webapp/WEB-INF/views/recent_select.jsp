<%@page import="java.lang.reflect.Array"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.NEW"%>
<%@page import="com.mega.project.MypageVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
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

<title>마이페이지 - 최근 본 상품</title>

</head>
<body>
 <!-- Navigation : 맨 위 메뉴바 부분/ 모든 페이지에 공통적으로 들어갈 부분(메뉴바)-->
  <nav class="navbar navbar-light bg-light static-top">
     <div class="logo">
     <a class="navbar-brand" href="main.jsp">내 집은 신촌에 있나방</a>
     </div>
    <div id="menu">
		 <a class="btn btn-primary btn-lg" href="productSummary.jsp">방찾기</a>
		 <a class="btn btn-primary btn-lg" href="mypage_main.jsp">마이페이지</a> <!-- href에 각자 만든 페이지 주소 넣어주기 -->
		 <a class="btn btn-primary btn-lg" href="PMain.jsp">방내놓기</a><!-- href에 각자 만든 페이지 주소 넣어주기 -->
		 <a class="btn btn-primary btn-lg" href="#">고객센터</a><!-- href에 각자 만든 페이지 주소 넣어주기 -->
		 <a class="btn btn-primary btn-lg" href="ruser_update.jsp">회원정보수정</a><!-- href에 각자 만든 페이지 주소 넣어주기 -->
		 <a class="btn btn-primary btn-lg" href="ruser_delete.jsp">회원탈퇴</a><!-- href에 각자 만든 페이지 주소 넣어주기 -->
		<a class="btn btn-primary btn-lg" href="ruser_logout.jsp">로그아웃</a><!-- href에 각자 만든 페이지 주소 넣어주기 -->
		<div class="btn btn-primary btn-lg">${userid}님 환영합니다.</div>
    </div>
  </nav><!-- navigation 종료 -->
  
${userid} 님의 최근 본 상품 <br>
<hr color="blue">
<!-- 화면에 찍어줄 것: 상품넘버를 통해 얻어온 상품 정보들 -->
<c:forEach var="list2" items="${list2}">
<%-- 아이디: ${list2.userid} <!-- 표현언어(Expression Languages:EL), 속성프린트 --><br>
상품번호: ${list2.pnum} --%>
 <img src ="resources/rimg/${list2.roomimg}" height = 100px>  
<a href = "productdetail.jsp?pnum=${list2.pnum}"><button style="background-color:RGB(23, 108, 249); color: white; margin-left: 5px">>> 상품 보기</button></a><br>
이름 :  ${list2.pname}<br> <!-- 상품 이름 -->
타입 :  ${list2.ptype}<br> <!-- 상품 종류 -->
특징 :  ${list2.placetype}<br> <!-- 땡세권 -->
가격 :  ${list2.price}<br> <!-- 상품 가격 -->
거래상태 :  ${list2.dstatue}<br> <!-- 거래가능/협의중/계약완료 -->
조회시간: ${list2.time2}<br> <!-- 상품 조회 시간 -->
<br>
</c:forEach>
<button onclick="goBack()" style="background-color:RGB(23, 108, 249); color: white; margin-left: 5px; padding:5px 20px">이전 페이지로</button>
<script>
	function goBack() { /* 버튼을 누르면 이전 페이지로 돌아가기 */
	    window.history.back();
	}
</script>
<hr color="blue">
</body>
</html>