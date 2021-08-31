<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.kh.user.model.vo.ULecture" %>
<%@ page import="java.util.ArrayList" %>

    <%
    	ArrayList<ULecture> lList = (ArrayList<ULecture>) request.getAttribute("ULectureList");
    %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>마이페이지</title>
        <link
            href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
            rel="stylesheet"/>

        <!-- bootstrap 4 -->
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <!-- fontawesome bootstrap 4 용 icon -->
        <link
            rel="stylesheet"
            href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
            integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
            crossorigin="anonymous"/>

		<link
			href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&fa
		         mily=Nanum+Gothic&family=Roboto&display=swap"
			rel="stylesheet">
        <style>

            .box {
                width: 1300px;
                height: 1000px;
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
                height: 700px;
                float: left;
                padding-left:30px;
                padding-right:30px;

            }
            .section h3 {
                font-size: 1.2em;
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

            #myPage h1 {
                position: relative;
                left: 20%;
                font-size: 35px;
                text-align: left;
				font-family: 'Roboto', 'sans-serif';
				font-weight:900;
				
               <!-- margin-top: 100px;-->
               <!-- margin-bottom: 40px; -->
            }
           

            .usericon {
                font-size: 150px;
                opacity: 0.1;
            }
            .modify .profileBtn {
                width: 100%;
                height: 50px;
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
			}
			
			.card-img-top{
				width:100%;
			}
			.card-body {
				padding:15px;
				height:100px;
			}
			.card-title{
				margin-bottom:5px;
				margin-top:5px;
			}
        </style>
    </head>
    <body>
	<%@ include file="../common/menubar.jsp"%>
		<div id="myPage" style="width:100%; height:220px; background-color: rgb(100, 220, 177,.3);  padding-bottom: 40px; padding-top:100px; margin-bottom:20px;">
		        <h1>마이페이지</h1>
		</div>

        <div class="box">
            <div class="content1">
                <div class="profile">
                    <div class="profileImg" style="margin:0 auto;">
                        <img src="https://us.123rf.com/450wm/thesomeday123/thesomeday1231712/thesomeday123171200008/91087328-%EC%97%AC%EC%84%B1%EC%9A%A9-%EA%B8%B0%EB%B3%B8-%EC%95%84%EB%B0%94%ED%83%80-%ED%94%84%EB%A1%9C%ED%95%84-%EC%95%84%EC%9D%B4%EC%BD%98-%ED%9A%8C%EC%83%89-%EC%82%AC%EC%A7%84-%EC%9E%90%EB%A6%AC-%ED%91%9C%EC%8B%9C-%EC%9E%90-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8-%EB%B2%A1%ED%84%B0.jpg?ver=6"
                        width=200px; height=200px;>
                        <br>
                        <p style="font-size: 20px;">
                           <b> <%=loginUser.getUserName()%></b>님 어서오세요!</p>
                        <p style="font-size: 18px;">
                      		적립금 : <%=loginUser.getPoint()%> 원</p>
                    </div>
                    <div class="modify" style="margin:0 auto;">
                   
                        <input class="profileBtn" type='button' value='정보수정' onclick="checkPwd();"></input> <br>
                        <input class="profileBtn" type='button' value='로그아웃' onclick="logout();"></input>
                    </div>
                </div>
            </div>

            <div class="content2">
 			 <div class="section project ">
                    <h3>내가 참여한 프로젝트</h3>
                    <div class="card"">
                        <div class="card-img-top"></div>
                        <div class="card-body">
                            <h2 class="card-title h5">티셔츠 입고 보육원 후원하자</h2>
                            <div class="small text-muted">수 많은 보육시설 아이들을 지켜주세요
                            </div>
                        </div>
                    </div>
 
                </div>
                <div class="section lecture">
                    <h3>내가 듣는 강의</h3>
                    <div class="card" style="width:100%; margin-bottom:10px;">
                        <div class="card-img-top" style="width:100%;"></div>
                        <div class="card-body" style=" padding: 10px; height: 100px;">
                            <h2 class="card-title h5" style="margin-bottom: 5px; margin-top: 5px;"><%=lList.get(0).getLTitle()  %></h2>
                            <div class="small text-muted">경기도 안양시 동안구 시민대로 235
                            </div>
                        </div>
                    </div>

                </div>
        
            </div>

        </div>
        
	<%@ include file="../common/footer.jsp"%>

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
	</script>
</html>