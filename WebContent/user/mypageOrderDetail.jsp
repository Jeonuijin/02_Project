<%@page import="java.util.ArrayList"%>
<%@page import="com.project.model.dao.OrderDAO"%>
<%@page import="com.project.model.vo.DetailVO"%>
<%@page import="java.util.List"%>
<%@page import="com.project.model.vo.OrderVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../user/category.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상제 조회</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<script>
	/* function cancelOrder() {
	 alert("지워라~~");
	
	 location.href = "deleteOneOrder?orderId=${orderId}"
	 location.href = "deleteOneOrder";
	 } */
</script>
<style>
table {
	text-align: left;
	border: 1px solid black;
	border-collapse: collapse;
	width: 500px;

}

<!--
추가 -->table {
	text-align: center;
	border: 0px solid black;
	border-collapse: collapse;
	width: 100%;
	left-margin: 10px;
	overflow: auto;
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

th, td {
	padding: 5px;
	height: 50px;
}

th {
	background-color: #F0F0F0;
	text-align: center;
}

div.boxOrderInfomation {
	border: thin solid #C2C2C2;
	margin: auto;
	width: 100%;
	height: 110px;
	position: relative;
	/* text-align: center; */
	padding: 15px;
}

div.boxOrderNumber {
	border: thin solid #C2C2C2;
	margin: auto;
	width: 100%;
	height: 60px;
	position: relative;
	/* text-align: center; */
	padding: 15px;
}

hr {
	background: #C2C2C2;
	height: 1px;
	border: 0;
}

/* 전체삭제 버튼을 오른쪽으로 이동 */
.right-button {
	float: right;
}

.mypageOrderDetail {
	border: thin solid #C2C2C2;
	margin: auto;
	width: 100%;
	height: 60px;
	position: relative;
	/* text-align: center; */
	padding: 15px;
}

#mypageOrderDetail td {
	text-align: center;
}

#btnOrderPrev {
	
	margin: 0 auto;
    padding: 10px;
    width: 35%; /* 가로 길이 */
    height: 50px;
    font-size: 20px;
    text-align: center;
    background-color: #285a34;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    font-weight: 700;
    color: #FFFFFF;
  

}

#btnOrderPrev:hover {

	background-color: #45a049 ;
	border-color: none;
	color: #FFFFFF;
}

#centerMypageOrderDetail {
	
	text-align: center;
}

</style>
<script>
	function confirmCancellation() {
		var confirmation = confirm("주문을 취소하시겠습니까?");
		if (confirmation) {
			// 사용자가 확인을 누른 경우
			// form을 제출
			document.getElementById('cancelOrderForm').submit();
		}
		alert("주문이 취소되었습니다");
	}

	function prevPage() {

		history.go(-1);
	}
	
	//마이페이지 버튼 누르고 해당 페이지로 이동
	function navigateToPage(page) {
	    window.location.href = page; 
	}
</script>
<body>

	<%
	HttpSession session1 = request.getSession();
	MembersVO membersVO = (MembersVO) session.getAttribute("loginUser");
	%>
	
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
					<button class="nav-link btn-lg btn-block active"
						onclick="navigateToPage('mypageOrder.jsp')">주문배송조회</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link btn-lg btn-block"
						onclick="navigateToPage('like.jsp')">찜 목록</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link btn-lg btn-block"
						onclick="navigateToPage('../members/06_myPage_delete.jsp')">회원탈퇴</button>
				</li>
			</ul>
		</div>

		<form>
			<div class="rightMypageOrder">


				<h5 style="color: #285A34;">주문배송조회</h5>
				<hr>


				<div class="boxOrderInfomation">
					<h6>주문배송안내</h6>
					<hr>
					입금대기 상태가 결제완료 상태에서는 직접 주문을 취소할 수 있습니다
				</div>
				<br>

				<div class="boxOrderNumber">

					주문 번호 [ ${vo.getOrderId()} ]
					</td> <input type="button" class="right-button" value="주문취소"
						onclick="confirmCancellation()">
					</td>

				</div>


				<form id="cancelOrderForm" action="deleteOneOrder">


					<br>


					<h5>주문자 정보</h5>
					<table class="mypageOrderDetail">
					<colgroup>
						<col width="20%" />
						<col width="30%" />
						<col width="20%" />
						<col width="30%" />
					</colgroup>
						<tr>
							<th>주문하신 분</th>
							<td>${loginUser.getName()}</td>
							<!-- 으로 나중에 가져오기 -->
							<th>주문일</th>
							<td>${vo.getOrderdate()}</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>${vo.getRcvPhone()}</td>
							<th>주문상태</th>
							<td>결제완료</td>
						</tr>
						<tr>
							<th>받으실 분</th>
							<td>${vo.getRcvName()}</td>
							<th>배송방법</th>
							<td>택배</td>
						</tr>
						<tr>
							<th>주소</th>
							<td colspan="3">${vo.getRcvAddress()}</td>
						</tr>
					</table>

					<br>

					<h5>상품 정보</h5>
					<table class="mypageOrderDetail" id="mypageOrderDetail">
					<colgroup>
						<col width="40%" />
						<col width="10%" />
						<col width="25%" />
						<col width="25%" />
					</colgroup>

						<tr>
							<th>상품명</th>
							<th>수량</th>
							<th>판매가</th>
							<th>상태</th>
						</tr>
						
						<c:forEach var="vo" items="${detailVOList}">
							<tr>
								<td>${vo.getBookName() }</td>
								<!-- detailVOList에서 가져온 vo -->
								<td>${vo.getBookCnt() }</td>
								<td>${vo.getPrice() }</td>
								<td>결제완료</td>
							</tr>
						</c:forEach>
						<tr>
							<th>합계</th>
							<td>${vo.getTotalCnt() }</td>
							<!-- OrderInfo 저장해놓은 vo -->
							<td>${vo.getTotalPrice() }</td>
							<td></td>
						</tr>
					</table>

					<br>

					<h5>결제 정보</h5>
					<table class="mypageOrderDetail">
					<colgroup>
						<col width="40%" />
						<col width="60%" />
					</colgroup>
						<tr>
							<th>결제수단</th>
							<td>${vo.getPayment() }</td>
						</tr>
						<tr>
							<th>결제금액</th>
							<td>${vo.getTotalPrice() }</td>
						</tr>
					</table>

					<br><br>
					<div id="centerMypageOrderDetail">
						<button id="btnOrderPrev" onclick="prevPage()">이전페이지</button>
					</div>
					<br><br>
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