<%@ page import="Model.Bean.Question" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Bean.Account" %>
<%@ page import="Model.Bean.Test" %><%--
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
<%
  Account account = (Account) request.getSession().getAttribute("account");
  Test test = (Test) request.getAttribute("test");
  List<Question> questions = (List<Question>) request.getAttribute("questions");
%>
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

<form action="history?action=addHistoryStudent" method="post" class="form" accept-charset="UTF-8">
  <input type="hidden" value="<%=account.getId()%>" name="idStudent">
  <input type="hidden" value="<%=account.getName()%>" name="nameStudent">
  <input type="hidden" value="<%=test.getIdTest()%>" name="idTest">
  <input type="hidden" value ="<%=questions.size()%>" name="numberOfQuestion" >
  <input type="hidden" value ="1" name="numberOfCorrectAnswer" class="correct">
</form>
</body>
<script>
  var questionsData = [
    <%
        for (int i = 0; i < questions.size(); i++) {
            Question q = questions.get(i);
    %>
    {
      question: "<%= q.getQuestion().replace("\"", "\\\"") %>",
      answers: [
        { text: "<%= q.getAnswer1().replace("\"", "\\\"") %>" , isCorrect: true },
        { text: "<%= q.getAnswer2().replace("\"", "\\\"") %>",  isCorrect: false},
        { text: "<%= q.getAnswer3().replace("\"", "\\\"") %>",  isCorrect: false },
        { text: "<%= q.getAnswer4().replace("\"", "\\\"") %>",  isCorrect: false }
      ]
    }<%= (i < questions.size() - 1) ? "," : "" %>
    <%
        }
    %>
  ];
  console.log(questionsData.length);
  const displayQuestionDiv = document.querySelector(".displayquestion");
  const questionElement = document.querySelector(".question");
  const answerButtons = document.querySelectorAll(".answer");
  const num_question = document.querySelector(".num_question")
  let currentQuestionIndex = 0;
  const form = document.querySelector(".form");
  function shuffle(array) {
    for (let i = array.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
  }


  let numCorrect = 0;
  let numCorrectInput = document.querySelector(".correct");

  function loadQuestion() {
    if(currentQuestionIndex >= questionsData.length){
      numCorrectInput.value = numCorrect;
      form.submit();
      return;
    }
    const currentQuestion = questionsData[currentQuestionIndex];

    console.log(currentQuestion.question)
    questionElement.textContent = currentQuestion.question;

    const shuffledAnswers = shuffle([...currentQuestion.answers]);

    answerButtons.forEach((button, index) => {
      num_question.textContent = currentQuestionIndex + 1 + "/" +  questionsData.length;
      button.textContent = shuffledAnswers[index].text;
      button.onclick = () => {
        if (shuffledAnswers[index].isCorrect) {
          numCorrect++;
          alert("Correct");
        } else {
          alert("Wrong answer");
        }
          currentQuestionIndex = currentQuestionIndex + 1;
        loadQuestion();
      };
    });
  }
  loadQuestion();
</script>

</html>
