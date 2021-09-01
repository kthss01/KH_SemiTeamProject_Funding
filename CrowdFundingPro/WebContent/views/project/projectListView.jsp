<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Project> list=request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.container_filed{
    border:1px solid black;
    width:100%;
    height:1700px;

}

.div1{
            border:1px solid white;
            width:320px;
            height:350px;
            background-color:aquamarine;

            margin-top: 5%;
            margin-right: 2%;
            
        }
        .div1111{
            width:1090px;
            height:800px;
            /* background-color:lightgray ;
            border:1px solid lightgray; */
            display:flex;
            flex-wrap: wrap;

            /* align-content:flex-start; */
            
            /*margin:0 auto;/*중앙으로 정렬*/
            
        }
        #categoryName{
            width:100%;
            height:60px;
        }

        img{
            width:100%;
            height:80%;
        }



       
.header{
            border:1px solid black;
            width:100%;
            height:19%;
        }
        

</style>
</head>
<body>
<div class="container_filed">
    <div class="header"><h2>홍보이미지슬라이드</h2></div><br>
    <form class="searchArea" >
        <select id="cName" name="cName">
            <option value="travel">여행,레저</option>
            <option value="tech">테크,가전</option>
            <option value="sports">스포츠</option>
            <option value="homeLiv">홈리빙</option>
            <option value="beauty">뷰티,패션잡화</option>
            <option value="animal">반려동물</option>
            <option value="donate">기부,후원</option>
            <option value="publish">출판</option>
            <option value="food">푸드</option>
            <option value="design">디자인소품</option>
            <option value="culture">공연,컬쳐</option>
            <option value="social">소셜</option>
            <option value="hobby">게임,취미</option>
            <option selected>카테고리</option>
        </select>
        <input type="search" name="search" placeholder="어떤 프로젝트를 찾고 계신가요?" size="50">
        <button id="btn2" type="submit">검색하기</button>
    </form><br>
    <div id="categoryName">
        <h1>카테고리명</h1>
    </div>
    
    <div class="div1111">
    	<% for( Project pj:list){%>
        <div class="div1">
        	<input type="hidden" value="<%=pj.getProjectCode()%>">
            <img  src="<%=request.getContextPath() %>/resources/board_upfiles/<%= pj.getTitleImg() %>" width="100%" height="80%">
            <p class="caption"><%=pj.getProjectName() %><br>
                	현재금액
            </p>
        </div>&nbsp;
        <% }%>
       
        
        <div class="div1">
            <img src="">
            <p class="caption">프로젝트 제목<br>
               	 현재금액
            </p>
        </div>&nbsp;
        <div class="div1">
            <img src="">
            <p class="caption">프로젝트 제목<br>
                	현재금액
            </p>
        </div>&nbsp;
        <div class="div1">
            <img src="">
            <p class="caption">프로젝트 제목<br>
                	현재금액
            </p>
        </div>&nbsp;
        <div class="div1">
            <img src="">
            <p class="caption">프로젝트 제목<br>
                	현재금액
            </p>
        </div>&nbsp;
        <div class="div1">
            <img src="">
            <p class="caption">프로젝트 제목<br>
               	 현재금액
            </p>
        </div>
       <button onclick="location.href='<%=request.getContextPath() %>/insertForm.th'">작성하기</button>
    </div>

   <script>
		
			$(function(){
				$(".div1").click(function(){
					var pjCode = $(this).children().eq(0).val();
					location.href="<%=request.getContextPath()%>/detail.do?pjCode=" + pjCode;
				});
			});
		</script>

</div>
</body>
</html>