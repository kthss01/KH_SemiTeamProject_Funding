<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.kh.user.model.vo.User"%>

<%
	User loginUser = (User) session.getAttribute("loginUser");
String msg = (String) session.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LoginPage</title>
<!-- bootstrap 4 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- fontawesome bootstrap 4 용 icon -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&fa
            mily=Nanum+Gothic&family=Roboto&display=swap"
	rel="stylesheet">
<style>
.login-form {
	justify-content: center;
	align-items: center;
	width: 500px;
	height: 100vh; /*vh : veiwport height*/
	text-align: center;
	margin: 0 auto;
}

.login-form h1 {
	font-size: 30px;
	text-align: left;
	margin-top: 150px;
	margin-bottom: 100px;
	font-family: 'Roboto', sans-serif;
}

.login-btn {
	background: rgb(100, 200, 167);
	border: none;
	width: 100%;
	height: 50px;
	margin-top: 45px;
	border-radius: 10px;
	opacity: 0.8;
	color: white;
	font-size: 1.5em;
	text-align: center;
	font-family: 'Rajdhani', sans-serif;
}

.login-btn:hover {
	cursor: pointer;
	background: rgb(100, 220, 167);
}

.int-area {
	width: 500px;
	position: relative;
}

.int-area input {
	width: 100%;
	padding: 20px 10px 10px;
	background: transparent;
	border-style: none;
	border-bottom: 2px solid black;
	font-size: 18px;
	color: black;
	outline: none;
	text-align: center;
}

.int-area label {
	position: absolute;
	left: 10px;
	top: 15px;
	font: 18px;
	color: #999;
}

.int-area input:focus+label, .int-area input:valid+label {
	top: 0;
}

.caption {
	margin-top: 20px;
	position: relative;
}

::placeholder {
	font-size: 0.7em;
	text-align: center;
	opacity: 0.6;
}

.caption {
	text-align: left;
}

#joinBtn {
	width: 120px;
	height: 30px;
	margin-left: 380px;
	background: rgb(0, 0, 0, 0.1);
	border: none;
	border-radius: 5px;
	opacity: 0.8;
	color: rgba(0, 0, 0, 0.7);
	font-weight: 600;
	font-family: 'Rajdhani', sans-serif;
}

#joinBtn:hover {
	cursor: pointer;
	background: rgb(0, 0, 0, 0.3);
	color: black;
	font-size: 14px;
}
</style>

<script type="text/javascript">
	$(function(){
		var msg = "<%=msg%>";
		if(msg != "null") {
			alert(msg);
			<%session.removeAttribute("msg");%> //메세지를 띄우고 나면 msg 속성을 삭제한다.
		}
	})

	function loginValidate(){
		if($("#userId").val().trim().length==0){
			alert("아이디를 입력하세요");
			$("#userId").focus();
			return false;
		}
		
		if($("#userPwd").val().trim().length==0){
			alert("비밀번호를 입력하세요");
			$("#userPwd").focus();
			return false;
		}
		return true;
	}

</script>

</head>

<body>


        	<%@ include file="../common/menubar.jsp"%>



	<section class="login-form">
		<h1>로그인</h1>
		<form id = "loginForm" action="<%=request.getContextPath()%>/login.me" method="post" > <!-- onsubmit="return loginValidate();" -->
			<div class="int-area">
				<input class="input-box" type="text" name="emailId" id="emailId"
					autocomplete="off" required placeholder="이메일 아이디"> <label
					for="id">ID</label>

				<!-- autocomplete : 자동완성기능,  required : 필수 작성 -->
			</div>
			<div class="int-area">

				<input class="input-box" type="password" name="userPwd" id="userPwd"
					autocomplete="off" required
					placeholder="비밀번호 (영문, 숫자, 특수문자 포함 8자 이상)"> <label
					for="pwd">PWD</label>

				<button class="login-btn" type="submit">LOGIN</button>
			</div>
		</form>
		<div class="caption">
			<br> <a href="<%=request.getContextPath()%>/enrollForm.me"
				style="font-size: 1em">아직 계정이 없으신가요?</a>

			<!-- <a  href="" style="font-size: 1em" >로그인 정보를 잊으셨나요?</a> -->
		</div>
		<button id="joinBtn" onclick="enrollPage();">회원가입</button>

	</section>

	<script>
	
	function enrollPage(){
		location.href = "<%=request.getContextPath()%>
/enrollForm.me";
		}
	</script>
</body>
</html>