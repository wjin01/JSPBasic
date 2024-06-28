package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DepartmentDAO {

	//DAO는 불필요하게 여러개 만들 필요가 없기 때문에 객체가 1개만 생성되도록 
	//singleton 형식으로 설계
	
	//1. 나 자신의 객체를 1개 생성하고 private을 붙임
	private static DepartmentDAO instance = new DepartmentDAO();
	
	//2. 직접 객체를 생성할 수 없도록 생성자에도 private을 붙임
	private DepartmentDAO() {
		
		//커넥션풀에 사용할 객체를 얻어옴
		try {
			InitialContext init = new InitialContext(); //시작설정 객체
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
			
		} catch (Exception e) {
			System.out.println("커넥션 풀 에러");
		}
	}
	
	//3. 객체 생성을 요구할 때 getter 메서드를 사용해서 1번의 객체를 반환
	public static DepartmentDAO getInstance() {
		return instance;
	}
	
	/////////////////////////////////////////////////////////////////////////
	//필요한 메서드를 생성
	
	//데이터베이스 연결
//	public String url = "jdbc:oracle:thin:@localhost:1521:xe";
//	public String uid = "HR";
//	public String upw = "HR";
	
	//커넥션 풀 객체정보
	private DataSource ds;
	
	
	//부서명을 조회하는 메서드
	public ArrayList<DepartmentDTO> getList() {
		
		ArrayList<DepartmentDTO> list = new ArrayList<>();
		
		
		String sql = "SELECT * FROM DEPARTMENTS WHERE MANAGER_ID IS NOT NULL";
		
		Connection conn = null; //연결 객체
		PreparedStatement pstmt = null; //sql문 실행 객체
		ResultSet rs = null; //결과 처리 객체
		
		try {
			//Class.forName("oracle.jdbc.OracleDriver"); //드라이버 호출
			//conn = DriverManager.getConnection(url, uid, upw); //conn 객체
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(); //select 구문의 실행
			
			while(rs.next()) { //다음이 있으면 true
				
				//1행에 대한 처리
				int departmentId = rs.getInt("department_id"); //컬럼명
				String departmentName = rs.getString("department_name");
				int managerId = rs.getInt("manager_id");
				int locationId = rs.getInt("location_id");
				
				//1행을 DTO에 저장
				DepartmentDTO dto = new DepartmentDTO(departmentId, departmentName, managerId, locationId);
				
				//DTO를 리스트에 추가
				list.add(dto);
				
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (Exception e2) {
				
			}
			
		}
		
		return list;
	}
	

	
	//부서번호를 조회하는 메서드
		public DepartmentDTO getDept(String dno) {
			
			DepartmentDTO dto = null; 
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID = ?";
			
			try {
				
				conn = ds.getConnection(); //conn객체
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dno);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					int deptmartmentId = rs.getInt("department_id"); //컬럼명 
					String departmentName = rs.getString("department_name");
					int managerId = rs.getInt("manager_id");
					int locationId = rs.getInt("location_id");
					
					
					dto = new DepartmentDTO(deptmartmentId, departmentName, managerId, locationId);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(conn != null) conn.close();
					if(pstmt != null) pstmt.close();
					if(rs != null) rs.close();
					
				} catch (Exception e2) {
					
				}
			}
			
			return dto;
		}

	
	
	
}
	

