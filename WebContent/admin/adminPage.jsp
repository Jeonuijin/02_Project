<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../user/category.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 상품을 등록할 수 있는 관리자 페이지 시작페이지 -->
<c:set var="fileUpload" value="${fileUpload}" />
<title>상품등록, 수정, 삭제</title>
<script>
	
	
	function book_view() {
		location.href = "bookList";
	}
	
	
	function book_view() {
		location.href = "bookList";
	}
	
	
</script>
</head>
<body>
	<button onclick="book_view()">전체 책 리스트 조회</button>

</body>
</html>