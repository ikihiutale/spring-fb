package com.foo.dao;

import java.util.List;

import com.foo.model.Employee;

public interface EmployeeDao {

	Employee findById(int id);

	void saveEmployee(Employee employee);
	
	void deleteEmployeeBySsn(String ssn);
	
	List<Employee> findAllEmployees();

	Employee findEmployeeBySsn(String ssn);

	Employee findEmployeeBySsn2(String ssn);
}
