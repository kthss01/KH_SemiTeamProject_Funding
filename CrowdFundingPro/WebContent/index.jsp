
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>메인페이지</title>

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

            .container_filed {
                width: 100%;
                height: 2000px;

            }

            .carousel-item {
                height: 400px;
            }

            .carousel-item > img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .container {
                color: black;
            }
            h4 {
                font-family: 'Roboto','sans-serif';
                margin-top: 30px;
                font-size: 2em;
                font-weight: bold;
                letter-spacing: -2px;
            }

        </style>

    </head>
    <body>

        	<%@ include file="views/common/menubar.jsp"%>
        

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
                </a>
                <a href="#intro" class="carousel-control-next" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>

            <div class="box" style="width: 1300px; margin: 0 auto; padding: 0;">

                <div class="container" style="display: inline;">
                    <div class="row">
                        <!-- Blog entries-->

                        <div class="col-lg-9">
                            <!-- Featured blog post-->
                            <div class="preview">
                                <h4>이 프로젝트 어때요 ?</h4>
                            </div>

                            <!-- Nested row for non-featured blog posts-->
                            <div class="row">
                                <div class="col-lg-4" style="padding: 5px;">
                                    <!-- Blog post-->
                                    <div class="card mb-4">
                                        <a href="#!"><img
                                            class="card-img-top"
                                            src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
                                            alt="..."/></a>
                                        <div class="card-body">
                                            <div class="small text-muted">January 1, 2021</div>
                                            <h2 class="card-title h4">프로젝트명</h2>
                                            <a class="btn btn-primary" href="#!">신청하기 →</a>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4" style="padding: 5px;">
                                    <!-- Blog post-->
                                    <div class="card mb-4">
                                        <a href="#!"><img
                                            class="card-img-top"
                                            src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
                                            alt="..."/></a>
                                        <div class="card-body">
                                            <div class="small text-muted">January 1, 2021</div>
                                            <h2 class="card-title h4">프로젝트명</h2>
                                        </div>
                                    </div>
                                    <!-- Blog post-->

                                </div>
                                <div class="col-lg-4" style="padding: 5px;">
                                    <!-- Blog post-->
                                    <div class="card mb-4">
                                        <a href="#!"><img
                                            class="card-img-top"
                                            src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
                                            alt="..."/></a>
                                        <div class="card-body">
                                            <div class="small text-muted">January 1, 2021</div>
                                            <h2 class="card-title h4">프로젝트명</h2>
                                        </div>
                                    </div>
                                    <!-- Blog post-->

                                </div>
                                <div class="col-lg-4" style="padding: 5px;">
                                    <!-- Blog post-->
                                    <div class="card mb-4">
                                        <a href="#!"><img
                                            class="card-img-top"
                                            src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
                                            alt="..."/></a>
                                        <div class="card-body">
                                            <div class="small text-muted">January 1, 2021</div>
                                            <h2 class="card-title h4">프로젝트명</h2>
                                        </div>
                                    </div>

                                </div>
                                <!-- Blog post-->
                                <div class="col-lg-4" style="padding: 5px;">
                                    <div class="card mb-4">
                                        <a href="#!"><img
                                            class="card-img-top"
                                            src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
                                            alt="..."/></a>
                                        <div class="card-body">
                                            <div class="small text-muted">January 1, 2021</div>
                                            <h2 class="card-title h4">프로젝트명</h2>
                                        </div>
                                    </div>
                                </div>
                                <!-- Blog post-->
                                <div class="col-lg-4" style="padding: 5px;">
                                    <div class="card mb-4">
                                        <a href="#!"><img
                                            class="card-img-top"
                                            src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
                                            alt="..."/></a>
                                        <div class="card-body">
                                            <div class="small text-muted">January 1, 2021</div>
                                            <h2 class="card-title h4">프로젝트명</h2>
                                        </div>
                                    </div>

                                </div>
                                <div class="preview">
                                    <h4>이런 강의도 있어요 !</h4>
                                </div>

                                <!-- Blog post-->
                                <div class="card col-lg-12" style="padding: 0px;">
                                    <a href="#!"><img
                                        style="width: 100%; height: 200px;"
                                        "card-img-top"
                                        src="https://dummyimage.com/850x350/dee2e6/6c757d.jpg"
                                        alt="..."/></a>
                                    <div class="card-body">
                                        <h2 class="card-title" onclick="location.href='#!'">강의명</h2>
                                    </div>
                                </div>

                            </div>
                            <!-- Pagination <nav aria-label="Pagination"> <hr class="my-0" /> <ul
                            class="pagination justify-content-center my-4"> <li class="page-item
                            disabled"><a class="page-link" href="#" tabindex="-1"
                            aria-disabled="true">Newer</a></li> <li class="page-item active"
                            aria-current="page"><a class="page-link" href="#!">1</a></li> <li
                            class="page-item"><a class="page-link" href="#!">2</a></li> <li
                            class="page-item"><a class="page-link" href="#!">3</a></li> <li class="page-item
                            disabled"><a class="page-link" href="#!">...</a></li> <li class="page-item"><a
                            class="page-link" href="#!">15</a></li> <li class="page-item"><a
                            class="page-link" href="#!">Older</a></li> </ul> </nav> -->
                        </div>
                        <!-- Side widgets-->
                        <div class="col-lg-3">
                            <div class="ranking">
                                <h4>실시간 랭킹</h4>
                            </div>
                            <div class="card mb-4">
                                <!-- <div class="card-header">실시간 랭킹</div> -->
                                <ol class="list-group mb-0">
                                    <li class="list-group-item">
                                        <div>프로젝트1</div>
                                    </li>
                                    <li class="list-group-item">
                                        <div>프로젝트2</div>
                                    </li>
                                    <li class="list-group-item">
                                        <div>프로젝트3</div>
                                    </li>
                                    <li class="list-group-item">
                                        <div>프로젝트4</div>
                                    </li>
                                    <li class="list-group-item">
                                        <div>프로젝트5</div>
                                    </li>
                                    <li class="list-group-item">
                                        <div>프로젝트6</div>
                                    </li>

                                </ol>

                            </div>

                        </div>

                    </div>

                    <div class="row">
                        <div class="col-lg-12" >

                            <div class="openFunding" style="margin-top: 100px;">
                                <img
                                    src="resources/images/openfunding.png"
                                    alt="..."
                                    style="width: 100%; height: 100%;">
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
        	<%@ include file="views/common/footer.jsp"%>
<!-- 
        <footer class="container-fluid" style="margin-bottom: 50px; margin-top: 50px;">
            <!-- navbar -->
<!--
            <nav
                class="navbar navbar-expand-md navbar-light mb-5"
                style="border-top: 3px solid rgba(0, 0, 0, .5); border-bottom: 3px solid rgba(0, 0, 0, .5);  padding-left: 100px; padding-right:100px;">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="#" class="nav-link">정책.약관</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">개인정보처리방침</a>
                    </li>
                </ul>

                <ul class="navbar-nav ml-auto">
                    <li class="navbar-item">
                        <a href="#" class="nav-link">공지사항</a>
                    </li>

                    <li class="navbar-item">
                        <a href="#" class="nav-link">문의사항</a>
                    </li>
                </ul>
            </nav>

            <div class="row">
                <div class="col-md-3">
                    <button class="btn btn-dark ml-4" style="width: 200px;">
                        <i class="far fa-question-circle"></i>
                        문의하기</button>
                </div>
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <b>KH(주)| 대표이사 ooo | 사업자 등록번호 000-00-000000</b>
                    <br>
                    <small>서울특별시 강남구 강남구 테헤란로14길 6</small>
                </div>

            </div>
            <div class="media ml-3">
                <img src="resources/images/support_icon.png" alt="support_icon">
                <div class="media-body">
                    <b>고객센터 000-0000</b><br>
                    <small>상담 가능 시간 : 평일 오전 9시 ~ 오후 6시
                        <br>
                        (주말, 공휴일 제외)</small>
                </div>
            </div>
            <!-- 문의하기 버튼 -->
            <!-- 주소 및 사업자 등록번호 -->
            <!-- 고객센터 -->
  <!--  
        </footer>
        -->
  
  
    </body>
</html>