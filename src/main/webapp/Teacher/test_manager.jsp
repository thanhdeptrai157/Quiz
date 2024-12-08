<%@ page import="Model.Bean.Account" %>
<%@ page import="Model.Bean.HistoryTest" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Bean.Test" %><%--
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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Teacher/style.css">
</head>
<%
  Account account = (Account) request.getSession().getAttribute("account");
  if(account == null){
    response.sendRedirect("../index.jsp");
  }
%>
<body>
<div class="header">
  <div class="title">
    <h2>Danh Sách Bài Thi</h2>
  </div>
  <div class="user-info">
    <span><%= account != null ? account.getName() : ""%></span>
    <button><a href="../authen?action=logout">Đăng Xuất</a></button>
  </div>
</div>
<div class="sidebar">
  <h1>Quản Lý Bài Thi</h1>
  <button><a href="../NewTest/new_test.jsp">Thêm bài thi</a></button>
  <button><a href="../AddTestTaking/add_test_taking.jsp">Hen gio thi</a></button>
</div>
<div class="main">
  <div class="content">

  </div>
</div>
</body>
<script>
  var listTest = [
    <%
        List<HistoryTest> tests = (List<HistoryTest>) request.getSession().getAttribute("listHistoryTest");
        System.out.println(tests.size());
        for(int i = 0; i <tests.size(); ++i){
            HistoryTest t = tests.get(i);
    %>
    {
      idTest:"<%=t.getIdTest()%>",
      nameTest: "<%=t.getNameTest()%>",
      numContestants: "<%=t.getNumberOfContestants()%>",
      numQuestions: "<%=t.getNumberOfQuestions()%>",

    }<%= i< tests.size() - 1 ? ", ": ""%>
    <%
        }
    %>
  ];
  var contentDiv = document.querySelector('.content');

  listTest.forEach(test => {

    var card = document.createElement('div');
    card.classList.add('card');

    var title = document.createElement('h3');
    title.textContent = test.nameTest;
    card.appendChild(title);

    var numQuestions = document.createElement('p');
    numQuestions.textContent = "Số Câu Hỏi: " + test.numQuestions;
    card.appendChild(numQuestions);

    var numContestants = document.createElement('p');
    numContestants.textContent = "Số Người Tham Gia: "+ test.numContestants;
    card.appendChild(numContestants);

    var buttonHistory = document.createElement('button');
    var link = document.createElement('a');
    link.textContent = "historyStudent " + test.idTest;
    link.href = "../history?action=getHistoryStudent&idTest=" + test.idTest; // Đường dẫn đến trang lịch sử
    link.style.textDecoration = "none"; // Để loại bỏ gạch chân
    link.style.color = "inherit"; // Để đồng bộ màu với button
    buttonHistory.appendChild(link);
    card.appendChild(buttonHistory);

    contentDiv.appendChild(card);
  });



</script>
</html>
