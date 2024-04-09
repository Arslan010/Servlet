package edu.jsp.emptaskmang.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jspemptaskmanag.controller.Controller;

@WebServlet("/assignTask")
public class AssignTask extends HttpServlet{
	Controller controller =new Controller();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int eid=Integer.parseInt(req.getParameter("eid"));
		int tid=Integer.parseInt(req.getParameter("tid"));
		controller.assignTask(eid, tid);
		
		req.getRequestDispatcher("/taskadd.jsp").forward(req, resp);
	}
	

}
