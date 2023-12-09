<%@page import="com.project.model.vo.MembersVO"%>
<%@page import="com.project.model.dao.CartDAO"%>
<%@page import="com.project.model.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="category.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="../appdata/css/main.css" rel="stylesheet">
<script>

//특정 상품(1개) 장바구니에서 삭제
function deleteOne(bookId){

	$.ajax({
		type : "POST",
		url : "deleteCart",
		dataType : "json",
		data : {"bookId": bookId},
		success : function(respData){
				alert("삭제 완료");
				location.reload();

		},
		error : function(request, status, error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}	
	})
 };
 
//선택 상품 장바구니에서 삭제
function deleteSel() { //체크된 값 수집
	 let selectedItems = [];
	 let checkboxes = document.querySelectorAll(".checkbox"); //checkbox 클래스를 가진 모든 요소를 선택
	 
	 for (let i = 0; i < checkboxes.length; i++) {
		 if (checkboxes[i].checked) {
			 selectedItems.push(checkboxes[i].value);
		 }
	 }
	 
	 //console.log(selectedItems);
	 
	 if (selectedItems.length == 0) {
		 alert("선택된 항목이 없습니다.");
	 } else {
		if (confirm ("선택된 항목을 삭제하시겠습니까?")) {	
		 	$.ajax({
		         	type: "POST",
		        	url: "deleteSel",
		        	data: { selectedItems: selectedItems.join(",") },
		        	traditional: true, //배열 전송을 위해 필요
		        	success : function(respData){
					alert("정상적으로 삭제되었습니다.");
					location.reload();
				},
				error : function(request, status, error){
			       	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}	
		 	})
		} else {
			alert("삭제 실패"); //나중에 지우자 깔끔하게
		}
 	}
 };
 
//전체 상품 장바구니에서 삭제
function deleteAll() { //장바구니 전체 삭제
	 $.ajax({
		type : "POST",
		url : "deleteAll",
		dataType : "json",
		success : function(respData){
				alert("삭제 완료");
				location.reload();

		},
		error : function(request, status, error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}	
	})
	
 }
 
//선택 상품 주문하기
function orderSel() {
	 //alert("선택 주문 페이지로 넘어갑니다"); //삭제 예정
	 
	 let selectedItems = [];
	 let checkboxes = document.querySelectorAll(".checkbox"); //checkbox 클래스를 가진 모든 요소를 선택
	 
	 for (let i = 0; i < checkboxes.length; i++) {
		 if (checkboxes[i].checked) {
			 selectedItems.push(checkboxes[i].value);
		 }
	 }
	 
	 console.log(selectedItems);	
	 
	 if (selectedItems.length == 0) {
		 alert("선택된 항목이 없습니다.");
	 } else {
		 
		//데이터 전달하면서 페이지 이동
       var sendData = "selectedItems=" + selectedItems.join(",");
       //location.href = "orderSel?" + sendData;
       location.href = "orderSel?" + sendData;
 	}	 
}


$(document).ready(function() {
     $(".allcheckbox").click(function () {
         // "모두 선택" 체크 박스의 상태를 가져옴
         var isChecked = $(this).prop("checked");
         
         // 모든 다른 체크 박스들의 상태를 "모두 선택" 체크 박스와 동일하게 설정
         $(".checkbox").prop("checked", isChecked);
     });
});

// 수량 plus/minus 기능
function cal(bookId, action) {
	
	//alert ("플러스 : " + bookId);
	$.ajax({
		type : "POST",
		url : "updateCnt",
		dataType : "json",
		data : {"bookId": bookId, "action": action},
		success : function(respData){
				//alert("플러스 완료");
				location.reload(); //지울지 말지 고민

		},
		error : function(request, status, error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}	
	})
	
}

function goHome() {
	
	location.href = "main.jsp"
}




</script>


<style>
.cart_img {
	margin: 0 auto;
	padding: 0;
	width: 100%;
	border: 3px solid;
	border-color: #ddd;
	margin-top: 30px;
	margin-left: 20px;
}

.first_h1 {
	margin: 0 auto;
	padding: 10px;
	font-size: 20px;
	text-align: left;
}

.first_table {
	margin: 0 auto;
	padding: 0;
	width: 100%;
	border: 3px solid;
	border-color: #ddd;
	border-collapse: collapse;
	font-size: 15px;
	text-align: center;
	margin-left: 20px;
}

.first_table th {
	padding: 5px;
	background-color: #eee;
	text-align: center;
	border-bottom: 1px solid;
	border-bottom-color: #ddd;
}

.first_table td {
	padding: 5px;
	border-top: 1px solid;
	border-top-color: #ddd;
}

.second_table {
	margin: 0 auto;
	padding: 0;
	width: 100%;
	border: 3px solid;
	border-color: #ddd;
	border-collapse: collapse;
	font-size: 15px;
	text-align: center;
	margin-left: 20px;
}

.second_table th {
	padding: 5px;
	background-color: #eee;
	text-align: center;
	border-bottom: 1px solid;
	border-bottom-color: #ddd;
}

.second_table td {
	padding: 5px;
}

.first_p {
	margin: 0 auto;
	padding: 10px;
	font-size: 15px;
}

/* 마지막 줄 버튼 */
.button_s {
	margin: 0 auto;
	padding: 10px;
	text-align: center;
	margin-bottom: 30px;
}

.button_s>button {
	margin: 0 auto;
	padding: 10px;
	width: 22%; /* 가로 길이 */
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

</head>
<body>
	<%
	MembersVO loginUser = (MembersVO) session.getAttribute("loginUser");
	String memId = loginUser.getMemId();
	
	//String memId = (String) session.getAttribute("memId");
	
	if(memId != null) {
		List<CartVO> list = CartDAO.checkTotalCart(memId);
		request.setAttribute("list", list);
	}
%>

	<!-- 품절인 상품 담지 못하게 하기 -->




	<div class="inner">
		<img src="cart.png" alt="장바구니" class="cart_img"> <br>
		<br>

		<h1 class="first_h1">장바구니</h1>
		<table class="first_table">
			<tr>
				<th class="ft_th1"><input type="checkbox" class="allcheckbox"></th>
				<th>상품명</th>
				<th>가격</th>
				<th>수량</th>
				<th>합계</th>
			</tr>
			<c:choose>

				<c:when test="${empty list}">
					<tr>
						<td colspan="7">장바구니가 비었습니다</td>
					</tr>

				</c:when>
				<c:otherwise>

					<c:forEach var="vo" items="${list }">
						<tr>
							<td><input type="checkbox" class="checkbox"
								value="${vo.bookId}"></td>
							<td>${vo.bookName }</td>
							<td>${vo.price }원</td>
							<td>
								<button type="button" onclick="cal(${vo.bookId}, 'minus')">-</button>
								${vo.bookCnt }
								<button type="button" onclick="cal(${vo.bookId}, 'plus')">+</button>
							</td>
							<td class="all_price">${vo.bookCnt * vo.price }원</td>

						</tr>

						<c:set var="totalPrice"
							value="${totalPrice + vo.price * vo.bookCnt}" />
						<c:set var="totalCnt" value="${totalCnt + vo.bookCnt}" />

					</c:forEach>

				</c:otherwise>
			</c:choose>
		</table>

		<br>

		<table class="second_table">
			<tr>
				<th>주문상품 금액 합계</th>
				<th>주문상품 수량</th>
				<th>배송비</th>
				<th>총 금액 합계</th>
			</tr>
			<tr>
				<td>${totalPrice}원</td>
				<td>${totalCnt}권</td>
				<td>0 원</td>
				<td>${totalPrice}원</td>
			</tr>
		</table>
		<p class="first_p">10,000원 이상 주문하시면 배송비가 무료입니다.</p>

		<br>
		<br>

		<div class="button_s">
			<button class="left-button" onclick="deleteSel()">선택 삭제</button>
			<button class="left-button" onclick="deleteAll()">전체 삭제</button>
			<!--  <input type="button" class="right-button" value="전체 삭제"> -->
			<button class="right-button" onclick="orderSel()">주문하기</button>
			<button class="right-button" onclick="goHome()">쇼핑 계속하기</button>
		</div>
	</div>

</body>
</html>