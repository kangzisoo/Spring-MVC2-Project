<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
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
            padding: 20px 212px;
        }
        #gohome {
            background-color: rgb(18, 70, 184);
            color: white;
            border: 0;
            border-radius: 5px;
            padding: 20px 228px;
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
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function() {
	//비밀번호 유효성검사
	$('#pw1').blur(function() {
		pw1 = $('#pw1').val()
		//최소 8자이상, 대소문자, 숫자 및 특수문자 각 하나씩 이상 
		regex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/
		console.log(pw1)
			if (false == regex.test(pw1)) {
				$('#pw1check').html('<h6 style=color:red;>비밀번호는 8자 이상, 숫자/대소문자/특수문자를 모두 포함해야 합니다.</h6>')
			} else {
				$('#pw1check').html('')
			}
	}) //pw1
	
	//비밀번호 확인
	$('#pw2').blur(function() {
		pw1 = $('#pw1').val()
		pw2 = $('#pw2').val()
		console.log(pw1)
		console.log(pw2)
			
		if (pw1 == pw2) {
			$('#pw2check').html('')
		} else {
			$('#pw2check').html('<h6 style=color:red;>비밀번호가 일치하지 않습니다.</h6>')
		}
	}) //pw2
	
	//전화번호 유효성 검사
	$('#tel').blur(function() {
		
		//01x(3자로 시작), 0-9까지중 3, 4자리, 0-9까지중 4자리
        regex = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/
        result = regex.exec($("#tel").val());
		
		if (result != null) {
			$('#telcheck').html('')
		} else {
			$('#telcheck').html('<h6 style=color:red;>올바른 번호가 아닙니다.</h6>')
		}
	})
	
	//이메일주소 유효성 검사
	$('#email').blur(function() {
		
		//숫자, 영문대소문자 및 특수문자 사용 가능하며 중앙에 @ 필수, .뒤에 2~3자 더 필요
        regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
        result = regex.exec($("#email").val());
		
		if (result != null) {
			$('#emailcheck').html('')
		} else {
			$('#emailcheck').html('<h6 style=color:red;>올바른 이메일 주소가 아닙니다.</h6>')
		}
	})

	</script>
</head>

<body>
    <div class="container">
        <h5><span>회원정보수정</span></h5>
        <hr><br>
        
        <form action="ruser_update" >
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
					<option value="단독/다가구">단독/다가구</option>
					<option value="아파트">아파트</option>
					<option value="오피스텔">오피스텔</option>
				</select><br><br>
			<select id="interest" class="sel" name="userinterest" style="height:30px; width: 500px">
				<option>편의시설</option>
					<option value="역세권">역세권</option>
					<option value="편세권">편세권</option>
					<option value="스세권">스세권</option>
					<option value="학세권">학세권</option>
					<option value="숲세권">숲세권</option>
			</select><br><br>
			<p>
            <input type="submit" value="회원정보수정" id="signup"><br><br>
            <input type="hidden" name="userid" value="${userid}">
            </p>
        </div>
        </form>
    </div>
</body>
</html>