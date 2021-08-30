<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	String AuthenticationKey = (String)session.getAttribute("AuthenticationKey");
	%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<!-- bootstrap 4 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&fa
         mily=Nanum+Gothic&family=Roboto&display=swap"
	rel="stylesheet">

<!-- fontawesome bootstrap 4 용 icon -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
.join-form {
	font-family: 'Rajdhani', 'sans-serif';
	/* 하나의 플렉스 아이템이 자신의 컨테이너가 차지하는 공간에 맞추기 위해 크기를 키우거나 줄이는 방법을 설정하는 속성*/
	justify-content: center;
	align-items: center;
	text-align: center;
}
.join-form div {
	display: inline-block;
	text-align: left;
}
#pageTitle {
	font-size: 30px;
	text-align: left;
	margin-top: 150px;
	margin-bottom: 100px;
	font-family: 'Rajdhani', 'sans-serif';
	font-weight: bolder;
}
.input-area {
	width: 400px;
}

.input-area input{
	width: 100%;
	padding: 15px 10px 10px;
	line-height: 1.2em;
	background: transparent;
	margin-bottom: 10px;
	border: 0.3px solid rgba(0, 0, 0, .2);
	border-radius: 10px;
	font-size: 19px;
	color: black;
	outline: none;
}
#sendMailBtn{
	width: 30%;
	height: 30px;
	background: rgba(100, 200, 167, .5);
	border: none;
	border-radius: 5px;
	font-size: 1em;
	color: white;
	margin-left: 280px;
	padding:0px;
}
#emailCheckBtn{
	width: 30%;
	height: 30px;
	background: rgba(100, 200, 167, .5);
	border: none;
	border-radius: 5px;
	font-size: 1em;
	color: white;
	margin-left: 280px;
	padding:0px;
}
.input-area input::placeholder {
	opacity: 0.5;
}

.pwd-area input {
	background: rgba(0, 0, 0, .06);
}
label {
	line-height: 50px;
	font-size: 20px;
	font-weight: 700;
	color: rgba(0, 0, 0, .7);
	padding-bottom: 5px;
}
.usercode-area {
	width: 100%;
	display: inline;
}
.usercode-area input {
	width: 70px;
	margin-left: 20px;
}
.usercode-area label {
	font-size: 1em;
}
#joinBtn {
	margin-top: 50px;
	margin-bottom: 100px;
	background-color: rgb(116, 228, 190);
	border: none;
	color: white;
	font-size: 1.5em;
}
#joinBtn:hover {
	cursor: pointer;
	background-color: mediumaquamarine;
}

.msgBox{
	display : none;
	color:red;
}

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>

            <section class="join-form">

                <div class="input-area">

                    <h1 id="pageTitle">회원가입</h1>

                    <form
                        id="loginForm"
                        action="<%=request.getContextPath()%>/insert.me"
                        method="post">
                        <div class="name-area area">

                            <label for="name">이름</label>
                            <input
                                type="text"
                                id="name"
                                name="userName"
                                placeholder="이름 입력"
                                required="required">
                            <label for="emailId">이메일아이디</label>
                            <input
                                type="email"
                                id="emailId"
                                name="emailId"
                                placeholder="이메일 입력"
                                required="required">
                            <input id="sendMailBtn" type="button" onclick="sendEmail()" value="인증메일발송">
                            <div id="emailCodeArea" style="width: 100%; height: 100px; display: none;">
                            <input
                            	type="text"
                                id="emailCode"
                                name="emailCode"
                                placeholder="인증코드 입력"
                                required="required"
                                autocomplete='off'>
                            <input id="emailCheckBtn" type="button" onclick="codeCheck()" value="인증하기">
                            </div>
                            <br>

                            <div class="pwd-area area">
                                <label for="userPwd">비밀번호</label>
                                <input
                                    type="password"
                                    class="password"
                                    id="userPwd"
                                    name="userPwd"
                                    placeholder="비밀번호"
                                    required="required"
									onchange="check_pw()"
									>
                                <input
                                    type="password"
                                    class="password"
                                    id="userPwd2"
                                    name="userPwd2"
                                    placeholder="비밀번호 확인"
                                    required="required"
									onchange="check_pw()">
									<div id="msgBox" style="width:100%; font-size:0.8em; text-align: center;"></div>

                            </div>

                            <label for="userSsn">주민번호
                            </label>
                            <input
                                type="text"
                                id="userSsn"
                                name="userSsn"
                                placeholder="주민번호 입력"
                                required="required">
                            <label for="phone">전화번호</label>
                            <input
                                type="tel"
                                id="phone"
                                name="phone"
                                placeholder="전화번호 입력"
                                required="required">

                            <label for="address">주소
                            </label>
                            <input
                                type="text"
                                id="address"
                                name="address"
                                placeholder="주소 입력"
                                required="required">
                            <label>회원구분</label>

                            <br>

                            <div class="usercode-area">

                                <input
                                    type="radio"
                                    class="usercode"
                                    id="normal"
                                    name="userCode"
                                    value="02"
                                    checked="checked"
                                    onclick="hide();">
                                <label for="normal">일반회원</label>
                                <input
                                    type="radio"
                                    class="usercode"
                                    id="business"
                                    name="userCode"
                                    value="03"
                                    onclick="show();">
                                <label for="business"> 사업자회원</label>
                            </div>
                            <div id="businessArea" style="width: 100%; display: none;">

                                <label for="bNumber">사업자번호
                                </label>
                                <input
                                    type="text"
                                    id="bNumber"
                                    name="bNumber"
                                    placeholder="사업자번호 입력"
                                    style="width: 100%;">
                                <br>

                                <label for="bName">사업자명</label>
                                <input
                                    type="text"
                                    id="bName"
                                    name="bName"
                                    placeholder="사업자명 입력"
                                    style="width: 100%;">

                            </div>
                            <input id="joinBtn" type="button" value="가입하기" onclick="enrollAvailable();">
                        </div>
                    </form>

                </div>
            </section>
            
            <script>
            
            $(function(){
                var emailCodeCheck = false;  //  이메일 인증 성공 여부
            })
            
            
            
            //입력값 유효성 검사 --> 통과 시 서블릿으로 전송 : 회원가입 실행
            function enrollAvailable(){
        		
       		 var pwd = $("#userPwd").val();
    		 var pwd2 = $("#userPwd2").val();

       		 var num = pwd.search(/[0-9]/g);
       		 var eng = pwd.search(/[a-z]/ig);
       		 var spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
       		 
       		 if(pwd.length<8 || pwd.length>20 ){

       			  alert("8자리 ~ 20자리 이내로 입력해주세요.");
       			  
       			 }else if(pwd.search(/\s/) != -1){
       				 
       			  alert("비밀번호는 공백 없이 입력해주세요.");
       			  
       			 }else if(num < 0 || eng < 0 || spe < 0 ){
       				 
       			  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
       			  
       			 }else if(pwd != pwd2){
       			  
       			  alert("비밀번호 확인이 일치하지 않습니다.");

       			 }else if(emailCodeCheck == false){
          		   alert("이메일 인증을 완료해주세요");

       			 } else {
       				 
       				welcome(); //환영 메세지
       				$("#loginForm").submit(); //Form 전송
       			 }
       	}


				//비밀번호 일치 검사
              function check_pw(){

				var pwd1 = document.getElementById("userPwd").value;
				var pwd2 =  document.getElementById("userPwd2").value;
				var msg = '';
			
				if(pwd1 != pwd2){
					msg='<b style=color:orangered;>비밀번호가 일치하지 않습니다.</b>'
				}else {
					msg='<b style=color:gray;>비밀번호가 일치합니다.</b>'
				}
				$("#msgBox").html(msg);
	

			  }

              	//사업자 정보 입력 창 보이기
                function show() {
                    $("#businessArea").css("display", "block");
                }
              	//사업자 정보 입력 창 숨기기

                function hide() {
                    $("#businessArea").css("display", "none");
                }

              	//가입 완료 메세지
                function welcome() {
                    if ($("#businessArea").css("display") == "none") {
                        alert("회원이 되신 것을 환영합니다! 가입 축하 선물로 20,000원의 적립금이 충전되었습니다.");
                    } else {
                        alert("회원이 되신 것을 환영합니다! 지금 당장 프로젝트를 오픈해서 좋은 서포터들을 만나보세요!");

                    }
                }
            
            function codeCheck(){
               	var code = $("#emailCode").val();		
               	if(code == "<%=AuthenticationKey%>"){
					alert("이메일 인증을 성공했습니다.")
					emailCodeCheck = true;
                    $("#emailCodeArea").css("display", "none"); //오류 발생 시 삭제

               	}else{
					alert("이메일 인증을 실패했습니다. 인증 코드를 다시 확인해주세요.")
               	}                  	
            }
                        
    		function sendEmail(){
        	    	var emailId = $("#emailId").val();
        	    	console.log("<%=AuthenticationKey%>");
        	    	if(emailId == null ||
        	    	   emailId ==''){
        	    		alert("이메일을 올바르게 입력해주세요.")
        	    	}else{
        				$.ajax({
        					url : "sendEmail.me",
        					type : "post",
        					data : {
        						emailId : emailId
        					},
        					async: false,  
        					success : function(result,msg){
        						console.log("서버 통신 성공");
        						console.log("sendEmailResult : " + result); //sendSuccess
        						console.log("sendEmailMsg : " + msg); //success
        						if(result == "sendSuccess"){
        							alert('인증 메일이 발송되었습니다. 메일이 도착하지 않았을 경우 입력하신 이메일 주소를 다시 확인해주세요.')
                                    $("#emailCodeArea").css("display", "block");

        						}else if(result == "duplicate" ){
        							alert("이미 가입 된 이메일입니다.")
        						}else{
        							alert("인증 메일 발송실패 : 관리자에게 문의해주세요")
        						}
        					},
        					error : function(){
        						console.log("서버 통신 실패");
        					}
        				})	
        	    	}

    		}
            
            </script>

        </body>
    </html>