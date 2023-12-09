<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../user/category.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 리스트</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>

function addCart(bookId){
	$.ajax({
		type : "POST",
		url : "addCart",
		dataType : "json",
		data : {"bookId": bookId}, //나중에 1대신 bookId로 변경해서 addCartController로 전달함을 표현
		success : function(respData){
			
			if(confirm("도서를 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?")) {
				location.href = "cart.jsp";
			} else {
			
			}
		},
		error : function(request, status, error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}	
	})
};

function addLike(bookId){ 
	$.ajax({
		type : "POST",
		url : "addLike",
		dataType : "json",
		data : {"bookId": bookId}, //나중에 1대신 bookId로 변경해서 addCartController로 전달함을 표현
		success : function(respData){
			if (respData.count >= 1) {
				if(confirm("이미 내서재에 등록된 도서입니다. 내서재로 이동하시겠습니까?")) {
					location.href = "like.jsp";
				} else { }
            } else {
            	if(confirm("내서재에 등록되었습니다. 내서재로 이동하시겠습니까?")) {
					location.href = "like.jsp";
				} else { }
            }
		},
		error : function(request, status, error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}	
	})
};
 
</script>
</head>
<body>
	<h1>전체 책 리스트</h1>
	<table border="1">
		<tr>
			<th>카테고리</th>
			<th>책이름</th>
			<th>가격</th>
			<th>출판사</th>
			<th>작가</th>
			<th>책설명</th>
			<th>책이미지</th>

			<!-- 합치고 bookId 담아서 전달 -->
			<td><button onclick="addCart(1)">장바구니 담기</button></td>
			<td><button onclick="addLike(1)">찜</button></td>
		</tr>

	</table>
</body>
</html>