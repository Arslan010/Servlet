package edu.jsp.emptaskmang.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jspemptaskmanag.controller.Controller;
import edu.jspemptaskmanag.model.Task;

@WebServlet("/taskUpdate")
public class TaskUpdate extends HttpServlet {

	Controller controller =new Controller();
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Task task = new Task();
		int id = Integer.parseInt(req.getParameter("tid"));
		Task task2= controller.saveTaskValue(id);
		String team = req.getParameter("tname");
		

		String nameParameter = req.getParameter("tname");
		if (nameParameter != null && !nameParameter.isEmpty()) {
		    task.setName(nameParameter);
		} else {
		    task.setName(task2.getName());
		}
		
		String dateParameter = req.getParameter("tdl");
		LocalDate date = null;
		if (dateParameter != null && !dateParameter.isEmpty()) {
		    date = LocalDate.parse(dateParameter);
		}

		if (date != null) {
		    task.setDeadLine(date);
		} else {
		    task.setDeadLine(task2.getDeadLine());
		}

		
		
		controller.updateTask(task,id);
		RequestDispatcher dispatcher  = req.getRequestDispatcher("/taskGetAll.jsp");
		req.setAttribute("name", "Task");
		dispatcher.forward(req, resp);
	}
}
