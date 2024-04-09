<%@page import="edu.jspemptaskmanag.model.Task"%>
<%@page import="edu.jspemptaskmanag.model.Employee"%>
<%@page import="java.util.List"%>
<%@page import="edu.jspemptaskmanag.controller.Controller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border: 2px solid #4CAF50;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            border-right: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f0f0f0;
        }

        .action-links a {
            margin-right: 10px;
        }

        /* Button Styles */
        .delete-button, .update-button {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .delete-button {
            background-color: #dc3545; /* Red */
            color: #fff;
        }

        .update-button {
            background-color: #17a2b8; /* Teal */
            color: #fff;
        }

        .delete-button:hover, .update-button:hover {
            filter: brightness(90%);
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Employee List</h1>
    <% 
        Controller controller = new Controller();
        List<Employee> employees = controller.getAllEmployee();
    %>

    <table>
        <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Salary</th>
                <th>Age</th>
                <th>Date of Join</th>
                <th>Assigned Tasks</th>

            </tr>
        </thead>
        <tbody>
            <% for(Employee employee : employees) { %>
            <tr>
                <td><%= employee.getId() %></td>
                <td><%= employee.getName() %></td>
                <td><%= employee.getSalary() %></td>
                <td><%= employee.getAge() %></td>
                <td><%= employee.getDateOfJoin() %></td>
                <td>
                    <% 
                        List<Task> tasks = controller.getTasksByEmployeeId(employee.getId());
                        if(tasks != null && !tasks.isEmpty()) {
                            for(Task task : tasks) {
                    %>
                            <%= task.getName() %><br>
                    <%      }
                        } else {
                    %>
                            No tasks assigned
                    <%  } %>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

</body>
</html>
