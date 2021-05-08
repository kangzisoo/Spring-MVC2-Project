<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매물 상세 페이지</title>
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
<link rel="stylesheet" href="resources/css/bootstrap-multiselect.css" type="text/css">
<link rel="stylesheet" href="resources/css/product.css" type="text/css">
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
         <a class="btn btn-primary btn-lg" href="ruser_login.jsp">마이페이지</a> <a
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
         ${userid}님 환영합니다.
         <%
            }
         %>
      </div>
   </nav>
   <div style="margin: 0px 0px 0px 15px">
   <h3>매물 상세 페이지</h3>
   <hr color="green">
      <div class="detail">
         <table class="detail">
            <tr>
               <th>등록번호</th>
               <th>매물 종류</th>
               <th>계약 종류</th>
               <th>매물 이름</th>
               <th>가격(만원)</th>
               <th>매물 주소</th>
               <th>상세 주소</th>
            </tr>
            <tr>
               <!-- 브라우저에서 컨트롤러를 통해 넘어온 값(db에서 가져온 값(sql문))을 보여준다. -->
               <!-- ProductController에서 pdetail은 productVO2를 모델로 넘겨준다. -->
               <td>${productVO2.pnum}</td>
               <td>${productVO2.ptype}</td>
               <td>${productVO2.ctype}</td>
               <td>${productVO2.pname}</td>
               <td>${productVO2.price}</td>
               <td>${productVO2.address}</td>
               <td>${productVO2.address2}</td>
            </tr>
            <tr>
               <th>연락처</th>
               <th>층수(매물층/전체층)</th>
               <th>매물 크기(㎡)</th>
               <th>방갯수(방/화장실)</th>
               <th>전체 세대수</th>
               <th>땡세권</th>
               <th>진행상태</th>
            </tr>
            <tr>
               <!-- 브라우저에서 컨트롤러를 통해 넘어온 값(db에서 가져온 값(sql문))을 보여준다. -->
               <!-- ProductController에서 pdetail은 productVO2를 모델로 넘겨준다. -->
               <td>${productVO2.contact}</td>
               <td>${productVO2.floor}</td>
               <td>${productVO2.rsize}</td>
               <td>${productVO2.room}</td>
               <td>${productVO2.total}</td>
               <td>${productVO2.placetype}</td>
               <td>${productVO2.dstatue}</td>
            </tr>
         </table>
         <!-- 브라우저에 찍히는 구성을 위해 tr로 테이블 구분-->
      </div>
      <div style="margin: 0px 0px 0px 10px">
      <!-- 브라우저 페이지의 정렬을 위해서 div 스타일 지정 -->
         <table>
            <tr>
               <th>매물사진</th>
            </tr>
         </table>
      </div>
      <div style="margin: 0px 0px 0px 10px">
         <table>
            <tr>
               <!-- 브라우저에서 컨트롤러를 통해 넘어온 값(db에서 가져온 값(sql문))을 보여준다. -->
               <td rowspan="2"><img src="resources/rimg/${productVO2.roomimg}" height="640" width="960"></td>
               <td><img src="resources/rimg/${productVO2.roomimg2}" height="320" width="630"></td>
               <!-- 사진은 3개가 들어가는 구조이므로 rowspan을 사용해서 셀 병합처리 -->
            </tr>
            <tr>
               <td><img src="resources/rimg/${productVO2.roomimg3}" height="320" width="630"></td>
            </tr>
         </table>
      </div>
      <div style="margin: 0px 0px 0px 10px">
         <h6>매물 정보</h6>
      </div>
      <div style="margin: 0px 0px 0px 10px">
         ${productVO2.pinfo}
      </div>
      <div style="margin: 0px 0px 0px 10px">
         <button onclick="location.href='PUpdate2.jsp?pnum=${productVO2.pnum}&pname=${productVO2.pname}&ptype=${productVO2.ptype}&ctype=${productVO2.ctype}&price=${productVO2.price}&address=${productVO2.address}&address2=${productVO2.address2}&contact=${productVO2.contact}&floor=${productVO2.floor}&rsize=${productVO2.rsize}&room=${productVO2.room}&total=${productVO2.total}&placetype=${productVO2.placetype}&roomimg=${productVO2.roomimg}&pinfo=${productVO2.pinfo}&dstatue=${productVO2.dstatue}'">수정</button>
         <!-- 수정버튼 클릭시 update 페이지로 이동! db값 다 넘겨줘야 수정페이지에서 찍어 줄 수 있다. -->
         <button onclick="location.href='PDelete2.jsp?pnum=${productVO2.pnum}&contact=${productVO2.contact}'">삭제</button>
         <!-- 삭제버튼 클릭시 delete 페이지로 이동! db값 넘겨줘야 삭제페이지에서 찍어 줄 수 있다. -->
      </div>
   <a href="select?contact=${contact}" style="margin: 0px 0px 0px 10px">
      <button>돌아가기</button>
      <!-- 돌아가기 버튼 클릭시 컨트롤러의 가상주소 select로 contact 값을 넘겨준다. -->
   </a>
   </div>
</body>
</html>