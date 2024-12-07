<%--
  Created by IntelliJ IDEA.
  User: giapwibu
  Date: 12/7/24
  Time: 9:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 300px;
            box-sizing: border-box;
        }

        form input[type="text"],
        form input[type="datetime-local"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        form button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        form button:hover {
            background-color: #0056b3;
        }

        title {
            text-align: center;
        }

    </style>
</head>
<body>

    <form action="../test?action=addTestTaking" method="post">
        ID Test<input type="text" name="idTest"> <br>
        Time Start<input type="datetime-local" name="timeStart"><br>
        Time End<input type="datetime-local" name="timeEnd"><br>
        <button type="submit">OK</button>
    </form>

</body>
</html>
