<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../user/category.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책(상품)등록 페이지</title>
<style>
.searchTable {
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

.searchTableH {
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

.searchTable input[type="submit"] {
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

.searchTable input[type="reset"] {
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
<body>
<div class="inner">
<script>
	var fileUploadResult = $
	{
		fileInsert
	};

	if (fileUploadResult > 0) {
		alert("책 등록 완료");
		location.href = "bookList.jsp"
	} else {
		alert("책 등록 실패");
	}

	function book_view() {
		location.href = "bookList";
	}
</script>
</head>
<body>
<div class="inner">
   <div class="searchTable">
   
   <br><br>
   <h2 class="searchTableH" style="color: #285A34;">상품 등록</h2>
   <hr>
   <h5 class="searchTableH">관리자 전용 상품 등록 페이지입니다.</h5>
   <br><br>
   
   <form action="InsertBook" method="post"
      enctype="multipart/form-data">
      <table>
         <colgroup>
             <col width="30%" />
              <col width="70%" />
          </colgroup>
         <tr>
            <th><label for="bookName">책 이름</label></th>
            <td><input type="text" id="bookName" name="bookName" required></td>
         </tr>
         <tr>
            <th><label for="price">가격</label></th>
            <td><input type="number" id="price" name="price" required></td>
         </tr>
         <tr>
            <th><label for="publisher">출판사</label></th>
            <td><input type="text" id="publisher" name="publisher" required></td>
         </tr>
         <tr>
            <th><label for="pubDate">출판일</label></th>
            <td><input type="Date" id="pubDate" name="pubDate" required></td>
         </tr>
         <tr>
            <th><label for="author">저자</label></th>
            <td><input type="text" id="author" name="author" required></td>
         </tr>
         <tr>
            <th><label for="bookCnt">재고 수량</label></th>
            <td><input type="number" id="bookCnt" name="bookCnt" required></td>
         </tr>
         <tr>
            <th><label for="orderCnt">주문 수량</label></th>
            <td><input type="number" id="orderCnt" name="orderCnt" required></td>
         </tr>
         <tr>
            <th><label for="details">상세 정보</label></th>
            <td><textarea id="details" name="details" rows="8" required></textarea></td>
         </tr>
         <tr>
            <th><label for="bookImage">책 이미지</label></th>
            <td><input type="file" id="bookImage" name="bookImage" required></td>
         </tr>
         <tr>
            <th><label for="category">카테고리</label></th>
            <td><select id="category" name="category" required>
                  <option value="문학">문학</option>
                  <option value="인문과학">인문과학</option>
                  <option value="경제경영">경제경영</option>
                  <option value="어린이">어린이</option>
                  <option value="소설">소설</option>
                  <!-- 원하는 카테고리를 추가하실 수 있습니다 -->
            </select></td>
         </tr>
      </table>
      <br><br>
      <div style="text-align: center">
      <input type="submit" value="등록"> 
      <input type="reset" value="초기화">
      </div>
   </form>
   </div>
</div>
</body>
</html>