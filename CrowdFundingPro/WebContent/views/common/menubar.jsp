<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.user.model.vo.User" %>

<%
	User loginUser = (User)session.getAttribute("loginUser");
	String msg = (String)session.getAttribute("msg");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

	<!-- 다크모드 css -->
<link
	href="./resources/css/darkTheme.css"
	rel="stylesheet">
	
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
	
</head>


<body>
	
	<nav class="navbar navbar-expand-md bg-dark navbar-dark"
		style="padding-left: 130px; padding-right: 130px;">
		<a href="<%=request.getContextPath() %>" class="navbar-brand" style="font-size:22px;">CROWD FUND!NG</a> <!-- 클릭하면 메인 페이지로 이동  -->
		

		<ul class="navbar-nav">
			<li class="nav-item"><a href="#" class="nav-link">펀딩하기</a></li> <!-- 펀딩페이지 링크 -->

			<li class="nav-item"><a href="<%= request.getContextPath() %>/recruitPage.do" class="nav-link">채용공고</a></li>

			<li class="nav-item dropdown"><a href="#" class="nav-link dropdown-toggle" id="navbardrop" data-toggle="dropdown"> 더보기 </a>
				<div class="dropdown-menu">

					<a href="#" class="dropdown-item">공지사항</a> 
					<a href="#" class="dropdown-item">펀딩스쿨</a>
					<a href="#" class="dropdown-item" onclick="goFaq();">문의하기</a>
						
				</div>
			</li>

		</ul>
		<script>
			/* 문의사항 == FAQ */
			function goFaq(){
				location.href="<%=request.getContextPath()%>/list.fq";
			}
		</script>

		<ul class="navbar-nav ml-auto">
			
			<!--  검색 아이콘   **추가기능** -->
			<li class="nav-item"> <a href="#" class="nav-link"> <i class="fas fa-search fa-lg"></i> </a> </li>
			
			<%if (loginUser == null) { %>  <!-- 로그인 전 -->
			<li class="nav-item"><a href="<%=request.getContextPath() %>/loginForm.me" class="nav-link">로그인</a></li>
			<li class="nav-item"><a href="<%=request.getContextPath() %>/enrollForm.me"class="nav-link">회원가입</a></li>
			<%} else { %> <!-- 로그인 후 -->
			<li class="nav-item"><a href="<%=request.getContextPath() %>/mypage.me" class="nav-link">마이페이지</a></li>
			<li class="nav-item"><a href="<%=request.getContextPath() %>/logout.me" class="nav-link">로그아웃</a></li>
			
			<% } %>
			<li class="nav-item"><a id="colorTheme" role="button" class="nav-link" onclick="colorTheme();">다크모드</a></li>

		</ul>
	</nav>
</body>
<script>

	function colorTheme(){
    	$('body').toggleClass('dark-theme');
	}

    
    </script>
</html>