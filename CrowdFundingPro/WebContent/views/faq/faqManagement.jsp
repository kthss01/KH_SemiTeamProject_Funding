<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.kh.faq.model.vo.Faq"%>
    
<%
	ArrayList<Faq> list  = (ArrayList<Faq>)request.getAttribute("list");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
        /* background-color: aquamarine; */
        /* border: 1px solid black; */
        margin-top: 20px;
    }

    #faq{
        display: inline-block;
        font-weight: bold;
        font-size: 50px;
        margin-left: 20px;
        margin-bottom: 0px;
        
        /* border: 1px solid black; */
    }

    #under{
        display: inline-block;
        width: 100%;
        height : 5px;
        background : gray;
        /* border: 1px solid black; */
            
    }

    #content{
        display: inline-block;
        width: 1200px;
        height: 600px;
        /* border: 1px solid black; */
        margin-bottom: 40px;

    }
    .contents{
        display: inline-block;
        width: 500px;
        border: 1px solid black;
        height: 100%;
        
        margin-left: 10px;
        margin-right: 10px;

    }

    .c1, .c2{
        width: 100%;
        box-sizing: border-box;
        /* border: 1px solid black; */

    }

    .top{
        display: inline-block inline-block;
        height: 100px;
        line-height: 3;
        padding: 10px;
    }
    .top p{
        /* display: inline-block; */
        float: left;
        font-weight: bold;
    }

    .mid{
        display: inline-block inline-block;
        height: 450px;
        
        padding: 20px;
    }
    .bot{
        display: inline-block inline-block;
        height: 50px;
        
        /* padding: 10px; */
 
    }

    .pages{
        margin-left: 5px;
        margin-right: 5px;
        
    }

    #lTable{
                            
        border: 1px solid black;
        display: inline-block;
        
    }

    #dTable{
        border: 1px solid black;
        display: inline-block;
    }

    th, td{
        border: 1px solid black;
    }

    #lTable tr{
        height: 30px;
    }
    
    .Qs{
    	border: none;
    	background-color: white;
    }
    
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	
	<div class="container_filed">
        <div id = "top">
            <p id="faq">FAQ</p>
            <div id="under"></div>
        </div>

        <div id="content">
            <div class="contents" id="FAQList">
                <div class="c1 top" id="c1Top">
                    <p style="font-size: 40px;">목록</p>
                </div>
                <div class="c1 mid" id="c1Mid">
                    
                    <button style="float: right; margin-bottom: 10px;" onclick = "location.href='insertForm.fq'">작성</button>
                    <table id="lTable">
                        <tr>
                            <th style="width: 100px;">글번호</th>
                            <th style="width: 300px;">질문 내용</th>
                            <th style="width: 150px;">작성인</th>
                        </tr>
                        <%for(Faq f : list){ %>
                       	<tr>
                            <td><%=f.getfNo() %></td>
                            <th style="width: 300px;"><input type="button" id=<%=f.getfNo() %> class="Qs" name="qContent" value=<%=f.getQuestion() %>></th>
                            <td><%=f.getCreatorId() %></td>
                       	</tr>
                        <%} %>
                        
                    </table>
                 
                </div>
                <div class="c1 bot" id="c1Bot">
                    <button class="pages">&lt;</button><button class="pages">1</button><button class="pages">2</button>
                    <button class="pages">3</button><button class="pages">4</button><button class="pages">5</button><button class="pages">&gt;</button>
                </div>
            </div>
            <script type = "text/javascript">
                    
           		$(function(){
	            	$(".Qs").each(function(i, item){
	            		
	            		$(this).click(function(){
	            			var fno = $(this).attr('id');
	            			
	            			$.ajax({
	            				url : "select.fq",
	            				data : {
	            					fno : fno
	            				},
	            				type : "get",
	            				success : function(result){
	            					$("#c2Mid").html(result);
	            				}
	            			})
	            			
	            		})
	            	})
               
    			})
              
           	</script>
            <div class="contents" id="FAQDetail">
                <div class="c2 top" id="c2Top"> 
                    <p style="font-size: 40px;">상세</p>
                </div>
                <div class="c2 mid" id="c2Mid">
                
                </div>
                <div class="c2 bot" id="c2Bot" style="text-align: right;">                
                    <input form="detail" type="submit" style="display: inline-block; margin-left: 5px; margin-right: 5px;" value="수정"></input>
                    <input form="detail" type="submit" style="display: inline-block; margin-left: 5px; margin-right: 5px;" value="삭제"></input>
                </div>
            </div>
        </div>
    </div>  

    <script>
        $(function(){          

            $("#y").click(function()
            {
                    console.log("Y클릭함");
                    $("#y").attr('checked', true);
                    $("#n").attr('checked', false);
             
            })

            $("#n").click(function()
            {
                    console.log("N클릭함");
                    $("#y").attr('checked', false);
                    $("#n").attr('checked', true);
             
            })

        })

    </script>
    
	<%@ include file="../common/footer.jsp"%>
</body>
</html>