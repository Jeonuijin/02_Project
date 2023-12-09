<%@page import="com.project.model.vo.MembersVO"%>
<%@page import="com.project.model.vo.DetailVO"%>
<%@page import="com.project.model.vo.OrderVO"%>
<%@page import="com.project.model.dao.CartDAO"%>
<%@page import="com.project.model.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../user/category.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료 페이지 (payment.jsp)</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
function goHome() {
   
   location.href = "main.jsp"
}
</script>

<style>
.payment_img {
	width: 100%;
	border: 3px solid;
	border-color: #ddd;
}

.inner_first_div>h1 {
	margin: 0 auto;
	padding: 10px;
	font-size: 25px;
	text-align: center;
}

.inner_first_div>h2 {
	margin: 0 auto;
	padding: 10px;
	font-size: 23px;
	text-align: center;
}

/* 배송정보 */
.delivery>h1 {
	margin: 0 auto;
	padding: 10px;
	font-size: 20px;
	text-align: left;
}

.delivery>table {
	margin: 0;
	padding: 0;
	width: 100%;
	font-size: 15px;
	text-align: left;
	border-collapse: collapse;
	border: 3px solid;
	border-color: #ddd;
}

.delivery th {
	padding: 5px;
	width: 100px;
	text-align: center;
	border-right: none;
	background-color: #eee;
}

.delivery td {
	padding: 5px;
	border-left: none;
}

.delivery tr {
	border-bottom: 1px solid;
	border-bottom-color: #ddd;
}

/* 상품정보 */
.book>h1 {
	margin: 0 auto;
	padding: 10px;
	font-size: 20px;
	text-align: left;
}

.book>table {
	margin: 0;
	padding: 0;
	width: 100%;
	font-size: 15px;
	text-align: center;
	border-collapse: collapse;
	border: 3px solid;
	border-color: #ddd;
}

.book>table th {
	padding: 5px;
	border-right: none;
	background-color: #eee;
}

.book>table td {
	padding: 5px;
	border-left: none;
}

.book>table tr {
	border-bottom: 1px solid;
	border-color: #ddd;
}

/* 결제정보 */
.payment h1 {
	margin: 0 auto;
	padding: 10px;
	font-size: 20px;
	text-align: left;
}

.payment table {
	margin: 0;
	padding: 0;
	width: 100%;
	font-size: 15px;
	text-align: center;
	border-collapse: collapse;
	border: 3px solid;
	border-color: #ddd;
}

.payment th {
	padding: 5px;
	border-right: none;
	background-color: #eee;
}

.payment td {
	padding: 5px;
	border-left: none;
}

.payment tr {
	border-bottom: 1px solid;
	border-color: #ddd;
}

.payment .table_td {
	border-left: 1px solid;
	border-color: #ddd;
	color: cadetblue;
}

/* 마지막줄 버튼 */
.button_s {
	margin: 0 auto;
	padding: 10px;
	text-align: center;
}

.button_s>button {
	margin: 0 auto;
	padding: 10px;
	width: 25%; /* 가로 길이 */
	height: 50px;
	font-size: 20px;
	text-align: center;
	background-color: #fff;
	border: 2px solid;
	border-color: #285a34;
	border-radius: 5px; /* 테두리 모서리부분 */
	cursor: pointer; /* 버튼 위로 올라가면 손가락 모양 */
	font-weight: 700; /* 글자 굵기 */
}

.button_s>button:hover {
	background-color: #285a34;
	color: #fff;
}
</style>
<body>
	<%
HttpSession session1 = request.getSession();

MembersVO loginUser = (MembersVO) session.getAttribute("loginUser");
%>

	<div class="inner">
		<img src="payment.png" alt="주문완료" class="payment_img">
		<div class="inner_first_div">
			<br>
			<h1>감사합니다. 님의 주문이 정상적으로 처리되었습니다.</h1>
			<h2>고객님의 주문번호 [ ${orderInfo.getOrderId()} ]</h2>
		</div>
		<hr>
		<form action="mypageOrder">

			<div class="delivery">
				<h1>배송정보</h1>
				<table border="1">
					<tr>
						<th>주문일</th>
						<td>${orderInfo.getOrderdate()}</td>
					</tr>
					<tr>
						<th>배송 예정일</th>
						<td>${orderInfo.getDlvydate()}</td>
					<tr>
						<th>이름</th>
						<td>${orderInfo.getRcvName()}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${orderInfo.getRcvPhone()}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${loginUser.getEmail()}</td>
						<!-- 나중에 session.get해서 가져올수있으면 좋겠다 -->
					</tr>
					<tr>
						<th>주소</th>
						<td>${orderInfo.getRcvAddress()}</td>
					</tr>
				</table>
			</div>

			<br>
			<br>

			<div class="book">
				<h1>상품정보</h1>
				<table border="0">
					<tr>
						<th>상품명</th>
						<th>수량</th>
						<th>가격</th>
					</tr>
					<tbody>
						<c:set var="totalPrice" value="0" />
						<!-- 합계 구하기 위한 초기값 -->
						<c:set var="totalCnt" value="0" />
						<!-- 건수 구하기 위한 초기값 -->

						<c:forEach var="vo" items="${list}">
							<tr>
								<td>${vo.getBookName()}</td>
								<td>${vo.getBookCnt()}</td>
								<td>${vo.getPrice()}원</td>
							</tr>

							<c:set var="totalPrice"
								value="${totalPrice + vo.price * vo.bookCnt}" />
							<c:set var="totalCnt" value="${totalCnt + vo.getBookCnt()}" />

						</c:forEach>

						<tr>
							<td>합계</td>
							<td>${totalCnt}</td>
							<td>${totalPrice}원</td>
						</tr>
					</tbody>

					<!-- totalPrice와 totalCout와 list 보내기 ---보낼 곳이 없음   -->
					<input type="hidden" name="totalPrice" value="${totalPrice}" />
					<input type="hidden" name="totalCnt" value="${totalCnt}" />

				</table>
			</div>

			<br>
			<br>

			<div class="payment">
				<h1>결제정보</h1>
				<table>
					<tr>
						<th>결제방법</th>
						<td>${orderInfo.getPayment()}</td>
						<td rowspan="2" class="table_td">최종 결제 금액<br>${orderInfo.getTotalPrice()}
							원
						</td>
					</tr>
					<tr>
						<th>총 상품가격<br>${orderInfo.getTotalPrice()} 원
						</th>
						<td>배송비<br>0 원
						</td>
					</tr>
				</table>
			</div>

			<br>
			<br>

			<div class="button_s">
				<button type="button" onclick="goHome()">홈으로</button>
				<button type="submit">주문/배송 조회</button>
			</div>
		</form>
		<br>
	</div>

</body>

</html>