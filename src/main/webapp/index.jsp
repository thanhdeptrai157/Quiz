<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiziz</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body {
            overflow: hidden;
        }
        header {
            position: fixed;
            top: 0;
            width: 100%;
            height: 60px;
            background: rgba(0, 0, 0, 0.7);
            display: flex;
            align-items: center;
            padding: 0 20px;
            color: white;
            font-weight: 600;
            font-size: 18px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
            display: flex;
            justify-content: space-between;
        }
        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            height: 50px;
            background-color: #000;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
        }
        .main {
            background: linear-gradient(135deg, #1e88e5, #1c6eb9);
            height: 100vh;
            display: flex;
            justify-content: center;
            padding-top: 60px;
        }
        .code_input {
            text-align: center;
            margin-top: 100px;
        }
        h1 {
            font-size: 80px;
            color: white;
            text-shadow: 2px 4px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
        }
        .input_container {
            background-color: #ffffff;
            padding: 15px;
            border-radius: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: 0 auto;
        }
        input {
            border: none;
            outline: none;
            font-size: 16px;
            flex: 1;
            padding: 10px;
            margin-right: 10px;
        }
        input::placeholder {
            color: #aaa;
            font-size: 14px;
        }
        .btn_join {
            background-color: #35a84c;
            color: white;
            border: none;
            outline: none;
            padding: 10px 20px;
            border-radius: 10px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .btn_join:hover {
            background-color: #2a863d;
        }
        a{
            padding: 10px;
            background: #1e88e5;
            color: white;
            text-decoration: none;
            border-radius: 10px;
        }
    </style>
</head>
<body>
<header>
    <div>
        Quiziz - Tham gia thi trắc nghiệm
    </div>
    <div>
        <a href="Login/login.jsp">Đăng nhập</a>
        <a href="Signup/signup.jsp">Đăng ký</a>
    </div>
</header>
<section class="main">
    <form action="test?action=getQuestion" method="post" class="code_input">
        <h1>Quiziz</h1>
        <div class="input_container">
            <input type="text" placeholder="Nhập mã tham gia" name="idTest">
            <button class="btn_join" type="submit">Tham gia</button>
        </div>
    </form>
</section>
<footer>

</footer>
</body>
</html>
