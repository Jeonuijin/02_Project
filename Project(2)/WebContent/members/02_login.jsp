<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알라딩 서점</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="include/main.js"></script>
<link href="../appdata/css/main.css" rel="stylesheet">
<script>
	function find_IdPw() {
		location.href="04_find.jsp";
	}
	function main() { // 메인
		location.href="01_main.jsp";
	}
	function myPage() { // 마이페이지
		location.href="06_myPage.jsp";
	}
	function logout() { // 로그아웃
		location.href="05_logout.jsp";
	}
</script>
<style>
/* 로그인칸 */
.loginPage {
	margin: auto;
	padding: 50px;
	width: 400px;
	align-items: center;
	background-color: #fff;
	text-align: center;
	border: none;
}

/* 로그인 */
.loginPage>h3 {
	color: #333;
}

/**/
.loginPage>ul {
	margin: 0;
	padding: 0;
	list-style: none; /* list 형식 제거 */
}

/**/
.loginPage li {
	margin: 10px;
	text-align: left; /* 왼쪽 정렬 */
	font-size: 15px;
}

/* 아이디/비밀번호 찾기, 회원가입 */
.loginPage a {
	color: #555;
	text-decoration: none; /* 밑줄 제거 */
}

/* 아이디, 비밀번호 입력창 */
.loginPage input {
	width: 100%;
	padding: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

/* 로그인 버튼 */
.loginPage input[type="submit"] {
	background-color: #285a34; /* 배경색 */
	color: #fff; /* 글자색 */
	border: none; /* 테두리 */
	border-radius: 5px; /* 테두리 모서리부분 */
	width: 100%; /* 가로 길이 */
	cursor: pointer; /* 버튼 위로 올라가면 손가락 모양 */
	font-weight: 700; /* 글자 굵기 */
}

/* 로그인 버튼 (커서 O) */
.loginPage input[type="submit"]:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<%@ include file="../user/category.jsp"%>

	<form action="login" method="post">
		<div class="inner">
			<fieldset class="loginPage">
				<h3>로그인</h3>
				<ul>
					<li><input type="text" name="memId"
						placeholder="아이디를 입력해 주세요."></li>
					<li><input type="password" name="memPw"
						placeholder="비밀번호를 입력해 주세요."></li>
					<li><a href="04_find.jsp">아이디/비밀번호 찾기</a> &nbsp;|&nbsp; <a
						href="03_signUp.jsp">회원가입</a></li>
					<br>
					<li><input type="submit" value="로그인"></li>
				</ul>
			</fieldset>
		</div>
	</form>

</body>
</html>