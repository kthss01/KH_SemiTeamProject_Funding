
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인페이지</title>


<!-- 구글 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<style>
//인코딩 테스트
.body{
	font-family: 'Noto Sans KR', 'sans-serif';

}

.container_filed {
	width: 100%;
	padding-bottom:100px;
}

.carousel-item {
	height: 370px;
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
	font-family: 'Noto Sans KR', 'sans-serif';
	margin-top: 30px !important;
	margin-bottom: 10px !important;
	font-size: 28px !important;
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
	font-size:13px;
	font-weight: bold;
	color: #90949C;
	
}
#categoryName{
	font-size:12px;
	font-weight: bold;
	color: rgba(0, 0, 0, .8);
}
#ddln{
	font-size:13px;
	font-weight: bold;
	color: #90949C;
}

.lankTitle{
font-size:15px;
font-weight:bold;
font-family: 'Noto Sans KR', 'sans-serif';
}

.pTitle{
	font-family: 'Noto Sans KR', 'sans-serif';

}

li:hover{
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2), 0 0 1px rgba(0, 0, 0, 0.2);
	z-index:1;
	cursor:pointer;
}

.rank{
width:400px;
}

.openFunding:hover{
cursor:pointer;
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
						<div class=" mb-4 rankingList" style="border:none;">
							<!-- <div class="card-header">실시간 랭킹</div> -->
							<div class="list-group mb-0 rank" >


							</div>

						</div>

					</div>

				</div>


				<div class="preview">
					<h4>이런 강의도 있어요 !</h4>
				</div>
				<br>
				<div class="card banner "style="padding: 0px; margin-bottom:100px; width:900px; position: relative; overflow: hidden;" >
				 	<ul class="slider" style="list-style:none; display:flex; position: absolute; top:0; left:0;">
					</ul>
				</div>
				
				
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

	var bannerWidth = (document.querySelector('#top_banner')).clientWidth;
var imageCount = document.querySelectorAll('.slider_item').length;
var index = 0;
var slider = document.querySelector('.slider');
slider.style.width = bannerWidth * imageCount + 'px';
slides()
function slides() {
    for(var i=0;i<imageCount;i++){
        slider.style.left = -(bannerWidth * index) + 'px';    
    }
    index++;
    if (index === imageCount) {
        index = 0;
    }
    setTimeout(slides, 3000); 
}
			
			
			
						<div class="openFunding" style=" width:100%;   margin-top:200px;"
							onclick="location.href='views/project/registrationView.jsp'">
							<img src="resources/images/openfunding.png" alt="..."
								style="width: 100%; height: 270px;">
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
	const card2 = $('.lectureSlide');
	const rank = $('.rank');
	const contextPath = "<%=request.getContextPath()%>";

	
	<!--펀딩 추천 리스트 -->

	$.ajax({
		url:'random.pro',
		success:function(pList){
	
			pList.forEach((pj) => {
			const ratio = Math.floor((pj.amountPresent/pj.amountGoal)*100);
			console.log(pj.ddln);
			card.append(`
					<div class="col-lg-4 pCard " style="padding: 5px;">
				    <input type="hidden" value="\${pj.projectCode}">
					<div class="card mb-4" style="height:300px; width:280px; border:none;">
						<img class="card-img-top" style="height:185px;"
							src="\${contextPath}/resources/images/project/\${pj.titleImg}"
							alt="..." />
						<div class="card-body" style="padding:10px; border-bottom: 3px solid gray; position:relative;"  >
						<h2 class="card-title pTitle" style='font-size:15px; font-weight:bold; height:55px;'">\${pj.projectName}</h2>
						<span class="persent"> \${ratio}%</span>
						<span id="present">&#12685 \${pj.amountPresent.toLocaleString()}원</span>
						<span id="ddln" style="position:absolute; right:0; bottom:0;">마감 \${dDay(pj.ddln)}일 전</span>

						</div>
					</div>
					</div>	
					`)
					
					// 이벤트 처리
					   $(".pCard").on("click",function(){
						   var pCode = $(this).children('input').val();
							location.href = "<%=request.getContextPath()%>/detail.do?pCode="+pCode;
						});
		
			
			
			function dDay(ddln){
				var now = new Date();

				var year = now.getFullYear();
				var month = now.getMonth();
				var day = now.getDate();

				var today = new Date(year, month, day);
/* 				console.log("오늘 날짜 : " + today);
 */
				var ddlnArr = ddln.split(" ");
				
				var ddlnYear = ddlnArr[2]; 
				var ddlnMonth = ddlnArr[0].substr(0,ddlnArr[0].length-1);
				var ddlnDay = ddlnArr[1].substr(0,ddlnArr[1].length-1)
				
				var ddlnDate = new Date(ddlnYear, ddlnMonth, ddlnDay);
/* 				console.log("마감 날짜 : " + ddlnDate);
 */
				
				var btMs =  ddlnDate.getTime() - today.getTime();
				var btDay = (btMs / (1000*60*60*24));
/* 				console.log("d-day : " + btDay);
 */
				return btDay+1;
				
			}
			
			
			
					
			})
			
		},
		error:function(){
			console.log('통신실패1');
		}
	})
	

	
	
	
	
		<!--실시간 랭킹 리스트 -->

	$.ajax({
		url:'rank.pro',
		success:function(pList){
/* 			console.log(pList);
 */			var index = 1;
			pList.forEach((pj => {
			const ratio = Math.floor((pj.amountPresent/pj.amountGoal)*100);
				rank.append(`
						<li class="list-group-item pCard"
						style="padding:0px; width:100%; height:100px; overflow:hidden; height:auto; border:none; border-bottom: 2px solid lightgray; padding-top:10px; padding-bottom:5px;">
					    <input type="hidden" value="\${pj.projectCode}">

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

			}));
			

			
			// 이벤트 처리
			   $(".pCard").on("click",function(){
				   var pCode = $(this).children('input').val();
					location.href = "<%=request.getContextPath()%>/detail.do?pCode="+pCode;
				});
			
		},error:function(){
			console.log('통신에러');
		}
		
	})
	

	
	$.ajax({
		url:'random.le',
		success:function(lList){
			/*
				lectureCode: "1006"
				lectureNum: 80
				lectureTime: 0
				lectureTitle: "획기적인 것과 창의적인 것의 차이"
				lectureTopic: "펀딩오픈강의"
			    lecturer: "Ms.Kwon"
		    */
			lList.forEach((le) => {
			console.log(le);
 			card2.append(`
 						<input type="hidden" value="\${le.lectureCode}">
 						<li class="slider_item" style="margin: 15px 0px 0px 0px; height: 400px; width: 400px; text-align: center;">
 							<img class="slider" src="\${contextPath}/resources/lectureImage/\${le.lectureImage}">
 						<div class="card-body">
						<h2 class="card-title" onclick="location.href='#!'">\${le.lectureTitle}</h2>
						<span style="text-weight:bold"> 주제 : \${le.lectureTopic} / </span> &nbsp  <span style="text-weight:bold"> 정원 수 : \${le.lectureNum} </span>
						</div>
						</li>

					`) 
			})
		},
		error:function(){
			console.log('통신실패1');
		}
	})
	


	
})


	
	
	var sliderWidth = (document.querySelector('.lecture')).clientWidth;
	var imageCount = document.querySelectorAll('.sliderItem').length;
	var index = 0;
	var slider = document.querySelector('.lectureSlide');
		slider.style.width = sliderWidth * imageCount + 'px';
		slides();
	function slides() {
   	 for(var i=0;i<imageCount;i++){
   	     slider.style.left = -(sliderWidth * index) + 'px';    
   	 }
   	 index++;
   	 if (index === imageCount) {
  	      index = 0;
   	 }
   	 setTimeout(slides,5000); 
}





</script>



</html>