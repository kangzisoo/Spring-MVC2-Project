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
        input {
            border: 1px solid lightgray;
            border-radius: 3px;
        }
    	</style>
</head>
<body>
    <div class="container">
        <h5><span>회원정보검색</span></h5>
        <hr><br>
        
		<form action="ruser_select">
			<div class="select">
				<input type="text" id="pw" placeholder="아이디" name="userid" required style="height:30px; width: 490px"><br><br>			
				<input type="password" id="pw" placeholder="비밀번호" name="userpw" required style="height:30px; width: 490px"><br><br>
				<input type="submit" value="검색하기" id="ruserselect"><br><br>
			</div>
		</form>
	</div>
</body>
</html>