<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.user.model.vo.User" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보수정</title>
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
    rel="stylesheet" />

    <style>

        .container{
            width: 100%;
            padding-top: 150px;
        }
    

        .join-form{
            font-family: 'Rajdhani','sans-serif';
            /* 하나의 플렉스 아이템이 자신의 컨테이너가 차지하는 공간에 맞추기 위해 크기를 키우거나 줄이는 방법을 설정하는 속성*/
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .join-form div{
            display: inline-block;
            text-align: left;
        }

  
        h1{
            font-size: 30px;
            text-align: left;
            margin-bottom: 100px;
        }
        label{
            line-height: 50px;
            font-size: 20px;
            font-weight: 700;
            color:rgba(0,0,0,.7);
            padding-bottom: 5px;
        }

        .input-area{
            width: 400px;
        }
        .input-area button{
            width: 25%;
            height: 30px;
            background: rgba(100, 200, 167,.5) ;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            color:white;
            margin-left: 300px;
        }

        .input-area input{
            width: 100%;
            padding: 15px 10px 10px;
            line-height: 1.2em;
            background: transparent;
            margin-bottom: 10px;
            border: 0.3px solid rgba(0,0,0,.2);
            border-radius: 10px;
            font-size: 19px;     
            color: black;
            outline: none; 
        }
        .input-area input::placeholder{
            opacity: 0.5;
        }
        .usercode-area{
            width: 100%;
            display: inline;
        }
        .usercode-area input{
            width: 70px;
            margin-left: 20px;

        }
        
        .usercode-area label{
            font-size: 1em;
        }

             
        #modifyBtn{
            margin-top: 50px;
            margin-bottom: 100px;
            background-color: rgb(116, 228, 190);
            border: none;
            color: white;
            font-size: 1.5em;
        }

        #modifyBtn:hover{
            cursor: pointer;
            background-color: mediumaquamarine;

        }
   
    </style>
</head>
<body>

	<%@ include file="../common/menubar.jsp"%>

    <div class="container">


        <div class="input-area">

            <h1>회원정보수정</h1>

				<form id="loginForm" action="<%=request.getContextPath()%>/update.me"  method="post">
            

                <label for="name">이름</label>
                <input type="text" id="name" name="name" placeholder=<%=loginUser.getUserName()%> readonly>

                <label for="email">이메일 아이디</label>
                <input type="email" id="email" name="email" placeholder=<%=loginUser.getEmailId()%> readonly>
                <br><br>


                <div class="pwd-area area" >
                    <label for="name">비밀번호</label>
                    <input type="password" id="password1" name="password1" placeholder=<%=loginUser.getUserPwd() %> onchange="check_pw()">
                    <input type="password" id="password2" name="password2" placeholder=<%=loginUser.getUserPwd() %> onchange="check_pw()">
                	
					<div id="msgBox" style="width:100%; font-size:0.8em; text-align: center;"></div>
                </div>
                
                <label for="tel">전화번호 </label>
                <input type="tel" id="tel" name="tel" placeholder=<%=loginUser.getUserPhone()%>>

                <label for="email">주소 </label>
                <input type="email" id="email" name="email" placeholder=<%=loginUser.getUserAddress()%>>


               
                <input id="modifyBtn" type="submit" value="수정완료">
			</form>
        </div>

          
</div>

	<script>
		//비밀번호 유효성 검사  (미완료)
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
	</script>
</body>
</html>