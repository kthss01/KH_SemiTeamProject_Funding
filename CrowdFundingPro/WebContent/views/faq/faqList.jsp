<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.kh.faq.model.vo.Faq"%>
    
<%
	ArrayList<Faq> list  = (ArrayList<Faq>)request.getAttribute("list");
	
	ArrayList<Faq> sList = new ArrayList<Faq>();
	ArrayList<Faq> mList = new ArrayList<Faq>();

	for(Faq f : list){
		if(f.getTargetUser().charAt(0) == 'S'){ //서포터이면
			sList.add(f);
		}
		else if(f.getTargetUser().charAt(0) == 'M'){	//메이커이면
			mList.add(f);
		}
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
        body{
        text-align: center;
        
    }

    #top{
        width: 1200px;
        text-align: center;
        margin: 0 auto;
        padding-bottom: 40px;
        margin-top: 20px;
    }

    #top p{
        font-weight: bold;
        font-size: 50px;
        margin-bottom: 0px;
    }

    #under{
        display: inline-block;
        width: 100%;
        height : 5px;
        background : gray;
    }

    #contents{
        display: inline-block;
        text-align: center;
        width: 1000px;
        height: auto;
    }

    .userType{
        display: inline-block;
        text-align: center;
        width: 350px;
        height: auto;
        margin: 20px;
        margin-bottom: 40px;
		background-color: yellowgreen;  
        border-radius: 30px;
        transition: height 1s;
    }

    .userType1{
        display: inline-block;
        text-align:center;
        width: auto;
        height: auto;
        min-height: 50px;

        margin: 45% 20px;
        font-size: 50px;
        font-weight: bold;       
    }

    .box, .boxM {
        display: none;
        width: 80%; 
        height: 50px;
        text-align: center;
        margin: 1% 10%;
        float: left;
    }

    </style>
</head>
<body>
 	<%@ include file="../common/menubar.jsp"%>
 	<div id = "top">
        <p>FAQ</p>
        <div id="under"></div>
    </div>
    <div id="contents">
        <div class="userType" id="t1">
            <div class="userType1" id="s">서포터</div>
            
        	<% for(Faq f : sList){ %>
				<div class="box"><%= f.getQuestion() %></div>
			<%} %>

        </div>
        <div class="userType" id="t2">
            <div class="userType1" id="m">메이커</div>
            
            <% for(Faq f : mList){ %>
				<div class="boxM"><%= f.getQuestion() %></div>
			<%} %>

        </div>
    </div>
		
	<script>
	
		//각 질문을 클릭하면 상세로 이동
	    var box = document.getElementsByClassName("box");
	    
	    for(var i = 0; i < box.length; i++){
	        console.log(box[i]);
	        box[i].addEventListener('click', goFaqDetail);
	    }

		function goFaqDetail(){
				location.href="<%=request.getContextPath()%>/detail.fq";
		}
	</script>
    <script>
        // userType(t1, t2)에 마우스를 올리면
        // userType1이 마진 20px (위로 올라가게)
        // box 갯수, 크기에 맞춰서 userType(t1, t2)의 height 늘어나기
        // box 생성

        var t1 = document.getElementById("t1");
        var t2 = document.getElementById("t2");
        
        // 서포터
        t1.addEventListener('mouseover', (event) => {

            var s = gsap.timeline();
            s.to("#s", {duration: 1, y: -120, opacity: 1})

            var tl = gsap.timeline();
            tl.to(".box", {duration: 1, y: -250, display: "block",  opacity: 1});
            
        });

        t1.addEventListener('mouseout', (event) => {
            
            var s = gsap.timeline();
            s.to("#s", {duration: 1, y: 0, opacity: 1}).to(".box", { opacity: 0}, "-=1");

            var tl = gsap.timeline();
            tl.to(".box", {duration: 1,y: 0, display: "none"}).to(".box", { opacity: 0}, "-=1");  
        });

        // 메이커
        t2.addEventListener('mouseover', (event) => {

            var m = gsap.timeline();
            m.to("#m", {duration: 1, y: -120, opacity: 1})

            var t2 = gsap.timeline();
            t2.to(".boxM", {duration: 1, y: -250, display: "block",  opacity: 1});

            

        });

        t2.addEventListener('mouseout', (event) => {

            var m = gsap.timeline();
            m.to("#m", {duration: 1, y: 0, opacity: 1}).to(".boxM", { opacity: 0}, "-=1");

            var t2 = gsap.timeline();
            t2.to(".boxM", {duration: 1,y: 0, display: "none"}).to(".boxM", { opacity: 0}, "-=1");  
        });
    </script>
    <%@ include file="../common/footer.jsp"%>
</body>
</html>