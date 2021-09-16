<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%import %>

<%ArrayList<UProject> list=(ArrayList)(request.getAttribute("")) %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="" align="center">
		<thead>
			<tr>
				<td>No</td>
				<td>회원번호</td>
				<td>프로젝트번호</td>
				<td>프로젝트명</td>
				<td>목표금액</td>
				<td>현재금액</td>
			</tr>
		</thead>
		
		<tbody>
			<%if(list !=null){ %>
				<% for(){%>
				<tr>
					<td><%= %></td>
					<td><%= %></td>
					<td><%= %></td>
					<td><%= %></td>
					<td><%= %></td>
					<td><%= %></td>
				</tr>
				<% }%>
			<%} else{%>
				<tr>
					<td colspan="">아직 참여중인 프로젝트가 없으시네요!</td>
				</tr>
				
			<%} %>
		</tbody>
	</table>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>