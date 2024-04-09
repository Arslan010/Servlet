package edu.jsp.emptaskmang.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jspemptaskmanag.controller.Controller;

@WebServlet("/taskDelete")
public class TaskDelete extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve task ID from request parameter
        String taskIdString = req.getParameter("tid");

        // Check if task ID parameter is not null and is a valid number
        if (taskIdString != null && taskIdString.matches("\\d+")) {
            int taskId = Integer.parseInt(taskIdString);

            // Create an instance of the Controller class
            Controller controller = new Controller();

            // Remove the task using the Controller
            controller.removeTask(taskId);
        }

        // Forward the request to taskGetAll.jsp to display updated tasks
        RequestDispatcher dispatcher = req.getRequestDispatcher("/taskGetAll.jsp");
        dispatcher.forward(req, resp);
    }
}
