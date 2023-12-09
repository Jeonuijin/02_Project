<%@page import="java.util.ArrayList"%>
<%@page import="com.project.model.dao.OrderDAO"%>
<%@page import="com.project.model.vo.DetailVO"%>
<%@page import="java.util.List"%>
<%@page import="com.project.model.vo.OrderVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/배송 조회</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
//마이페이지 버튼 누르고 해당 페이지로 이동
function navigateToPage(page) {
    window.location.href = page; 
}
</script>

</head>
<style>
#book {
	margin-right: auto;
}

td {
	padding: 5px;
}

button:hover {
	background-color: #285a34;
	color: #eee;
}

table {
	text-align: center;
	border: thin solid #C2C2C2;
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

/* 	#orderPrice {
		text-align : right;

	} */

/*홀수행*/
table tr:nth-child(odd) {
	background-color: #F0F0F0;
}

/*짝수행*/
table tr:nth-child(even) {
	background-color: #fff;
}

div.box {
	border: thin solid #C2C2C2;
	margin: auto;
	width: 100%;
	height: 110px;
	position: relative;
	/* text-align: center; */
	padding: 15px;
}

hr {
	background: #C2C2C2;
	height: 1px;
	border: 0;
}

#pay {
	color: #285A34;
}

a {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}
</style>


<body>

	<%@ include file="../user/category.jsp"%>

	<!-- 적용안되서 추가한 부분 -->
	<%
	MembersVO loginUser = (MembersVO) session.getAttribute("loginUser");
	String memId = loginUser.getMemId();
		
	if(memId != null) {
		List<Integer> list = OrderDAO.selectOrderAllId(memId);
		
		List<OrderVO> orderVOList = new ArrayList<>();
		
		for (int orderNum : list){
			OrderVO vo = OrderDAO.getOrderInfo(orderNum);
			orderVOList.add(vo);
		}
		request.setAttribute("orderVOList", orderVOList);
	}
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

				<div class="box">
					<h6>주문배송안내</h6>
					<hr>
					입금대기 상태가 결제완료 상태에서는 직접 주문을 취소할 수 있습니다
				</div>
				<br>

				<table>
					<tr>
						<th>주문일</th>
						<th>주문번호</th>
						<!-- <th>상품명</th> -->
						<th>주문금액</th>
						<th>수량</th>
						<th>주문상태</th>
					</tr>

					<c:forEach var="orderVO" items="${orderVOList}">
						<tr>
							<td>${orderVO.getOrderdate()}</td>
							<td><a
								href="mypageOrderDetail?orderId=${orderVO.getOrderId()}"
								style="color: #285A34;">${orderVO.getOrderId()}</a></td>
							<!-- <td>${orderVO}</td>  보류 -->
							<td id="orderPrice">${orderVO.getTotalPrice()}원</td>
							<td>${orderVO.getTotalCnt()}</td>
							<td id="pay">결제 완료</td>

						</tr>

					</c:forEach>
				</table>
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