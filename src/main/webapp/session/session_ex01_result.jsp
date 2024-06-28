<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1. 아이디, 비밀번호, 닉네임을 파라미터를 받음
	2. 아이디와 비밀번호 같으면 로그인 성공
		닉네임과 id를 저장하는 세션을 생성하고, session_welcome 페이지로 리다이렉트 시킴
		welcome에서는 세션을 이용해서 "id(name) 님 환영합니다" 를 출력
		
	3. welcome 페이지에서는 a태그를 이용해서 로그아웃 기능도 만듬
	*/
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String nick = request.getParameter("nick");
	
	if(id.equals(pw)) {
		session.setAttribute("nick", nick);
		session.setAttribute("id", id);
		response.sendRedirect("session_ex01_welcome.jsp");
		
	} else {
		response.sendRedirect("session_ex01.jsp");
	}
%>
