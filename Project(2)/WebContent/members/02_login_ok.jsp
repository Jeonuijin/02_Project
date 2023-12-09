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
	alert("로그인 성공!" + "\n좋은 하루 되세요.");
	location.href = "../user/main.jsp";
</script>
<%
	}
%>