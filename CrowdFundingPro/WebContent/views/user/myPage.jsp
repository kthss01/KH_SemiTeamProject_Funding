<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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


        <style>

            .box {
                width: 1200px;
                height: 100vh;

            }

            .content1 {
                float: left;
            }

            .content2 {
                width: 70%;
                height: 100vh;
                float: left;
            }

            .section {
                width: 50%;
                height: 100%;
                float: left;
                padding: 10px 10px 20px 30px;

            }
            .section h3 {
                font-size: 1.2em;
                color: rgba(0, 0, 0, .8);
                margin-bottom: 20px;
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

            h1 {
                position: relative;
                left: 25%;
                font-size: 30px;
                text-align: left;
                margin-top: 150px;
                margin-bottom: 40px;
            }
            .profile {
                margin-left: 100px;
                width: 240px;
                height: 100vh;
                border: none;
                border-right: lightgray solid 0.1px;

            }

            .profile div {
                float: left;
                width: 100%;
                padding: 40px 20px 20px 10px;
                text-align: center;
            }

            .usericon {
                font-size: 150px;
                opacity: 0.1;
            }
            .modify button {
                width: 100%;
                height: 50px;
                border-radius: 30px;
                border: 3px solid rgb(100, 220, 167,.5);
                margin: 10px;
                font-size: 1.3em;
                color: gray;
            }
            .modify button:hover {
                cursor: pointer;
                background: rgb(100, 220, 177,.8);
                color: white;

            }
        </style>
    </head>
    <body>
	<%@ include file="../common/menubar.jsp"%>

        <h1>마이페이지</h1>

        <div class="box">
            <div class="content1">
                <div class="profile">
                    <div class="profileImg">
                        <span class="material-icons-outlined usericon">account_circle</span>
                        <br>
                        <b style="font-size: 20px;">
                            <%=loginUser.getUserName()%>님 어서오세요!</b>
                        <br>
                        <b style="font-size: 18px;">
                      		적립금 : <%=loginUser.getPoint()%> 원</b>
                    </div>
                    <div class="modify">
                        <button onclick="location.href=<%=request.getContextPath() %>/updateForm.me">정보수정</button><br>
                        <button onclick="location.href=<%=request.getContextPath() %>/logout.me">로그아웃</button>
                    </div>
                </div>
            </div>

            <div class="content2">
                <div class="section project ">
                    <h3>내가 참여한 프로젝트</h3>

                    <ul>
                        <li>
                            <a href="">[끝판 앵콜]비건 오일풀링 클렌징밤</a>
                        </li>
                        <li>
                            <a href="">[전액기부] 보호소의 아픈 동물들을 도와주세요! 유기동물 폰케이스</a>
                        </li>
                        <li>
                            <a href="">[전액기부] 보호소의 아픈 동물들을 도와주세요! 유기동물 폰케이스</a>
                        </li>

                    </ul>
                </div>
                <div class="section lecture">
                    <h3>내가 듣는 강의</h3>
                    <ul>
                        <li>
                            <a href="">와디즈 교육 파트너 모집 설명회</a>
                        </li>
                        <li>
                            <a href="">와디즈 스토어 입점 설명회</a>
                        </li>
                        <li>
                            <a href="">와디즈 스토어 입점 설명회</a>
                        </li>

                    </ul>
                </div>
            </div>

        </div>
        
	<%@ include file="../common/footer.jsp"%>

    </body>
</html>