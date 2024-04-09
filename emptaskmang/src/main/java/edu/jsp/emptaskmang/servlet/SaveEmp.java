package edu.jsp.emptaskmang.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jspemptaskmanag.controller.Controller;
import edu.jspemptaskmanag.model.Employee;

@WebServlet({"/semp"})
public class SaveEmp extends HttpServlet {
	Controller controller = new Controller();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		Employee employee = new Employee();
		
		employee.setName(req.getParameter("ename"));
		employee.setAge(Integer.parseInt(req.getParameter("eage")));
		employee.setSalary(Integer.parseInt(req.getParameter("esalary")));
		controller.saveEmployee(employee);
		RequestDispatcher dispatcher  = req.getRequestDispatcher("/SetPage.jsp");
		req.setAttribute("name", "Employee");
		dispatcher.forward(req, resp);
	
	}
	

}
