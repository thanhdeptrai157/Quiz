<%@ page import="Model.Bean.Account" %>
<%@ page import="Model.Bean.HistoryTest" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Bean.Test" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản Lý Bài Thi</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/Teacher/style.css">
  <style>
    .popup-form {
      display: none;
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      z-index: 1000;
    }

    .popup-overlay {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.5);
      z-index: 999;
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
  <button><a href="../test?action=getSubject">Thêm bài thi</a></button>
</div>
<div class="main">
  <div class="content"></div>
</div>

<div class="popup-overlay" id="popup-overlay"></div>
<div class="popup-form" id="popup-form">
  <form action="../test?action=addTestTaking" method="post" accept-charset="UTF-8">
    <label>ID Test</label>
    <input type="text" name="idTest" id="idTest" readonly> <br>
    <label>Time Start</label>
    <input type="datetime-local" name="timeStart"><br>
    <label>Time End</label>
    <input type="datetime-local" name="timeEnd"><br>
    <button type="submit">OK</button>
    <button type="button" onclick="closePopup()">Cancel</button>
  </form>
</div>

<script>
  var listTest = [
    <%
        List<HistoryTest> tests = (List<HistoryTest>) request.getSession().getAttribute("listHistoryTest");
        for (int i = 0; i < tests.size(); ++i) {
            HistoryTest t = tests.get(i);
    %>
    {
      idTest: "<%= t.getIdTest() %>",
      nameTest: "<%= t.getNameTest() %>",
      numContestants: "<%= t.getNumberOfContestants() %>",
      numQuestions: "<%= t.getNumberOfQuestions() %>",
      code: "<%=t.getCode()%>"
    }<%= i < tests.size() - 1 ? "," : "" %>
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
    numContestants.textContent = "Số Người Tham Gia: " + test.numContestants;
    card.appendChild(numContestants);
    if(!test.code !== "null"){
      var codeTest = document.createElement('p');
      codeTest.textContent = "Code: " + test.code;
      card.appendChild(codeTest);
    }
    var buttonHistory = document.createElement('button');
    buttonHistory.className = "history-button";
    var link = document.createElement('a');
    link.textContent = "Xem lịch sử bài thi";
    link.href = "../history?action=getHistoryStudent&idTest=" + test.idTest;
    link.style.textDecoration = "none";
    link.style.color = "inherit";
    buttonHistory.appendChild(link);
    card.appendChild(buttonHistory);

    var buttonAdd = document.createElement('button');
    buttonAdd.textContent = "Hẹn giờ thi";
    buttonAdd.addEventListener('click', () => openPopup(test.idTest));
    buttonAdd.className = "history-button"
    card.appendChild(buttonAdd);

    var buttonEdit = document.createElement('button');
    buttonEdit.className = "history-button";
    var linkedit = document.createElement('a');
    linkedit.textContent = "Sửa bài thi";
    linkedit.href = "../test?action=getTestEdit&idTest=" + test.idTest;
    linkedit.style.textDecoration = "none";
    linkedit.style.color = "inherit";
    buttonEdit.appendChild(linkedit);
    card.appendChild(buttonEdit);

    contentDiv.appendChild(card);
  });

  function openPopup(idTest) {
    document.getElementById('idTest').value = idTest;
    document.getElementById('popup-overlay').style.display = 'block';
    document.getElementById('popup-form').style.display = 'block';
  }

  function closePopup() {
    document.getElementById('popup-overlay').style.display = 'none';
    document.getElementById('popup-form').style.display = 'none';
  }
</script>
</body>
</html>
