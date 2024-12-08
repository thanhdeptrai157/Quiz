<%@ page import="Model.Bean.Account" %>
<%@ page import="Model.Bean.Test" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Bean.Subject" %>
<%@ page import="java.util.Map" %><%--
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
    <link rel="stylesheet" href="style.css">
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
        <a href="../authen?action=logout">Đăng xuất</a>
    </div>
</header>

<section class="main">
    <div class="main_content">
        <div class="join" >
            <div class="input_zone">
                <form action="../test?action=getIdTestTaking" method="post" class="code_input">
                    <div class="input_container">
                        <input type="text" placeholder="Nhập mã tham gia" name="idTestTaking">
                        <button class="btn_join" type="submit">Tham gia</button>
                    </div>
                </form>
            </div>
            <div class="welcome">
                <span>Chào mừng <%= account != null ? account.getName() : ""%></span><br>
                <img src="img/hehe.png" alt="" width="50%">
            </div>
        </div>
        <div class="test_zone">
            <h2>Danh sách bài kiểm tra</h2>
            <div class="test_list">

            </div>

            <%
                int index = 0;
                Map<Subject, List<Test>> mapTestHeader = (Map<Subject, List<Test>>) request.getSession().getAttribute("mapTest");
                for(Subject subject : mapTestHeader.keySet()){
            %>
                <h2><%=subject.getNameSubject()%></h2>
                <div class="test_list">
                    <%for(Test test : mapTestHeader.get(subject)){%>

                        <div class="test_card">
                            <h3><%=test.getNameTest()%></h3>
                            <p><strong>ID:</strong><%=test.getIdTest()%></p>
                            <p><strong>Giáo viên:</strong><%=test.getIdTeacher()%></p>
                            <p><strong>Thời gian:</strong><%=test.getTime()%> phút </p>
                            <form action="../test?action=getQuestion" method="post">
                                <input type="hidden" name="idTest" value="<%=test.getIdTest()%>">
                                <button type="submit" class="btn_start">Bắt đầu</button>
                            </form>
                        </div>

                    <%}%>
                </div>
            <%
                index++;
                }
            %>
        </div>
    </div>
</section>
</body>

<script>

    var testList = [
        <%
            List<Test> tests = (List<Test>) request.getSession().getAttribute("testList");
            for(int i = 0; i < tests.size(); ++i){
                Test t = tests.get(i);
        %>
        {
            idTest: "<%=t.getIdTest()%>",
            nameTest: "<%=t.getNameTest()%>",
            idTeacher: "<%=t.getIdTeacher()%>",
            time: "<%=t.getTime()%>"
        }<%= (i < tests.size() - 1) ? "," : ""%>
        <%
            }
        %>
    ];
    const testListContainer = document.querySelector('.test_list');
    console.log(testList.length);

    testList.forEach(test => {
        const testCard = document.createElement('div');
        testCard.className = 'test_card';
        const title = document.createElement('h3');
        title.textContent = test.nameTest;

        const idInfo = document.createElement('p');
        idInfo.innerHTML = "<strong>ID:</strong>"+ test.idTest;

        const teacherInfo = document.createElement('p');
        teacherInfo.innerHTML = "<strong>Giáo viên:</strong>"+ test.idTeacher;

        const timeInfo = document.createElement('p');
        timeInfo.innerHTML = "<strong>Thời gian:</strong>"+ test.time +"phút";

        const form = document.createElement('form');
        form.action = "../test?action=getQuestion";
        form.method = "post";

        const hiddenInput = document.createElement('input');
        hiddenInput.type = 'hidden';
        hiddenInput.name = 'idTest';
        hiddenInput.value = test.idTest;

        const startButton = document.createElement('button');
        startButton.type = 'submit';
        startButton.className = 'btn_start';
        startButton.textContent = 'Bắt đầu';

        form.appendChild(hiddenInput);
        form.appendChild(startButton);
        testCard.appendChild(title);
        testCard.appendChild(idInfo);
        testCard.appendChild(teacherInfo);
        testCard.appendChild(timeInfo);
        testCard.appendChild(form);
        testListContainer.appendChild(testCard);
    });
</script>
</html>