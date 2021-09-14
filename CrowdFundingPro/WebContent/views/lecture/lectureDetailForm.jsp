<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="com.kh.lecture.model.vo.Lecture" %>
<%@ page import="com.kh.user.model.vo.User"%>


<% Lecture lecture = (Lecture)request.getAttribute("lecture"); %>
<% String count = (request.getAttribute("count")).toString(); %>
<% User loginUser = (User) session.getAttribute("loginUser"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<title>lectureDetail</title>

<style>
		
		.mainContent{
			
			text-align: center;
			border: 2px solid rgb(52,58,64);
			border-radius: 4px;
			margin: 10px 15px 10px 15px;
			height: 850px;
		}

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
        
        
        .lectureContent{
        
        line-height:350px;
        
        }
        
        
    </style>

</head>
<body>
	
	<jsp:include page="/views/common/menubar.jsp" />
	

		
	<div class="mainContent" >
        
        <div class ="mainTop"> 
        <img id = "thumbnail" src="resources/images/no_image.png">
            <div class ="lecInfo">
                <p class ="lecturer">강사: <%=lecture.getLecturer() %> </p>
                <p class ="lectureTitle">타이틀: <%=lecture.getLectureTitle() %> </p>
                <p class ="lectrueTopic">주제 : <%=lecture.getLectureTopic() %> </p>
                <p class ="lectureDate">일시: <%= lecture.getLectureDate() %> </p>
                <p class ="lectureAddress">주소: <%= lecture.getLectureAddress() %> </p>
                <p class ="lectrueNumber">현재 수용 인원: <%= count %>/ <%= lecture.getLectureNum() %></p>
            </div>
        </div>

        <div class="lectrueCotent">
			
			<p class="lectureContent"> <%= lecture.getLectureContent() %> </p>
			
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
			<button type="button" onclick=""> 삭제하기</button>
			<button type="button" onclick="cancle()" value="X"> 취소</button>
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