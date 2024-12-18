<%@ page import="Model.Bean.HistoryStudent" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: giapwibu
  Date: 12/8/24
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lịch sử làm bài</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .history-item {
            margin-bottom: 20px;
            padding: 15px;
            border-bottom: 1px solid #ddd;
        }

        .history-item:last-child {
            border-bottom: none;
        }

        .history-item p {
            margin: 5px 0;
        }

        .history-item p strong {
            color: #333;
        }

        .back-button {
            display: block;
            margin: 20px 0;
            padding: 10px 15px;
            font-size: 16px;
            color: #ffffff;
            background-color: #007bff;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <%
        List<HistoryStudent> listHistoryStudent = (List<HistoryStudent>) request.getAttribute("listHistoryStudent");
        for(HistoryStudent historyStudent : listHistoryStudent){
    %>
    <div class="history-item">
        <p><strong>Tên học sinh:</strong> <%=historyStudent.getNameStudent()%></p>
        <p><strong>Mã số học sinh:</strong> <%=historyStudent.getIdStudent()%></p>
        <p><strong>Tên bài thi:</strong> <%=historyStudent.getNameTest()%></p>
        <p><strong>Số câu đúng:</strong> <%=historyStudent.getNumOfCorrectAnswer()%></p>
        <p><strong>Tổng số câu hỏi:</strong> <%=historyStudent.getNumOfQuestion()%></p>
        <p><strong>Thời gian hoàn thành:</strong> <%=historyStudent.getTimeFinish()%></p>
    </div>
    <%}%>
    <a href="javascript:history.back()" class="back-button">Back</a>
</div>
</body>
</html>
