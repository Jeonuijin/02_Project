<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<body>
	<h1>Error Page</h1>
	<p>There was an error processing your request.</p>

	<!-- JavaScript 코드를 추가하여 이전 페이지로 돌아가는 버튼을 생성 -->
	<button onclick="goBack()">Go Back</button>

	<script>
        function goBack() {
        	alert("[실패] 오류가 발생했습니다. 이전 페이지로 돌아갑니다.");
            window.history.back();
        }
    </script>
</body>
</html>