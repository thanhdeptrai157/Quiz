<%@ page import="Model.Bean.*" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Teacher</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
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


        .form-container {
            background-color: #ffffff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .form-container h1 {
            text-align: center;
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            color: #555;
            font-weight:700;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            outline: none;
        }

        .form-group input:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.2);
        }

        .form-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .form-actions button {
            padding: 10px 15px;
            font-size: 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-actions .add-btn {
            background-color: #0e62bb;
            color: #ffffff;
        }

        .form-actions .add-btn:hover {
            opacity: 0.6;
        }

        .form-actions .cancel-btn {
            background-color: #dc3545;
            color: #ffffff;
        }

        .form-actions .cancel-btn:hover {
            background-color: #c82333;
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

    <div class="form-container">
        <h1>Add Teacher</h1>
        <form action="${pageContext.request.contextPath}/admin?action=add" method="POST" accept-charset="UTF-8">
            <div class="form-group">
                 <label for="name">Name</label>
                 <input type="text" id="name" name="name" placeholder="Enter teacher's name" required>
            </div>

            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter teacher's username" required>
            </div>



            <div class="form-actions">
                <button type="submit" class="add-btn">Add Teacher</button>
                <button type="button" class="cancel-btn" onclick="window.history.back();">Cancel</button>
            </div>
        </form>
    </div>
</body>
</html>
