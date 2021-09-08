<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.user.model.vo.User" %>
<%@ page import="com.kh.lecture.model.vo.Lecture"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.kh.common.model.vo.PageInfo" %>

<%
String contextPath = request.getContextPath();
ArrayList<Lecture> lectureList = (ArrayList<Lecture>) request.getAttribute("lectureList");
PageInfo pi = (PageInfo)request.getAttribute("pi");

int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
%>


<%//User loginUser = (User) request.getAttribute("loginUser");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>

<link href="resources/css/menubar.css" rel="stylesheet" type="text/css">
<link href="resources/css/lecture/lectureMain.css" rel="stylesheet" type="text/css">


<style>
@charset "UTF-8";

ul {
	list-style: none;
}

.main_top {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 50px;
	margin-bottom: 80px;
	padding: 30px;
}

#top_banner {
	width: 900px;
	height: 400px;
	position: relative;
	background-color: antiquewhite;
	overflow: hidden;
}

.slider {
	display: flex;
	position: absolute;
	top: 0;
	left: 0;
}

.slider_item {
	width: 1200px;
	height: 400px;
	text-align: center;
}

ul img {
	width: 600px;
	height: 400px;
}

#top_banner ul {
	-webkit-transition: all 0.25s cubic-bezier(1, .01, .32, 1);
	-o-transition: all 0.25s cubic-bezier(1, .01, .32, 1);
	transition: all 0.25s cubic-bezier(1, .01, .32, 1);
}

.center {
	width: 100%;
	/* display: inline-flex; */
	display: flex;
}

.left {
	height: 1200px;
	width: 50%;
}

.right {
	height: 1200px;
	width: 50%;
}

.lecWrapper {
	float: right;
	padding-top: 20px;
	padding-bottom: 20px;
}

.lec_Item {
	margin-top: 30px;
	margin-right: 40px;
	display: flex;
	border: 2px solid rgb(25, 25, 25, .44);
	height: 200px;
	margin-bottom: 20px;
	border-radius: 10px;
}

.lec_Item img {
	width: 180px;
	height: 180px;
	margin-top: 10px;
	margin-left: 10px;
	margin-bottom: 10px;
	border-radius: 5px;
}

.details {
	background-color: white;
	height: 180px;
	width: 400px;
	margin-left: 40px;
	margin-top: 10px;
	margin-right: 10px;
	margin-bottom: 10px;
	border-radius: 5px;
	text-align: center;
}

.details pre {
	font-size: 20px;
	font-family: 'Nanum Brush Script', cursive;
}

.area {
	background-color: rgb(240, 215, 210);
	width: 300px;
	height: 550px;
	margin-top: 50px;
	margin-left: 40px;
	border-radius: 10px;
}

#regist {
	background-color: paleturquoise;
	right: 0%;
	bottom: 0%;
	font-family: 'Nanum Brush Script', cursive;
	align-self: flex-end;
}

#inserLecture{

	border-radius: 5px;
    background-color: gray;
    color: white;
}


input {
	margin-left: 25px;
}
</style>

<link href="resources/css/menubar.css" rel="stylesheet" type="text/css">

</head>
<body>

<%--
	<jsp:include page="/views/common/menubar.jsp" />
 --%>
	<%@ include file="../common/menubar.jsp"%>

	<!-- 화면 중앙 구현 부-->
	<div class="main">

		<!-- 화면 상단 이미지 슬라이드-->
		<div class="main_top">
			<div id="top_banner">
				<ul class="slider">
					<li class="slider_item"><img
						src="resources/images/no_image.png"></li>
					<li class="slider_item"><img
						src="resources/images/no_image.png"></li>
					<li class="slider_item"><img
						src="resources/images/no_image.png"></li>
				</ul>
			</div>
		</div>
		<script src="resources/script/lecture/lectureSlider.js"></script>
		<!-- 이미지 슬라이드 끝-->

		<div class="center">
			<div class="left">
				<div class="lecWrapper">

					<%
					if (lectureList != null && !(lectureList.isEmpty())) {
					%>
		
	
					<%
					for (Lecture l : lectureList) {
					%>

					<div class="lec_Item" onclick ='moveToDetail()'>
						<img src="<%l.getLectureImage();%>">
						<div class="details">
								<table>
								<tbody>
									<tr>
										<td> 주제 :<%=l.getLectureTopic()%> </td>
									</tr>
									<tr>
										<td> 제목 :<%=l.getLectureTitle()%></td>
									</tr>
									<tr>
										<td> 날짜 :<%=l.getLectureDate()%> </td>
									</tr>
									<tr>
										<td> 강사 :<%=l.getLecturer()%>
										</td>
									</tr>
									<tr>
										<td> 강의 시간: <%=l.getLectureTime()%> / </td>
										<td> 강의 인원:<%=l.getLectureNum()%>
									</tr>
									<tr>
										<td style="color='white'"><%=l.getLectureCode()%></td>
									</tr>
								</tbody>
								</table>
						</div>
					</div>
					<% } 
					} else { %>
						<div class="lec_Item">
						<img src="resources/images/NoImage.png">

						<div class="details">
							<div class="content">
								<table>
								<tbody>
									<tr><td>등록된 강의 정보가 없습니다.</td></tr>
								</tbody>
								</table>
							</div>
						</div>
					</div>
					<% } %>
				</div>
			</div>
			
				<!-- 페이징바 만들기 -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=1'"> &lt;&lt; </button>
		
			<!-- 이전페이지로(<) -->
			<%if(currentPage == 1){ %>
			<button disabled> &lt; </button>
			<%}else{ %>
			<button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage-1 %>'"> &lt; </button>
			<%} %>
			
			<!-- 페이지 목록 -->
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(p == currentPage){ %>
				<button disabled> <%= p %> </button>
				<%}else{ %>
				<button onclick="location.href='<%=contextPath %>/list.bo?currentPage=<%= p %>'"> <%= p %> </button>
				<%} %>
				
			<%} %>
			
			<!-- 다음페이지로(>) -->
			<%if(currentPage == maxPage){ %>
			<button disabled> &gt; </button>
			<%}else { %>
			<button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage+1 %>'"> &gt; </button>
			<%} %>
		
			<!-- 맨 끝으로 (>>) -->
			<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
		</div> 
		<br><br>
		<div align="center">
		<% if(loginUser != null){ %>
		<button onclick="location.href='enrollForm.bo'">작성하기</button>
		<% } %>
		</div>
			
			<script>
					<%if(!lectureList.isEmpty()){%>
					$(function(){
						$(".details>table>tbody>tr").click(function(){
							var lecCode = $(this).children().eq(7).text();
							location.href="<%=request.getContextPath()%>/lectureDetail.le?lecCodeo="+lecCode;
						})
					})
					<%}%>
				
			<%--
			const moveToDetail () => {
				
				var lecCode = 
					
				window.location.href = " <%=request.getContextPath()%>/leDetail.le?lId=";
				
				<%  if(!list.isEmpty()){ %>
				$(function(){
					$(".listArea>tbody>tr").click(function(){
						var nno = $(this).children().eq(0).text();
						
						
						location.href="<%=request.getContextPath()%>/detail.no?nno="+nno;
					})
				})
				
				<% } %> 
			}  --%>
			
			
				
			<%-- 
				window.addEvenetListener('scroll',() = > {
					
					const {scrollheight,scrollTop,clientheight} = document.documentElement;
					if(scrollTop + clientHeight >= scrollHeight -5) {
						
						<% if ( count <= lectureList.size()){
							l = lectureList.get(count++); %>
							setTimeout(addLec,1500);
						<% } %>
					  }
					}
					
				})
				
				function addLec(){
					
					const lec = document.createElement('div');
					lec.className = 'lec_Item';
					lec.innerHTML = '
						<img src="<%l.getLectureImage();%>">
					<div class="details">
						<div class="content">
							<table>
								<tr>
									<td> 주제 :<%=l.getLectureTopic()%> </td>
								</tr>
								<tr>
									<td> 제목 :<%=l.getLectureTitle()%></td>
								</tr>
								<tr>
									<td> 날짜 :<%=l.getLectureDate()%> </td>
								</tr>
								<tr>
									<td> 강사 :<%=l.getLecturer()%>
									</td>
								</tr>
								<tr>
									<td> 강의 시간: <%=l.getLectureTime()%><p>/</p></td>
									<td> 강의 인원:<%=l.getLectureNum()%>
								</tr>
							</table>
						</div>
					</div>
					';
					
					
					document.querySelector(".lecWrapper").appendChild(lec);
					
				}
	 		--%>		
			</script>
			
			
			

			<div class="right">
				<div class="area"></div>
				

				
				<div class="area2">
					<ul>
						<li>
						  <a href="<%= request.getContextPath() %>/lecInsertForm.le"> 신규 강의 등록</a>
						</li>
					</ul>
				</div>
			</div>

		</div>



	</div>
	<script>
	
	</script>	
	

	<jsp:include page="/views/common/footer.jsp" />





</body>
</html>