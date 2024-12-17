<%@ page import="Model.Bean.Subject" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Bean.Question" %>
<%@ page import="Model.Bean.Test" %>
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
<%
    List<Question> questions = (List<Question>) request.getAttribute("questions");
    Test test = (Test) request.getAttribute("test");
    String action = questions != null? "edit" : "add";
%>
<div class="main">
    <form action="test?action=<%=action%>" method="post" accept-charset="UTF-8">
        <input type="hidden" value="<%=test != null ? test.getIdTest(): ""%>" name="idTest">
        <div class="infor_test">
            <label for="nameTest">Tên bài test:</label>
            <input type="text" name="nameTest" id="nameTest" value="<%=test !=null? test.getNameTest() : ""%>" required><br>
            <div class="test_details">
                <div>
                    <label for="timeTest">Thời gian (phút):</label>
                    <input type="number" name="timeTest" id="timeTest" value="<%=test != null? test.getTime() : ""%>" required>
                </div>

                <div>
                    <label for="option">Kiểu test:</label>
                    <select name="option" id="option">
                        <option value="0" <%= test !=null ? (!test.isTypeTest() ? "selected" : "") : ""%>>Công khai</option>
                        <option value="1" <%= test !=null ? (test.isTypeTest() ? "selected" : "") : ""%>>Đóng</option>
                    </select>
                </div>

            </div>
            <div>
                <select name="idSubject" >
                    <%
                        List<Subject> listSubject = (List<Subject>) request.getAttribute("listSubject");
                        for(Subject subject : listSubject){
                            int id = test != null ? test.getIdSubject() : -1;
                    %>
                    <option value="<%=subject.getIdSubject()%>"
                            <%=subject.getIdSubject() == (id) ? "selected" : ""%>>
                        <%=subject.getNameSubject()%>
                    </option>
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
                <span><%=questions != null ? questions.size() : "0"%> câu hỏi</span>
            </div>
            <%
                if(questions != null){
                    for(int i = 0; i<questions.size(); ++i){
                            Question question = questions.get(i);
                        %>
            <div style="margin-bottom: 20px;">
                <div style="display: flex;">
                    <span class="num"><%=i + 1%></span>
                    <h4>. <%=question.getQuestion()%></h4>
                </div>
                <ul>
                    <li style="font-weight: bold; color: green;">1. <%=question.getAnswer1()%></li>
                    <li>2. <%=question.getAnswer2()%></li>
                    <li>3. <%=question.getAnswer3()%></li>
                    <li>4. <%=question.getAnswer4()%></li>
                </ul>
                <input type="hidden" name="idQuestion" value="<%=question.getIdQuestion()%>" class="idQuestion"/>
                <div class="postInput">
                    <input type="hidden" name="question" value="<%=question.getQuestion()%>">
                    <input type="hidden" name="<%="answer_"+(i+1)+"_correct"%>" value="<%=question.getAnswer1()%>">
                    <input type="hidden" name="<%="answer_"+(i+1)+"_incorrect"%>" value="<%=question.getAnswer2()%>">
                    <input type="hidden" name="<%="answer_"+(i+1)+"_incorrect"%>" value="<%=question.getAnswer3()%>">
                    <input type="hidden" name="<%="answer_"+(i+1)+"_incorrect"%>" value="<%=question.getAnswer4()%>">
                </div>
                <div class="button_container">
                    <button type="button" class="btn_edit">Sửa</button>
                    <button type="button" class="btn_delete">Xoá</button>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
        <input type="hidden" class="inputQuestions" name="inputQuestions">
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
