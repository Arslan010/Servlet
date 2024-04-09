package edu.jsp.emptaskmang.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jspemptaskmanag.controller.Controller;
import edu.jspemptaskmanag.model.Employee;

@WebServlet("/empUpdate")
public class EmployeeUpdate extends HttpServlet {
	
	Controller controller = new Controller();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		Employee employee = new Employee();
		int id = Integer.parseInt(req.getParameter("eid"));
		Employee employee2= controller.saveValue(id);
		String ageParameter = req.getParameter("eage");
		if (ageParameter != null && !ageParameter.isEmpty()) {
		    employee.setAge(Integer.parseInt(ageParameter));
		} else {
		     employee.setAge(employee2.getAge());
		}

		String salaryParameter = req.getParameter("esalary");
		if (salaryParameter != null && !salaryParameter.isEmpty()) {
		    employee.setSalary(Integer.parseInt(salaryParameter));
		} else {
		    employee.setSalary(employee2.getSalary());
		}

		String nameParameter = req.getParameter("ename");
		if (nameParameter != null && !nameParameter.isEmpty()) {
		    employee.setName(nameParameter);
		} else {
		    employee.setName(employee2.getName());
		}

		
		
		controller.updateEmployee(employee,id);
		RequestDispatcher dispatcher  = req.getRequestDispatcher("/empGetAll.jsp");
		req.setAttribute("name", "Employee");
		dispatcher.forward(req, resp);
	
	}
}
