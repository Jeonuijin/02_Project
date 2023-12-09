<%@page import="com.project.model.vo.MembersVO"%>
<%@page import="com.project.model.dao.LikeDAO"%>
<%@page import="com.project.model.vo.LikeVO"%>
<%@page import="com.project.model.dao.CartDAO"%>
<%@page import="com.project.model.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
//마이페이지 버튼 누르고 해당 페이지로 이동
function navigateToPage(page) {
    window.location.href = page; 
}

//찜 목록에서 상품 삭제
function deleteLike(bookId){

	$.ajax({
		type : "POST",
		url : "deleteLike",
		dataType : "json",
		data : {"bookId": bookId},
		success : function(respData){
				alert("해당 도서를 삭제했습니다.");
				location.reload(); //할까 아니면 그냥 둘까 결과 비교해보자
				
		},
		error : function(request, status, error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}	
	})
 };

 
//찜 목록에 있는 상품 1개 장바구니에 담기
function orderLike(bookId) {
	
	$.ajax({
		type : "POST",
		url : "orderLike",
		dataType : "json",
		data : {"bookId": bookId},
		success : function(respData){
			if (respData.count >= 1) {
				if(confirm("이미 장바구니에 담긴 도서입니다. 장바구니로 이동하시겠습니까?")) {
					location.href = "cart.jsp";
				} else {
					location.reload(); //할까 아니면 그냥 둘까 결과 비교해보자
				}
			} else {
				if(confirm("도서를 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?")) {
					location.href = "cart.jsp";
				} else {
					location.reload(); //할까 아니면 그냥 둘까 결과 비교해보자
				}
			}
		},
		error : function(request, status, error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}	
	})
 };

</script>
</head>

<style>
#book {
	margin-right: auto;
}

td {
	padding: 5px;
}

#btnCart {
	border-color: #285a34;
	margin-right: 5px;
	color: #285a34;
}

#btnCart:hover {
	background-color: #285a34;
	border-color: none;
	color: #FFFFFF;
}

#btnDel {
	border-color: #DA4444;
	color: #DA4444;
}

#btnDel:hover {
	background-color: #DA4444;
	border: none;
	color: #FFFFFF;
}

table {
	text-align: center;
	border: 0px solid black;
	border-collapse: collapse;
	width: 100%;
	left-margin: 10px;
	overflow: auto;
}

div.leftMypageLike {
	width: 23%;
	float: left;
	padding: 50px 6px 6px 0px;
	box-sizing: border-box;
}

div.rightMypageLike {
	width: 77%;
	float: right;
	padding: 50px 0px 6px 10px;
	box-sizing: border-box;
}

th, td {
	padding: 5px;
	height: 50px;
}

/*홀수행*/
table tr:nth-child(even) {
	background-color: #F0F0F0;
}

/*짝수행*/
table tr:nth-child(odd) {
	background-color: #fff;
}

#likeCategory {
	background-color: #F0F0F0;
}

div.box {
	border: thin solid #C2C2C2;
	margin: auto;
	width: 100%;
	height: 80px;
	position: relative;
	/* text-align: center; */
	padding: 15px;
}

hr {
	background: #C2C2C2;
	height: 1px;
	border: 0;
}

a {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

/* 선택삭제 버튼을 왼쪽으로 이동 */
.left-button {
	float: left;
	margin: 5px;
}

/* 전체삭제 버튼을 오른쪽으로 이동 */
.right-button {
	float: right;
	margin: 5px;
}
</style>

<body>

	<%@ include file="../user/category.jsp"%>

	<%
	MembersVO loginUser = (MembersVO) session.getAttribute("loginUser");
	String memId = loginUser.getMemId();
		
	if(memId != null) {
		List<LikeVO> list = LikeDAO.checkTotalLike(memId);
		request.setAttribute("list", list);
	}
%>

	<div class="inner">

		<div class="leftMypageLike">

			<ul class="nav nav-pills nav-fill flex-column"
				style="background-color: #f7f8f9;" id="myTab" role="tablist">

				<li class="nav-item" role="presentation">
					<button class="nav-link btn-lg btn-block"
						onclick="navigateToPage('../members/06_myPage_update.jsp')">내정보
						수정</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link btn-lg btn-block"
						onclick="navigateToPage('mypageOrder.jsp')">주문배송조회</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link btn-lg btn-block active"
						onclick="navigateToPage('like.jsp')">찜 목록</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link btn-lg btn-block"
						onclick="navigateToPage('../members/06_myPage_delete.jsp')">회원탈퇴</button>
				</li>
			</ul>
		</div>

		<div class="rightMypageLike">

			<h5 style="color: #285A34;">찜 목록</h5>
			<hr>

			<div class="box">
				회원님께서 읽고 싶은 책을 담아 두셨다가 구입을 원하시면<br> 언제든지 구매하실 수 있는 회원님의 서재 입니다.
			</div>
			<br>
			<table>
				<colgroup>
					<col width="35%" />
					<col width="30%" />
					<col width="35%" />
				</colgroup>
				<tr id="likeCategory">
					<th>도서 정보</th>
					<th>가격 정보</th>
					<th>선택</th>
				</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="7">찜 목록이 비었습니다</td>
						</tr>

					</c:when>
					<c:otherwise>
						<tbody>
							<c:forEach var="vo" items="${list }">
								<tr>
									<td>${vo.bookName }</td>
									<td>${vo.price }원</td>
									<td>
										<button id="btnCart" class="btn btn-sm"
											onclick="orderLike(${vo.bookId})">장바구니 담기</button>
										<button id="btnDel" class="btn btn-sm"
											onclick="deleteLike(${vo.bookId})">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</c:otherwise>
				</c:choose>
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