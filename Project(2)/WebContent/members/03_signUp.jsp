<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알라딩 서점</title>
<link href="../appdata/css/main.css" rel="stylesheet">
<style>
/* 본문 */
.signup {
	margin: auto;
	padding: 50px;
	width: 400px;
	align-items: center;
	background-color: #fff;
	text-align: center;
	border: none;
}

/* 회원가입 */
.signup>h3 {
	color: #333;
}

/**/
.signup>ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

/* 정보 입력칸 */
.signup input {
	width: 100%;
	padding: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 13px;
}

/* 가입하기 버튼 */
.signup input[type="submit"] {
	margin: 10px 0;
	background-color: #285a34;
	color: #fff;
	border: none;
	border-radius: 5px;
	width: 100%;
	cursor: pointer;
	font-weight: 700;
}

/* 가입하기 버튼 (커서 O) */
.signup input[type="submit"]:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<%@ include file="../user/category.jsp"%>

	<form action="signup" method="post">
		<div class="inner">
			<fieldset class="signup">
				<h3>회원가입</h3>
				<ul>
					<li><input type="text" name="memId"
						placeholder="아이디를 입력해 주세요."></li>
					<li><input type="password" name="memPw"
						placeholder="비밀번호를 입력해 주세요."></li>
					<li><input type="password" name="memPw2"
						placeholder="비밀번호를 한 번 더 입력해 주세요."></li>
					<br>
					<li><input type="text" name="name" placeholder="이름을 입력해 주세요."></li>
					<li><input type="text" name="birth"
						placeholder="생년월일 8자리를 입력해 주세요."></li>
					<li><input type="text" name="phone"
						placeholder="휴대전화번호를 입력해 주세요."></li>
					<li><input type="text" name="address"
						placeholder="주소를 입력해 주세요."></li>
					<li><input type="email" name="email"
						placeholder="이메일을 입력해 주세요."></li>
					<br>
					<br>
					<li><input type="submit" value="가입하기"></li>
				</ul>
			</fieldset>
		</div>
	</form>
</body>
</html>