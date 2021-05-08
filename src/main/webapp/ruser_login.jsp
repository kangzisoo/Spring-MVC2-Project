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
            padding: 20px 221px;
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
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
/* $(function() {
	$('#login').click(function() {
		id = $('#id').val()
		pw = $('#pw').val()
		
		if (id == "") {
			alert('아이디를 입력하세요')
			$(id).focus()
			return
			
		} else if (pw == "") {
			alert('비밀번호를 입력하세요')
			$(pw).focus()
			return
		}
		$.ajax({
			type : "post",
			url : "ruser_login",
			data : {
				id : id
				pw : pw
			},
			success: function(data) {
				if (data == 'true') {
					location.href = "main.jsp"
				} else {
					$('#logincheck').html('<h6 style=color:red;>아이디나 비밀번호가 일치하지 않습니다.</h6>')
					$('#id').focus()
				}
			},
			error: function() {
				alert("로그인 실패하였습니다.")
			}
		}) //ajax
		
	}) //idlogin
	
	$('#logout').click(function() {
		$.ajax({
			type: "post",
			url: "ruser_logout",
			success: function() {
				location.href = "main.jsp"
			},
			error: function() {
				 alert("로그아웃 실패하였습니다.")
		 	}
		}) //ajax
	} //logout
}) //fun */
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