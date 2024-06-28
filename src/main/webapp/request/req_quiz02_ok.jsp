<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String height = request.getParameter("height");
	String weight = request.getParameter("weight");
	double cm = Double.parseDouble(height);
	double kg = Double.parseDouble(weight);
	double BMI = cm / (cm/100) * (cm/100);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3>넘어온 데이터</h3>
	이름: <%=name %>
	신장: <%=height %>
	몸무게: <%=weight %>
	BMI: 
	<% if(BMI >=25) { %>
	 	과체중
	<% }else if(BMI <= 18) {%> 
		저체중
	<% }else { %>
		정상
	<% } %>
</body>
</html>