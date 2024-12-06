
const btnAdd = document.querySelector(".btn_add");
const popup = document.querySelector(".popup");

const addQuestionBtn = document.getElementById("add_question");
const questionInput = document.getElementById("question_input");

const listQuestion = document.querySelector(".list_question");
const headerText = document.querySelector(".header span");

const answersInputs = [
    document.getElementById("answer1"),
    document.getElementById("answer2"),
    document.getElementById("answer3"),
    document.getElementById("answer4"),
];
const correctAnswerSelect = document.getElementById("correct_answer");

let questionCount = 0;

btnAdd.addEventListener("click", () => {
    popup.style.display = "flex";
    questionInput.value = "";
    answersInputs.forEach(input => input.value = "");
    correctAnswerSelect.value = "1";
});


addQuestionBtn.addEventListener("click", () => {
    const questionText = questionInput.value.trim();
    const answers = answersInputs.map(input => input.value.trim());
    const correctAnswer = correctAnswerSelect.value;

    if (!questionText || answers.some(answer => !answer)) {
        alert("Vui lòng nhập đầy đủ câu hỏi và các câu trả lời!");
        return;
    }
    const questionDiv = document.createElement("div");
    questionDiv.style.marginBottom = "20px";
    questionDiv.innerHTML = `
        <h4>${++questionCount}. ${questionText}</h4>
        <input type="hidden" name="question" value="${questionText}" />
        ${answers.map((answer, index) => {
        if (correctAnswer == index + 1) {
            return `
                    <input type="hidden" name="answer_${questionCount}_correct" value="${answer}" />
                `;
        } else {
            return `
                    <input type="hidden" name="answer_${questionCount}_incorrect" value="${answer}" />
                `;
        }
        }).join("")}
        <ul>
            ${answers.map((answer, index) => `
                <li style="${correctAnswer == index + 1 ? 'font-weight: bold; color: green;' : ''}">
                    ${index + 1}. ${answer}
                </li>
            `).join("")}
        </ul>
    `;
    listQuestion.appendChild(questionDiv);
    headerText.textContent = `${questionCount} câu hỏi`;
    popup.style.display = "none";
});
