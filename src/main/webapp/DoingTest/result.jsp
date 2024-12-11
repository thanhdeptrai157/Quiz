<%@ page import="Model.Bean.HistoryStudent" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả bài thi</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(135deg, #ff7eb3, #ff758c);
        }
        .result-container {
            text-align: center;
            background: #ffffff;
            border: none;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            padding: 40px 30px;
            border-radius: 15px;
            max-width: 450px;
            width: 100%;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .result-container h1 {
            font-size: 2.5rem;
            color: #ff5e6c;
            margin-bottom: 25px;
        }
        .result-container p {
            font-size: 1.3rem;
            color: #333333;
            margin-bottom: 15px;
        }
        .score {
            font-size: 1.8rem;
            color: #4caf50;
            font-weight: bold;
        }
        .result-container .decorative-line {
            width: 80%;
            height: 3px;
            background: linear-gradient(90deg, #ff758c, #ff7eb3);
            margin: 20px auto;
            border-radius: 5px;
        }
        .home-button {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            font-size: 1rem;
            color: #ffffff;
            background: #ff5e6c;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        .home-button:hover {
            background: #ff758c;
        }
    </style>
</head>
<body>
<%
    HistoryStudent historyStudent = (HistoryStudent) request.getAttribute("historyStudent");


%>
<div class="result-container">
    <h1>Kết quả bài thi</h1>
    <div class="decorative-line"></div>
    <p>Tên: <%=historyStudent.getNameStudent()%></p>
    <p>Tên bài kiểm tra: <%=historyStudent.getNameStudent()%></p>
    <p class="score">Điểm đạt được: <%=historyStudent.getNumOfCorrectAnswer()%>/<%=historyStudent.getNumOfQuestion()%></p>
    <a href="Student/home.jsp" class="home-button">Quay về trang chủ</a>
</div>
</body>
</html>
