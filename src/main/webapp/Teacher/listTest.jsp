<%@ page import="Model.Bean.*" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>danh sách bài kiểm tra</title>

    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h1 {
            font-size: 28px;
            color: #007bff;
        }

        .test-item {
            margin-bottom: 20px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            border: 1px solid #ddd;
            transition: box-shadow 0.3s ease;
        }

        .test-item:hover {
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .test-item p {
            margin: 8px 0;
            font-size: 16px;
        }

        .test-item p strong {
            color: #007bff;
        }

        .not-found {
            text-align: center;
            color: #ff4d4d;
            font-size: 18px;
            margin: 20px 0;
        }

        .back-button {
            display: inline-block;
            margin: 20px auto;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            color: #ffffff;
            background-color: #007bff;
            border: none;
            border-radius: 25px;
            text-align: center;
            text-decoration: none;
            box-shadow: 0 4px 10px rgba(0, 123, 255, 0.2);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .back-button:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 15px rgba(0, 86, 179, 0.3);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>List of Tests</h1>
        </div>

        <% List<TestDetail> listTestDetail = (List<TestDetail>) request.getAttribute("listTestDetail"); %>
        <% if (listTestDetail != null && !listTestDetail.isEmpty()) { %>
            <% for (TestDetail test : listTestDetail) { %>
                <div class="test-item">
                    <p><strong>Mã bài kiểm tra:</strong> <%= test.getIdTestDetail() %></p>
                    <p><strong>Tên bài kiểm tra:</strong> <%= test.getNameTestDetail() %></p>
                    <p><strong>Tên môn học:</strong> <%= test.getNameSubjectDetail() %></p>
                    <p><strong>Loại bài kiểm tra:</strong> <%= test.getTypeTestDetail() %></p>
                   <!-- <p><strong>Mã giáo viên:</strong> <%= test.getIdTeacherDetail() %></p> -->
                    <p><strong>Thời gian bài thi:</strong> <%= test.getTimeDetail() %> minutes</p>
                </div>
            <% } %>
        <% } else { %>
            <div class="not-found">
                <h2>Giáo viên này không có bài test nào:(</h2>
            </div>
        <% } %>

        <a href="javascript:history.back()" class="back-button">Quay lại</a>
    </div>
</body>
</html>
