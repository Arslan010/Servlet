package edu.jsp.emptaskmang.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jspemptaskmanag.controller.Controller;

@WebServlet(name = "eDelete" , urlPatterns = {"/empDelete"})
public class EmpDelete extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Controller controller =new Controller();
		int id= Integer.parseInt(req.getParameter("eid"));
		controller.removeEmployee(id);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/empGetAll.jsp");
		dispatcher.forward(req, resp);
	}
}
