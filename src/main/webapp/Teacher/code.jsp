<%--
  Created by IntelliJ IDEA.
  User: CONG THANH
  Date: 12/8/2024
  Time: 10:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> Nhận mã bài thi </title>
  <style>

    body {
      margin: 0;
      padding: 0;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #eafaf1;
      font-family: Arial, sans-serif;
    }


    .card {
      width: 300px;
      height: 100px;
      background-color: #4caf50;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      padding: 20px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      align-items: center;
      color: white;
    }


    .code-container {
      background-color: #2e7d32;
      padding: 10px;
      border-radius: 5px;
      font-family: monospace;
      font-size: 30px;
      width: 100%;
      color: #dcedc8;
      text-align: center;
    }
    .btn-copy {
      margin-top: 10px;
      background-color: #81c784;
      border: none;
      color: white;
      padding: 10px 20px;
      border-radius: 5px;
      font-size: 14px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .btn-copy:hover {
      background-color: #66bb6a;
    }
  </style>
</head>
<body>
<%
  String code = (String) request.getAttribute("code");
%>
<div class="card">
  <div class="code-container" id="codeContainer">
    <%= code != null ? code : ""%>
  </div>
  <button class="btn-copy" id="copyButton">Sao chép</button>
</div>

<script>
  const copyButton = document.getElementById("copyButton");
  const codeContainer = document.getElementById("codeContainer");

  copyButton.addEventListener("click", () => {
    const codeText = codeContainer.innerText;
    navigator.clipboard.writeText(codeText)
            .then(() => {
              alert("Code copied to clipboard!");
            })
            .catch(err => {
              console.error("Failed to copy: ", err);
            });
  });
</script>
</body>
</html>
