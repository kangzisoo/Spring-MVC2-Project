<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매물 등록 페이지입니다.</title>
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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 다음의 주소 api를 사용하기 위한 경로설정 -->
<script type="text/javascript"> //실제로 사용할 js는 script 사이에 위치 시킨다.
	$(function() {
		$("#b1").click(function() {// id가 b1인 버튼을 클릭했을때 아래를 수행한다.
			if (confirm("등록하시겠습니까 ?") == true) { // 컨펌 팝업을 띄워서 등록 리체크 기능
				var form = $("#form").serialize();
				// serialize를 사용해서 id가 form인 부분에 있는 모든 값을 form 변수에 넣어준다.
				$.ajax({
				// ajax를 통해서 입력받은 form은 가상주소 insert로 보내고 alert를 통해 등록 완료 체크
					url : "insert",
					data : form,
					success : function() {
						alert("등록이 완료되었습니다.")

					}
				})
				// ajax 실행 후 다시 select 게시판으로 돌아가는 location
				location.href = "select?contact=" + $("input[name=contact]").val()
				// 등록된 번호(contact)를 가져와서 db와 매칭되는 data를 보여준다.
			}
		})
	})
	// 다음 주소 api 사용하는 js
	function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                // console.log(data.zonecode);
                console.log(fullRoadAddr);
                // 내가 사용할 주소값만 놓고 나머지는 막아준다.
                
                
                // $("[name=address]").val(data.zonecode);
                $("[name=address]").val(fullRoadAddr);
                // 내가 사용할 주소값을 address라는 입력창에 넣어준다.(찍어준다.)
                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
         }).open();
     }

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
	<h3>매물 등록하는 페이지 입니다.</h3>
	<hr color='blue'>
	<form id="form"> <!-- id를 form으로 잡아놓은 이유는 js에서 serialize를 사용하기 위해서 -->
	<!-- serialize를 통해서 아래 name으로 잡혀 있는 모든 값을 한번에 받아서 넘길 수 있다. -->
		매물 이름 : <input name="pname"><br>
		매물 종류 : <select	name="ptype">
					<option value="아파트">아파트</option>
					<option value="오피스텔">오피스텔</option>
					<option value="단독/다가구">단독/다가구</option>
				</select><br>
		계약 종류 : <select name="ctype">
					<option value="매매">매매</option>
					<option value="전세">전세</option>
					<option value="월세">월세</option>
				</select><br>
		매물 가격(만원) : <input name="price"><br>
		매물 주소 : <button type="button" onclick="execPostCode();">주소검색하기</button><br>
		<!-- 주소검색하기 클릭시 위의 js의 다음 주소 api를 실행한다. -->
		<input name="address" placeholder="도로명 주소" readonly><br>
		<!-- address를 readonly한 이유는 위의 주소 api를 통해서 address부분에 찍어주기 때문
		수정 할 수 없게 막아 놓는 처리 -->
		<input name="address2" placeholder="상세주소"><br>
		<!-- 도로명주소로 전체 주소를 찾고 상세주소는 직접 입력하는 address2 -->
		 연락처 : <input name="contact" value="${contact}" readonly>
      <!-- 입력된 contact 값을 받아서 다른 번호로 수정 할 수 없게 막아주는 처리 -->
      <p style="font-size: 11px; color: red;">(다른 번호 등록시 등록할 번호로 로그인해 주세요)</p>
      <!-- p 태스를 사용해서 다른 번호로 등록할 경우에 대한 안내문 -->
		층수(매물층/건물층) : <input name="floor"><br>
		크기(단위㎡) : <input	name="rsize"><br>
		방 갯수(방/화장실) : <input name="room"><br>
		전체 세대수 : <input name="total"><br>
		땡세권(택1) : <select name="placetype"> 
						<option value="역세권">역세권</option>
						<option value="편세권">편세권</option>
						<option value="학세권">학세권</option>
						<option value="숲세권">숲세권</option>
						<option value="스세권">스세권</option>
				</select><br>
		거래 상태 : <select name="dstatue">
					<option value="거래가능">거래가능</option>
					<option value="협의중">협의중</option>
					<option value="계약완료">계약완료</option>
				</select><br>
		매물 사진 : <input name="roomimg"><br>
		매물 사진 : <input name="roomimg2"><br>
		매물 사진 : <input name="roomimg3"><br>
		매물 상세정보<br>
			<textarea name="pinfo" rows="20" cols="100"></textarea><br>
		<button type="button" id="b1">등록하기</button>
		<!-- 버튼의 id를 b1으로 하여 버튼 클릭시 js의 b1클릭 후 처리를 진행! -->
	<a href="select?contact=${contact}">
	<!-- a태그를 이용해서 돌아가기 버튼을 클릭시 contact 값을 가지고 select(가상주소)로 이동 -->
		<button type="button">돌아가기</button>
		<!-- form안에 버튼을 둬서 브라우저에 버튼 2개가 나란하게 위치함. -->
	</a>
	</form>
	</div>
</body>
</html>