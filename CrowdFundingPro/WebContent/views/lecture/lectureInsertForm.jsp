<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.body{
	height: 2200px;
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
	height: 750px;;
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
	
	height: 256px;
	width: 256px;
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
</style>
</head>
<body>		
				<div class="modal">
					<div class="modal_overlay"></div>
					<div class="modal_content">

						<div class="top">신규 강의 등록</div>

						<form class="regist" method="POST" action="<%= request.getContextPath()%>/lectureInsert.le"  enctype="multipart/form-data">
							<div class="preview" id="top">
								<img src="resources/images/NoImage.png" class="lectureImage">

								<input type="file" id="selectImg" value="사진 업로드" onchange="previewImg(event);"/>
							</div>

							<div class="information">
								<span class="box"> <label class="labels"><b>
											강사 </b></label> <input type="text" class="lecturer" placeholder="강사이름">
											<!--  <input type="text" value=" loginUser" readonly> -->
								</span>
								<div class="box">
									<label class="labels"><b> 강의 제목 </b></label> <input type="text"
										class ="lectureTItle" placeholder="강의 제목" required>
								</div>
								<div class="box">
									<label class="labels"><b> 강의 날짜 </b></label> <input
										class ="lectureDate" type="date" placeholder="강의 날짜" required>
								</div>
								<div class="box">
									<label class="labels"><b> 강의 주소 </b></label> <input type="text"
										class ="lectureAddress" placeholder="강의 주소" required>
								</div>
								<div class="box">
									<label class="labels"><b> 강의 인원 </b></label> <input type="number"
										class ="lectureNumber" placeholder="강의 인원" required>
								</div>
								<div class="box">
									<label class="labels"><b> 강의 주제 </b></label> <select
										class ="lectureTopic" required>
										<option value="펀딩투자강의"> 펀딩투자강의 </option>
										<option value="펀딩오픈강의"> 펀딩오픈강의 </option>
										<option value="펀딩입문강의"> 펀딩입문강의 </option>
										</select>
								</div>
								<div class="box">
									<label class="labels"><b> 강의 시간 </b></label> <input type="number"
										class ="lectureTime" placeholder="강의 인원 (분)" required>
								</div>
								
								<div class="box">
									<label class="labels"><b> 강의 세부내용 </b></label> <br>
									<textarea cols="40" rows="25" class ="lectureDatail"></textarea>
								</div>
							</div>
							<button type="submit" > 등록 </button>
							<button type="button" onclick="hisotry.back(); 
							">취소</button>
						</form>

						

					</div>
				</div>
				
				
				<script>
					function previewImg(event) {
					
					const reader = new FileReader();
					const preView = document.querySelector(".lectureImage");
					
					reader.onload = (event) => {
						preView.setAttribute("src", event.target.result);
					}
						reader.readAsDataURL(event.target.files[0]);
					}
					
					preView.setAttribute("height","256");
					preView.setAttribute("width","256");
					
					
				</script>
				

</body>
</html>