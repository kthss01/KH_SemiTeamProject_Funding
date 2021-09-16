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
        width: 1100px;
        height: auto;
        background-color: rgba(100, 200, 167, 0.9);
        border-radius: 25px;
        padding: 30px;
    }

    .contents{
        display: inline-block;
        height: auto;
        padding: 20px;
        margin: auto 0;
        border-radius: 25px;
    }

    .contents p {
        display: inline-block;
        text-align: right;
       	width: auto;
       	min-height: 50px;
    	vertical-align: top;
    	font-weight: bold;
    	font-size: 50px;
    	color: rgba(100, 220, 167, 0.9);
    	-webkit-text-stroke: 0.5px black;
    	/* border: 1px solid black; */
    	
    }

    .contents span {
        display: inline-block;
        text-align: left;
        width: 90%;
        word-wrap: break-word;
        min-height: 50px;
        font-size: 15px;
        /* border: 1px solid black; */
        padding: 10px;
        font-size: 20px;
        
    }
    
    #question{
        margin-bottom: 20px;
        background-color: rgba(255, 255, 255, 0.7);
    }

    #answer{
        background-color: rgba(255, 255, 255, 1);
    }
    
    .pageHead {
	width: 100%;
	height: 250px;
	padding-top: 100px;
	margin-bottom: 50px;
	position: relative;
	z-index: 1;
}

.pageHead::after {
	width: 100%;
	height: 250px;
	content: "";
	background:
		url('<%=request.getContextPath()%>/resources/images/faqBannerImg.jpg');
	opacity: 0.5;
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
}

#pageTitle {
    font-size: 48px;
    text-align: center;
    font-family: 'Roboto', sans-serif;
    font-weight: bold;
}
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	
	<div class="container_filed">
    <%-- <div id = "top">
        <p id="faq">FAQ</p>
        <div id="bar"></div>
 
        <p id="ftype"><%=ftype %></p>
        
        <div id="under"></div>
    </div> --%>
    
    <div class="pageHead">
			<h1 id="pageTitle">FAQ</h1>
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

<script>
	$(function(){
		
		var conWid = $("#content").css('width').slice(0, -2);
		var conPad = $("#content").css('padding').slice(0, -2);
		
		var contents = $(".contents").css('width', conWid - conPad*2);

	})
</script>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>