<%@page import="com.project.model.vo.MembersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	if (request.getAttribute("error") != null) {
%>
<script>
	alert("<%= request.getAttribute("error") %>");
	window.history.back();
</script>
<%
	} else {
		MembersVO vo = (MembersVO) request.getAttribute("vo");
%>
<script>
	alert("입력하신 정보에 해당하는 아이디의 비밀번호는 <%= vo.getMemPw() %> 입니다.\n로그인 페이지로 이동합니다.");
	location.href="02_login.jsp";
</script>
<%
	}
%>