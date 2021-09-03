<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<%@ include file="../common/menubar.jsp"%>
	
	<div class="container_filed">
<form action="<%=request.getContextPath()%>/register.do" method="post" enctype="multipart/form-data">
        <h1>기본정보</h1><br>

        <label><b>프로젝트명</b></label>
        <input type="text" name="projectName" size="20" value=""><br><br>

        <label><b>목표금액</b></label>
        <input type="text" name="amountGoal" size="20"value="0"><br><br>

        <label><b>배송료</b></label><br>
        <input type="text" placeholder="가격을 입력하세요." name="delivery" size="18" ><b>원</b><br><br>

        <label><b>대표이미지</b></label><br>
        <label>파일선택:</label>
    <input type="file" name="uploadfile"><br><br>

    <label><b>카테고리선택:</b></label>
    
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

        </select><br><br>

        <label for="dateIn"><b>프로젝트 기간</b></label>
        <input type="date" name="dateInput" id="dateIn"><br><br>

        <label><b>성인인증</b></label><br>
        <input type="checkbox" id="confirm1" name="confirm1" value="" checked>
        <label for="confirm1">19세 이상 펀딩 가능한 리워드입니다.</label><br><br>

        <label><b>프로젝트 소개</b></label><br>
    <textarea name="detail" cols="40" rows="4" placeholder="간단한 설명을 기입해주세요."></textarea><br><br>

    <label><b>와디즈 약관 동의</b></label><br><br>
    <input type="checkbox" id="" name="confirm2" value="1" checked>
    <label for="confirm2">(필수)와디즈 심의 가이드라인을 숙지하여야 합니다.</label><br><br>

    <input type="checkbox" id="" name="confirm2" value="2" checked>
    <label for="confirm2">(필수)와디즈는 담당기관의 해석을 우선시합니다.</label><br><br>

    <input type="checkbox" id="" name="confirm2" value="3" checked>
    <label for="confirm2">관계법령을 준수하여야 합니다.</label><br><br>

    <input type="checkbox" id="" name="confirm2" value="4" checked>
    <label for="confirm2">제 3자의 지적재산권을 침해하지 않아야 합니다.</label><br>
    <hr>
    <input type="checkbox" id="" name="confirm2" value="5" checked>
    <label for="confirm2">모두 동의합니다.</label><br>
    <hr><br>

        <input id="btn1" type="button" value="완료하기"><br>
    </form>
    </div>
    
    <%@ include file="../common/footer.jsp"%>
</body>
</html>