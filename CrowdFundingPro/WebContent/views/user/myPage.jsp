<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.kh.user.model.vo.ULecture"%>
<%@ page import="com.kh.user.model.vo.UProject"%>
<%@ page import="com.kh.user.model.vo.IProject"%>
<%@ page import="java.util.ArrayList"%>

<%
	ArrayList<ULecture> lList = (ArrayList<ULecture>) request.getAttribute("ULectureList");
	ArrayList<UProject> UPList = (ArrayList<UProject>) request.getAttribute("UProjectList");
	ArrayList<IProject> IPList = (ArrayList<IProject>) request.getAttribute("InProjectPList");
%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>마이페이지</title>
       
		<link
			href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&fa
		         mily=Nanum+Gothic&family=Roboto&display=swap"
			rel="stylesheet">
        <style>

            .box {
                width: 1300px;
                height: 1200px;
                margin: 0 auto;
            }

            .content1 {
            	width:260px;
                float: left;
                margin : 0 auto;
            }
            
             .profile {
                width: 100%;
                border: none;
                border-right: lightgray solid 0.1px;

            }

            .profile div {
                float: left;
                width: 100%;
                padding: 40px 20px 20px 10px;
                text-align: center;
            }

            .content2 {
                width: 1040px;
                float: left;
            }

            .section {
                width: 50%;
                height: 500px;
                float: left;
                padding-left:30px;
                padding-right:30px;
            }
            .section h3 {
                font-size: 1.4em;
                color: rgba(0, 0, 0, .8);
                margin-bottom: 20px;
                font-weight : bold;
            }
            .section li {
                display: block;
                width: 80%;
                height: 50px;
                border: 1px solid rosybrown;
                margin-bottom: 10px;
            }
            .section li a {
                text-decoration: none;

            }
            #myPageTitle{
             width:100%;
             height:250px;
             padding-bottom: 40px;
             padding-top:100px; 
             margin-bottom:20px;
             position:relative;
			 z-index:1;
            }
			
			#myPageTitle::after{
			width:100%;
            height:250px;
			content:"";
			background : url('<%=request.getContextPath() %>/resources/images/myPageBannerImg.jpg');
			opacity: .7;
			position:absolute;
			top:0;
			left:0;
			z-index:-1;
			}
	

            #myPageTitle h1 {
            	margin-left:20%;
                font-size: 42px;
				font-family: 'Roboto', 'sans-serif';
				font-weight:bold;

            }
            .usericon {
                font-size: 150px;
                opacity: 0.1;
            }
            .modify .profileBtn {
                width: 100%;
                height: 40px;
                border-radius: 30px;
                border: 2px solid rgb(100, 220, 167,.5);
                margin: 10px;
                font-size: 1.3em;
                color: gray;
                background : white;
            }
            .modify .profileBtn:hover {
                cursor: pointer;
                background: rgb(100, 220, 177,.8);
                color: white;

            }
            
            .card{
				width:100%;
				margin-bottom:10px;
				padding:5px;
			}
			
			.card-img-top{
				width:100%;
			}
			.card-body {
				height:100px;
				padding:5px !important;
			}
			
			.card-body h2{
				font-size:1rem;
				font-family: 'Roboto', 'sans-serif';
				font-weight:600;
			}
			
			.card-title{
				margin-bottom:5px;
				margin-top:5px;
			}

			
			.card:hover{
    		box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2), 0 0 1px rgba(0, 0, 0, 0.2);
    		cursor:pointer;

			}

			#point{
			  font-size: 18px;
			  font-family: 'Jua', 'sans-serif';
			  
			}

        </style>
    </head>
    <body>
	<%@ include file="../common/menubar.jsp"%>
		<div id="myPageTitle">
		
		<%if(loginUser.getUserCode().equals("01")){ %>		
		        <h1>관리자 페이지</h1>
		   <%} else { %>
		   		 <h1>마이 페이지</h1>
		   
		   <%} %>		     
		</div>

	<div class="box">
		<div class="content1">
			<div class="profile">
				<div class="profileImg" style="margin: 0 auto;">
					<img id="pImg"
						src=""
						width=200px; height=200px;/> <br>
					<p id="point" style="font-size: 20px;">
						<b> <%=loginUser.getUserName()%></b>
						님 어서오세요 !
						<br>
						충전금액 : 
						<b><%=loginUser.getPoint()%></b> 원
					</p>
				</div>
				<div class="modify" style="margin: 0 auto;">

					<input class="profileBtn" type='button' value='정보수정'
						onclick="checkPwd();"></input> <br> <input class="profileBtn"
						type='button' value='로그아웃' onclick="logout();"></input>
				</div>
			</div>
		</div>

		<div class="content2">
			<div class="section project ">
				<h3>내가 참여한 프로젝트</h3>
				
				<%
				if(!UPList.isEmpty()){
					for (UProject up : UPList) {				
				%>
				<div class="card">
					<div class="card-img-top"></div>
					<div class="card-body" id="cBody">
						<h2 class="card-title h5"><%=up.getProjectName() %></h2>
						<div class="small text-muted"><%=up.getProDetail() %></div>
					</div>
				</div>
				<%
					}
				} else {
				%>
				<div class="card">
					<div class="card-img-top"></div>
					<div class="card-body" id="cBody">
						<h2 class="card-title h5">
							<a href="#">프로젝트 구경가기</a>
						</h2>
						<div class="small text-muted">
							<p>아직 참여중인 프로젝트가 없으시네요!</p>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
			
			
			<div class="section project ">
				<h3>나의 관심 프로젝트</h3>
				<%
					for (IProject ip : IPList) {
				%>
				<div class="card">
					<div class="card-img-top"></div>
					<div class="card-body">
						<h2 class="card-title h5"><%=ip.getProjectName() %></h2>
						<div class="small text-muted"><%=ip.getProDetail() %></div>
					</div>
				</div>
				<%
					}
				%>
			</div>
			
		
			
			<div class="section lecture" style="width:100%;">
				<h3>내가 듣는 강의</h3>
				<%
					for (ULecture l : lList) {
				%>
				<div class="card" >
					<div class="card-img-top"></div>
					<div class="card-body">
						<h2 class="card-title h5"><%=l.getLTitle()%></h2>
						<div class="small text-muted"><%=l.getLTopic()%>
							<div class="small text-muted"><%=l.getLDate()%>
							</div>

						</div>
					</div>
				</div>
				<%
					}
				%>
				
			</div>
		</div>
	</div>

	<div class="footer">
		<%@ include file="../common/footer.jsp"%>

	</div>

</body>
    
    <script>
	
    function checkPwd(){
    
    	var input = prompt('비밀번호를 입력해주세요',"");
    	if(input == "<%=loginUser.getUserPwd()%>"){
    		update();
    	} else if(input == null) {
    		// prompt의 취소를 누르면 null을 반환 -> 아무 동작 없음
    	} else{
    		alert('비밀번호가 일치하지 않습니다.');

    	}
    }
    
	function logout(){
		location.href = "<%= request.getContextPath() %>/logout.me ";
		}
	function update(){
		location.href = "<%= request.getContextPath() %>/updateForm.me ";
		}
	
	$(function(){
		
		// 성별에 따른 동적 프로필 이미지 src 할당
		
		var ssn = "<%= loginUser.getUserSsn() %>";
		var g = ssn.charAt(7);
		if(g=='2' || g=='4'){
		//여자 프로필이미지
			$("#pImg").attr("src","https://us.123rf.com/450wm/thesomeday123/thesomeday1231712/thesomeday123171200008/91087328-%EC%97%AC%EC%84%B1%EC%9A%A9-%EA%B8%B0%EB%B3%B8-%EC%95%84%EB%B0%94%ED%83%80-%ED%94%84%EB%A1%9C%ED%95%84-%EC%95%84%EC%9D%B4%EC%BD%98-%ED%9A%8C%EC%83%89-%EC%82%AC%EC%A7%84-%EC%9E%90%EB%A6%AC-%ED%91%9C%EC%8B%9C-%EC%9E%90-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8-%EB%B2%A1%ED%84%B0.jpg?ver=6")
			console.log($("#pImg"))
		
		}else{
		//남자 프로필이미지

			$("#pImg").attr("src","https://us.123rf.com/450wm/thesomeday123/thesomeday1231712/thesomeday123171200009/91087331-%EB%82%A8%EC%84%B1%EC%9D%84%EC%9C%84%ED%95%9C-%EA%B8%B0%EB%B3%B8-%EC%95%84%EB%B0%94%ED%83%80-%ED%94%84%EB%A1%9C%ED%95%84-%EC%95%84%EC%9D%B4%EC%BD%98-%ED%9A%8C%EC%83%89-%EC%82%AC%EC%A7%84-%EC%9E%90%EB%A6%AC-%ED%91%9C%EC%8B%9C-%EC%9E%90-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8-%EB%B2%A1%ED%84%B0.jpg?ver=6")
			console.log($("#pImg"))			
		}
	});


	</script>
</html>