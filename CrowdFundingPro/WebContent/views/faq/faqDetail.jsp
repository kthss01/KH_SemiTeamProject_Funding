<%@ page language="java" contentType="text/html; charset=UTF-8"
   	pageEncoding="UTF-8" import = "com.kh.faq.model.vo.Faq"%>
    
<%
	Faq f = (Faq)request.getAttribute("f");
	
	String ftype = "";
	
	if(f.getTargetUser() == 'S'){
		ftype = "서포터";
	} else {
		ftype = "메이커";
	}
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.7.1/gsap.min.js" integrity="sha512-UxP+UhJaGRWuMG2YC6LPWYpFQnsSgnor0VUF3BHdD83PS/pOpN+FYbZmrYN+ISX8jnvgVUciqP/fILOXDjZSwg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&fa
         mily=Nanum+Gothic&family=Roboto&display=swap"
	rel="stylesheet">
<style>

    .container_filed{
        width:100%;
        height: auto;
		text-align: center;
    }

    #top{
        width: 1200px;
        text-align: left;
        margin: 0 auto;
        padding-bottom: 40px;
        margin-top: 20px;
    }

    #faq{
        display: inline-block;
        font-weight: bold;
        font-size: 50px;
        margin-left: 20px;
        margin-bottom: 0px;
    }

    #ftype {
        display: inline-block;
        font-weight: bold;
        font-size: 25px;
        margin-bottom: 0px;
        margin-left: 20px;
    }

    #bar{
        display: inline-block;
        height: 35px;
        width: 5px;
        margin-left: 20px;
        margin-bottom: 0px;
        background-color: gray;
    }

    #under{
        display: inline-block;
        width: 100%;
        height : 5px;
        background : gray;
    }

    #content{
        display: inline-block;
        width: 1200px;
        height: auto;
    }

    .contents{
        display: inline-block;
        width: 1000px;
        height: auto;
        padding: 20px;
        margin: auto 0;

    }

    .contents p {
        display: inline-block;
        text-align: right;
       	width: auto;
       	min-height: 50px;
    	vertical-align: top;
    	font-weight: bold;
    }

    .contents span {
        display: inline-block;
        text-align: left;
        width: 90%;
        word-wrap: break-word;
        min-height: 50px;
    }
    
    #question{
        margin-bottom: 20px;
        background-color: beige;
    }

    #answer{
        margin-bottom: 40px;
        background-color: pink;
    }


</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	
	<div class="container_filed">
    <div id = "top">
        <p id="faq">FAQ</p>
        <div id="bar"></div>
 
        <p id="ftype"><%=ftype %></p>
        
        <div id="under"></div>
    </div>
    
    <div id="content">
        <div id="question" class="contents">
            <p>Q.</p>
            <span><%=f.getQuestion() %></span>

        </div>
        <div id="answer" class="contents">
            <p>A.</p>
            <span><%=f.getAnswer() %></span>
        </div>
    	</div>
	</div>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>