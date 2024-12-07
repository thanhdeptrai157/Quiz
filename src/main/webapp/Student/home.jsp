<%--
  Created by IntelliJ IDEA.
  User: CONG THANH
  Date: 12/7/2024
  Time: 3:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
    *{
        padding: 0;
        margin: 0;
    }
    header{
        width: 100%;
        height: 50px;
        background-color: black;
        position: fixed;
        top:0;
        color: white;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .main{
        height: 100vh;
        background-color: #f0f0f0;
        padding: 20px 150px;

    }
    .main_content{

        height: 100vh;
    }
    .join{
        width: 100%;
        height: 200px;

        margin-top: 50px;
        display: flex;
        align-items: center;
        justify-content: space-between;


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
        background-color: #921a66;
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
    .input_zone{
        display: flex;
        align-items: center;
        justify-content: center;
        width: 60%;
        background-color: white;
        height: inherit;
        border-radius: 10px;
        box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
    }
    .welcome{
        background-color: white;
        width: 30%;
        height: inherit;
        box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
    }
    .test_zone{
        margin-top: 50px;
    }
</style>
<body>
<header>
    <div>
        Quizziz
    </div>
    <div>
        <span>Name user</span>
        <a href="">Đăng xuất</a>
    </div>
</header>
<section class="main">
    <div class="main_content">
        <div class="join" >
            <div class="input_zone">
                <form action="test?action=getQuestion" method="post" class="code_input">
                    <div class="input_container">
                        <input type="text" placeholder="Nhập mã tham gia" name="idTest">
                        <button class="btn_join" type="submit">Tham gia</button>
                    </div>
                </form>
            </div>
            <div class="welcome">
                <span>Chào mừng Nguyễn Công Thành</span><br>
                <img src="hehe.png" alt="" width="50%">
            </div>
        </div>
        <div class="test_zone">
            <h2>Danh sách bài kiểm tra</h2>
            <div class="test_list">
                <form action="">

                </form>
            </div>
        </div>
    </div>
</section>
</body>
</html>