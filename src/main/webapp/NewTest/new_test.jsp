
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="main">
    <div class="header">
        <span>0 câu hỏi</span>
        <button class="btn_add">Thêm câu hỏi</button>
    </div>
    <form action="../test?action=add" method="post">
        <span>Tên bài kiểm tra</span>
        <input type="text" name="nameTest">
        <div class="list_question">

        </div>
        <input type="submit" value="Submit">
    </form>
</div>

<div class="popup">
    <div class="popup-content">
        <h3>Nhập câu hỏi và câu trả lời</h3>
        <textarea type="text" id="question_input" placeholder="Nhập câu hỏi..." ></textarea>
        <label for="answer1">Câu trả lời 1:</label>
        <input type="text" id="answer1" placeholder="Nhập câu trả lời 1">
        <label for="answer2">Câu trả lời 2:</label>
        <input type="text" id="answer2" placeholder="Nhập câu trả lời 2">
        <label for="answer3">Câu trả lời 3:</label>
        <input type="text" id="answer3" placeholder="Nhập câu trả lời 3">
        <label for="answer4">Câu trả lời 4:</label>
        <input type="text" id="answer4" placeholder="Nhập câu trả lời 4">
        <label for="correct_answer">Chọn đáp án đúng:</label>
        <select id="correct_answer">
            <option value="1">Câu trả lời 1</option>
            <option value="2">Câu trả lời 2</option>
            <option value="3">Câu trả lời 3</option>
            <option value="4">Câu trả lời 4</option>
        </select>
        <button id="add_question">Thêm câu hỏi</button>
    </div>
</div>


</body>

<script src="main.js"></script>
</html>
