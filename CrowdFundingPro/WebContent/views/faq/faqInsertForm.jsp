<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

    #ftype {
        display: inline-block;
        font-weight: bold;
        font-size: 25px;
        
        margin-bottom: 0px;
        margin-left: 20px;
        /* border: 1px solid black; */
    }

    #under{
        display: inline-block;
        width: 100%;
        height : 5px;
        background : gray;
        /* border: 1px solid black; */
            
    }

    table{
        display: inline-block;
        width: 1000px;
        /* border: 1px solid black; */
    }

    th{
        border: 1px solid black;
        width: 200px;
    }

    td{
        border: 1px solid black;
        width: 800px;
        display: inline-block;
        text-align: left;
    }

    #btns{
        display: inline-block;
        text-align: right;
        width: 1000px;
    }

    .btn{
    	/* background-color: skyblue; */
        /* border: 1px solid black; */
        /* display: inline-block; */
        margin-top: 20px;
        margin-bottom: 40px;
        margin-left: 5px;
        
    }

    textarea{
        width: 98%;
        margin: 1%;
    }

    select{
        margin: 1%;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div class="container_filed">
        <div id = "top">
            <p id="faq">FAQ</p>
            <p id="ftype">- 추가</p>
            <div id="under"></div>
        </div>
        <form method="GET" id="f" action="<%= request.getContextPath() %>/insert.fq" onsubmit="return insert();">
        <table>
            <tr>
                <th>대상</th>
                <td> 
                    <select name="targetUser">
                        <option value="S">서포터</option>
                        <option value="M">메이커</option>
                    </select>
                </td>
                
            </tr>
            <tr>
                <th>질문</th>
                <td>
                    <textarea name="question" rows = "4" cols = "50" placeholder="내용을 입력해주세요" required></textarea>
                </td>
                
            </tr>
            <tr>
                <th>답변</th>
                <td>
                    <textarea name="answer" rows = "8" cols = "50" placeholder="내용을 입력해주세요" required></textarea>
                </td>
                
            </tr>
        </table>
        </form>
        
        <div id="btns">
            <button class="btn" onclick="back();">이전으로</button>
       		<button class="btn" type="submit" form="f">등록</button>
        </div>
        
    </div>  
    <script>
    	function back(){
    		if (confirm("이전으로 돌아가시겠습니까?\n 작성중인 내용은 사라집니다.")) {
   	            alert("목록으로 돌아갑니다.");
   	            history.back();
   	        }
    	}
        function insert(){
          	if (confirm("게시물을 등록하시겠습니까?")) {
            	return true;
   	        }
          	else {
          		return false
          	}
   	     
        }
    </script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>