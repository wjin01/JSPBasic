<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String[] inter = request.getParameterValues("inter");
	String major = request.getParameter("major");
	String regdate = request.getParameter("regdate");
	String region = request.getParameter("region");
	String introduce = request.getParameter("introduce");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>넘어온 데이터</h3>
	관심분야: <%=Arrays.toString(inter) %><br>
	전공분야: <%=major %><br>
	입사일: <%=regdate %><br>
	지역: <%=region %><br>
	자기소개: <%=introduce %><br>
</body>
</html>