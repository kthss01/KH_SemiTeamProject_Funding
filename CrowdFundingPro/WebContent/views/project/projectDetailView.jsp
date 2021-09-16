<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>

<%@ page import="com.kh.project.model.vo.Project" %>

    
<%
Project pj=(Project)(request.getAttribute("pj"));
//Attachment at=(Attachment)(request.getAttribute("at"));

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

		.container_filed{
		    width:100%;
		    height:1700px;
		
		}

		.wrap{
            /*border:1px solid black;*/
            width:100%;
            height:1300px;
            
        }

        .header{
            border:1px solid black;
            width:100%;
            height:19%;
        }

        .wrap2{
            /*border:1px solid green;*/
            width:100%;
            height:30%;
            display:flex;
            margin:25px;
        }
        .information{
            
            width:50%;
            height:90%;
            padding-left: 20px;
        }
        #info{
            border:1px solid black;
            
        }

        .wrap3{
            width:100%;
            height:60%;
            display:flex;
            margin:25px;
        }

        .content1{
            border:1px solid black;
            width:70%;
            height:100%
            
        }
        .content2{
            /* border:1px solid blue; */
            width:20%;
            height:100%;
        }
        .side{
            border:1px solid black;
            width:100%;
            height:40%;
            margin-left: 20px;

            /* top:500px;
            left:700px;
            position: fixed; */
        }

        #btn1{
            width:200px;
            height:50px;

            border-top-right-radius: 10px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            border-top-left-radius: 10px;
        }
        #btn2{
        	width:200px;
            height:50px;

            border-top-right-radius: 10px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            border-top-left-radius: 10px;
        }
        
        #imgBox{
       	width:800px;
       	height:330px;
       	background:
		url('<%=request.getContextPath()%>/resources/images/project/<%=pj.getTitleImg()%>');
		background-position:cover;
        }
        
        #pTitle{
        font-size: 30px;
        font-weight:bold;
        }
        
        .pInfo{
        font-size:18px;
        font-weight:bold;
        margin-right:10px;
        
        }
    


        /* .information{
            display:flex;

            flex-direction: column;
            align-items: center;
            justify-content:center; 
        } */
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>

<div class="container_filed">
    <br><br>

        <div class="wrap">
            <div class="header"><span  id = pTitle> <%=pj.getProjectName() %> </span></div><br>
              
    
            <div class="wrap2">
                <div id="imgBox" class="information">
                </div>
                <div class="information"><h2>프로젝트정보</h2><br>
                	
                    <label class="pInfo">목표금액 : </label><%=pj.getAmountGoal() %>원<br>
                    <label class="pInfo">현재금액 : </label><%=pj.getAmountPresent() %>원<br>
                    <label class="pInfo">마감일 : </label><%=pj.getDdln() %><br>
                    <label class="pInfo">배송료 : </label><%=pj.getDeliveryCharge() %>원<br>
                    <input type="text" name="amount" id="input1" value="1" size="3" onchange="change();">
                    
                    
                    
                     <form  action="" id="postForm" method="post">
                		<input type="hidden" name="pCode" value="<%= pj.getProjectCode() %>">
                		<input type="hidden" name="fileNo" value="<%=pj.getFileNo() %>"> 
                		
                		<button id="btn1" onclick="test1();">펀딩하기</button>
        				<button id="btn2" type="button" onclick="updateForm();">수정하기</button>
                	</form>
                </div>
            </div>
            <div class="wrap3">
                <div class="content1">
                	<label class="pInfo">
                		<h2>프로젝트스토리</h2><br>
                		
                	</label><br>
                	<%=pj.getDetailIntro() %>
                </div>
                <div class="content2">
                    <div class="side"><h3>인기프로젝트</h3></div>
                    <div class="side"><h3>연관프로젝트</h3></div> 	
                	
               <script>
                	function updateForm(){
                		
                		$("#postForm").attr("action", "<%=request.getContextPath()%>/update.do");
                		$("#postForm").submit();
        				
        			}
                	
                	</script> 
                	
                	<script>
                		function test1(){
                			$("#postForm").attr("action", "<%=request.getContextPath()%>/signIn.do");
                			$("#postForm").submit();
                		}
                	</script>
                	
                	
                               
                </div>
            </div>
            
        </div>
        

</div>
         <%@ include file="../common/footer.jsp"%>


</body>
</html>