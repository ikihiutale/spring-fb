package com.foo.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.foo.model.Employee;

@Repository("employeeDao")
public class EmployeeDaoImpl extends AbstractDao<Integer, Employee> implements EmployeeDao {

	private final Logger LOGGER = LoggerFactory.getLogger(EmployeeDaoImpl.class);

	public Employee findById(int id) {
		return getByKey(id);
	}

	public void saveEmployee(Employee employee) {
		persist(employee);
	}

	public void deleteEmployeeBySsn(String ssn) {
		getSession().createNativeQuery("DELETE FROM Employee WHERE ssn = :ssn", Employee.class)
			.setParameter("ssn", ssn)
			.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public List<Employee> findAllEmployees() {
		LOGGER.debug("*** findAllEmployees..");
		CriteriaBuilder cb = getSession().getCriteriaBuilder();
	    CriteriaQuery<Employee> query = cb.createQuery(Employee.class);
	    Root<Employee> emp = query.from(Employee.class);
	    query.select(emp);
		return getSession().createQuery(query).getResultList();
	}

	public Employee findEmployeeBySsn(String ssn) {
		LOGGER.debug("*** findEmployeeBySsn: {}", ssn);
		CriteriaBuilder cb = getSession().getCriteriaBuilder();
		CriteriaQuery<Employee> query = createEntityCriteriaQuery();
	    Root<Employee> emp = query.from(Employee.class);
	    query.select(emp);
	    query.distinct(true);
	    query.where(cb.like(emp.<String>get("ssn"),
	                            cb.parameter(String.class, "ssn")));
	        		
		TypedQuery<Employee> tq = getSession().createQuery(query);
        tq.setParameter("ssn", ssn);
        return tq.getSingleResult();
	}
}
