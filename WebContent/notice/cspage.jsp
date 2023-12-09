<%@page import="com.project.model.vo.MembersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../user/category.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link href="../appdata/css/main.css" rel="stylesheet">
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

nav {
	background-color: #f0f0f0;
	padding: 10px;
}

nav ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

nav ul li {
	display: inline-block;
	margin-right: 10px;
}

nav ul li a {
	text-decoration: none;
	color: #333;
	padding: 5px;
}

nav ul li a:hover {
	background-color: #007bff;
	color: #fff;
}
</style>
</head>
<body>




	<%
HttpSession session3 = request.getSession();
MembersVO membersVO3 = (MembersVO) session3.getAttribute("loginUser");
String redirectionURL = "noticeboarduser"; // 기본적으로 user 페이지로 이동

if (membersVO3 != null && "jesjo9193".equals(membersVO3.getMemId())) {
    redirectionURL = "noticeboardadmin"; // id가 admin인 경우 admin 페이지로 이동
}
%>
	<div class="inner">
		<nav>
			<ul>
				<li><a href="#" onclick="branch()">공지사항</a></li>
				<li><a href="#">Q&A</a></li>
				<li><a href="#">FAQ</a></li>
			</ul>
		</nav>
	</div>
	<script>
function branch() {
    location.href = "<%=redirectionURL%>"; // JavaScript에서 Java 변수를 사용하여 분기
}
</script>

</body>
</html>