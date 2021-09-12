<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kh.project.model.vo.Project" %>
    
    
<%
	ArrayList<Project> list= (ArrayList<Project>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

		.container_filed{
		    border:1px solid black;
		    width:1300px;
		    margin: 0 auto;
		    padding:15px;
		    
		}

		.div1111:after{
		content:'';
		display:block;
		clear:both;
		}

        .div1111{
            width:1090px;
            /* background-color:lightgray ;
            border:1px solid lightgray; */
           
            /* align-content:flex-start; */
            
            /*margin:0 auto;/**/
            
        }
        
        .div1{
            border:1px solid white;
            width:320px;
            height:350px;
            background-color:aquamarine;
    		float:left;
            margin-top: 20px;
            margin-right: 10px;
            
        }
        
        #categoryName{
            width:100%;
            height:60px;
        }

        .div1 img{
            width:100%;
            height:80%;
        }

		
		.carousel-item {
			height: 400px;
		}

		.carousel-item>img {
			width: 100%;
			height: 100%;
			object-fit: cover;
		}

       
		.header{
            border:1px solid black;
            width:100%;
            height:200px;
        }
       
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp"%>


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


<div class="container_filed">
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
        <input type="search" name="search" placeholder="어떤 프로젝트를 찾고 계신가요?">
        <button id="btn2" type="submit">검색하기</button>
    </form><br>
    <div id="categoryName">
        <h1>카테고리명</h1>
    </div>
    
    <div class="div1111">
    	<% for(Project pj:list){%>
        <div class="div1">
        	<input type="hidden" value="<%=pj.getProjectCode()%>">
         	<img  src="<%=request.getContextPath() %>/resources/images/project/<%=pj.getTitleImg()%>" width="100%" height="80%">                
            <p class="caption"><%=pj.getProjectName() %><br>
                	현재금액:<%=pj.getAmountPresent() %>원
            </p>
        </div>&nbsp;
        <% }%>

      
    </div>

</div>



	<%@ include file="../common/footer.jsp"%>
</body>

<script>
		
   $(function(){
	   
	   $(".div1").on("click",function(){
			var pCode=$(this).children().eq(0).val();
			location.href="<%=request.getContextPath() %>/detail.do?pCode="+pCode;
			
			
		})
		
	
	
		
		
	})
</script>
		
		
		
		
		
</html>