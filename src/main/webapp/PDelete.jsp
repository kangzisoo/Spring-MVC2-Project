<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pnum = request.getParameter("pnum");
	String contact = request.getParameter("contact");
%>
<!-- 넘겨준 pnum값과 contact값을 받아주는 처리 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록한 매물 삭제 페이지</title>
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
	
<!-- Include the plugin's CSS and JS: -->
<script type="text/javascript" src="resources/js/bootstrap-multiselect.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap-multiselect.css" type="text/css"/>

<!-- jquery를 사용하기 위한 주소 설정 -->
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		$("#b1").click(function() {
		// id가 b1 인 버튼을 클릭했을때 아래를 실행
			if (confirm("<%=pnum%>번 매물를 삭제하시겠습니까 ?") == true) {
			// 매물번호를 확인 하는 팝업창 노출.
				$.ajax({// ajax를 통해서 연결된 url로 data 보내기
					url : "delete", // 컨트롤러의 가상주소 delete로 연결
					data : {
						pnum : $("#pnum").val()
						// delete 가상주소로 넘겨줄 값은 pnum의 val(값)을 넘겨줌
					},
					success : function() {
						alert("삭제가 완료되었습니다.")
						// data를 delete url로 넘겨주면 삭제완료 alert 실행
					}
				})
				location.href = "select?contact=" + $("input[name=contact]").val()
				// ajax 실행 후 다시 매물 리스트를 보여주는 select로 연결!(contact값으로 등록매물 노출)
			}
		})
	})
</script>
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
	<div style="margin: 0px 0px 0px 15px">
	<h3>등록 매물 삭제 페이지 입니다.</h3>
	<hr color="red">
		삭제할 매물 번호를 확인해주세요 : <input id="pnum" value="<%=pnum%>" readonly><br>
		삭제할 매물과 연결된 번호 확인 : <input name="contact" value="<%=contact%>" readonly><br>
		<!-- 삭제할 매물 번호를 받아온 값으로 자동 입력시킨다. -->
		<button type="button" id="b1">삭제하기</button>
	<a href="select?contact=${contact}">
	<!-- 돌아가기 클릭시 select 페이지로 contact 값을 가지고 이동 -->
		<button>돌아가기</button>
	</a>
	</div>
</body>
</html>