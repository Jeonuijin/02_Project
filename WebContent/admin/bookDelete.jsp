<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../user/category.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책삭제페이지</title>
<script>
var fileDeleteResult = ${fileDelete};

if (fileDeleteResult > 0) {
	 	alert("책 삭제 완료");
	 	location.href = "bookList.jsp"
} else {
		alert("책 삭제 실패 \n 책 리스트 페이지로 돌아갑니다.");
		location.href = "bookList.jsp";
}
	
	
</script>
</head>
<body>

</body>
</html>