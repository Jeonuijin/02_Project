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
	    location.href = page; 
	}
</script>
<style>
/* 본문 영역 */
.rightMypageOrder {
	margin: auto;
	padding: 0px;
	width: 100%;
	flex: 1;
}

table {
	margin: 10px;
	padding: 0px;
	border-collapse: collapse;
	border: none;
	width: 100%;
	font-size: 15px;
}

table th, table td {
	height: 50px;
	text-align: left;
	border-top: 1px solid;
	border-bottom: 1px solid;
	border-color: #ddd;
}
/*헤더*/
table th {
	padding: 5px;
	background-color: #F0F0F0;
	color: #333;
	text-align: center;
	border-right: 1px solid;
	border-right-color: #ddd;
}

table td {
	padding: 5px 20px;
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

#centerSubmit {
	text-align: center;
}

.rightMypageOrder input[type="submit"]:hover {
	background-color: #45a049;
}

.inputAdit {
	width: 70%;
}

.inputAddress {
	width: 90%;
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
					<button class="nav-link btn-lg btn-block active"
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
					<button class="nav-link btn-lg btn-block"
						onclick="navigateToPage('../members/06_myPage_delete.jsp')">회원탈퇴</button>
				</li>
			</ul>
		</div>

		<form action="update" method="post">
			<div class="rightMypageOrder">
				<!-- mypage -->
				<h5 style="color: #285A34;">내정보 수정</h5>
				<hr>

				<br> 회원정보
				<table>
					<colgroup>
						<col width="40%" />
						<col width="60%" />

					</colgroup>
					<tr>
						<th>아이디</th>
						<td>${ loginUser.memId }</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" class="inputAdit" name="memPw"
							value="${ loginUser.memPw }"></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" class="inputAdit" name="memPw2"
							value="${ loginUser.memPw }"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" class="inputAdit" name="name"
							value="${ loginUser.name }"></td>
					</tr>
					<tr>
						<th>생년월일 8자리</th>
						<td><input type="text" class="inputAdit" name="birth"
							value="${ loginUser.birth }"></td>
					</tr>
				</table>
				<br>
				<br> 기본 배송 정보
				<table>
					<colgroup>
						<col width="40%" />
						<col width="60%" />

					</colgroup>
					<tr>
						<th>휴대전화번호</th>
						<td><input type="text" class="inputAdit" name="phone"
							value="${ loginUser.phone }"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" class="inputAddress" name="address"
							value="${ loginUser.address }"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" class="inputAddress" name="email"
							value="${ loginUser.email }"></td>
					</tr>

				</table>
				<br>

				<div id="centerSubmit">
					<input type="submit" value="수정하기">
				</div>
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

<style>
body {
	position: relative;
	padding-bottom: 1100px;
	min-height: 100vh;
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
</html>