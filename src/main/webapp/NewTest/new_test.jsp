<%@ page import="Model.Bean.Subject" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/NewTest/style.css">

</head>
<body>
<div>
    <button class="back" onclick="history.back()">Quay lại</button>
</div>
<div class="main">
    <form action="test?action=add" method="post">

        <div class="infor_test">
            <label for="nameTest">Tên bài test:</label>
            <input type="text" name="nameTest" id="nameTest" required><br>
            <div class="test_details">
                <div>
                    <label for="timeTest">Thời gian (phút):</label>
                    <input type="number" name="timeTest" id="timeTest" required>
                </div>

                <div>
                    <label for="option">Kiểu test:</label>
                    <select name="option" id="option">
                        <option value="0">Công khai</option>
                        <option value="1">Đóng</option>
                    </select>
                </div>

            </div>
            <div>
                <select name="idSubject">
                    <%
                        List<Subject> listSubject = (List<Subject>) request.getAttribute("listSubject");
                        for(Subject subject : listSubject){
                    %>
                    <option value="<%=subject.getIdSubject()%>"><%=subject.getNameSubject()%></option>
                    <%}%>

                </select>
            </div>
            <div class="bottom">
                <input type="submit" value="Submit">
                <button class="btn_add" type="button">Thêm câu hỏi</button>
            </div>
        </div>

        <div class="list_question">
            <div class="header">
                <span>0 câu hỏi</span>
            </div>
        </div>
    </form>
</div>

<div class="popup">
    <div class="popup-content">
        <h3>Nhập câu hỏi và câu trả lời</h3>
        <textarea type="text" id="question_input" placeholder="Nhập câu hỏi..."></textarea>
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
        <div class="button_zone">
            <button id="add_question">Thêm câu hỏi</button>
            <button id="cancel_button">Huỷ</button>
        </div>

    </div>
</div>


</body>

<script src="${pageContext.request.contextPath}/NewTest/main.js"></script>
</html>
