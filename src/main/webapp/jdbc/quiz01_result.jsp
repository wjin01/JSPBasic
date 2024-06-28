<%@page import="com.model.DepartmentDTO"%>
<%@page import="com.model.DepartmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	/*
	사용자가 적은 부서번호에 정보를 보여주는 프로그램 코드
	
	1. 사용자가 입력한 부서번호를 받습니다.
	2. DepartmentDAO에 부서번호에 따라서 부서정보를 조회하는 메서드를 생성해주세요.
		=> 번호로 조회하기 때문에 부서번호는 반드시 1행 입니다.
		
	3. 부서정보를 조회했다면, 조회한 결과를 quiz_ok로 데이터를 넘겨주세요.
	4. quiz_ok에서는 EL, JSTL을 사용해서, 사용자의 부서정보를 출력해주면 됩니다.
	*/
	
	String dno = request.getParameter("departmentId");
	
	
	DepartmentDAO dao = DepartmentDAO.getInstance(); //DAO생성
	DepartmentDTO dto = dao.getDept(dno); //메서드 호출
		
	//dto를 quiz_ok로 넘긴다.
	request.setAttribute("dto", dto);
	request.getRequestDispatcher("quiz_ok.jsp").forward(request, response);
	
		
	
	
	
	
	
%>