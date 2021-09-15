<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.user.model.vo.User"%>
<%@ page import="com.kh.lecture.model.vo.Lecture"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.kh.common.model.vo.PageInfo"%>

<%
String contextPath = request.getContextPath();
ArrayList<Lecture> lectureList = (ArrayList<Lecture>) request.getAttribute("lectureList");
PageInfo pi = (PageInfo) request.getAttribute("pi");

System.out.println(contextPath);

int listCount = pi.getListCount();
System.out.println("count:" + listCount);
int currentPage = pi.getCurrentPage();
System.out.println("current:" + currentPage);
int maxPage = pi.getMaxPage();
System.out.println("max:" + maxPage);
int startPage = pi.getStartPage();
System.out.println("start:" + startPage);
int endPage = pi.getEndPage();
System.out.println("end:" + endPage);
%>


<%
//User loginUser = (User) request.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link href="resources/css/menubar.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&fa
            mily=Nanum+Gothic&family=Roboto&display=swap"
	rel="stylesheet">
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
	width: 830px;
	height: 400px;
	position: relative;
	background-color: rgb(52, 58, 64);
	overflow: hidden;
}

.slider {
	display: flex;
	position: absolute;
	top: 0;
	left: 0;
}

.slider_item {
	margin: 15px 0px 0px 0px width: 1200px;
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
	float:
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

.lecturePage {
	margin: 15px 10px 15px 10px;
	width: 100%;
}

.lecturePage>button {
	background-color: rgb(255, 255, 255);
	color: rgb(0, 123, 255);
	font-size: 18px;
	font-weight: bold;
	font-family: 'inherit';
	border: 1px solid white;
}

.pageButton {
	margin: 10px 15px 10px 15px;
}

.lecturePage>button:hover {
	background-color: rgb(0, 123, 255);
	color: white;
	cursor: pointer;
}

.pageButton:active {
	background-color: rgb(0, 79, 154);
	color: rgb(190, 190, 190);
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

#inserLecture {
	border-radius: 5px;
	background-color: gray;
	color: white;
}

input {
	margin-left: 25px;
}

table {
	width: 100%;
	height: 100%;
	border: 1px solid rgb(230, 230, 230);
	border-radius: 5px;
}

tbody {
	line-height: 25px;
}

.topic {
	text-weight: bold;
}

.registBox{
	position:relative;
	right: 0;
	bottom: 0;
	magin: 0px 15px 10px 0px;
		
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
						src="resources/lectureImage/lectureImage_4.png"></li>
					<li class="slider_item"><img
						src="resources/lectureImage/lectureImage_8.png"></li>
					<li class="slider_item"><img
						src="resources/lectureImage/lectureImage_9.png"></li>
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
					
					<div class="lec_Item">
						<p style="display: none"><%=l.getLectureCode()%></p>
						<img  src="<%=request.getContextPath() %>/resources/lectureImage<%=l.getLectureImage()%>"/>  
						<div class="details">
							<table>
								<tbody>
									<tr>
										<td class="topic"><%=l.getLectureTopic()%></td>
									</tr>
									<tr>
										<td class="title"><%=l.getLectureTitle()%></td>
									</tr>
									<tr>
										<td class="date"><%=l.getLectureDate()%></td>
									</tr>
									<tr>
										<td class="human"><%=l.getLecturer()%></td>
									</tr>
									<tr>
										<td class="time">강의 시간 - <%=l.getLectureTime()%></td>
									</tr>
									<tr>
										<td class="number">수용 인원-<%=l.getLectureNum()%></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<%
					}
					} else {
					%>
					<div class="lec_Item">
						<img src="resources/images/NoImage.png">
						<div class="details">
							<div class="content">
								<table>
									<tbody>
										<tr>
											<td>등록된 강의 정보가 없습니다.</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<%
					}
					%>



					<div class="lecturePage" align="center">

						<button class="pageButton"
							onclick="location.href='<%=request.getContextPath()%>/list.le?currentPage=1'">
							&lt;&lt;</button>
						<%
						if (currentPage == 1) {
						%>
						<button class="pageButton" disabled>&lt;</button>
						<%
						} else {
						%>
						<button
							onclick="location.href='<%=request.getContextPath()%>/list.le?currentPage=<%=currentPage - 1%>'">
							&lt;</button>
						<%
						}
						%>

						<!-- 페이지 목록 -->
						<%
						for (int i = 1; i <= endPage; i++) {
						%>

						<%
						if (i == currentPage) {
						%>
						<button class="pageButton" disabled>
							<%=i%>
						</button>
						<%
						} else {
						%>
						<button class="pageButton"
							onclick="location.href='<%=request.getContextPath()%>/lecture.le?currentPage=<%=i%>'">
							<%=i%>
						</button>
						<%
						}
						%>
						<%
						}
						%>
						<%
						if (currentPage == maxPage) {
						%>
						<button class="pageButton" disabled>&gt;</button>
						<%
						} else {
						%>
						<button class="pageButton"
							onclick="location.href='<%=request.getContextPath()%>/lecture..le?currentPage=<%=currentPage + 1%>'">
							&gt;</button>
						<%
						}
						%>
						<%
						if (currentPage == maxPage) {
						%>
						<button class="pageButton" disabled>&gt;&gt;</button>
						<%
						} else {
						%>
						<button class="pageButton"
							onclick="location.href='<%=request.getContextPath()%>/lecture..le?currentPage=<%=maxPage%>'">
							&gt;&gt;</button>
						<%
						}
						%>
					</div>
				</div>



			</div>




			<script>
					$(function(){
						$(".lec_Item").click(function(){
							var code = $(this).children().eq(0).text();
							location.href="<%=request.getContextPath()%>/lectureDetail.le?code="+code;
							console.log(code);
						})
					})
				
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
				<div class="area">
					<div class="lecture_Rank">
											
						
					</div>
					
				
				
				
				</div>
				<div class="registBox">
					<ul>
						<li><button style="background-color:white; border:none; color:rgb(0,0,0,0.43);" type="button" onclick="location.href=' <%=request.getContextPath()%>/lecInsertForm.le'"> 강의 등록 
						<b style="font-weight:bold; font-size:12px; text-shadow: -1px 0 blakc, 0 1px black, 1px 0 black, 0 -1px black; color:rgb(211,211,211);">+</b></button></li>
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