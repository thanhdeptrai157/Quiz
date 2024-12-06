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
    <link rel="stylesheet" href="style.css">
</head>
<style>
  *{
    padding: 0;
    margin: 0;
    color: white;
  }
  .main{
    background-color: #5d0775;
    width: 100%;
    height: 100vh;
    display: flex;
    justify-content: center;
  }
  .displayquestion{
    width: 100%;
    margin-top: 100px;
    font-size: 35px;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .question{
    background-color: #2f0737;
    width: 60%;
    padding: 50px;
    text-align: center;
    border-radius: 20px;
  }
  .answers_zone{
    margin-top: 7%;
    display: flex;
    width: 95%;
    justify-content: space-between;
  }
  .answer{
    cursor: pointer;
    height: 300px;
    width: 20%;
    display: grid;
    place-items: center;
    font-size: 35px;
    border-radius: 10px;
    border: none;
    outline: none;
  }
  .answer1{
    background-color: #0773d6;
  }
  .answer2{
    background-color: #008e95;
  }
  .answer3{
    background-color: #e87708;
  }
  .answer4{
    background-color: #f54578;
  }
</style>
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
