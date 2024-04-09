<!DOCTYPE html>
<%@page import="edu.jspemptaskmanag.model.Task"%>
<%@ page import="edu.jspemptaskmanag.controller.Controller" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Update</title>
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
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-container {
            padding: 20px;
        }

        .details-container {
            padding: 20px;
            margin-top: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        form {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        input[type="text"],
        input[type="submit"] {
            width: calc(100% - 22px); /* Adjusted width */
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #ffffff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
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

        .action-links {
            display: flex;
            justify-content: space-around;
        }

        .delete-button, .update-button {
            padding: 5px 10px;
            text-decoration: none;
            color: #ffffff;
            border-radius: 4px;
            cursor: pointer;
        }

        .delete-button {
            background-color: #f44336;
        }

        .update-button {
            background-color: #4caf50;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Employee Update</h1>

    <div class="form-container">
        <form action="TaskGetId.jsp" method="get">
            <label for="tid" style="width: 40px;">Id:</label> <!-- Adjusted width -->
            <input type="text" id="tid" name="tid" value="<%=request.getParameter("id") != null ? request.getParameter("id") : ""%>">
            <input type="submit" value="Get Details">
        </form>
    </div>

    <div class="details-container">
        <% String Tid = request.getParameter("tid");
        if (Tid!= null && !Tid.isEmpty()) {
            try {
                Controller controller = new Controller();
                Task task = controller.searchTask(Integer.parseInt(Tid));
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
            </tbody>
        </table>

        <% } catch (NumberFormatException e) { %>
        <% } catch (Exception e) { %>
        <% } } %>
    </div>
</div>

</body>
</html>
