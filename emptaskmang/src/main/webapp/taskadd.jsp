<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Task Assigned Successfully</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .success-message {
            color: #4CAF50;
            background-color: #e7f3e3;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #4CAF50;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="success-message">
            <h2>Task Assigned Successfully!</h2>
            <p>The task has been successfully assigned to the employee.</p>
            <a href="index.jsp"><button>Go Back</button></a>
            <a href="employeetask.jsp"><button>Show assigned Employee with tasks</button></a>
        </div>
    </div>
</body>
</html>
