<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.kh.project.model.vo.Project"%>


<%
	ArrayList<Project> list = (ArrayList<Project>) request.getAttribute("list");
	DecimalFormat decFormat = new DecimalFormat("###,###");
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&fa
		         mily=Nanum+Gothic&family=Roboto&display=swap"
	rel="stylesheet">

<style>
.carousel-item {
	height: 400px;
}

.carousel-item>img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

#box {
	width: 100%;
	margin: 0 auto;
	overflow: hidden;
	height: auto;
}

.container_filed {
	width: 1300px;
	overflow:hidden;
	height:auto;
	padding: 15px;
	margin: 0 auto;
	padding-top:50px;
}

#categoryName h1 {
	width: 100%;
	font-family: 'Roboto', 'sans-serif';
	font-size:35px;
	font-weight:700;
	margin-top:70px;
	margin-bottom:40px;
	margin-left:30px;
}

#celectCategory {
	width: 100%;
}

.header {
	border: 1px solid black;
	width: 100%;
	height: 200px;
}

.info {
	width: 350px;
	height: 360px;
	float: left;
	margin: 30px;
	border : none !important;
}

.card-img-top>#pImg {
	width: 100%;
	height: 220px;
	object-fit: cover;
}

#pTitle {
	font-size: 20px;
	font-weight: bold;
	font-family: 'Roboto', 'sans-serif';
	padding: 5px;
}

#pTitle:hover {
	text-decoration: underline;
}

#pAmount {
	font-size:18px;
	font-family: 'Roboto', 'sans-serif';
	color: #90949C;
	border: none;
	border-top: 4px solid #00B2B2;
	padding-top: 2px;
}

.card {
	display: block !important; 
	float : left !important;
	border: none;
	float: left !important;
	
}
.card:hover{
cursor:pointer;
}
.card-body {
	padding: 0px !important;
}

#pBox {
	width: 1300px;
	margin: 0 auto;
	border: 1px solid red;
}

#persent{
color:#00B2B2;
font-weight:bold;
}

#pSearch{
height:38px;
width:400px;
border:2px solid #00B2B2;
border-radius: 20px;
margin-left:20px;
margin-right:20px;
margin-bottom:2px;
}

#pSearch:hover{
background: #F4FFFF;
opacity:0.5;
}

#pSearch::placeholder{
text-align:center;
}

#searchBtn{
font-size:22px;
border:none;
background:none;
font-weight:bold;
color:#00B2B2;
}



</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp"%>

	<div id=box>

		<!-- carousel -->
		<div id="intro" class="carousel slide" data-ride="carousel">
			<!-- indicators -->
			<ul class="carousel-indicators">
				<li data-target="#intro" data-slide-to="0" class="active"></li>
				<li data-target="#intro" data-slide-to="1"></li>
				<li data-target="#intro" data-slide-to="2"></li>
			</ul>

			<!-- slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="resources/images/recruit_img1.png" alt="img1">
				</div>
				<div class="carousel-item">
					<img src="resources/images/recruit_img2.png" alt="img2">
				</div>
				<div class="carousel-item">
					<img src="resources/images/recruit_img3.png" alt="img3">
				</div>
			</div>

			<!-- left and right controls -->
			<a href="#intro" class="carousel-control-prev" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a href="#intro" class="carousel-control-next" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>


		<div class="container_filed">
			<form class="searchArea">
				<div id="celectCategory">
					<select id="cName" name="cName" class="form-control" style="width:200px; display:inline; ">
						<option value="">여행,레저</option>
						<option value="">테크,가전</option>
						<option value="">스포츠</option>
						<option value="">홈리빙</option>
						<option value="">뷰티,패션잡화</option>
						<option value="">반려동물</option>
						<option value="">기부,후원</option>
						<option value="">출판</option>
						<option value="">푸드</option>
						<option value="">디자인소품</option>
						<option value="">공연,컬쳐</option>
						<option value="">소셜</option>
						<option value="">게임,취미</option>
						<option selected>카테고리</option>
					</select> 
					<input type="text" id="pSearch" name="search" placeholder="어떤 프로젝트를 찾고 계신가요?">
								
					<input id="searchBtn" style="height:38px;"type="submit" value='검색'>
					<i class="fas fa-search fa-lg" style="color:#00B2B2"></i>
				</div>
			</form>

			<div id="categoryName">
				<h1>어떤 프로젝트를 찾으시나요 ?</h1>
			</div>


			<%
				for (Project pj : list) {
			%>
			<%-- 
        <div class="div1">
        	<input type="hidden" value="<%=pj.getProjectCode()%>">
         	<img  src="<%=request.getContextPath() %>/resources/images/project/<%=pj.getTitleImg()%>" width="100%" height="80%">                
            <p class="caption"><%=pj.getProjectName() %><br>
                	현재금액:<%=pj.getAmountPresent() %>원
            </p>
        </div>&nbsp;
        --%>
			<div class="card info project">
				<input type="hidden" value="<%=pj.getProjectCode()%>">
				<div class="card-img-top">
					<img id="pImg"
						src="<%=request.getContextPath()%>/resources/images/project/<%=pj.getTitleImg()%>">
				</div>
				<div class="card-body">
					<h2 class="card-title h5" id="pTitle"><%=pj.getProjectName()%>
					</h2>
					<div class="h5" id="pAmount">
					<span id="persent"> <%= (int)Math.floor(((double)pj.getAmountPresent()/pj.getAmountGoal())*100) %>%</span>
						<span>≫ <%= decFormat.format(pj.getAmountPresent()) %>원</span>
					</div>
				</div>
			</div>

			<%
				}
			%>
		</div>
	</div>

	<div id="footer" style="clear: both; display: block;">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>

<script>
		
   $(function(){
	   
	   $(".project").on("click",function(){
		   var pCode = $(this).children().eq(0).val();
		   	console.log(pCode);
			location.href = "<%=request.getContextPath()%>/detail.do?pCode="+pCode;
		})
		
	
	
		
		
	})
	
</script>





</html>