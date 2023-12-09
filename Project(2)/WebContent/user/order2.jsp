<%@page import="com.project.model.vo.MembersVO"%>
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
<title>주문 페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>

</script>
<head>
<style>
/* 결제 진행중 */
.order_img {
	margin: 0 auto;
	padding: 0;
	width: 700px;
	border: 3px solid;
	border-color: #ddd;
	margin-left: 132px;
	margin-top: 30px;
}

/* 주문상품 확인 */
.order_ok {
	margin: 0 auto;
	padding: 0;
	width: 700px;
	flex: 1;
}

.order_ok h2 {
	margin: 0 auto;
	padding: 10px 0;
	text-align: left;
}

.order_ok table {
	margin: 0 auto;
	padding: 0;
	width: 700px;
	border: 3px solid;
	border-color: #ddd;
	border-collapse: collapse;
	font-size: 13px;
	text-align: center
}

.order_ok table thead th {
	background-color: #eee;
	margin: auto;
	padding: 10px;
}

.order_ok table tbody tr {
	background-color: #fff;
	text-align: left;
}

.order_ok tr {
	border-bottom: 1px solid;
	border-bottom-color: #ddd;
}

.item_info {
	width: 500px;
}

.item_cnt {
	width: 50px;
}

.order_ok table tbody td {
	padding: 5px;
	border-bottom: 1px solid;
	border-bottom-color: #ddd;
}

/* 구매자 정보 */
.orderInfo {
	margin: 0 auto;
	padding: 0;
	width: 700px;
	flex: 1;
}

.orderInfo h2 {
	margin: 0 auto;
	padding: 10px 0;
	text-align: left;
}

.order_mem_table {
	margin: 0 auto;
	padding: 0;
	width: 700px;
	border-collapse: collapse;
	border: 3px solid;
	border-color: #ddd;
	font-size: 13px;
	text-align: center
}

.order_mem_table th {
	padding: 5px;
	background-color: #eee;
}

.order_mem_table tr {
	border-bottom: 1px solid;
	border-bottom-color: #ddd;
}

.order_mem_table td {
	padding: 5px;
	text-align: left;
}

/* 배송지 정보 입력 */
.delivery {
	margin: 0 auto;
	padding: 0px;
	width: 700px;
	flex: 1;
}

.delivery h2 {
	margin: 0 auto;
	padding: 10px 0;
	text-align: left;
}

.delivery table {
	margin: 0 auto;
	padding: 0;
	width: 700px;
	border-collapse: collapse;
	border: 3px solid;
	border-color: #ddd;
	font-size: 13px;
	text-align: center;
}

.delivery th {
	padding: 5px;
	background-color: #eee;
}

.delivery tr {
	border-bottom: 1px solid;
	border-bottom-color: #ddd;
}

.delivery td {
	padding: 5px;
	text-align: left;
}

.delivery input[name="rcvName"], input[name="rcvPhone"] {
	margin: 1px auto;
	width: 100px;
}

.delivery input[name="rcvAddress"] {
	margin: 1px auto;
	width: 500px;
}

.delivery textarea {
	margin: 1px auto;
	width: 300px;
	height: 100px;
}

.delivery button {
	margin: 1px auto;
	padding: 3px;
	background-color: #555;
	color: #fff;
	border: none;
	border-radius: 1px;
	cursor: pointer;
	font-size: 13px;
}

.delivery button:hover {
	background-color: #999;
}

/* 결제정보 확인 */
.final {
	margin: 0 auto;
	padding: 0px;
	width: 700px;
	flex: 1;
}

.final h2 {
	margin: 0 auto;
	padding: 10px 0;
	text-align: left;
}

.final table {
	margin: 0 auto;
	padding: 0;
	width: 700px;
	border-collapse: collapse;
	border: 3px solid;
	border-color: #ddd;
	font-size: 13px;
	text-align: center;
}

.final th {
	background-color: #eee;
	margin: auto;
	padding: 10px;
}

.final td {
	background-color: #fff;
	text-align: left;
	margin: auto;
	padding: 10px;
	text-align: center;
}

.final tr {
	border-bottom: 1px solid;
	border-bottom-color: #ddd;
}

/* 결제 방법 */
.payment {
	margin: 0 auto;
	padding: 0px;
	width: 700px;
	flex: 1;
}

.payment h2 {
	margin: 0 auto;
	padding: 10px 0;
	text-align: left;
}

.payment table {
	margin: 0 auto;
	padding: 0;
	width: 700px;
	border-collapse: collapse;
	border: 3px solid;
	border-color: #ddd;
	font-size: 13px;
}

.payment th {
	background-color: #eee;
	margin: auto;
	padding: 10px;
	text-align: center;
}

.payment td {
	background-color: #fff;
	text-align: left;
	margin: auto;
	padding: 10px;
}

.payment td label {
	margin-right: 15px;
}

.payment tr {
	border-bottom: 1px solid;
	border-bottom-color: #ddd;
}

/* 마지막줄 버튼 */
.last_button {
	margin: 0 auto;
	padding: 0px;
	width: 700px;
	flex: 1;
}

.last_button button {
	margin: 0 auto;
	padding: 5px;
	width: 100px;
	height: 40px;
	background-color: #fff;
	border: 1px solid;
	border-color: #285a34;
	border-radius: 5px; /* 테두리 모서리부분 */
	width: 30%; /* 가로 길이 */
	cursor: pointer; /* 버튼 위로 올라가면 손가락 모양 */
	font-weight: 700; /* 글자 굵기 */
}

.last_button button:hover {
	background-color: #285a34;
	color: #fff;
}
</style>
</head>

<div class="inner">
	<%
   
   HttpSession session1 = request.getSession();
   MembersVO membersVO = (MembersVO)session.getAttribute("loginUser");
   
%>
	<script>
   var rcvName = "<%=membersVO.getName()%>";
   var rcvPhone = "<%=membersVO.getPhone()%>";
   var rcvAddress = "<%=membersVO.getAddress()%>";

   function fillMyInfo() {

      document.getElementById('rcvName').value = rcvName;
       document.getElementById('rcvPhone').value = rcvPhone;
       document.getElementById('rcvAddress').value = rcvAddress;
   }
   
   function prevPage() {
      
      history.go(-1);
   }
   
</script>

	<form action="insertOrder">
		<div class="inner">
			<img src="order.jpg" alt="주문/결제" class="order_img"> <br>
			<br>

			<div class="order_ok">
				<h2>주문상품 확인</h2>
				<table border="0">
					<thead>
						<tr>
							<th class="item_info">상품/옵션정보</th>
							<th class="item_price">정가</th>
							<th class="item_cnt">수량</th>
							<th class="all_price">합계</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="totalPrice" value="0" />
						<!-- 합계 구하기 위한 초기값 -->
						<c:set var="totalCnt" value="0" />
						<!-- 건수 구하기 위한 초기값 -->

						<c:forEach var="vo" items="${list}">
							<tr>
								<td>${vo.bookName}</td>
								<td>${vo.price}원</td>
								<td>${bookCnt}개</td>
								<td>${list[0].price * bookCnt}원</td>
							</tr>

							<c:set var="totalPrice"
								value="${totalPrice + vo.price * bookCnt}" />
							<c:set var="totalCnt" value="${totalCnt + bookCnt}" />

						</c:forEach>
					</tbody>
					<!-- totalPrice와 totalCout 보내기    -->

					<input type="hidden" name="orderList" value="${list}">
					<input type="hidden" name="totalPrice" value="${totalPrice}" />
					<input type="hidden" name="totalCnt" value="${totalCnt}" />
				</table>
			</div>

			<br>
			<br>

			<div class="orderInfo">
				<h1>구매자 정보</h1>
				<table class="order_mem_table">
					<tr>
						<th>이름</th>
						<td><input type="text" name="orderName" id="orderName"
							value="<%=membersVO.getName()%>"></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" name="orderName" id="orderName"
							value="<%=membersVO.getPhone()%>"></td>
					</tr>
					<tr>
						<th>E-mail</th>
						<td><input type="text" name="orderName" id="orderName"
							value="<%=membersVO.getEmail()%>"></td>
					</tr>
				</table>
			</div>

			<br>
			<br>

			<div class="delivery">
				<h1>배송지 정보 입력</h1>
				<table>
					<tr>
						<th>받는 분 이름</th>
						<td><input type="text" name="rcvName" id="rcvName">
							<button type="button" onclick="fillMyInfo()">회원정보 배송지</button>
							<button type="reset">초기화</button></td>
					</tr>
					<tr>
						<th>휴대폰 번호</th>
						<td><input type="text" name="rcvPhone" id="rcvPhone"></td>
					</tr>
					<tr>
						<th>배송주소</th>
						<td><input type="text" name="rcvAddress" id="rcvAddress"></td>
					</tr>
					<tr>
						<td>택배사 전달사항</td>
						<td>
							<p>
								<textarea rows="3"></textarea>
							</p> 서점 요청사항이 아닌 택배사 송장에 표기되는 메시지입니다.
						</td>
					</tr>

				</table>
			</div>

			<br>
			<br>

			<div class="final">
				<h1>결제정보 확인</h1>
				<table>
					<tr>
						<th>주문상품 금액 합계</th>
						<th>주문상품 수량</th>
						<th>배송비</th>
						<th>총 결제금액</th>
					</tr>
					<tr>
						<td>${totalPrice}원</td>
						<td>${totalCnt}개</td>
						<td>3000 원</td>
						<td>${totalPrice + 3000}원</td>
					</tr>

				</table>
			</div>

			<br>
			<br>

			<div class="payment">
				<h1>결제방법</h1>
				<table>
					<tr>
						<th>일반결제</th>
						<td><label> <input type="radio" name="payment"
								value="신용카드">신용카드
						</label> <label> <input type="radio" name="payment"
								value="휴대폰 소액결제">휴대폰 소액결제
						</label> <label> <input type="radio" name="payment"
								value="실시간 계좌이체">실시간 계촤이체
						</label> <label> <input type="radio" name="payment" value="무통장 입금">무통장(온라인)
								입금
						</label></td>
					</tr>
					<tr>
						<th>간편결제</th>
						<td><label> <input type="radio" name="payment"
								value="페이코">페이코
						</label> <label> <input type="radio" name="payment" value="카카오페이">카카오페이
						</label> <label> <input type="radio" name="payment" value="토스페이">토스페이
						</label></td>
					</tr>
					<tr>
						<th>상품권결제</th>
						<td><label> <input type="radio" name="payment"
								value="걸쳐랜드상품권/도서상품권">걸쳐랜드상품권/도서상품권
						</label></td>
					</tr>
				</table>
			</div>

			<br>
			<br>

			<div class="last_button">
				<button type="submit">결제하기</button>
				<button type="button" onclick="prevPage()">이전페이지</button>
			</div>
		</div>
	</form>
</div>
<style>
</style>
</body>
</html>