package edu.jsp.emptaskmang.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jspemptaskmanag.controller.Controller;
import edu.jspemptaskmanag.model.Task;

@WebServlet("/addTask")
public class AddTask extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Task task = new Task();
		Controller controller = new Controller();
		task.setName(req.getParameter("tname"));
		task.setDeadLine(LocalDate.parse(req.getParameter("tdline")));
		controller.saveTask(task);
		
		req.setAttribute("name", "Task");
		req.getRequestDispatcher("/taskadd.jsp").forward(req, resp);
	}

}
