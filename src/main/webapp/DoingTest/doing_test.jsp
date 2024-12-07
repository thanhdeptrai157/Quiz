<%@ page import="Model.Bean.Question" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: CONG THANH
  Date: 12/6/2024
  Time: 11:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/DoingTest/style.css">
</head>

<body>
<div class="main">
  <div class="displayquestion">
    <span class="num_question"></span>
    <div class="question">

      Đây là câu hỏi
    </div>
    <div class="answers_zone">
      <button class="answer answer1">
        đáp án 1
      </button>
      <button class="answer answer2">
        đáp án 2
      </button>
      <button class="answer answer3">
        đáp án 3
      </button>
      <button class="answer answer4">
        đáp án 4
      </button>
    </div>
  </div>
</div>
</body>
<script>
  var questionsData = [
    <%
        List<Question> questions = (List<Question>) request.getAttribute("questions");
        for (int i = 0; i < questions.size(); i++) {
            Question q = questions.get(i);
    %>
    {
      question: "<%= q.getQuestion().replace("\"", "\\\"") %>",
      answers: [
        { text: "<%= q.getAnswer1().replace("\"", "\\\"") %>" , isCorrect: true },
        { text: "<%= q.getAnswer2().replace("\"", "\\\"") %>",  isCorrect: false},
        { text: "<%= q.getAnswer3().replace("\"", "\\\"") %>", isCorrect: false },
        { text: "<%= q.getAnswer4().replace("\"", "\\\"") %>", isCorrect: false }
      ]
    }<%= (i < questions.size() - 1) ? "," : "" %>
    <%
        }
    %>
  ];

  const displayQuestionDiv = document.querySelector(".displayquestion");
  const questionElement = document.querySelector(".question");
  const answerButtons = document.querySelectorAll(".answer");
  const num_question = document.querySelector(".num_question")
  let currentQuestionIndex = 0;


  function loadQuestion() {
    const currentQuestion = questionsData[currentQuestionIndex];


    questionElement.textContent = currentQuestion.question;
    answerButtons.forEach((button, index) => {
      num_question.textContent = currentQuestionIndex + 1 + "/" +  questionsData.length;
      button.textContent = currentQuestion.answers[index].text;
      button.onclick = () => {
        if (currentQuestion.answers[index].isCorrect) {
          alert("Correct");
        } else {
          alert("Wrong answer");
        }
          currentQuestionIndex = (currentQuestionIndex + 1) % questionsData.length;
        loadQuestion();
      };
    });
  }
  loadQuestion();
</script>

</html>
