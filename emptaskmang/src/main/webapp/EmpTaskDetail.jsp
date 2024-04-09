<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="edu.jspemptaskmanag.model.Employee" %>
<%@ page import="edu.jspemptaskmanag.model.Task" %>
<%@ page import="edu.jspemptaskmanag.controller.Controller" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee and Task Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }

    h1 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    .container {
        max-width: 800px;
        margin: 0 auto;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        border: 1px solid #dddddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Employee and Task Details</h1>
        
        <h2>Employees</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Salary</th>
                    <th>Date of Join</th>
                </tr>
            </thead>
            <tbody> 
                <% 
                Controller controller = new Controller();
                Employee employee = controller.searchEmployee(Integer.parseInt(request.getParameter("id")) );
                %>
                <tr>
                    <td><%= employee.getId() %></td>
                    <td><%= employee.getName() %></td>
                    <td><%= employee.getAge() %></td>
                    <td><%= employee.getSalary() %></td>
                    <td><%= employee.getDateOfJoin() %></td>
                </tr>
            </tbody>
        </table>
        
        <h2>Tasks</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Start Date</th>
                    <th>Deadline</th>
                </tr>
            </thead>
            <tbody>
                <% 
                Task tasks = controller.searchTask(employee.getTasks());
               %>
                <tr>
                    <td><%= task.getId() %></td>
                    <td><%= task.getName() %></td>
                    <td><%= task.getStartDate() %></td>
                    <td><%= task.getDeadLine() %></td>
                    <td>
                        <% List<Employee> taskEmployees = task.getEmployees();
                        if (!taskEmployees.isEmpty()) {
                            for (Employee employee : taskEmployees) { %>
                                <%= employee.getName() %><br>
                        <%      }
                        } else { %>
                            No assigned employees
                        <% } %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
