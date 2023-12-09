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
		session.invalidate();
%>
<script>
	alert("회원탈퇴 완료.\n메인페이지로 이동합니다.");
	location.href="../user/main.jsp";
</script>
<%
	}
%>