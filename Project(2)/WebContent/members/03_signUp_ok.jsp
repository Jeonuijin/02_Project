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
%>
<script>
	alert("회원가입 완료. 로그인 후 이용해주세요.");
	location.href="02_login.jsp";
</script>
<%
	}
%>