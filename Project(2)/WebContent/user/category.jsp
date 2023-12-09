<%@page import="com.project.model.vo.MembersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 처음 메인페이지에서 헤더와 풋터부분 + 베스트와 신간도서 카테고리를 볼 수 있는 부분 -->
	
<html>
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=1000, initial-scale=1, shrink-to-fit=no">
<link rel="icon" type="image/x-icon" href="../appdata/images/favicon.ico">
<link rel="shortcut icon" type="image/x-icon" href="../appdata/images/favicon.ico">

<title>카테고리 별 검색</title>

<link href="../appdata/css/bootstrap.min.css" rel="stylesheet">
<link href="../appdata/css/layout.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="../appdata/js/bootstrap.bundle.min.js"></script>



</head>
<body>
	
	<header id="header">
		<div class="inner">
			<div class="header-util">
				<ul>
					
<%
HttpSession session2 = request.getSession();
MembersVO membersVO2 = (MembersVO)session2.getAttribute("loginUser");
%>

<% if (membersVO2 == null) { // 세션에 저장된 loginUser가 없으면
%>	
		<li>
			<a href="../members/02_login.jsp">마이페이지</a>
		</li>
		<li>
			<a href="../members/02_login.jsp">로그인</a>
		</li>
		<li>
			<a href="../members/03_signUp.jsp">회원가입</a>
		</li>
		<li>
			<a href="../members/02_login.jsp">주문배송조회</a>
		</li>
		<li>
			<a href="../notice/noticeboarduser">공지사항</a>
		</li>
		
<%	
	
		// membersVO가 null이 아닌 경우에만 memId를 사용
	}else if (membersVO2.getMemId().equals("jesjo9193") && membersVO2.getMemPw().equals("1234")) {
		System.out.println("로그인한 아이디 : " + membersVO2.getMemId());
		System.out.println("로그인한 비번 : " + membersVO2.getMemPw());
		
%>			
		<li>
			<a href="../members/05_logout.jsp">로그아웃</a>
		</li>
		<li>
			<a href="../admin/userView.jsp">회원관리</a>
		</li>
		<li>
			<a href="../admin/bookList.jsp">상품관리</a>
		</li>
		<li>
			<a href="../notice/noticeboardadmin">게시판관리</a>
		</li>
			
<%			
		}else {
			System.out.println("로그인한 아이디 : " + membersVO2.getMemId());
			System.out.println("로그인한 비번 : " + membersVO2.getMemPw());
%>
		<li>
			<a href="../members/06_myPage.jsp">마이페이지</a>
		</li>
		<li>
			<a href="../members/05_logout.jsp">로그아웃</a>
		</li>
		<li>
			<a href="../user/cart.jsp">장바구니</a>
		</li>
		<li>
			<a href="../user/mypageOrder.jsp">주문배송조회</a>
		</li>
		<li>
			<a href="../notice/noticeboarduser">공지사항</a>
		</li>
			
<%		    
}
%>

					
				</ul>
			</div>
			
			<div class="header-area">
				<div class="logo">
					<a href="../user/main.jsp"><img src="../appdata/images/logo.png?ver=1.1" alt="logo"></a>
				</div>
				
				
				<%@ include file="userSearchAll.jsp" %>
				
				<div class="mini-banner">
					<img src="../appdata/images/mini_banner.png" alt="mini banner">
				</div>
			</div>
			<nav class="header-nav">
				<ul>
					<li>
						<form action="../user/bestListCategory.jsp" method="get">
							<input type="hidden" name="category" value="best">
							<button type="submit">베스트 도서</button>
						</form>
					</li>
					<li>
						<form action="../user/newtListCategory.jsp" method="get">
							<input type="hidden" name="category" value="new">
							<button type="submit">신간 도서</button>
						</form>
					</li>
					<li>
						<form action="../user/event.jsp" method="get">
							<button type="submit">이벤트</button>
						</form>
					</li>
				</ul>
			</nav>
		</div>
	</header>
	
	
	<footer id="footer">
		<div class="inner p-3">
			<ul class="footerMenu">
				<li><a
					href="#">회사소개</a></li>
				<li><a
					href="#">광고안내</a></li>
				<li><a
					href="#">입점문의</a></li>
				<li><a
					href="#">청약철회</a></li>
				<li><a
					href="#">청소년보호정책</a></li>
				<li><a class="useTo"
					href="#">이용약관</a></li>

				<li><a style="font-weight: bold;" class="private"
					href="'#">개인정보처리방침</a></li>
				<li><a class="cctv"
					href="#">영상정보관리방침</a></li>
				<li><a class="mailadmin"
					href="#">이메일
						무단 수집거부</a></li>
			</ul>
		</div>
		
		<div class="d-flex justify-content-center">
			<div class="logo w-10">
				<img src="../appdata/images/logo2.png?ver=1.1" alt="logo">
			</div>
	
			<div class="w-50">
				<ul class="address">
					<li><span class="tit">회사명 :</span> (주)영풍문고 <span
						style="margin-right: -7px;">ㅣ</span></li>
					<li><span class="tit">대표이사 :</span> 김경환</li>
					<li><span class="tit">소재지 :</span> 서울특별시 종로구 청계천로 41 (우)03188</li>
					<li><span class="tit">사업자 등록번호 :</span> 773-86-01800 ㅣ <span
						class="tit">통신판매업 신고번호 :</span> 2023-서울종로-0130 <a
						href="https://www.ftc.go.kr/bizCommPop.do?wrkr_no=7738601800"
						target="_blank" style="color: #36634f">[ 사업자정보확인 ] </a></li>
					<li><span class="tit">개인정보관리 책임자 :</span> 조순제 ㅣ <span
						class="tit">customer@ypbooks.co.kr ㅣ <span class="tit">대량주문
								:</span> webmaster@ypbooks.co.kr
					</span></li>
				</ul>
				<span class="address"><strong class="ldt">COPYRIGHT ©
						YOUNGPOONG BOOKSTORE INC. ALL RIGHTS RESERVED. </strong></span>
			</div>
	
			<div class="cs-box w-10 rounded p-3 mb-2 bg-secondary text-white">
				<p>
					고객센터 <br> <span> 1544-9020</span>
				</p>
			</div>
		</div>


	</footer>
	
	
</body>
</html>