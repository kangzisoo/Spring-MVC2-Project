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
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function() {
	
	// id중복확인 및 유효성 검사
	$('#id').blur(function() {
		id = $('#id').val()
		
		//영문 소문자 4~11자
		regex = /^[a-z0-9]{4,12}$/
		result = regex.exec(id)
		
		if (result != null) {
			$('#id2check').html('')
		} else {
			$('#id2check').html('<h6 style=color:red;>아이디는 영문 소문자 및 숫자 4~12자리로 구성되어야 합니다.</h6>')
		}
		
		$.ajax({
			type: "post",
			url: "idcheck",
			data : {
				id : id //컨트롤에 넘길 데이터 (userid)
			},
			success: function(result) {
				//console.log("성공여부 " + result)
				if (result != 'fail') {
					$('#idcheck').html('')
				} else {
					$('#idcheck').html('<h6 style=color:red;>중복된 아이디입니다.</h6>')
				}
			}//success
		}) //ajax
	}) //id
	
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
		
	//이름 유효성검사	
	$('#name').blur(function() {
		
		//한글 2자 이상
		regex = /[가-힣]{2,}/
		//exec 함수를 사용하면 인자로 주어진 문자열 안에서 pattern을 찾음
		result = regex.exec($('#name').val())
		
		if (result != null) {
			$('#namecheck').html('')
		} else {
			$('#namecheck').html('<h6 style=color:red;>2자 이상의 한글만 입력 가능합니다.</h6>')
		}
	})// name
	
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

//  생년월일 유효성 검사 초기화
	birth = false;
	
	//생년월일 유효성 검사
	$('#birth').blur(function(){
		dateStr = $(this).val();		
	    year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
	    month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
	    day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
	    today = new Date(); // 날짜 변수 선언
	    yearNow = today.getFullYear(); // 올해 연도 가져옴
		//alert(dateStr.length)
	    //생년월일 8자리 이하
	    if (dateStr.length == 8) {
	    	
			// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환
		    if (1900 > year || year > yearNow){
		    	$('#birthcheck').html('<h6 style=color:red;>생년월일을 확인해주세요.</h6>')
		    
		    	//1월 미만 또는 12월 초과일 경우
		    	}else if (month < 1 || month > 12) {
		    		$('#birthcheck').html('<h6 style=color:red;>생년월일을 확인해주세요.</h6>')
		    
		    	//1일 미만 또는 31일 초과일 경우
		    	}else if (day < 1 || day > 31) {
		    		$('#birthcheck').html('<h6 style=color:red;>생년월일을 확인해주세요.</h6>')
		    
		    	//4월, 6월, 9월, 11월이 31일 경우
		    	}else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
		    		$('#birthcheck').html('<h6 style=color:red;>생년월일을 확인해주세요.</h6>')
		    	
		    	//2월일 경우
		    	}else if (month == 2) {
		    	
		    	//윤년설정
		    	//연도를 4로 나누었을 때 나머지가 0일 때와 100 or 400으로 나누었을 때 나머지 0일 때 
		       	isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) 
		       	
		       	//29일 초과일 때 또는 29일 이면서 윤년이 아닐 때
		     	if (day>29 || (day==29 && !isleap)) {
		     		$('#birthcheck').html('<h6 style=color:red;>생년월일을 확인해주세요.</h6>')
		    	
					}else{
						$('#birthcheck').html('');
						birth = true;
					}//end of if (day>29 || (day==29 && !isleap))
		     	
		    	}else{
		    		$('#birthcheck').html(''); 
					birth = true;
				}//end of if
			
				}else{
					//alert('나는 else!no!!!')
					//입력된 생년월일이 8자 초과할때 : false
					$('#birthcheck').html('<h6 style=color:red;>생년월일을 확인해주세요.</h6>') 
				}
		}) //End of method
	
		
		
/* 	    //회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
    $("#signupbtn").on("click",function(){
    	id = $("#id").val();
     	pw1 = $("#pw1").val();
     	pw2 = $("#pw2").val();     
     	name = $("#name").val();
     	phone = $("#tel").val();
     	email = $("#email").val();
	 
     	idregex = /^[a-z][a-z\d]{4,11}$/;
     	pwregex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/
     	pw2regex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/
     	nameregex = /[가-힣]{2,}/
     	telregex = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/
     	emailregex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
        	   
     	idregex = idregex.exec(id);
     	if(idregex == null){
        	alert("아이디양식을 다시 확인해주세요");
        	return;
        	}
     
     	pw1regex = pw1regex.exec(pw);
     	if(pw1regex == null){
        	alert("비밀번호양식을 다시 확인해주세요");
        	retrun;
     		}
     	
     	pw2regex = pw2regex.exec(pw);
     	if(pw2regex == null){
        	alert("비밀번호양식을 다시 확인해주세요");
        	retrun;
     		}
     
     	nameregex = nameregex.exec(name);
     	if(nameregex == null){
        	alert("이름양식을 다시 확인해주세요");
        	retrun;
     	}
     
     	phoneregex = phoneregex.exec(phone);
     	if(phoneregex == null){
        	alert("핸드폰번호양식을 다시 확인해주세요");
        	retrun;
     	}
     
     	emailregex = emailregex.exec(email);
     	if(emailregex == null){
        	alert("이메일양식을 다시 확인해주세요");
        	retrun;
     	}
        	   
     	//빈칸 없을 때 제출
		$("#signup").submit();
     	
    	}) */
	
}) //fun
	</script>
</head>

<body>
    <div class="container">
        <h5><span>회원 가입</span></h5>
        <hr><br>
        
        <form action="ruser_login" >
        <div class="register">
            <input type="text" id="id" placeholder="아이디" name="userid" required style="height:30px; width: 495px"><br><br>
            <div id="idcheck" style="float:left;"></div>
            <div id="id2check" style="float:left;"></div>
            
            <input type="password" id="pw1" placeholder="비밀번호" required style="height:30px; width: 495px"><br><br>
            <div id="pw1check" style="float:left;"></div>
            
            <input type="password" id="pw2" placeholder="비밀번호 확인" name="userpw" required style="height:30px; width: 495px"><br><br>
            <div id="pw2check" style="float:left;"></div>
            
            <input type="text" id="name" placeholder="이름" name="username" required style="height:30px; width: 495px"><br><br>
            <div id="namecheck" style="float:left;"></div>
            
            <input type="text" id="tel" placeholder="전화번호('-'없이 번호만 입력해주세요)" name="usertel" required style="height:30px; width: 495px"><br><br>
            <div id="telcheck" style="float:left;"></div>
            
            <input type="email" id="email" placeholder="이메일 주소" name="useremail" required style="height:30px; width: 495px"><br><br>
            <div id="emailcheck" style="float:left;"></div>
            
            <input type="text" id="birth" placeholder="생년월일(8자리 입력해주세요)" name="userbirth" required style="height:30px; width: 495px"><br><br>
            <div id="birthcheck" style="float:left;"></div>
            
            <input type="text" id="address" placeholder="주소" name="useraddress" required style="height:30px; width: 495px"><br><br>
            <div id="addresscheck" style="float:left;"></div>
            
            <select id="gender" class="sel" name="usergender" style="height:30px; width: 500px">
				<option>성별</option>
					<option value="남자">남자</option>
					<option value="여자">여자</option>
			</select><br><br>
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
            <input type="submit" value="가입하기" id="signup"><br><br>
            </p>
        </div>
        </form>
    </div>
</body>
</html>