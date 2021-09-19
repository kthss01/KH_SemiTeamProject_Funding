<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="com.kh.lecture.model.vo.Lecture" %>
<%@ page import="com.kh.user.model.vo.User"%>


<% Lecture lecture = (Lecture)request.getAttribute("lecture"); %>
<% String count = (request.getAttribute("count")).toString(); %>
<% User loginUser = (User) session.getAttribute("loginUser"); %>
<% boolean check = (boolean)request.getAttribute("duplicate"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<title>lectureDetail</title>

<style>
		
		.topThumbnail{
			margin-top: 25px;
			text-align:center;
			justify-content:center;
			width: 100%;
			hieght: 450px;
			
		}
		.topThumbnail>img{
			padding : 10px 5px 10px 5px;
			margin : 10px 20px 10px 20px;
			height: 350px;
			width: 700px;
			
		}
		
		.mainContent{
			
			text-align: center;
			border: 2px solid rgba(52,58,64,0.77);
			border-radius: 8px;
			margin: 10px 15px 10px 25px;
			height: 850px;
		}

        .lecDe_Wrapper{
            text-align: center;
            margin : 50px 25px 50px 25px; 
            padding : 15px 10px 15px 10px;
        }
        
      
        
        
        .lectureContent{
        	
        	font-size: 14px;
        	
        }
        
        
        .delModal{
   
        	top: 0;
   			left: 0;
  		 	width: 100%;
   		 	height: 100%;

    	 	display: flex;

    		justify-content: center;
    		align-items: center;
        }
        .delModal_overlay{
   			width: 100%;
  			height: 100%;
  			position: absolute;
        }
        
        .delModal_content{
        	margin: 0 auto;
   			background-color: white;

  			padding: 10px 12px 10px 12px;
  			align-items: center;
  			text-align: center;

   			position: relative;
  			top: 0px;
  			border-radius: 15px;
  			box-shadow: 0 10px 16px rgba(0,0,0,.35), 0 8px 8px rgba(0,0,0,.60);
  			width: 235px;
  			
  			border: 1px solid gray;	
        }
        
        .hidden{
        	
        	display:none;
        }
        
        .buttonArea{

            display:block;
            right: 0;
            bottom:0;
            position: fixed;
			border: 1px solid : gray;
        	border-radius: 5px;
        	box-shadow:0 3px; 7px; rgba(0,0,0,0.08), 0 4px 4px rgba(0,0,0,0.09);
        	margin: 0px 10px 15px 0px;
        	
        }
        
        .buttonArea>Button{
        	
        	background-color: rgba(211,212,221,0.87);
        	color:rgb(52,58,64);
        	font-weight:bold;
        	border-radius: 5px;
        	border:1px solid white;
        }
        
       	.lecInfo{
       		text-align:center;
       	}
        
        
    </style>

</head>
<body>
	
	<jsp:include page="/views/common/menubar.jsp" />
	

	<div class="topThumbnail">
	 <img id = "thumbnail" src="<%=request.getContextPath()%>/<%=lecture.getLectureImage()%>">
	</div>
	<div class="mainContent" >
        <div class ="mainTop"> 
            <div class ="lecInfo">
            	<p class ="lectureCode"  style="display:none;"><%=lecture.getLectureCode()%> </p>
                <p class ="lecturer">강사: <%=lecture.getLecturer() %> </p>
                <p class ="lectureTitle" >타이틀: <%=lecture.getLectureTitle() %> </p>
                <p class ="lectrueTopic" >주제 : <%=lecture.getLectureTopic() %> </p>
                <p class ="lectureDate" >일시: <%= lecture.getLectureDate() %> </p>
                <p class ="lectureAddress" >주소: <%= lecture.getLectureAddress() %> </p>
                <p > 참여 인원: <%= count %>/ <pre class ="lectrueNumber"><%= lecture.getLectureNum() %></pre></p>
            </div>
        </div>

        <div class="lectrueCotent">
			
			<p class="lectureContent"> <%= lecture.getLectureContent() %> </p>
			
        </div>
	
	
		
        <div class="buttonArea">
            <button type ="button" onclick="window.history.back()"> 이전으로</button>
            <% if ( check ) {%>
            <button type ="button" class="signInBtn" onclick="checkLogin()"> 수강등록</button>
            <%}else{ %>
            <button type ="button" class="signInBtn" onclick="cancleLec()"> 수강취소</button>
            <%} %>
            <button type ="button" class="signInBtn" onclick="updateLecture()">수정하기</button>
            <button type ="button" class="deleteBtn">강의삭제</button>
            <button class="toTheTop" onclick="location.href='#thumbnail'"> <b>▲ </b></button>
        </div>

    </div>
    
   
    <div class="delModal hidden" id="delModal"> 
    	<div class="delModal_overlay">
  			<div class="delModal_content">
  				<p> 정말로 해당 강의를 삭제합니까?</p>
				<button type="button" onclick="deleteLecture()"> 삭제하기</button>
				<button type="button" class="cancleBtn"> 취소</button>
  			</div>
  		</div>
    </div>

	
     <script>
        <%--
     	widnow.onload = function(){
     			document.querySelector(".deleteBtn").classList.remove("hidden");
     	} 
     	--%> 
     
     
     	const deleteBtn = document.querySelector(".deleteBtn");
        const delModal = document.querySelector(".delModal");
        const cancleBtn = document.querySelector(".cancleBtn");
        
        const openDelBox = ()=> {
        	delModal.classList.remove("hidden");
        }
        const closeDelBox = () => {
        	delModal.classList.add("hidden");        	
        }
        
        deleteBtn.addEventListener("click",openDelBox);
        cancleBtn.addEventListener("click",closeDelBox);
        
        function checkLogin(){
        	
			<% if ( (loginUser != null ) && ( loginUser.getUserCode() !="01")) {%>
			
			var code = document.querySelector(".lectureCode").textContent;
        	location.href = '<%=request.getContextPath()%>/signIn.le?code='+code;
        	
        	<%} else {%>
        	
        	alert("수강 신청을 위해선 로그인 하셔야합니다.");
        	location.href ='<%=request.getContextPath()%>/loginForm.me';
        	<%}%>
        	
        }
       	
        function deleteLecture(){
			var code = document.querySelector(".lectureCode").textContent;
			location.href="<%=request.getContextPath()%>/lectureDelete.le?code="+code;
	
        }
        
        function updateLecture(){
        	var code = document.querySelector(".lectureCode").textContent;
        	location.href="<%=request.getContextPath()%>/lecUpdateForm.le?code="+code;
        	
        }
        
        function cancleLec(){
        	var code = document.querySelector(".lectureCode").textContent;
        	location.href="<%=request.getContextPath()%>/lecCancle.le?code="+code;
        }
        
        
     
     
    </script>

     
     
    <jsp:include page="/views/common/footer.jsp" />
    
    
   
    
</body>
</html>