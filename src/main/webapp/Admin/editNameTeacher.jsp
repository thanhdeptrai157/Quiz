<%@ page import="Model.Bean.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Teacher Name</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f9;
        }

        header {
                    width: 100%;
                    height: 60px;
                    background-color: #222;
                    color: white;
                    position: fixed;
                    top: 0;
                    left: 0;
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    padding: 0 20px;
                    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                    z-index: 1000;
                }

                header div:first-child {
                    font-size: 1.5em;
                    font-weight: bold;
                }

                header div:last-child {
                    display: flex;
                    align-items: center;
                }

                header div:last-child span {
                    margin-right: 15px;
                    font-weight: 500;
                    font-size: 1em;
                    color: #e9ecef;
                }

                header div:last-child a {
                    background: #dc3545;
                    color: white;
                    padding: 8px 12px;
                    border-radius: 5px;
                    font-size: 0.9em;
                    text-decoration: none;
                    transition: background-color 0.3s, transform 0.2s;
                    margin-right: 30px;
                }

                header div:last-child a:hover {
                    background: #c82333;
                    transform: scale(1.05);
                }


        .container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            text-align: center;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333333;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333333;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .confirm {
            background-color: #0e62bb;
            color: white;
        }

        .confirm:hover {
            opacity: 0.6;
        }

        .cancel {
            background-color: #f44336;
            color: white;
        }

        .cancel:hover {
            background-color: #e53935;
        }
        .error-message {
                    color: #dc3545;
                    font-weight: bold;
                    margin: 10px 0;
                }
    </style>
</head>

<%
    Account account = (Account) request.getSession().getAttribute("account");
    if(account == null){
        response.sendRedirect("../index.jsp");
    }

%>

<body>
<header>
    <div>
        Quizziz
    </div>
    <div>
        <span> <%= account != null ? account.getName() : ""%></span>
        <a href="${pageContext.request.contextPath}/authen?action=logout">Đăng xuất</a>
    </div>
</header>

<% String currentName = (String) request.getAttribute("currentName"); %>

<div class="container">
    <h1>Edit Teacher Name</h1>
    <form action="${pageContext.request.contextPath}/admin?action=edit" method="post" accept-charset="UTF-8">
        <input type="hidden" name="idTeacher" value="<%= request.getParameter("idgv") %>">

        <div class="form-group">
            <label for="nameTeacher">Teacher Name:</label>
            <input type="text" id="nameTeacher" name="nameTeacher" value="<%= currentName %>" required>
        </div>

        <div class="form-buttons">
            <button type="submit" class="confirm">Confirm</button>
            <button type="button" class="cancel" onclick="history.back();">Cancel</button>
        </div>
    </form>
</div>
    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
        <div class="error-message">
            <%= errorMessage %>
        </div>
    <%
        }
    %>

</body>
</html>
