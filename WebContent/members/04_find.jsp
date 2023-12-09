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
/* 본문 영역 */
.find {
	margin: auto;
	padding: 50px;
	width: 400px;
	align-items: center;
	background-color: #fff;
	text-align: center;
	border: none;
}

/* 구분선 */
hr {
	width: 400px;
}

/* 제목 */
.find>h3 {
	color: #333;
}

/**/
.find>p {
	font-size: 13px;
}

/**/
.find>ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

/**/
.find li {
	text-align: left;
	font-size: 13px;
}

/**/
.find input {
	width: 100%;
	padding: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

/* 찾기 버튼 */
.find input[type="submit"] {
	margin: 10px 0;
	background-color: #285a34; /* 배경색 */
	color: #fff; /* 글자색 */
	border: none; /* 테두리 */
	border-radius: 5px; /* 테두리 모서리부분 */
	width: 100%; /* 가로 길이 */
	cursor: pointer; /* 버튼 위로 올라가면 손가락 모양 */
	font-weight: 700; /* 글자 굵기 */
}

/* 찾기 버튼 (커서 O) */
.find input[type="submit"]:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<%@ include file="../user/category.jsp"%>


	<form action="findId" method="post">
		<div class="inner">
			<fieldset class="find">
				<h3>아이디 찾기</h3>
				<p>가입할 때 작성하신 이름, 생년월일 8자리, 휴대전화번호, 이메일을 입력해주세요.</p>
				<ul>
					<li><input type="text" name="name" placeholder="이름을 입력해 주세요."></li>
					<li><input type="text" name="birth"
						placeholder="생년월일 8자리를 입력해 주세요."></li>
					<li><input type="text" name="phone"
						placeholder="휴대전화번호를 입력해 주세요."></li>
					<li><input type="email" name="email"
						placeholder="이메일을 입력해 주세요."></li>
					<li><input type="submit" value="아이디 찾기"></li>
				</ul>
			</fieldset>
		</div>
	</form>
	<hr>
	<form class="pw" action="findPw" method="post">
		<div class="inner">
			<fieldset class="find">
				<h3>비밀번호 찾기</h3>
				<p>가입할 때 작성하신 아이디, 이름, 생년월일 8자리, 휴대전화번호, 이메일을 입력해주세요.</p>
				<ul>
					<li><input type="text" name="memId"
						placeholder="아이디를 입력해 주세요."></li>
					<li><input type="text" name="name" placeholder="이름을 입력해 주세요."></li>
					<li><input type="text" name="birth"
						placeholder="생년월일 8자리를 입력해 주세요."></li>
					<li><input type="text" name="phone"
						placeholder="휴대전화번호를 입력해 주세요."></li>
					<li><input type="email" name="email"
						placeholder="이메일을 입력해 주세요."></li>
					<li><input type="submit" value="비밀번호 찾기"></li>
				</ul>
			</fieldset>
		</div>
	</form>
</body>
</html>