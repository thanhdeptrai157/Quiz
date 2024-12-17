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

<div id="alert_wrong" class="alert">
  <span class="alert-text">Answer is wrong!</span>
</div>

<div id="overlay" class="overlay"></div>

<div id="alert_correct" class="alert">
  <span class="alert-text">Answer is correct!</span>
</div>
<div id="timer" class="timer"></div>
</body>
<script>

  const alertBoxWrong = document.getElementById('alert_wrong');
  const alertBoxCorrect = document.getElementById('alert_correct');

  function showAlert(set) {
    if(set){
      alertBoxCorrect.classList.add('show');
      alertBoxCorrect.classList.remove('hide');
      setTimeout(() => {
        alertBoxCorrect.classList.add('hide');
        alertBoxCorrect.classList.remove('show');
      }, 1000);
    }
    else {
      alertBoxWrong.classList.add('show');
      alertBoxWrong.classList.remove('hide');
      setTimeout(() => {
        alertBoxWrong.classList.add('hide');
        alertBoxWrong.classList.remove('show');
      }, 1000);
    }

  }

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

  const form = document.querySelector(".form");
  function shuffle(array) {
    for (let i = array.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
  }

  let currentQuestionIndex = 0;
  let numCorrect = 0;
  let numCorrectInput = document.querySelector(".correct");

  async function loadQuestion() {
    if (currentQuestionIndex >= questionsData.length) {
      numCorrectInput.value = numCorrect;
      form.submit();
      return;
    }

    const currentQuestion = questionsData[currentQuestionIndex];
    console.log(currentQuestion.question);
    questionElement.textContent = currentQuestion.question;

    const shuffledAnswers = shuffle([...currentQuestion.answers]);

    num_question.textContent = currentQuestionIndex + 1 + "/" + questionsData.length;

    answerButtons.forEach((button, index) => {
      button.textContent = shuffledAnswers[index].text;

      button.onclick = async () => {
        if (shuffledAnswers[index].isCorrect) {
          numCorrect++;
          showAlert(true);
          openCloseAnimation();
        } else {
          showAlert(false);
          openCloseAnimation();
        }

        currentQuestionIndex++;
        await sleep(500);
        loadQuestion();
      };
    });
  }

  loadQuestion();

  function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  function openCloseAnimation(){
    const overlay = document.getElementById("overlay");

    overlay.classList.add('show');

    overlay.addEventListener("animationend", () => {
      overlay.classList.remove('show');
    });
  }

  let countdownTime = <%=test.getTime()%> * 60;

  const timerElement = document.getElementById("timer");

  function formatTime(seconds) {
    const minutes = Math.floor(seconds / 60);
    const remainingSeconds = seconds % 60;
    return minutes.toString().padStart(2, "0")+":"+remainingSeconds.toString().padStart(2, "0");
  }

  function startCountdown() {
    const interval = setInterval(() => {
      timerElement.textContent = formatTime(countdownTime);

      if (countdownTime <= 0) {
        clearInterval(interval);
        numCorrectInput.value = numCorrect;
        form.submit();
      }

      countdownTime--;
    }, 1000);
  }

  startCountdown();
</script>

</html>
