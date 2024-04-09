<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Task Update</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        input[type="text"],
        input[type="date"],
        input[type="submit"] {
            width: calc(100% - 22px); /* Adjusted width */
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box; /* Ensure padding is included in the width */
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<form action="taskUpdate" method="post">
    <h1>Task Update</h1>
    <label for="tid">Enter Id:</label>
    <input type="text" name="tid" id="tid" value="<%=request.getParameter("id") != null ? request.getParameter("id") : ""%>">
    <label for="tname">Enter Task Name:</label>
    <input type="text" id="tname" name="tname">
    <label for="tdl">Enter Deadline Date:</label>
    <input type="date" id="tdl" name="tdl">
    <input type="submit" value="Submit">
</form>

</body>
</html>
