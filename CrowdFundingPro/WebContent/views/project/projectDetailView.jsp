<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Project pj=(Project)(request.getAttribute("pj"));
Attachment at=(Attachment)(request.getAttirbute("at"));
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


        /* .information{
            display:flex;

            flex-direction: column;
            align-items: center;
            justify-content:center; 
        } */
</style>
</head>
<body>
<div class="container_filed">
    <br><br>

        <div class="wrap">
            <div class="header"><h2>홍보이미지슬라이드</h2></div><br>
    
            <div class="wrap2">
                <div id="info" class="information"><h2>이미지</h2>
                    <img width="" height="" id="titleImg" src="<%=request.getContextPath() %>/resources/board_upfiles/<%= at.getChangeName() %>">
                </div>
                <div class="information"><h2>프로젝트정보</h2><br>
                    <b>프로젝트명</b><br>
                    <b>펀딩금액</b><br>
                    <b>현재금액</b><br>
                    <b>종료일</b><br>
                    <b>배송료</b><br>
                    <!-- <select name="national">
                        <option selected>수량</option>
                    </select><br> -->

                    <!-- <b>수량</b><br>
                    <button type="button" onclick="fnCalCount('p',this);">+</button>
                    <input type="text" name="pop_out" vallue="0" readonly="readonly" style="text-align: center;" size="19"/>
                    <button type="button" onclick="fnCalCount('m',thist);">-</button><br> -->
                    <b>수량</b><br>
                    <input type="text" name="amount" id="input1" value="1" size="3" onchange="change();">
                    <input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br><br>
                    
                    <button id="btn1" onclick="test1();">펀딩하기</button>
                </div>
            </div>
            <div class="wrap3">
                <div class="content1"><h2>프로젝트스토리</h2></div>
                <div class="content2">
                    <div class="side"><h3>인기프로젝트</h3></div>
                    <div class="side"><h3>연관프로젝트</h3></div>
                </div>
            </div>
            
        </div>

</div>

<script>
        function test1(){
            alert("마이페이지에서 펀딩투자내역을 확인하실 수 있습니다.");
        }
        
      </script>
</body>
</html>