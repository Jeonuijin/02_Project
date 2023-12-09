<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../user/category.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 페이지</title>
</head>
<style>
.userView {
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 25vh;
	margin: 0;
}

.userViewH1 {
	text-align: center;
	font-size: 2.5rem;
	padding: 40px;
	margin-top: 150px;
}

.userViewBtn {
	margin: auto;
	padding: 0px;
	width: 100%;
	flex: 1;
	background-color: #285a34;
	border-radius: 5px;
	padding: 5px;
	width: 200px;
	cursor: pointer;
	font-weight: 500;
	font-size: 20px;
	color: #fff;
}

.userViewBtn:hover {
	background-color: #fff;
	border-color: #285a34;
	color: #285a34;
}

.userViewSearch {
	margin-left: 10px;
	margin: auto;
	padding: 0px;
	width: 100%;
	flex: 1;
	background-color: #fff;
	/* border-color: #285a34; */
	border-radius: 5px;
	border: thin solid #285a34;
	padding: 5px;
	width: 80px;
	cursor: pointer;
	font-weight: 500;
	font-size: 15px;
}

.userSearchIn {
	margin-left: 12px;
}

.userViewSearch:hover {
	background-color: #285a34;
	color: #fff;
}

hr {
	background: #C2C2C2;
	height: 1px;
	/* border: 1px; */
	width: 1000px;
}
</style>
<body>

 <div class="inner">
 	<div class="userView">
		<h1 class="userViewH1" style="color: #285a34;">회원 관리 페이지</h1>
	   	<hr>
	   	<br><br>
	    <!-- 전체 회원 정보 버튼 -->
	    <button class="userViewBtn" id="viewAllMembersButton">전체 회원 정보 보기</button>
	    
	    <br><br><br>
	    <!-- 회원 아이디로 주문 내역 찾기 입력 폼 -->
	    <div>
	        <label for="searchMemberId">회원 아이디로 주문 내역 찾기  :  </label>
	        <input class="userSearchIn" type="text" id="searchMemberId" placeholder="회원 아이디를 입력하세요">
	        <button class="userViewSearch" id="searchOrdersByMemberId">검색</button>
	    </div>
    </div>
</div>
    <script>
        // "전체 회원 정보 보기" 버튼 클릭 이벤트 처리
        document.getElementById("viewAllMembersButton").addEventListener("click", function() {
            // 페이지 이동
            window.location.href = "SelectAllMember"; // SelectAllMember 컨트롤러 URL로 이동
        });

        // "회원 아이디로 주문 내역 찾기" 버튼 클릭 이벤트 처리
        document.getElementById("searchOrdersByMemberId").addEventListener("click", function() {
            // 회원 아이디 입력 값 가져오기
            var memberId = document.getElementById("searchMemberId").value;

            // 페이지 이동 (이 때, memberId를 URL 파라미터로 전달 가능)
            window.location.href = "SelectOneOrder?memberId=" + memberId; // SelectOneOrder 컨트롤러 URL로 이동
        });
    </script>
</body>
</html>