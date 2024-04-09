<%@page import="edu.jspemptaskmanag.model.Task"%>
<%@page import="java.util.List"%>
<%@page import="edu.jspemptaskmanag.controller.Controller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TASK List</title>
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
            background-color: #e5ffe5; /* Light green */
            border: 2px solid #4CAF50; /* Border color */
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

        tr:hover {
            background-color: #f9f9f9;
        }

        a {
            text-decoration: none;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #0056b3;
        }

        .action-links a {
            margin-right: 10px;
        }

        /* Button Styles */
        .delete-button {
            padding: 8px 16px;
            background-color: #dc3545; /* Red */
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .delete-button:hover {
            background-color: #c82333; /* Darker red */
        }

        .delete-button:active {
            background-color: #bd2130; /* Even darker red */
        }

        .update-button {
            padding: 8px 16px;
            background-color: #17a2b8; /* Teal */
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .update-button:hover {
            background-color: #138496; /* Darker teal */
        }

        .update-button:active {
            background-color: #117a8b; /* Even darker teal */
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Task List</h1>
    <% 
        Controller controller = new Controller();
        List<Task> tasks = controller.getAllTask();
    %>

    <table>
        <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Date of Start</th>
                    <th>Date of DeadLine</th>
                    <th>Action</th>
                </tr>
            </thead>
        <tbody>
            <% for(Task task : tasks) { %>
              <tr>
                    <td><%= task.getId() %></td>
                    <td><%= task.getName() %></td>
                    <td><%= task.getStartDate() %></td>
                    <td><%= task.getDeadLine() %></td>
                    <td class="action-links">
                        <a class="delete-button" href="TaskDelete.jsp?id=<%= task.getId() %>">Delete</a>
                        <a class="update-button" href="Taskupdate.jsp?id=<%= task.getId() %>">Update</a>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

</body>
</html>
