<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3>경로 공부하기</h3>
	
	<!-- a태그로 jspTag 폴더에 include 페이지로 상대경로, 절대경로 -->
	<a href="../../jspTag/include.jsp">include 상대경로</a>
	<a href="/JSPBasic/jspTag/include.jsp">include 절대경로</a>
	<br>
	
	<!-- MyServlet 맵핑경로는 /JSPBasic/apple 입니다 여기서 상대경로 이동 -->
	<a href="../../apple">MyServlet</a>
	<br>
	
	<!-- html 안에 있는 img 파일을 img 태그 상대경로, 절대경로 -->
	<a href="../../html/img/img1.jpeg">img 파일 상대경로</a>
	<a href="/JSPBasic/html/img/img2.jpeg">img 파일 절대경로</a>
</body>
</html>