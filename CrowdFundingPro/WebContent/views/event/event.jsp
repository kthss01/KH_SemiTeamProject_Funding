<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.kh.user.model.vo.ULecture"%>
<%@ page import="com.kh.user.model.vo.UProject"%>
<%@ page import="com.kh.user.model.vo.IProject"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&fa
            mily=Nanum+Gothic&family=Roboto&display=swap"
	rel="stylesheet" />


</head>
<style>
.box {
	width: 100%;
	margin: 0 auto;
}

#pageTitle {
	font-size: 48px;
	text-align: center;
	font-family: 'Roboto', sans-serif;
	font-weight: bold;
}

.pageHead {
	width: 100%;
	height: 250px;
	padding-top: 100px;
	margin-bottom: 50px;
	position:relative;
	z-index:1;
}
.pageHead::after{
	width:100%;
	height:250px;
	content:"";
	background : url('<%=request.getContextPath() %>/resources/images/eventBannerImg.jpg');
	opacity: 0.5;
	position:absolute;
	top:0;
	left:0;
	z-index:-1;
}
.event-form {
	justify-content: center;
	align-items: center;
	width: 800px;
	height: 100vh;
	margin: 0 auto;
}
.event-form .info {
	width: 800px;
	height: 140px;
	border-bottom: solid 0.2px rgb(0, 0, 0, .2);
	margin-bottom: 20px;
	padding-bottom:20px;
}
.info .title {
	width: 650px;
	height:90px;
	font-size : 20px;
	color: #1d2129;
	font-family: 'Roboto', sans-serif;
	font-weight: 600;
	font-size: 20px;
	float:left;
}
#img {
	float:left;
	width: 140px;
	height: 120px;
	margin-left:10px;
	background-color:	rgb(0,0,0,.8);
	text-align : center;
	color:white;
}
</style>

<body>


	<%@ include file="../common/menubar.jsp"%>



	<div class='box'>

		<div class="pageHead">
			<h1 id="pageTitle">이벤트</h1>
		</div>

		<div class="event-form">

			<div class="info">

				<div class="title">[펀딩] 코오롱FnC 먼저 만나는 가을 기획전 | 무료배송+3천원 쿠폰</div>
				<div id="img">이미지</div>
			</div>

			<div class="info">
				<div class="title">
					[이벤트] 펀딩할수록 커지는 혜택!
					<렛츠펀딩!> 프로모션 | 펀딩만 해도 100% 당첨 | 8/23~9/5 
			
				</div>
								<div id="img">이미지</div>
				
					
				
			</div>


			<div class="info">
				<div class="title">[푸드 펀딩 기획전] 매일 먹던 거 말고 뭔가 새로운 건 없을까? | 펀딩할수록
					커지는 혜택까지!</div>
									<div id="img">이미지</div>
					
			</div>

		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>