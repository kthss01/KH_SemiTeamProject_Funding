<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.kh.user.model.vo.User" %>
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<title>lectureDetail</title>

<style>
        .lecDe_Wrapper{
            text-align: center;
            margin : 50px 25px 50px 25px; 
            padding : 15px 10px 15px 10px;
        }
        
        .buttonArea{

            display:block;
            right: 0;
            position: fixed;

        }
    </style>

</head>
<body>
	
	<jsp:include page="/views/common/menubar.jsp" />
	

		
	<div class="mainContent" >
        
        <div class ="mainTop"> 
        <img id = "thumbnail" src="resources/images/no_image.png">
            <div class ="lecInfo">
                <p class ="lecturer">강사: </p>
                <p class ="lectureTitle">타이틀: </p>
                <p class ="lectrueTopic">주제 : </p>
                <p class ="lectureDate">일시: </p>
                <p class ="lectureAddress">주소: </p>
                <p class ="lectrueNumber">인원:--/--</p>
            </div>
        </div>

        <div class="lectrueCotent">
		
		
        </div>

        <div class="buttonArea">

            <button type ="button" onclick="history.back()"> 이전으로</button>
            <button type ="button" class="signInBtn" onclick="signInLectrue();"> 수강등록</button>
            <button type ="button" class="deleteBtn hidden" onclick="openDelCheckBox();" >강의삭제</button>
            <button class="toTheTop" onclick="location.href='#thumbnail'"> <b>▲ </b></button>
        </div>

    </div>
    

    
    <div class="deleteCheck hidden"> 
  		
  		<div class="delCheckBox">
  			<p> 정말로 해당 강의를 삭제합니까?</p>
			<button type="button" onclick="deleteLectrue()" value="O"></button>
			<button type="button" onclick="cancle()" value="X"></button>
  		</div>
  		 
    </div>
	

    <!-- 
     <script>
    	/*
    	function signInLecture(){
    		
    		
    	}
    
    	function openDelCheckBox(){
    		
			var loginUser =  //loginUser.getUserNo()%>;
    		var delCheckBox = document.querySelector(".delCheckBox");

    		if( loginUser == '100') {
    			delCheckBox.classList.remove("hidden");
    		} else { 
    			alert(" 삭제 권한이 없습니다.");
    		}
    		
    	}
    	*/
    	function deleteLecture(){
    		
    		
    	}
    	
    	
    	
    
    </script>
     -->
     
     
    <jsp:include page="/views/common/footer.jsp" />
    
    
   
    
</body>
</html>