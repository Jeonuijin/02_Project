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
	alert("수정 완료.\n마이페이지로 이동합니다.");
	location.href="06_myPage.jsp";
</script>
<%
	}
%>