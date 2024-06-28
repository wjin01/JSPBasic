package com.model;

public class DepartmentDTO {
	
	//DTO 또는 VO 클래스는 데이터를 옮기기 위한 클래스로 테이블별로 1개씩 생성함
	//관련 변수를 테이블과 동일한 이름으로 선언하고 getter, setter 메서드를 반드시 생성함

	private int departmentID;
	private String departmentName;
	private int managerId;
	private int locationID;
	
	//생성자는 기본생성자 그리고 멤머변수를 초기화하는 생성자 2개를 만듬
	public DepartmentDTO() {
		
	}

	public DepartmentDTO(int departmentID, String departmentName, int managerId, int locationID) {
		super();
		this.departmentID = departmentID;
		this.departmentName = departmentName;
		this.managerId = managerId;
		this.locationID = locationID;
	}

	//getter, setter
	public int getDepartmentID() {
		return departmentID;
	}

	public void setDepartmentID(int departmentID) {
		this.departmentID = departmentID;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public int getManagerId() {
		return managerId;
	}

	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}

	public int getLocationID() {
		return locationID;
	}

	public void setLocationID(int locationID) {
		this.locationID = locationID;
	}
	
	
}
