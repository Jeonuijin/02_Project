<%@page import="com.project.model.dao.adminBookDAO"%>
<%@page import="com.project.model.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../user/category.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책정보 수정</title>
<style>
.UpdateTable {
	margin: auto;
	padding: 0px;
	width: 100%;
	flex: 1;
}

table {
	margin: auto;
	padding: 0px;
	border-collapse: collapse;
	width: 500px;
	font-size: 16px;
}

hr {
	background: #C2C2C2;
	height: 1px;
	border: 0;
	width: 1000px;
}

.UpdateTableH {
	text-align: center;
}


table, td, th {
	border-collapse: collapse;
}

table th, table td {
	padding: 5px;
	height: 50px;
	border-top: thin solid #C2C2C2;
	border-bottom: thin solid #C2C2C2;
	/* text-align: center; */
}

table td {
	text-align: left;
	padding: 3px 3px 3px 70px;
}

table th {
	text-align: center;
	padding: 0px 0px 0px 20px;
	
}

.UpdateTable input[type="submit"] {
	background-color: #285a34;
	color: #fff;
	border-color: #285a34;
	border-radius: 5px;
	padding: 5px;
	width: 150px;
	cursor: pointer;
	font-weight: 500;
	font-size: 20px;
}

.UpdateTable input[type="reset"] {
	background-color: #fff;
	border-color: #285a34;
	border-radius: 5px;
	padding: 5px;
	width: 150px;
	cursor: pointer;
	font-weight: 500;
	font-size: 20px;
}
</style>
<link href="../appdata/css/main.css" rel="stylesheet">
<script>
	var fileUploadResult = ${fileUpdate};

	if (fileUploadResult > 0) {
   	 	alert("책정보 수정 완료");
   	 	location.href = "bookList.jsp"
	} else {
  		alert("책정보 수정 실패했습니다. \n 책리스트 화면으로 돌아갑니다.");
	}
</script>
</head>

<body>
<div class="inner">
	<div class="UpdateTable">

	<br>
	<br>
	<h2 class="UpdateTableH" style="color: #285A34;">상품 수정</h2>
	<hr>
	<h5 class="UpdateTableH">관리자 전용 상품 수정 페이지입니다.</h5>
	<br>
	<br>
	
	<form action="bookUpdate" method="post" enctype="multipart/form-data">
		<c:forEach var="vo" items="${list }">
			<table>
			<colgroup>
				<col width="30%" />
				<col width="70%" />
			</colgroup>
				<tr>
					<td><label for="booId">책아이디:</label></td>
					<td><input type="text" id="bookName" name="bookId"
						value="${vo.bookId }" required readonly
						style="border: none; outline: none;"></td>
				</tr>
				<tr>
					<td><label for="bookName">책 이름:</label></td>
					<td><input type="text" id="bookName" name="bookName"
						value="${vo.bookName }" required></td>
				</tr>
				<tr>
					<td><label for="price">가격:</label></td>
					<td><input type="number" id="price" name="price"
						value="${vo.price }" required></td>
				</tr>
				<tr>
					<td><label for="publisher">출판사:</label></td>
					<td><input type="text" id="publisher" name="publisher"
						value="${vo.publisher }" required></td>
				</tr>
				<tr>
					<td><label for="pubDate">출판일:</label></td>
					<td><input type="Date" id="pubDate" name="pubDate"
						value="${vo.pubDate }" required></td>
				</tr>
				<tr>
					<td><label for="author">저자:</label></td>
					<td><input type="text" id="author" name="author"
						value="${vo.author }" required></td>
				</tr>
				<tr>
					<td><label for="bookCnt">재고 수량:</label></td>
					<td><input type="number" id="bookCnt" name="bookCnt"
						value="${vo.bookCnt }" required></td>
				</tr>
				<tr>
					<td><label for="orderCnt">주문수량:</label></td>
					<td><input type="text" id="bookName" name="orderCnt"
						value="${vo.orderCnt }" required readonly
						style="border: none; outline: none;"></td>
				</tr>
				<tr>
					<td><label for="details">상세 정보:</label></td>
					<td><textarea id="details" name="details" rows="8"
							value="${vo.details }" required>${vo.details }</textarea></td>
				</tr>
				<tr>
					<td><label for="bookImage">책 이미지:</label></td>
					<td><input type="file" id="bookImage" name="bookImage"
						accept="${vo.bookImage }" required></td>
				</tr>
				<tr>
								<th><label for="category">카테고리</label></th>
								<td><select id="category" name="category" required>
										<option value="문학">문학</option>
										<option value="인문과학">인문과학</option>
										<option value="경제경영">경제경영</option>
										<option value="어린이">어린이</option>
										<option value="소설">소설</option>
										<option value="학습">학습</option>
										<option value="외국어">외국어</option>
										<option value="컴퓨터">컴퓨터</option>
										<!-- 원하는 카테고리를 추가하실 수 있습니다 -->
								</select></td>
							</tr>
				
			</table>
			<br>
			<br>
			<div style="text-align: center">
		</c:forEach>
		<input class="bookUpdateIn" type="submit" value="수정"><!--  <input type="reset"
			value="초기화"> --><!--  <input type="button" value="뒤로가기"
			onclick="history.back()"> -->
	</form>
	</div>
	</div>
	</div>
</body>
</html>
