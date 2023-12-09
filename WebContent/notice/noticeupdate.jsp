<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../user/category.jsp" %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항 작성</title>

<style>
.button {
		display: flex;
		justify-content: center;
		margin-top: 20px;
	}

	.button input[type="submit"]
	 {
		padding: 10px 20px;
		background-color: #285a34;
		border: none;
		color: white;
		font-size: 16px;
		font-weight: bold;
		cursor: pointer;
		border-radius: 10px; /* 버튼을 라운드 처리 */
		margin-right: 5px; /* 버튼 사이의 수평 간격 조절 */
	}

	.button input[type="submit"]:hover {
		background-color: #285a34;
	}
	
	.button button {
	padding: 10px 20px;
		background-color: red;	
		 border: none; 
		color: white;
		font-size: 16px;
		font-weight: bold;
		cursor: pointer;
		border-radius: 10px; /* 버튼을 라운드 처리 */
		margin-right: 5px; /* 버튼 사이의 수평 간격 조절 */
	}
	
	.button button:hover {
		background-color: red;
	}

body {
overflow: scroll
}

.select-field {
   width: 300px; /* 원하는 세로 길이로 설정 */
}

.type-container {
    text-align: center; /* 원하는 정렬 방식으로 설정 */
  	
    padding-right: 500px; /* 우측 여백 크기 */
}

.container {
    text-align: center;
    margin-top: 20px;
}

.label {
    display: inline-block;
    width: 200px;
    font-weight: bold;
}

.input-field {
    width: 600px;
    height: 30px;
}

.textarea-field {
    width: 600px;
    height: 500px;
}

td .form-group {
	padding: 10px; /* 원하는 여백 크기로 조절 */
	white-space: pre-wrap; /* 줄바꿈을 유지하고 공백을 보존 */
}

h1 {
        font-family: 'Noto Sans KR';
        font-size: 30px;
        color: black; /* 원하는 색상으로 설정 */
        margin-left : 630px;
        text-align: left; /* 원하는 정렬 방식으로 설정 */
        padding: 20px; /* 원하는 여백 크기로 조절 */
    }
    
     hr {
        border: none;
        border-top: 1px solid #ccc; /* 원하는 선의 스타일과 색상으로 설정 */
        margin-bottom: 20px; /* 아래쪽 여백 추가 */
        width: 32%; /* 선의 길이를 조정합니다 */
    }

</style>

</head>

<body>

    <h1>공지사항 수정</h1>
    <hr>
   	
<div class="container">
   
<form action = "noticeupdate" method = "post">           
<input type="hidden" name="nbIdx" value="${param.nbIdx}">
<div class="form-group">
	<div class="type-container">
        <label for="type" class="label"></label>
        <select name="type" class="select-field"> 
        	<option disabled selected>구분을 입력하세요</option>
            <option>이벤트</option>
            <option>배송</option>     
        </select><br/>
    </div>
</div>

<div class="form-group">
<label for= "title" class= "label"></label><br/>
<input type ="text"id ="title" placeholder=" 제목을 입력하세요" class= "input-field" name ="title"><br/>
</div>

<div class="form-group">
<label for= "contents"class= "label"></label><br/>
<textarea id ="contents" placeholder=" 내용을 입력하세요" class= "textarea-field" name ="contents"></textarea><br/>
</div>

<div class = "button">
<input type= "submit" onclick='alert("등록되었습니다.")' value = "등록">
<button type= "button" onclick= "cancel()">취소</button>
</div>
</form>

 </div>


<script>
function cancel() {
window.location.href = 'noticeboardadmin';
}
 </script>

 </body>

 </html>