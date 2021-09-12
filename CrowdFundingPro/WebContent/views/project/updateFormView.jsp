<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.kh.project.model.vo.Project" %>
<%@ page import="com.kh.common.model.vo.Attachment" %>    
    
<%
	Project pj=(Project)(request.getAttribute("pj"));
	Attachment at=(Attachment)(request.getAttribute("at"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .container_filed{
            width:400px;
            height:1200px;
            margin: 0 auto ;

        }
        #btn1{
         
            border-top-right-radius: 10px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            border-top-left-radius: 10px;
            
            
        }
        form{
        	padding:15px;
        }
    </style>
</head>
<body>

	
	<div class="container_filed">
<form action="<%=request.getContextPath()%>/updateB.do" method="post" enctype="multipart/form-data">
        <h1>수정하기</h1><br>
        
		<input type="hidden" name="pCode" value="<%=pj.getProjectCode()%>">
		
        <label><b>프로젝트명</b></label>
        <input type="text" name="projectName" size="20" value="<%=pj.getProjectName()%>"><br><br>

        <label><b>목표금액</b></label>
        <input type="text" name="amountGoal" size="20"value="<%=pj.getAmountGoal()%>"><br><br>

        <label><b>배송료</b></label><br>
        <input type="text" placeholder="가격을 입력하세요." name="delivery" size="18" value="<%=pj.getDeliveryCharge() %>" ><b>원</b><br><br>


        <label><b>대표이미지</b></label><br>
    	<%=at.getOriginName() %>
    	<input type='hidden' name='titleImg' value='<%=at.getChangeName() %>'>
    	<input type='hidden' name='fileNo' value='<%=at.getFileNo() %>'><br><br>
    	
    	<label>파일선택:</label>
    	<input type="file" name="uploadfile"><br><br>
    	

   <!--  <label><b>카테고리선택:</b></label>
    
        <select name="category">
            <option value="travel">여행,레저</option>
            <option value="tech">테크,가전</option>
            <option value="sports">스포츠</option>
            <option value="homeLiv">홈리빙</option>
            <option value="beauty">뷰티</option>
            <option value="fashion">패션,잡화</option>
            <option value="animal">반려동물</option>
            <option value="donate">기부,후원</option>
            <option value="publish">출판</option>
            <option value="food">푸드</option>
            <option value="design">디자인소품</option>
            <option value="culture">공연,컬쳐</option>
            <option value="social">소셜</option>
            <option value="hobby">게임,취미</option>
            <option selected>선택</option>

        </select><br><br>-->

       <label for="dateIn"><b>프로젝트 기간</b></label>
        <input type="date" name="dateInput" id="dateIn" value="<%=pj.getDdln()%>"><br><br>

      

        <label><b>프로젝트 소개</b></label><br>
    <textarea name="detail" cols="40" rows="4" placeholder="간단한 설명을 기입해주세요."><%=pj.getDetailIntro() %></textarea><br><br>



        <input id="btn1" type="submit" value="수정 완료"><br>
    </form>
    </div>
    
   
</body>
</html>