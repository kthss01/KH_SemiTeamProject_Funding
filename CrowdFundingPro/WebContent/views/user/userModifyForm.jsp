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
    
	    <link
		href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&fa
	            mily=Nanum+Gothic&family=Roboto&display=swap"
		rel="stylesheet"/>
		<link 
		href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined
		|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
    	rel="stylesheet" />
	
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
    
    

    <style>
    	
 
  
        h1{
            font-size: 30px;
            text-align: left;
            margin-top: 150px;
            margin-bottom: 100px;
            font-weight:bolder;
            font-family: 'Rajdhani','sans-serif';
            
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
            margin:0 auto;
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
            margin-bottom: 10px;
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


        <div class="input-area">

            <h1>회원정보수정</h1>
            <p style="font-size:12px;">이름과 아이디는 수정이 불가합니다.</p>

				<form id="updateForm" action="<%=request.getContextPath()%>/update.me"  method="post">
            

                <label for="name">*이름</label>
                <input type="text" id="name" name="name" placeholder=<%=loginUser.getUserName()%> readonly>

                <label for="emailId">*이메일 아이디</label>
                <input type="email" id="emailId" name="emailId" placeholder=<%=loginUser.getEmailId()%> readonly>
                <br><br>


                <div class="pwd-area area" >
                    <label for="password">비밀번호</label>
                    <input type="password" id="userPwd" name="userPwd" onchange="check_pw()" value=<%=loginUser.getUserPwd()%>>
                    <input type="password" id="userPwd2" name="userPwd2" onchange="check_pw()" value=<%=loginUser.getUserPwd()%>>
                	
					<div id="msgBox" style="width:100%; font-size:0.8em; text-align: center;"></div>
                </div>
                
                <label for="tel">전화번호 </label>
                <input type="tel" id="tel" name="phone" value=<%=loginUser.getUserPhone()%>>

                <label for="address"text"">주소 </label>
                <input type="text" id="address" name="address" value="<%=loginUser.getUserAddress()%>">


               
                <input id="modifyBtn" type="button" value="수정완료" onclick="uadateAvailable();">
			</form>
                <input id="#deleteBtn" type="button" value="회원탈퇴" onclick="deleteCheck()">  <!-- ajax -->
               
			
        </div>

         
	<script>
	
	//입력값 유효성 검사
	function uadateAvailable(){
		
		 var pwd = $("#userPwd").val();
		 var pwd2 = $("#userPwd2").val();
		 var num = pwd.search(/[0-9]/g);
		 var eng = pwd.search(/[a-z]/ig);
		 var spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		 
		 if(pwd.length < 8 || pwd.length > 20){

			  alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
			  
			 }else if(pwd.search(/\s/) != -1){
				 
			  alert("비밀번호는 공백 없이 입력해주세요.");
			  
			 }else if(num < 0 || eng < 0 || spe < 0 ){
				 
			  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
			  
			 }else if(pwd != pwd2){
			  
			  alert("비밀번호 확인이 일치하지 않습니다.");

			 } else {
    				$("#updateForm").submit(); //Form 전송
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
		
		function deleteCheck(){
	    	var input = prompt('비밀번호를 입력해주세요.');
	    	if(input == "<%=loginUser.getUserPwd()%>" ){
				$.ajax({
					url : "delete.me",
					type : "post",
					async:false,
					success : function(result,msg){
						console.log("서버 통신 성공");
						console.log("modifyResult : " + result); //deleteSuccess
						console.log("modifyMsg : " + msg);	//success
						if(msg == "deleteSuccess"){
							alert('회원탈퇴가 완료되었습니다.')
							location.href="<%= request.getContextPath() %>";
						}else{
							alert("회원탈퇴에 실패하였습니다.")
						}
					},
					error : function(){
						console.log("서버 통신 실패");
					}
				})	    		
	    	} else if(input == null) {
	    		// prompt의 취소를 누르면 null을 반환 -> 아무 동작 없음
	    	} else{
	    		alert('비밀번호가 일치하지 않습니다.');
	    	}
		}
	
	</script>
</body>
</html>