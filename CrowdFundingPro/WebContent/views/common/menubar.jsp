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


</head>


<body>
	<!-- navbar -->
	<nav class="navbar navbar-expand-md bg-dark navbar-dark"
		style="padding-left: 200px; padding-right: 200px;">
		<!-- brand -->
		<a href="#" class="navbar-brand">사이트 이름</a>

		<!-- links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a href="#" class="nav-link">펀딩하기</a></li>

			<li class="nav-item"><a href="<%= request.getContextPath() %>/views/recruit/recruit.jsp" class="nav-link">채용공고</a></li>

			<!-- dropdowns -->
			<li class="nav-item dropdown"><a href="#"
				class="nav-link dropdown-toggle" id="navbardrop"
				data-toggle="dropdown"> 더보기 </a>
				<div class="dropdown-menu">
					<a href="" class="dropdown-item">공지사항</a> <a href=""
						class="dropdown-item">펀딩스쿨</a> <a href="" class="dropdown-item">문의하기</a>
				</div></li>
		</ul>

		<ul class="navbar-nav ml-auto">
			<li class="nav-item">
				<a href="#" class="nav-link"> 
					<i class="fas fa-search fa-lg"></i> 
				</a>
			</li>
			<%if (loginUser == null) { %>
			<li class="nav-item"><a href="<%=request.getContextPath() %>/loginForm.me" class="nav-link">로그인</a></li>
			<li class="nav-item"><a href="<%=request.getContextPath() %>/enrollForm.me"class="nav-link">회원가입</a></li>
			<%} else { %>
			<li class="nav-item"><a href="<%=request.getContextPath() %>/mypage.me" class="nav-link">마이페이지</a></li>
			<li class="nav-item"><a href="<%=request.getContextPath() %>/logout.me"class="nav-link">로그아웃</a></li>
			
			<% } %>
		</ul>
	</nav>
</body>
</html>