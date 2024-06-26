<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	앞에서 넘어온 폼값을 받아서 평균을 구합니다.
	평균이 60점 이상이면 score_ok으로 이동해서
		~~님 평균은 xx점 합격입니다 를 출력
	평균이 60점 이하라면 score_no으로 이동해서
		~~님 평균은 xx점 불합격입니다 를 출력
		
	조건: 세션을 사용하지 않습니다.		
	*/
	String name = request.getParameter("name");
	String kr = request.getParameter("kr");
	String en = request.getParameter("en");
	String mt = request.getParameter("mt");
	
	double score = (Integer.parseInt(kr) + Integer.parseInt(en) + Integer.parseInt(mt)) / 3;
	
	request.setAttribute("name", name);
	request.setAttribute("score", score);
	
	RequestDispatcher dp;
	if(score >= 60) {
		dp = request.getRequestDispatcher("score_ok.jsp"); //이동할 url주소
	} else {
		dp = request.getRequestDispatcher("score_no.jsp"); //이동할 url주소
	}
	dp.forward(request, response);
%>

