<%@page import="com.project.model.common.Paging"%>
<%@page import="com.project.model.vo.BookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../user/category.jsp" %>  
<% 


Integer datasize = 0;
System.out.println("search : " + request.getAttribute("search"));
System.out.println("list : " + request.getAttribute("list"));
System.out.println("cPage : " + request.getAttribute("cPage"));
System.out.println("searchOption : " + request.getAttribute("searchOption"));
	if (request.getAttribute("list") != null ){
		datasize = (Integer) request.getAttribute("size");
		System.out.println("Received parameter: " + datasize);
 	 }
	
 %>
 
<%
	//0. 페이징 처리를 위한 객체(Paging) 생성
	 try {
	Paging p = new Paging();

	//1. 전체 게시물 수량 구하기
	p.setTotalRecord(datasize);
	p.setTotalPage();
	System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
	System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
	
	//2. 현재 페이지 구하기
	String cPage = request.getParameter("cPage");
	if (cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}
	System.out.println("> cPage : " + cPage);
	System.out.println("> paging nowPage : " + p.getNowPage());
	
	//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호 구하지
	int fixedNumPerPage = 3; // 고정된 페이지당 게시글 수

	p.setEnd(p.getNowPage() * fixedNumPerPage);
	p.setBegin(p.getEnd() - fixedNumPerPage + 1);
	
	//3-1. (선택적) 끝 번호가 데이터 건수보다 많아지면 데이터 건수와 동일하게 설정
	if (p.getEnd() > p.getTotalRecord()) {
		p.setEnd(p.getTotalRecord());
	}
	
	System.out.println(">> 시작번호(begin) : " + p.getBegin());
	System.out.println(">> 끝번호(end) : " + p.getEnd());
	
	//------ 블록(block) 게산하기 -----------------
	//4. 블록 시작페이지, 끝페이지 구하기
	//4-1. 시작페이지 구하기
	int beginPage = (p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
	p.setBeginPage(beginPage);
	p.setEndPage(beginPage + p.getPagePerBlock() -1);
	
	//4-2. 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
	// 끝페이지를 전체 페이지 수로 변경처리(설정)
	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}
	
	System.out.println(">> 시작페이지(beginPage) : " + p.getBeginPage());
	System.out.println(">> 끝페이지(endPage) : " + p.getEndPage());
	
	System.out.println("p : " + p);
%>
<%

	//검색 결과를 데이터베이스 또는 다른 소스에서 가져옴
	List<BookVO> searchData = null;
	List<BookVO> list = null; 
	
		searchData = (List<BookVO>)request.getAttribute("list");
		System.out.println("list222searchData : " + searchData);
		int begin = p.getBegin() - 1;
		list = searchData.subList(begin, p.getEnd());
		System.out.println("리스트 : " + list);

	
	
	
	// 현재 페이지에 해당하는 데이터만 추출
	//List<YourDataClass> currentPageData = searchData.subList(begin, end);
	//================================
	//현재 페이지 기준으로 DB데이터(게시글) 가져오기
	//시작번호(begin), 끝번호(end) 사용해서
	//List<BbsVO> list = adminBookDAO.getPageList(p.getBegin(), p.getEnd());
	//System.out.println(">> 현재 페이지 글목록(list) : " + list);
	 
	
	//--------------------------
	//JSTL, EL 사용을 위해 scope에 데이터 등록(page 영역)
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pvo", p);
	
	//(개인적실습) 현재 페이지번호 사용 블록번호 구하고, 블록번호로 시작/끝 페이지 구하기
	System.out.println("p : " + p);	} catch (Exception e) {
        // 예외 처리: 예외 메시지를 출력하거나 다른 처리를 수행할 수 있음
        e.printStackTrace();
        // 여기에 예외 처리 로직을 추가하십시오.
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>공지사항 게시판</title>
 <link href="../appdata/css/main.css" rel="stylesheet">


<style>
  	body {
  	overflow: scroll
}

	.center-heading {
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
		font-size: 12px; /* 원하는 크기로 조절 */
		
	}
	
	hr {
	    border: none;
        border-top: 1px solid #ccc; /* 원하는 선의 스타일과 색상으로 설정 */
       /* margin-top: 1px; /* 아래쪽 여백 추가 */
       /* margin-bottom: 30px; /* 아래쪽 여백 추가 */
        width: 46%; /* 선의 길이를 조정합니다 */
	
	}

.button {
	display: flex; 
	justify-content: center; 
	margin-top: 30px; /* 작성하기와 삭제하기 사이 간격 조절 */
}

.button input[type="submit"] {
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
	

.button2 input[type="submit"] {
		padding: 10px 20px;
		background-color: red;
		border: none ;
		color: white;
		font-size: 16px;
		font-weight: bold;
		cursor: pointer;
		border-radius: 10px; /* 버튼을 라운드 처리 */
		margin-right: 5px; /* 버튼 사이의 수평 간격 조절 */
	}

.button2 input[type="submit"]:hover {
		background-color: red;
		
	}
	


th, td {
    text-align: center;
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 37px;
    padding-right: 37px;
}

 td a {
		color: black; /* 기본 글자색은 검정색으로 설정 */
	/*	transition: color 0.3s;  글자색 변화에 애니메이션 효과를 주기 위해 transition 속성 추가 */
	}
	
	td a:hover {
	 	text-decoration: none;
		color: lightblue; /* 마우스를 올려놓을 때의 글자색을 연한 파란색으로 설정 */
	}
	
	th.title {
        width: 500px; /* 제목 부분의 너비를 조정하세요 */
    }
    	
	td {
    font-size: 14px; /* 원하는 폰트 크기로 조정해주세요 */
  }
  
 

</style>

<style>
	#bbs table {
		width: 580px;
		margin-left: 10px;
		border-collapse: collapse;
		font-size: 14px;
		
	}
	#bbs table caption {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	#bbs th, #bbs td {
		border: 1px solid black;
		padding: 4px 10px;
		text-align: center;
	}
	#bbs .align-left { 
	text-align: left; 
	}
	
	#bbs td a {
		color: black; /* 기본 글자색은 검정색으로 설정 */
		transition: color 0.3s; /* 글자색 변화에 애니메이션 효과를 주기 위해 transition 속성 추가 */
	}
	
	#bbs td a:hover {
		color: #1f4e2b; /* 마우스를 올려놓을 때의 글자색을 연한 파란색으로 설정 */
	}
	
	/*.title { background-color: lightsteelblue; } */
	
	.no { width: 10%; }
	.writer { width: 15%; }
	.regdate { width: 20%; }
	.hit { width: 15%; }
	
	/*** 페이지 표시 영역 스타일(시작) ***/
	.paging { 
	margin-top: 20px; /* 위 여백 추가 */
	list-style: none; 
	}
	.paging li {
		float: left;
		margin-right: 8px;
		font-size: 14px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		/* border: 1px solid #00b3dc; */
		font-weight: bold;
		color: #666666;
		font-size: 14px;
	}
	.paging .disable {
	
	/*	border: 1px solid silver; */
		padding: 3px 7px;
		color: silver;
		font-size: 14px;
	}
	.paging .now {
		/* border: 1px solid #ff4aa5; */
		border-bottom: 2px solid #000000;
		padding: 3px 7px;
		font-weight: bold;
		font-size: 14px;
		/* background-color: #000000; */
		/* #ff4aa5 */
	}
	/*** 페이지 표시 영역 스타일(끝) ***/
</style>

<script>
	function checkAll() {
		var checkboxes = document.getElementsByName('selectedItems');
		var checkAllCheckbox = document.getElementById('checkAllCheckbox');

		for (var i = 0; i < checkboxes.length; i++) {
			checkboxes[i].checked = checkAllCheckbox.checked;
		}
	}
</script>

</head>

<body>


<br></br>

<div class="center-heading">
<h3>공지사항</h3>
<h5>알라딩의 새로운 소식과 공지사항을 알려드립니다.</h5>
</div>
<hr>

	<form id="deleteForm" action="noticedeleteall" method="post">
	
	<div style="display: flex; justify-content: center;">
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" id="checkAllCheckbox"
						onclick="checkAll()"></th>
					<th>번호</th>
					<th>구분</th>
					<th class="title">제목</th> <!-- "title" 클래스 추가 -->
					<th>작성일</th>
				</tr>
	
			<c:forEach var="vo" items="${list}"> 

			<tr>
				<td><input type="checkbox" name="selectedItems" value="${vo.nbIdx}"></td>
				<td>${vo.rnum}</td>
				<td>${vo.type}</td>
				<td align="left"><a href="noticeread?nbIdx=${vo.nbIdx }">${vo.title }</a></td>
				<td>${vo.createDat.substring(0, 10)}</td>
			</tr>

		</c:forEach>
			</thead>
		</table>
		</div>
		
		<!-- 페이징 처리 -->
		  <div style="display: flex; justify-content: center;">
		  <tfoot>
			<tr>
				<td colspan="4">
					<ol class="paging">
					<%--[이전페이지이동]에 대한 사용여부 처리 --%>
									<c:if test="${pvo.beginPage == 1 }">
						<li class="disable"><<</li>
					</c:if>
					<c:if test="${pvo.beginPage != 1 }">
						<li>
							<a href="noticeboarduser?cPage=${pvo.beginPage - 1 }"><<</a>
						</li>
					</c:if>	
					
					<%--[이전으로]에 대한 사용여부 처리 --%>
					<c:if test="${cPage == 1 || cPage == null}">
						<li class="disable"><</li>
					</c:if>
					<c:if test="${cPage != 1 && cPage != null}">
						<li>
							<a href="noticeboarduser?cPage=${cPage - 1 }"><</a>
						</li>
					</c:if>	
					
					<%--블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>
					<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
					<c:if test="${pageNo == pvo.nowPage }">
						<li class="now">${pageNo}</li>
					</c:if>	
					<c:if test="${pageNo != pvo.nowPage }">
						<li>
							<a href="noticeboarduser?cPage=${pageNo }&size=${size}">${pageNo }</a>
						</li>
					</c:if>		
						
					</c:forEach>
					
					<%--[다음으로]에 대한 사용여부 처리 --%>
					<c:if test="${cPage == pvo.totalPage}">
						<li class="disable">></li>
					</c:if>
					<c:if test="${cPage != pvo.totalPage}">
						<li>
							<a href="noticeboarduser?cPage=${cPage + 1 }&size=${size}">></a>
						</li>
					</c:if>	
					
					<%--[다음페이지이동]에 대한 사용여부 처리 --%>
					<c:if test="${pvo.endPage >= pvo.totalPage }">
						<li class="disable">>></li>
					</c:if>
					<c:if test="${pvo.endPage < pvo.totalPage }">
						<li>
							<a href="noticeboarduser?cPage=${pvo.endPage + 1 }&size=${size}">>></a>
						</li>
					</c:if>		 
					</ol>
				
				</td>

			</tr>
		</tfoot>
		</div>
	</form>

	

	<script>
		document.getElementById('deleteForm').addEventListener(
				'submit',
				function(e) {
					e.preventDefault(); // 기본적인 form 전송 동작 취소

					var checkboxes = document
							.getElementsByName('selectedItems');
					var selectedItems = [];

					for (var i = 0; i < checkboxes.length; i++) {
						if (checkboxes[i].checked) {
							selectedItems.push(checkboxes[i].value);
						}
					}

					var confirmed = confirm('선택된 게시글을 삭제하시겠습니까?');

					if (confirmed) {

						// 선택된 값들을 서버로 전송
						// AJAX 또는 다른 방식을 사용하여 서버로 전송하는 로직을 구현

						// 예시: AJAX를 사용한 전송
						var xhr = new XMLHttpRequest();
						xhr.open('POST', 'noticedeleteall', true);
						xhr
								.setRequestHeader('Content-Type',
										'application/json');
						xhr.onreadystatechange = function() {
							if (xhr.readyState === 4 && xhr.status === 200) {
								// 서버로부터 응답을 받았을 때의 동작
								console.log(xhr.responseText);
							}
						};

						xhr.send(JSON.stringify(selectedItems));
					}
				});

		document.getElementById('deleteButton').addEventListener('click',
				function() {
					var confirmed = confirm('선택된 게시글을 삭제하시겠습니까?');
					if (confirmed) {
					    document.getElementById('deleteForm').submit();
					  }
				});
	</script>
</body>
</html>
