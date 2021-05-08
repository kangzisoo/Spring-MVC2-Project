<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<script>
    $(function() { 
		$( "#dialog" ).dialog();
	} );
   	</script>
    <title>SignUp</title>
    
        <style>
        .container {
            width: 500px;
            margin: 40px auto;
            line-height: 16px;
        }
        h5 {
        	font-size: 20px;
            text-align: left;
        }
        h5 span {
            color: rgb(18, 70, 184);
        }
        #signup {
            background-color: rgb(18, 70, 184);
            color: white;
            border: 0;
            border-radius: 5px;
            padding: 20px 210px;
        }
        #gohome {
            background-color: rgb(18, 70, 184);
            color: white;
            border: 0;
            border-radius: 5px;
            padding: 20px 224px;
        }
        .bottom input {
            background-color: white;
            border: 0;
            color: teal;
            font-size: 16px;
        }
        input {
            border: 1px solid lightgray;
            border-radius: 3px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h5><span>회원정보</span></h5>
        <hr><br>
        
        <form action="ruser_update.jsp">
        <div class="register">
            
            <input type="password" id="pw1" placeholder="비밀번호" required style="height:30px; width: 495px"><br><br>
            <div id="pw1check" style="float:left;"></div>
            
            <input type="password" id="pw2" placeholder="비밀번호 확인" name="userpw" required style="height:30px; width: 495px"><br><br>
            <div id="pw2check" style="float:left;"></div>
            
            <input type="text" id="tel" placeholder="전화번호('-'없이 번호만 입력해주세요)" name="usertel" required style="height:30px; width: 495px"><br><br>
            <div id="telcheck" style="float:left;"></div>
            
            <input type="email" id="email" placeholder="이메일 주소" name="useremail" required style="height:30px; width: 495px"><br><br>
            <div id="emailcheck" style="float:left;"></div>
            
			<select id="type" class="sel" name="usertype" style="height:30px; width: 500px">
				<option>거래형태</option>
					<option value="매매">매매</option>
					<option value="전세">전세</option>
					<option value="월세">월세</option>
				</select><br><br>
			<select id="room" class="sel" name="userroom" style="height:30px; width: 500px">
				<option>방개수</option>
					<option value="아파트">아파트</option>
					<option value="쓰리룸">쓰리룸</option>
					<option value="투룸">투룸</option>
					<option value="원룸">원룸</option>
				</select><br><br>
			<select id="interest" class="sel" name="userinterest" style="height:30px; width: 500px">
				<option>편의시설</option>
					<option value="역세권">역세권</option>
					<option value="편세권">편세권</option>
					<option value="스세권">스세권</option>
					<option value="학세권">학세권</option>
					<option value="병세권">병세권</option>
					<option value="팍세권">팍세권</option>
			</select><br><br>
			<p>
            <input type="submit" value="회원정보수정" id="signup"><br><br>
            <input type="hidden" name="userid" value="${userid}">
            </p>
            <div id="dialog" title="">
  				<p>수정완료</p>
			</div>
        </div>
        </form>
		<form action="main.jsp">
		<input type="submit" value="메인으로" id="gohome"></form>
    </div>
</body>
</html>