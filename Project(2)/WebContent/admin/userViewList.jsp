<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../user/category.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원정보 조회 결과</title>
<style>
/* h3 {
    font-size: 2.5rem;
    padding: 20px;
    margin-top: 10px;
    margin-left: 170px;
}
table {
	font-size: 0.8em;
} */
.searchTable {
	margin: auto;
	padding: 0px;
	width: 100%;
	flex: 1;
}

table {
	margin: auto;
	padding: 0px;
	border-collapse: collapse;
	border: none;
	width: 1000px;
	font-size: 15px;
}

hr {
	background: #C2C2C2;
	height: 1px;
	border: 0;
	width: 1000px;
}

table th, table td {
	padding: 5px;
	height: 50px;
	text-align: center;
	border-top: 1px solid;
	border-bottom: 1px solid;
	border-color: #ddd;
}

.searchTableH {
	text-align: center;
}

table, td, th {
	border-collapse: collapse;
	border: thin solid #C2C2C2;
	text-align: center;
}

table th {
	background-color: #285A34;
	color: #fff;
}

table tr:nth-child(odd) {
	background-color: #F0F0F0;
}

table tr:nth-child(even) {
	background-color: #fff;
}

table tr:hover {
	background-color: #D5D5D5;
}
</style>
</head>
<body>
	<div class="inner">
		<div class=""searchTable">
			<br>
			<br>
			<h2 class="searchTableH" style="color: #285A34;">전체 회원정보 리스트</h2>
			<hr>
			<br>
			<br>
			<table class="table table-hover" border="1">
				<colgroup>
					<col width="15%" />
					<col width="12%" />
					<col width="13%" />
					<col width="20%" />
					<col width="15%" />
					<col width="10%" />
					<col width="15%" />
				</colgroup>

				<tr>

					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>주소</th>
					<th>핸드폰 번호</th>
					<th>생일</th>
					<th>이메일</th>
				</tr>

				<c:forEach var="vo" items="${list}">
					<tr>
						<td>${vo.memId}</td>
						<td>${vo.memPw}</td>
						<td>${vo.name}</td>
						<td>${vo.address}</td>
						<td>${vo.phone}</td>
						<td>${vo.birth}</td>
						<td>${vo.email}</td>

					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>