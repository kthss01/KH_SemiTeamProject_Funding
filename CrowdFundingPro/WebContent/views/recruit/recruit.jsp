<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.recruit.model.vo.Recruitment, com.kh.common.model.vo.PageInfo" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>펀딩사이트 프로젝트 - 채용 공고 페이지</title>

    <!-- bootstrap 4 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- fontawesome bootstrap 4 용 icon -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

    <!-- bootstrap-steps -->
    <!-- <link rel="stylesheet" href="../css/bootstrap-steps.min.css"> -->
    <!-- cdn -->
    <!-- <link  href="https://cdn.jsdelivr.net/npm/bootstrap-steps@%5E1.0/dist/bootstrap-steps.min.css" rel="stylesheet"> -->

    <!-- bootstarp4 date range picker -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

    <style>
        .jumbotron {
            background: #fff;
        }

        #jumbotron-head>h2 {
            font-weight: bold;
        }

        #jumbotron-body li {
            font-size: 0.85rem;
            font-weight: bold;
        }

        #recruit_category button {
            margin: 0.1rem;
            border-radius: 5rem;
        }

        #recruit_table {
            position: relative;
        }

        #recruit_create_btn {
            position: absolute;
            right: 0;
            bottom: 0;
            visibility: show;
        }
        
        .carousel-item {
		    height: 300px;
		}
		
		.carousel-item>img {
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		}
    </style>

	<script>
		
		const msg = '<%= (String)session.getAttribute("msg") %>';
		//console.log(msg);
		if (msg !== 'null') {
			alert(msg);
			<% session.removeAttribute("msg"); %> // msg 출력 후 제거
		}
	
	</script>

</head>

<%

	ArrayList<Recruitment> list = (ArrayList<Recruitment>) request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
%>

<body>
    <!-- navbar -->
	<%@ include file="../common/menubar.jsp" %>

    <!-- 채용공고 파트 소개 -->
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
                <img src="<%= request.getContextPath() %>/resources/images/recruit_img1.png" alt="img1">
            </div>
            <div class="carousel-item">
                <img src="<%= request.getContextPath() %>/resources/images/recruit_img2.png" alt="img2">
            </div>
            <div class="carousel-item">
                <img src="<%= request.getContextPath() %>/resources/images/recruit_img3.png" alt="img3">
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

    <!-- 채용 진행과정 일단 jumbotron과 이미지로 대체-->
    <div class="container-lg mt-5">
        <div class="jumbotron">
            <h5>PROCESS</h5>
            <br>
            <div class="row mb-5">
                <div id="jumbotron-head" class="col-md-6">
                    <h2>더 나은 세상을 함께 <br> 만들어갈 당신을 기다립니다</h2>
                </div>
                <div id="jumbotron-body" class="col-md-6">
                    <ul>
                        <li>상황에 따라 1,2차 면접이 1day 면접으로 진행될 수 있습니다.</li>
                        <li>개발 직군의 경우 '코딩 테스트'를 진행합니다.</li>
                        <li>직무에 따라 면접에 과제 발표가 포함될 수 있습니다.</li>
                        <li>2차 면접 합격 시 평판 조회가 진행될 수 있습니다.</li>
                        <li>채용 완료 시 공고가 조기 마감될 수 있습니다.</li>
                    </ul>
                </div>
            </div>
            <img class="rounded" src="<%= request.getContextPath() %>/resources/images/recruit_process.png" alt="recruit_process">
        </div>

        <!-- 채용 진행과정 step 구현 시도 -->
        <article>
            <!-- <ul class="steps">
                <li class="step">
                    <div class="step-content">
                        <span class="step-circle">1</span>
                        <span class="step-text">Step 1</span>
                    </div>
                </li>
                <li class="step">
                    <div class="step-content">
                        <span class="step-circle">1</span>
                        <span class="step-text">Step 1</span>
                    </div>
                </li>
                <li class="step">
                    <div class="step-content">
                        <span class="step-circle">1</span>
                        <span class="step-text">Step 1</span>
                    </div>
                </li>
            </ul> -->
        </article>
    </div>

    <section class="container mt-5">
        <!-- 직무 구분 카테고리 button groups badges -->
        <div id="recruit_category" class="btn-group">
            <button type="button" class="btn btn-secondary">
                #전체
                <span class="badge badge-light">49</span>
            </button>
            <button type="button" class="btn btn-secondary">
                #개발직군
                <span class="badge badge-light">14</span>
            </button>
            <button type="button" class="btn btn-secondary">
                #마케팅
                <span class="badge badge-light">5</span>
            </button>
            <button type="button" class="btn btn-secondary">
                #경영지원
                <span class="badge badge-light">6</span>
            </button>
            <button type="button" class="btn btn-secondary">
                #신사업
                <span class="badge badge-light">2</span>
            </button>
        </div>

        <!-- 직무 검색 input groups -->
        <div class="input-group mt-5">
            <input type="text" class="form-control" placeholder="직무 검색하기">
            <div class="input-group-append">
                <a href="#" class="btn btn-secondary">
                    <i class="fas fa-search fa-lg"></i>
                </a>
            </div>
        </div>

        <!-- 공고 리스트 table -->
        <article id="recruit_table">
            <table class="table table-hover mt-5">
                <tbody>
                	<% for (Recruitment r : list) { %>
                    <tr>
                        <td class="table-recruit-category">
                        	<a class="text-decoration-none text-info"
                                href="<%= request.getContextPath() %>/recruitContentList.do?rid=<%= r.getId() %>">[<%= r.getCode() %>]</a>
                        </td>
                        <td class="table-recruit-name" style="min-width: 200px;">
                        	<a class="text-decoration-none text-dark"
                                href="<%= request.getContextPath() %>/recruitContentList.do?rid=<%= r.getId() %>"><%= r.getTitle() %></a>
                        </td>
                        <td class="table-recruit-kind"><span
                                class="border border-info rounded-lg py-1 px-3 text-info"><%= r.getTime() %></span></td>
                        <td class="table-recruit-date"><span class="text-secondary"><%= r.getDate() %></span></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>

            <!--  pagination -->
            <ul class="pagination justify-content-center">
            	
            	<% if (currentPage == 1) { %>
                <li class="page-item px-5 disabled">
                <% } else { %>
                <li class="page-item px-5">
                <% } %>
                    <button onclick="location.href='<%= request.getContextPath() %>/recruitList.do?currentPage=<%= currentPage - 1 %>'" class="page-link border-0">&lt;</button>
                </li>

                <% for (int p = startPage; p <= endPage; p++) { %>
                	<% if (p == currentPage) { %>
                <li class="page-item px-3 active">
                	<% } else { %>
                <li class="page-item px-3">
                	<% } %>
                    <button onclick="location.href='<%= request.getContextPath() %>/recruitList.do?currentPage=<%= p %>'" class="page-link border-0"><%= p %></button>
                </li>
                <% } %>

				<% if (currentPage == maxPage) {%>
                <li class="page-item px-5 disabled">
                <% } else { %>
                <li class="page-item px-5">
                <% } %>
                    <button onclick="location.href='<%= request.getContextPath() %>/recruitList.do?currentPage=<%= currentPage + 1 %>'" class="page-link border-0">&gt;</button>
                </li>

            </ul>

            <button type="button" id="recruit_create_btn" class="btn btn-dark" data-toggle="modal"
                data-target="#recruit_create_modal">공고 등록</button>
        </article>
    </section>

   	<!-- footer -->
   	<%@ include file="../common/footer.jsp" %>

    <!-- 공고 등록 modal -->
    <div class="modal fade" id="recruit_create_modal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <!-- Modal header -->
                <div class="modal-header">
                    <h4 class="modal-title">공고 등록</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">

                    <form method="post" id="recruit_create_form" action="<%=request.getContextPath()%>/recruitInsert.do">

						<!-- 공고 종류 일반 / 상시 -->
                        <label>공고 종류</label>
                        <div class="form-group">
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" class="custom-control-input" id="recruitTime" name="recruitTime" value="일반 채용" checked>
                                <label for="recruitTime" class="custom-control-label">일반 채용</label>
                            </div>
    
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" class="custom-control-input" id="recruitTime2" name="recruitTime" value="상시 채용">
                                <label for="recruitTime2" class="custom-control-label">상시 채용</label>
                            </div>
                        </div>

                        <!-- 공고 시작일 ~ 공고 종료일 달력 선택 -->
                        <!-- <form-group>
                                <label for="recruitStartDate">공고 시작일</label>
                                <input type="date" class="form-control" id="recruitStartDate">
                                <label for="recruitEndDate">공고 종료일</label>
                                <input type="date" class="form-control" id="recruitEndDate">
                            </form-group> -->

                        <!-- <input type="text" class="form-control" id="daterange" name="daterange"/> -->
                        <div class="form-group">
                            <label>공고기간</label>
                            <div id="daterange" class="form-control">
                                <i class="fa fa-calendar"></i>&nbsp;
                                <span></span>
                            </div>
                        </div>
                        <input form="recruit_create_form" type="hidden" id="recruitStartDate" name="recruitStartDate">
                        <input form="recruit_create_form" type="hidden" id="recruitEndDate" name="recruitEndDate">

                        <!-- 공고명 -->
                        <div class="form-group">
                            <label for="recruitName">공고명</label>
                            <input form="recruit_create_form" type="text" class="form-control" id="recruitName"
                                name="recruitName" placeholder="내용을 입력해주세요">
                        </div>

                        <!-- 직무구분 -->
                        <!-- Custom Select Menu -->
                        <label>직무구분</label>
                        <select form="recruit_create_form" name="recruitCode" id="recruitCode" class="custom-select">
                            <option value="개발직군">개발직군</option>
                            <option value="신입">신입</option>
                            <option value="경영지원">경영지원</option>
                            <option value="신사업">신사업</option>
                        </select>

                    </form>

                    <!-- Nav pills or tabs with Dropdown -->
                    <ul class="nav nav-tabs mt-3" role="tablist">
                        <li class="nav-item">
                            <a href="#recruitContentTab1" data-toggle="tab"
                                class="text-secondary nav-link active">소개</a>
                        </li>
                        <li class="nav-item">
                            <a href="#recruitContentTab2" data-toggle="tab" class="text-secondary nav-link">주요 업무</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a href="#" class="text-secondary nav-link dropdown-toggle" data-toggle="dropdown">요구 사항</a>
                            <div class="dropdown-menu">
                                <a href="#recruitContentTab3" data-toggle="tab" class="text-secondary nav-link">자격
                                    요건</a>
                                <a href="#recruitContentTab4" data-toggle="tab" class="text-secondary nav-link">우대
                                    사항</a>
                            </div>
                        </li>

                        <li class="nav-item dropdown">
                            <a href="#" class="text-secondary nav-link dropdown-toggle" data-toggle="dropdown">혜택 및
                                기타</a>
                            <div class="dropdown-menu">
                                <a href="#recruitContentTab5" data-toggle="tab" class="text-secondary nav-link">혜택 및
                                    복지</a>
                                <a href="#recruitContentTab6" data-toggle="tab" class="text-secondary nav-link">기타
                                    사항</a>
                            </div>
                        </li>
                    </ul>

                    <div class="tab-content mt-2">
                        <div id="recruitContentTab1" class="container tab-pane active">
                            <!-- 소개 -->
                            <div class="form-group">
                                <label for="recruitContent1">소개</label>
                                <textarea form="recruit_create_form" name="recruitContent1" id="recruitContent1"
                                    class="form-control" rows="10"></textarea>
                            </div>
                        </div>

                        <div id="recruitContentTab2" class="container tab-pane fade">
                            <!-- 주요 업무 -->
                            <div class="form-group">
                                <label for="recruitContent2">주요 업무</label>
                                <textarea form="recruit_create_form" name="recruitContent2" id="recruitContent2"
                                    class="form-control" rows="10"></textarea>
                            </div>
                        </div>

                        <div id="recruitContentTab3" class="container tab-pane fade">
                            <!-- 자격 요건 -->
                            <div class="form-group">
                                <label for="recruitContent3">자격 요건</label>
                                <textarea form="recruit_create_form" name="recruitContent3" id="recruitContent3"
                                    class="form-control" rows="10"></textarea>
                            </div>
                        </div>

                        <div id="recruitContentTab4" class="container tab-pane fade">
                            <!-- 우대 사항 -->
                            <div class="form-group">
                                <label for="recruitContent4">우대 사항</label>
                                <textarea form="recruit_create_form" name="recruitContent4" id="recruitContent4"
                                    class="form-control" rows="10"></textarea>
                            </div>
                        </div>

                        <div id="recruitContentTab5" class="container tab-pane fade">
                            <!-- 혜택 및 복지 -->
                            <div class="form-group">
                                <label for="recruitContent5">혜택 및 복지</label>
                                <textarea form="recruit_create_form" name="recruitContent5" id="recruitContent5"
                                    class="form-control" rows="10"></textarea>
                            </div>
                        </div>

                        <div id="recruitContentTab6" class="container tab-pane fade">
                            <!-- 기타 사항 -->
                            <div class="form-group">
                                <label for="recruitContent6">기타 사항</label>
                                <textarea form="recruit_create_form" name="recruitContent6" id="recruitContent6"
                                    class="form-control" rows="10"></textarea>
                            </div>
                        </div>
                    </div>
                    
					<!-- toast -->
					<div class="toast" style="position: absolute; bottom: 0; right: 0;">
						<div class="toast-header">
							내용이 비어 있습니다. 채워 넣어주세요
						</div>
						<div class="toast-body">
						</div>
					</div>
                </div>


                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" form="recruit_create_form" class="btn btn-dark mx-auto">등록하기</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Date Range Picker -->
    <script>
        $(function () {
            const startDate = moment(); // 시작일
            const endDate = moment().add(30, 'day'); // 종료일 -> 현재 시간 + 30일
            $('#recruitStartDate').val(startDate.format('YYYY-MM-DD'));
            $('#recruitEndDate').val(endDate.format('YYYY-MM-DD'));

            $('#daterange span').html(startDate.format('YYYY-MM-DD') + ' ~ ' + endDate.format('YYYY-MM-DD'));

            $('#daterange').daterangepicker({
                //opens: 'right',
                //drops: 'up',
                startDate, // 시작일 설정
                endDate // 종료일 설정
            }, function (start, end) {
                //console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
                const startDate = start.format('YYYY-MM-DD');
                const endDate = end.format('YYYY-MM-DD');
                $('#recruitStartDate').val(startDate);
                $('#recruitEndDate').val(endDate);

                $('#daterange span').html(start.format('YYYY-MM-DD') + ' ~ ' + end.format(
                    'YYYY-MM-DD'));
            });

            $('#daterange').on('apply.daterangepicker', function(ev, picker) {
                //console.log(picker.startDate.format('YYYY-MM-DD'));
                //console.log(picker.endDate.format('YYYY-MM-DD'));
                const startDate = picker.startDate.format('YYYY-MM-DD');
                const endDate = picker.endDate.format('YYYY-MM-DD');
                $('#recruitStartDate').val(startDate);
                $('#recruitEndDate').val(endDate);
            });
        });
    </script>
    
    <!-- form content check -->
    <!-- toast 사용 -->
    <script>
        $(function() {
            $('#recruit_create_form').on("submit", function(e) {

                let check = true;
                let content = '';
                $('.tab-content').find('textarea').each(function(index, item){
                    if ($(item).val() === '') {
                        //console.log($(item).parent().children('label').html());
                        content += $(item).parent().children('label').text() + '<br>';
                        check = false;
                    }
                });

                if (!check) {
                    $('.toast .toast-body').html(content);

                    $('.toast').toast({delay: 2000});
                    $('.toast').toast('show');
                }
                
                return check;
            })
        });
    </script>
</body>

</html>