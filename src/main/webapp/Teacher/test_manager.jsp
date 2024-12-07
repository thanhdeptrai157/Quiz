<%--
  Created by IntelliJ IDEA.
  User: CONG THANH
  Date: 12/7/2024
  Time: 10:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản Lý Bài Thi</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: Arial, sans-serif;
    }
    body {
      display: flex;
      height: 100vh;
      flex-direction: column;
    }
    .sidebar {
      position: fixed;
      height: 100%;
      width: 250px;
      background-color: #2c3e50;
      color: white;
      display: flex;
      flex-direction: column;
      padding: 20px;
    }
    .sidebar h1 {
      margin-bottom: 20px;
      font-size: 18px;
      text-align: center;
    }
    .sidebar button {
      padding: 10px;
      margin: 10px 0;
      background-color: #3498db;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    .sidebar button:hover {
      background-color: #2980b9;
    }

    .header {
      position: fixed;
      background-color: #ecf0f1;
      padding: 15px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-bottom: 1px solid #bdc3c7;
      width: 100%;
    }
    .header .user-info {
      display: flex;
      align-items: center;
    }
    .header .user-info span {
      margin-right: 15px;
      font-size: 14px;
    }
    .header .user-info button {
      padding: 5px 10px;
      background-color: #e74c3c;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    .header .user-info button:hover {
      background-color: #c0392b;
    }

    .main {
      margin-top: 50px;
      display: flex;
      flex: 1;
    }

    .content {

      flex: 1;
      margin-left: 250px;
      padding: 20px;
      overflow-y: auto;
      background-color: #f4f6f7;
      margin-top: 15px;
    }
    .card {
      background-color: white;
      margin-bottom: 20px;
      padding: 15px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    .card h3 {
      margin-bottom: 10px;
      font-size: 16px;
      color: #2c3e50;
    }
    .card p {
      margin: 5px 0;
      font-size: 14px;
      color: #7f8c8d;
    }
  </style>
</head>
<body>
<div class="header">
  <div class="title">
    <h2>Danh Sách Bài Thi</h2>
  </div>
  <div class="user-info">
    <span>Tên User</span>
    <button>Đăng Xuất</button>
  </div>
</div>
<div class="sidebar">
  <h1>Quản Lý Bài Thi</h1>
  <button>Thêm Bài Thi</button>
</div>
<div class="main">


  <div class="content">
    <div class="card">
      <h3>Bài Thi 1</h3>
      <p>Số Câu Hỏi: 20</p>
      <p>Số Người Tham Gia: 50</p>
      <p>Số Lượt Tham Gia: 120</p>
    </div>

    <div class="card">
      <h3>Bài Thi 2</h3>
      <p>Số Câu Hỏi: 15</p>
      <p>Số Người Tham Gia: 30</p>
      <p>Số Lượt Tham Gia: 60</p>
    </div>
    <div class="card">
      <h3>Bài Thi 2</h3>
      <p>Số Câu Hỏi: 15</p>
      <p>Số Người Tham Gia: 30</p>
      <p>Số Lượt Tham Gia: 60</p>
    </div>
    <div class="card">
      <h3>Bài Thi 2</h3>
      <p>Số Câu Hỏi: 15</p>
      <p>Số Người Tham Gia: 30</p>
      <p>Số Lượt Tham Gia: 60</p>
    </div>
    <div class="card">
      <h3>Bài Thi 2</h3>
      <p>Số Câu Hỏi: 15</p>
      <p>Số Người Tham Gia: 30</p>
      <p>Số Lượt Tham Gia: 60</p>
    </div>
    <div class="card">
      <h3>Bài Thi 2</h3>
      <p>Số Câu Hỏi: 15</p>
      <p>Số Người Tham Gia: 30</p>
      <p>Số Lượt Tham Gia: 60</p>
    </div>
    <div class="card">
      <h3>Bài Thi 2</h3>
      <p>Số Câu Hỏi: 15</p>
      <p>Số Người Tham Gia: 30</p>
      <p>Số Lượt Tham Gia: 60</p>
    </div>
    <div class="card">
      <h3>Bài Thi 2</h3>
      <p>Số Câu Hỏi: 15</p>
      <p>Số Người Tham Gia: 30</p>
      <p>Số Lượt Tham Gia: 60</p>
    </div>
    <div class="card">
      <h3>Bài Thi 2</h3>
      <p>Số Câu Hỏi: 15</p>
      <p>Số Người Tham Gia: 30</p>
      <p>Số Lượt Tham Gia: 60</p>
    </div>

    <!-- Thêm nhiều card tương tự tại đây -->
  </div>
</div>
</body>
</html>
