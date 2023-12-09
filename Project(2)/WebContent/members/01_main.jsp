<%@page import="com.project.model.vo.MembersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알라딩 서점</title>
<%
	if (session.getAttribute("loginUser") == null) { // 세션에 저장된 loginUser가 없으면
%>
<script>
function main() { // 메인
	location.href="../user/main.jsp";
}
function login() { // 로그인
	location.href="02_login.jsp";
}
function signUp() { // 회원가입
	location.href="03_signUp.jsp";
}

</script>
<%
	} else { // 세션에 저장된 loginUser가 있으면
%>
<script>
function main() { // 메인
	location.href="../user/main.jsp";
}
function myPage() { // 마이페이지
	location.href="06_myPage.jsp";
}
function logout() { // 로그아웃
	location.href="05_logout.jsp";
}
</script>
<%
	}
%>
</head>
<body>
	<%
	if (session.getAttribute("loginUser") == null) { // 세션에 저장된 loginUser가 없으면
%>
	<h1>알라딩 서점</h1>
	<button onclick="main()">메인</button>
	<button onclick="login()">로그인</button>
	<button onclick="signUp()">회원가입</button>
	<hr>
	<%
	} else { // 세션에 저장된 loginUser가 있으면
%>
	<p>환영합니다. ${ loginUser.getName() }님</p>
	<button onclick="main()">메인</button>
	<button onclick="myPage()">마이페이지</button>
	<button onclick="logout()">로그아웃</button>
	<hr>
	<%
	}
%>
</body>
</html>