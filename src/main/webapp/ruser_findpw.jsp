<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
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
        #select {
            background-color: rgb(18, 70, 184);
            color: white;
            border: 0;
            border-radius: 7px;
            padding: 20px 228px;
        }
        #ruserselect {
            background-color: rgb(18, 70, 184);
            color: white;
            border: 0;
            border-radius: 7px;
            padding: 20px 222px;
        }
        #findpw {
            background-color: rgb(18, 70, 184);
            color: white;
            border: 0;
            border-radius: 7px;
            padding: 20px 208px;
        }
        input {
            border: 1px solid lightgray;
            border-radius: 3px;
        }
    	</style>
</head>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript"></script>
<body>
    <div class="container">
        <h5><span>회원정보검색</span></h5>
        <hr><br>
        
		<form action="ruser_findpw">
			<div class="select">
				<input type="text" id="id" placeholder="아이디" name="userid" required style="height:30px; width: 490px"><br><br>			
				<input type="text" id="email" placeholder="이메일주소" name="userpw" required style="height:30px; width: 490px"><br><br>
				<input type="text" id="birth" placeholder="생년월일(8자리)" name="userbirth" required style="height:30px; width: 490px"><br><br>
				<input type="submit" value="비밀번호찾기" id='findpw'><br><br>
			</div>
		</form>
	</div>
</body>
</html>