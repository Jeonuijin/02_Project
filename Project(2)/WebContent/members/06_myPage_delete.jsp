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
	
	//마이페이지 버튼 누르고 해당 페이지로 이동
	function navigateToPage(page) {
	    window.location.href = page; 
	}
</script>
<style>
/* 본문 */
.delete_mem {
	margin: auto;
	padding: 50px;
	width: 400px;
	align-items: center;
	background-color: #fff;
	text-align: center;
	border: none;
}

/**/
.delete_mem>h3 {
	color: #333;
}

/**/
.delete_mem>p {
	font-size: 13px;
}

/**/
.delete_mem>ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

/**/
.delete_mem input {
	width: 100%;
	padding: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

/* 탈퇴 버튼 */
.delete_mem input[type="submit"] {
	background-color: #285a34;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 15px;
	width: 300px;
	cursor: pointer;
	font-weight: 700;
	font-size: 13px;
}

/* 탈퇴 버튼 (커서 O) */
.delete_mem input[type="submit"]:hover {
	background-color: #45a049;
}

/*회원탈퇴칸 */
.delete fieldset {
	background-color: #fff;
	border: none;
	width: 300px;
	padding: 20px;
	margin: 0 auto;
	text-align: center;
}

/* 새로 추가한 부분-song */
button:hover {
	background-color: #285a34;
	color: #eee;
}

div.leftMypageOrder {
	width: 23%;
	float: left;
	padding: 50px 6px 6px 0px;
	box-sizing: border-box;
}

div.rightMypageOrder {
	width: 77%;
	float: right;
	padding: 50px 0px 6px 10px;
	box-sizing: border-box;
}

div.box {
	border: thin solid #C2C2C2;
	margin: auto;
	width: 100%;
	height: 55px;
	position: relative;
	/* text-align: center; */
	padding: 15px;
}

hr {
	background: #C2C2C2;
	height: 1px;
	border: 0;
}

.rightMypageOrder input[type="submit"] {
	background-color: #285a34;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px;
	width: 300px;
	cursor: pointer;
	font-weight: 700;
	font-size: 20px;
}

#centerMyPageDelete {
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="../user/category.jsp"%>

	<div class="inner">
		<div class="leftMypageOrder">
			<ul class="nav nav-pills nav-fill flex-column"
				style="background-color: #f7f8f9;" id="myTab" role="tablist">

				<li class="nav-item" role="presentation">
					<button class="nav-link btn-lg btn-block"
						onclick="navigateToPage('../members/06_myPage_update.jsp')">내정보
						수정</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link btn-lg btn-block"
						onclick="navigateToPage('../user/mypageOrder.jsp')">주문배송조회</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link btn-lg btn-block"
						onclick="navigateToPage('../user/like.jsp')">찜 목록</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link btn-lg btn-block active"
						onclick="navigateToPage('../members/06_myPage_delete.jsp')">회원탈퇴</button>
				</li>
			</ul>
		</div>

		<form action="delete" method="post">
			<div class="rightMypageOrder">
				<!-- delete_mem -->

				<h5 style="color: #285A34;">회원탈퇴</h5>
				<hr>

				<div class="box">원활한 회원탈퇴를 위해 아이디와 비밀번호를 입력해주세요.</div>
				<br>

				<fieldset class="delete_mem">
					<ul>
						<br>
						<li><input type="text" name="memId"
							placeholder="아이디를 입력해 주세요."></li>
						<li><input type="password" name="memPw"
							placeholder="비밀번호를 입력해 주세요."></li>
						<br>
						<br>
						<div id="centerMyPageDelete">
							<li><input type="submit" value="탈퇴하기"></li>
						</div>
					</ul>
				</fieldset>
			</div>
		</form>
	</div>

	<style>
.nav-pills .nav-link.active {
	background-color: #285a34;
}

.table td {
	vertical-align: middle;
}
</style>

</body>
</html>