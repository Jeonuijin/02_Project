<%@page import="java.io.File"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.awt.image.DataBufferDouble"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../user/category.jsp" %> 
<!DOCTYPE html>
<!-- 관리자가 책을 삭제, 수정, 등록하기 위해 책리스트를 뽑아오기 -->
<script type="text/javascript">
function book_insert() {
	location.href = "bookInsert.jsp";
}
function book_update() {
    var selectedBook = document.querySelector('input[name="selectedBook"]:checked');
    
    if (!selectedBook) {
        alert("수정할 책을 선택하세요.");
    } else {
        // 선택된 책의 bookId 값을 사용하여 수정 페이지로 이동합니다.
    	window.location.href = "bookListOne?bookId=" + selectedBook.value;
    }
}

function book_delete() {
    var selectedBook = document.querySelector('input[name="selectedBook"]:checked');
    
    if (!selectedBook) {
        alert("삭제할 책을 선택하세요.");
    } else {
        // 선택된 책의 bookId 값을 사용하여 삭제 페이지로 이동합니다.
        var confirmation = confirm("선택한 책을 삭제하시겠습니까?");
        
        if (confirmation) {
            // "예"를 선택한 경우, 선택된 책의 bookId 값을 사용하여 삭제 페이지로 이동합니다.
            window.location.href = "bookDelete?bookId=" + selectedBook.value;
        }
    }
}


function submitForm() {
    document.forms[0].submit(); // 폼 제출
}

</script>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>
<link href="../appdata/css/main.css" rel="stylesheet">
</head>
<style>
.userBook {
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 25vh;
	margin: 0;
}

/* h1 {
	font-size: 2.5rem;
	padding: 40px;
	margin-top: 60px;
} */

.bookListH1 {
	text-align: center;
	font-size: 2.5rem;
	padding: 40px;
	margin-top: 150px;
}

.userBookBtn {
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

.userBookBtn:hover {
	background-color: #fff;
	border-color: #285a34;
	color: #285a34;
}

.searchOption {
	margin-right: 10px;
}

.search-button {
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

.search-button:hover {
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
		<div class="userBook">
			<h1 class="bookListH1" style="color: #285a34;">상품 관리 페이지</h1>
			<hr>
			<br>
			<br>

			<button class="userBookBtn" onclick="book_insert()">책 등록하기</button>
			<br>
			<br>
			<br>

			<form action="searchList" method="post">
				<div class="search">
					<select class="searchOption" name="searchOption" id="searchOption">
						<option value="all">통합검색</option>
						<option value="title">제목으로 검색</option>
						<option value="author">작가별 검색</option>
					</select> <input type="text" name="search" placeholder="수정, 삭제할 책을 입력해주세요">
					<button type="submit" class="search-button">검색</button>
				</div>
			</form>
		</div>
		<!-- div form 위치 바꿨는데 문제 있으면 수정 -->



	</div>
	</div>
	</div>
</body>
</html>