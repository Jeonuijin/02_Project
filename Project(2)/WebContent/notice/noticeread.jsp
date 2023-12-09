<%@page import="com.project.model.vo.MembersVO"%>
<%@page import="com.project.model.dao.NoticeBoardDAO"%>
<%@page import="com.project.model.vo.NoticeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1000, initial-scale=1, shrink-to-fit=no">
<link rel="icon" type="image/x-icon" href="../appdata/images/favicon.ico">
<link rel="shortcut icon" type="image/x-icon" href="../appdata/images/favicon.ico">


<title>공지사항 내용</title>
<link href="../appdata/css/main.css" rel="stylesheet">

<link href="../appdata/css/bootstrap.min.css" rel="stylesheet">
<link href="../appdata/css/layout.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="../appdata/js/bootstrap.bundle.min.js"></script>


<style>
	 
	 body {
      font-family: 'Noto Sans KR';
      /* Malgun Gothic */
     
      margin: 0;
      padding: 0;
      
      overflow: scroll 
    }
	
	
	td .scrollable-content {
	height: 100%;
	width: 100%;
	/* padding: 120px;*/ /* 원하는 여백 크기로 조절 */
	white-space: pre-wrap; /* 줄바꿈을 유지하고 공백을 보존 */
	} 
	

	
	.center-heading {
		/* text-align: center; */
		text-align: left; /* 왼쪽 정렬 */
		margin-left: 510px; /* 원하는 여백 크기로 조절 */
		/* margin-bottom: 50px; /* 원하는 여백 크기로 조절 */
	}

	.center-heading h3, .center-heading h5 {
		display: inline-block;
		margin: 0;
	}

	.center-heading h3 {
		font-size: 24px; /* 원하는 크기로 조절 */
	}

	.center-heading h5 {
		font-size: 14px; /* 원하는 크기로 조절 */
	}
	
		hr {
	    border: none;
        border-top: 1px solid #ccc; /* 원하는 선의 스타일과 색상으로 설정 */
       /* margin-top: 1px; /* 아래쪽 여백 추가 */
       /* margin-bottom: 30px; /* 아래쪽 여백 추가 */
        width: 46%; /* 선의 길이를 조정합니다 */
	
	}
 

h3, h5 {
text-align : center;
font-family: 'Noto Sans KR';
      /* Malgun Gothic */
      
      margin: 0;
      padding: 0;
	margin-bottom: 20px;
}

/* 내용 */
table {
	/* width: 100%; */
	width: 60%;
  	margin: 0 auto;
	border-collapse: collapse;
	margin-left: 500px
}
/*
th, td {	
	padding: 10px;
	/* border: 1px solid #ccc; 
	padding-bottom: 10px;
    padding-left: 10px;
    padding-right: 10px;
} 
*/

th {
	/* background-color: #f0f0f0; */
	/* text-align: left; */
	margin-left : 500px;
	padding-left: 500px;
	
	padding: 10px;
	width: 7%;
	font-size: 14px;
}

td {

	width: 50%;
	font-size: 14px;
}

a {
	display: inline-block;
	padding: 10px;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
}

a:hover {
	background-color:black;
	/* background-color: #0056b3; */
}

.button {
		display: flex;
		justify-content: center;
		margin-top: 20px;
	}

	.button input[type="submit"]
	 {
		padding: 10px 20px;
		background-color: #285a34;
		border: none;
		color: white;
		font-size: 16px;
		font-weight: bold;
		cursor: pointer;
		border-radius: 10px; /* 버튼을 라운드 처리 */
		margin-right: 5px; /* 버튼 사이의 수평 간격 조절 */
	}

	.button input[type="submit"]:hover {
		background-color: #285a34;
	}
	
	.button button {
	padding: 10px 20px;
		background-color: red;	
		 border: none; 
		color: white;
		font-size: 16px;
		font-weight: bold;
		cursor: pointer;
		border-radius: 10px; /* 버튼을 라운드 처리 */
		margin-right: 5px; /* 버튼 사이의 수평 간격 조절 */
	}
	
	.button button:hover {
		background-color: red;
	}
	
	html, body {
    height: 100%
}

#wrap {
	/* min-height: 60px; */
    /* min-height: 100%; */
    position: relative;
    padding-bottom: 100px;
}

#footer {
	/* position : absolute; */
	 position: static; 
	/* position: fixed; */
    bottom: 100;
  	
 	height: 60px;
 	 width: 100%; 
  	padding: 0 25px; 
  /* line-height: 60px; */ 
  	color: #8a8c8f;
 	 border-top: 1px solid #dee5e7; 
  background-color: #f2f2f2; 
}
	

</style>
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
					<a href="../user/main.jsp"><img src="../appdata/images/logo2.png?ver=1.1" alt="logo"></a>
				</div>
				
				
				<%@ include file="/user/userSearchAll.jsp" %>
				
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
						<form action="#" method="get">
							<button type="submit">123</button>
						</form>
					</li>
				</ul>
			</nav>
		</div>
	</header>

<div id="wrap">

<!-- <div class="inner"> -->
	<br>
<div class="center-heading">
<br>
<h3>공지사항</h3>
<h5>알라딩의 새로운 소식과 공지사항을 알려드립니다.</h5>
</div>
<hr>

	<table>
		<tbody>
			<tr>
				<th>제목</th>
				<td>${vo.title}</td>
			</tr>
			<tr>
				<th>구분</th>
				<td>${vo.type}</td>
				<th>작성일</th>
				<td>${vo.createDat}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>		
			<div class="scrollable-content" style="height: fit-content;">
			${vo.contents}
		</div>
		</td>
			</tr>
		</tbody>
		
	</table>
	  
<%
HttpSession session3 = request.getSession();
MembersVO membersVO3 = (MembersVO) session3.getAttribute("loginUser");
String redirectionURL = "noticeboarduser"; // 기본적으로 user 페이지로 이동


%>

	<% if ("jesjo9193".equals(membersVO3.getMemId())) { %>
		<div class = "button">
		
			<form action="noticeupdate.jsp" method="post">
				<input type="hidden" name="nbIdx" value="${vo.nbIdx}"> 
				<input type="submit" value="수정">
			</form>
		
			<form action="noticedelete" method="post" id="deleteForm">
				<input type="hidden" name="nbIdx" value="${vo.nbIdx}"> 
				<button type="button" onclick="confirmDelete()">삭제</button>
			</form>
		</div>
	<% } %>
</div>

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

	<script>
  function confirmDelete() {
	  if (confirm("삭제하시겠습니까?")) {
	    document.getElementById("deleteForm").submit();
	  }
	}
  </script>

</body>
</html>