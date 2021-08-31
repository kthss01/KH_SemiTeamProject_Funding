<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="com.kh.user.model.vo.User" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> </title>

<link href="resources/css/menubar.css" rel="stylesheet" type="text/css">
<link href="resources/css/lecture/lectureMain.css" rel="stylesheet"
	type="text/css">


<style>
@charset "EUC-KR";

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

.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	opacity: 1;
	transition: opacity 1s;
}

.modal.opaque {
	opacity: 1;
	transition: opacitiy 1s;
}

.modal.unstaged {
	bottom: -100px;
	height: 0;
}

.modal-close:hover {
	background-color: #ffd500;
}

.modal_overlay {
	background-color: rgba(0, 0, 0, .70);
	width: 100%;
	height: 100%;
	position: absolute;
}

.modal_content {
	background-color: white;
	padding: 10px 60px 50px 60px;
	align-items: center;
	text-align: center;
	position: relative;
	top: 0px;
	border-radius: 15px;
	box-shadow: 0 5px 20px rgba(0, 0, 0, .25), 0 10px 10px
		rgba(0, 0, 0, .80);
	width: 800px;
	height: 900px;;
	border: 10px solid gray;
	overflow-y: scroll;
}

.hidden {
	display: none;
}

.top {
	background-color: rgb(80, 80, 80);
	border-radius: 10px;
	color: white;
	margin-bottom: 100px;
}

.labels {
	background-color: rgb(80, 80, 80);
	color: white;
	border-radius: 10px;
	padding: 5px 10px 5px 10px;
	font-size: 20px;
}

.preview {
	margin: 0 auto;
	width: 500px;
	height: 300px;
}

.preview img {
	left: 0;
	bottom: 0;
	align-self: flex-start;
	border: 1px dashed black;
}

#selectImg {
	margin: 0px 0px 10px 10px;
	font-family: 'Nanum Brush Script', cursive;
	border: 0px;
	border-radius: 5px;
}

.box {
	display: table;
	height: 85px;
	width: 350px;
	margin: 0 auto;
	text-align: center;
}

textarea {
	margin-top: 20px;
	margin-bottom: 20px;
	display: block;
	width: 600px;
}

input {
	margin-left: 25px;
}
</style>

<link href="resources/css/menubar.css" rel="stylesheet" type="text/css">

</head>
<body>


	<jsp:include page="/views/common/menubar.jsp" />

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
					<div class="lec_Item">
						<img src="resources/images/sample1.png">

						<div class="details">
							<div class="content">
								<a href="<%=request.getContextPath()%>/lectureDetail.le">행복한
									펀딩 세상 </a>

							</div>
						</div>
					</div>

					<div class="lec_Item">
						<img src="resources/images/no_image.png">
						<div class="details">

							<div class="content">
								<p> ---- </p>
							</div>

						</div>
					</div>

					<div class="lec_Item">
						<img src="resources/images/no_image.png">
						<div class="details">

							<div class="content">
								<p> ----</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="right">
				<div class="area"></div>



				<button class="openBtn">OPEN MODEL</button>
				<div class="modal hidden">
					<div class="modal_overlay"></div>
					<div class="modal_content">

						<div class="top">신규 강의 등록</div>

						<form class="regist" method="POST">
							<div class="preview" id="top">
								<img src="resources/images/no_image.png" class="lectureImage">

								<button id="selectImg">사진 업로드</button>
							</div>

							<div class="information">
								<span class="box"> <label class="labels"><b>
											강사 </b></label> <input type="text" class="lecturer" placeholder="강사이름">
											<!--  <input type="text" value=" loginUser" readonly> -->
								</span>
								<div class="box">
									<label class="labels"><b> 강의 제목 </b></label> <input type="text"
										class ="lectureTItle" placeholder="강의 제목">
								</div>
								<div class="box">
									<label class="labels"><b> 강의 날짜 </b></label> <input
										class ="lectureDate" type="datetime-local" placeholder="강의 날짜">
								</div>
								<div class="box">
									<label class="labels"><b> 강의 주소 </b></label> <input type="text"
										class ="lectureAddress" placeholder="강의 주소">
								</div>
								<div class="box">
									<label class="labels"><b> 강의 인원 </b></label> <input type="number"
										class ="lectureNumber" placeholder="강의 인원">
								</div>
								<div class="box">
									<label class="labels"><b> 강의 주제 </b></label> <input type="text"
										class ="lectureTopic" placeholder="강의 인원">
								</div>
								<div class="box">
									<label class="labels"><b> 강의 시간 </b></label> <input type="number"
										class ="lectureTime" placeholder="강의 인원 (분)">
								</div>
								
								<div class="box">
									<label class="labels"><b> 강의 세부내용 </b></label> <br>
									<textarea cols="40" rows="25" class ="lectureDatail"></textarea>
								</div>
							</div>
						</form>

						<input type="submit" value="등록">
						<button class="closeBtn">취소</button>

					</div>
				</div>



				<script type="text/javascript"
					src="resources/script/lecture/lectureRegistIn.js"></script>

			</div>

		</div>



	</div>

	<jsp:include page="/views/common/footer.jsp" />





</body>
</html>