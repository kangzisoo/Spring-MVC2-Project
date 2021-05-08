<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        #login {
            background-color: rgb(18, 70, 184);
            color: white;
            border: 0;
            border-radius: 7px;
            padding: 20px 228px;
        }
        #signup {
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
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

</script>
<meta charset="UTF-8">
</head>
<body>
    <div class="container">
        <h5><span>로그인</span></h5>
        <hr><br>
        
		<form action="main">
			<div class="login">
				<input type="text" id="id" placeholder="아이디" name="userid" required style="height:30px; width: 490px"><br><br>			
				
				<input type="password" id="pw" placeholder="비밀번호" name="userpw" required style="height:30px; width: 490px"><br><br>
				
				<div id="logincheck" style="float:left;"></div>
				<input type="submit" value="로그인" id="login"><br><br>
			</div>
		</form>
		<form action="signup">
			<input type="submit" value="회원가입" id="signup">
		</form>

	</div>
</body>
</html>