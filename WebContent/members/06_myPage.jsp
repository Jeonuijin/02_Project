<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script type="text/javascript" src="include/main_login.js"></script>
<script type="text/javascript" src="include/myPage.js"></script>
<script>
//마이페이지 버튼 누르고 해당 페이지로 이동
function navigateToPage(page) {
    window.location.href = page; 
}
</script>
<style>
/* 본문 영역 */
.rightMypageOrder {
	margin: auto;
	padding: 30px;
	width: 400px;
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
	padding: 5px 30px;
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
					<button class="nav-link btn-lg btn-block"
						onclick="navigateToPage('../members/06_myPage_delete.jsp')">회원탈퇴</button>
				</li>
			</ul>
		</div>

		<div class="rightMypageOrder">

			<h5 style="color: #285A34;">마이페이지</h5>
			<hr>

			<br> 나의 정보
			<table>
				<colgroup>
					<col width="40%" />
					<col width="60%" />

				</colgroup>


				<tr>
					<th>아이디</th>
					<td>${ loginUser.getMemId() }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>****</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${ loginUser.name }</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>${ loginUser.birth }</td>
				</tr>
				<tr>
					<th>휴대전화번호</th>
					<td>${ loginUser.phone }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${ loginUser.address }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${ loginUser.email }</td>
				</tr>

			</table>
		</div>
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