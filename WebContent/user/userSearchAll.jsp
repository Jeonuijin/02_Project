<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 책 검색을 할 수 있는 검색창 -->
<title>통합검색</title>

</head>
<body>
	<form action="searchAll" method="get">
		<div class="search">
			<select name="searchOption" id="searchOption">
				<option value="all">통합검색</option>
				<option value="title">제목으로 검색</option>
				<option value="author">작가별 검색</option>
			</select> <input type="text" name="search" placeholder="검색어를 입력하세요">
			<div class="search-icon" onclick="submitForm()">
				<img src="../appdata/images/top_search.gif">
			</div>


		</div>
	</form>

	<script>
    function submitForm() {
        document.forms[0].submit(); // 폼 제출
    }
</script>
</body>
</html>