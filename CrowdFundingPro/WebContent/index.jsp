
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인페이지</title>



<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&fa
            mily=Nanum+Gothic&family=Roboto&display=swap"
	rel="stylesheet">

<style>
.container_filed {
	width: 100%;
	height: 2500px;
}

.carousel-item {
	height: 400px;
}

.carousel-item>img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.container {
	color: black;
}

h4 {
	font-family: 'Roboto', 'sans-serif';
	margin-top: 30px !important;
	font-size: 2em;
	font-weight: 600 !important;
	letter-spacing: -1px;
}

.card:hover .card-title {
	text-decoration: underline;
}

.card:hover {
	cursor: pointer;
	z-index:2;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2), 0 0 1px rgba(0, 0, 0, 0.2);
	border:1.5px solid lightgray;
}

.persent {
	color: #00B2B2;
	font-weight: bold;
}

#present {
	font-weight: bold;
	color: #90949C;
}


.lankTitle{
font-size:15px;
font-weight:bold;
}

.rank > li:hover{
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2), 0 0 1px rgba(0, 0, 0, 0.2);
	z-index:1;
}

.rank{
width:400px;
}
</style>

</head>

<body>

	<%@ include file="views/common/menubar.jsp"%>
	<!-- master push -->
	<!-- test -->

	<div class="container_filed">

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

		<div class="box" style="width: 1300px; margin: 0 auto; padding: 10px;">

			<div class="container" style="display: inline;">
				<div class="row">
					<!-- Blog entries-->

					<div class="col-lg-8">
						<!-- Featured blog post-->
						<div class="preview">
							<%
								if (loginUser != null) {
							%>
							<h4><%=loginUser.getUserName()%>님, 이 프로젝트 어때요 ?
							</h4>
							<%
								} else {
							%>
							<h4>이 프로젝트 어때요 ?</h4>
							<%
								}
							%>
						</div>

						<!-- Nested row for non-featured blog posts-->
						<div class="row project">

							<%--
							<div class="col-lg-4 " style="padding: 5px;">
								<!-- Blog post-->
								<div class="card mb-4 ">
									<a href="#!"><img class="card-img-top"
										src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
										alt="..." /></a>
									<div class="card-body">
										<div class="small text-muted">January 1, 2021</div>
										<h2 class="card-title h4">프로젝트명</h2>

									</div>
								</div>
							</div>
							
							

							--%>
						</div>

					</div>
					<!-- Side widgets-->
					<div class="col-lg-4" >
						<div class="ranking">
							<h4 style="display:inline-block;">실시간 랭킹</h4>
							<span style="font-size:11px; color:lightgray;">( 서포터 수 기준 )</span>
							
						</div>
						<div class="card mb-4 rankingList" style="border:none;">
							<!-- <div class="card-header">실시간 랭킹</div> -->
							<ol class="list-group mb-0 rank" >


							</ol>

						</div>

					</div>

				</div>


				<div class="preview">
					<h4>이런 강의도 있어요 !</h4>
				</div>
				<br>
				<div class="card lecture "style="padding: 0px; margin-bottom:100px; width:900px;" >
					<a href="#!"><img style="width: 100%; height: 200px;"
						class="card-img-top"
						src="https://dummyimage.com/850x350/dee2e6/6c757d.jpg" alt="..." /></a>
					<div class="card-body">
						<h2 class="card-title" onclick="location.href='#!'">강의명</h2>
					</div>
				</div>



			
						<div class="openFunding" style=" width:1100px;   margin:0 auto;"
							onclick="location.href='views/project/registrationView.jsp'">
							<img src="resources/images/openfunding.png" alt="..."
								style="width: 100%; height: 100%;">
						</div>

			</div>
		</div>

	</div>
	
	<div id="footer" style="display:block;">
		<%@ include file="views/common/footer.jsp"%>
	</div>
</body>

<script>

/*
<div class="col-lg-4 " style="padding: 5px;">
<!-- Blog post-->
<div class="card mb-4 ">
	<a href="#!"><img class="card-img-top"
		src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
		alt="..." /></a>
	<div class="card-body">
		<div class="small text-muted">January 1, 2021</div>
		<h2 class="card-title h4">프로젝트명</h2>

	</div>
</div>
</div>
*/
$(function(){
	const card = $('.project');
	const rank = $('.rank');
	const contextPath = "<%=request.getContextPath()%>";

	$.ajax({
		url:'random.pro',
		success:function(pList){
	
			pList.forEach((pj) => {
			const ratio = Math.floor((pj.amountPresent/pj.amountGoal)*100);

			card.append(`
					<div class="col-lg-4 " style="padding: 5px;">
					<div class="card mb-4 " style="height:300px; width:260px; border:none;">
				    <input type="hidden" value="\${pj.projectCode}">
						<img class="card-img-top" style="height:185px;"
							src="\${contextPath}/resources/images/project/\${pj.titleImg}"
							alt="..." />
						<div class="card-body" style="padding:10px; border-bottom: 3px solid gray;" >
						<h2 class="card-title pTitle" style='font-size:15px; font-weight:bold;'">\${pj.projectName}</h2>
						<span class="persent"> \${ratio}%</span>
						<span id="present">  \${pj.amountPresent.toLocaleString()}원</span>

						</div>
					</div>
					</div>	

					`)
			})
		},
		error:function(){
			console.log('통신실패1');
		}
	})
	
	
	
	
	
	$.ajax({
		url:'rank.pro',
		success:function(pList){
			console.log(pList);
			var index = 1;
			pList.forEach((pj => {
			const ratio = Math.floor((pj.amountPresent/pj.amountGoal)*100);
				rank.append(`
						<li class="list-group-item" style="padding:0px; width:100%; height:100px; overflow:hidden; height:auto; border:none; border-bottom: 2px solid lightgray; padding-top:10px; padding-bottom:5px;">
						
						<div style="font-size:1.5em; color:rgba(0,0,0,.84); font-weight:bold; padding-left:5px;  width:15px; height:100px; float:left;">\${index++}</div>
						<div style="width:240px; color:rgba(0,0,0,.64) padding-top:20px; padding-left:10px; height:70px; float:left;" class="lankTitle">\${pj.projectName}
						</div>
						<div class="thumbnail" style="display:inline-block; width:140px; height:100px; background-color:black; float:left;">
						<img class="card-img-top" style="height:100px;"
							src="\${contextPath}/resources/images/project/\${pj.titleImg}"
							alt="..." />
						</div>

						<div class="persent" style=" font-size:13px; padding-left:30px; width:240px; float:left;">\${ratio}%<span style="color:gray;"> &#12685 \${pj.categoryName}</span></div>
						
						
						</li>
					
						`)
					
			}))
			
		},error:function(){
			console.log('통신에러');
		}
		
	})
	
	
	
})

</script>



</html>