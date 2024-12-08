<%@ page import="Model.Bean.HistoryStudent" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: giapwibu
  Date: 12/8/24
  Time: 8:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 20px;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        input {
            display: block;
            margin: 10px 0;
            padding: 8px;
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input:focus {
            border-color: #007bff;
            outline: none;
        }

        br {
            margin-bottom: 15px;
        }

    </style>
</head>
<body>

    <h2>History Student</h2>
    <button onclick="goBack()">Quay lại</button>
    <%
        List<HistoryStudent> listStudent = (List<HistoryStudent>)  request.getAttribute("listHistoryStudent");

        for(HistoryStudent historyStudent : listStudent){
    %>

    <input value="<%= historyStudent.getNameStudent()%>">
    <input value="<%= historyStudent.getNumOfCorrectAnswer()%>">
    <input value="<%= historyStudent.getNumOfQuestion()%>">
    <input value="<%= historyStudent.getTimeFinish()%>">
    <br>

    <%}%>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>
