const btnAdd = document.querySelector(".btn_add");
const popup = document.querySelector(".popup");
const addQuestionBtn = document.getElementById("add_question");
const questionInput = document.getElementById("question_input");
const listQuestion = document.querySelector(".list_question");
const headerText = document.querySelector(".header span");
const cancel_button = document.querySelector("#cancel_button");
const answersInputs = [
    document.getElementById("answer1"),
    document.getElementById("answer2"),
    document.getElementById("answer3"),
    document.getElementById("answer4"),
];
const correctAnswerSelect = document.getElementById("correct_answer");

let questionCount = parseInt(headerText.textContent.split(" ")[0]);

const delete_Button = document.querySelectorAll(".btn_delete");
const edit_Button = document.querySelectorAll(".btn_edit");

delete_Button.forEach(btn =>{
    btn.addEventListener("click",
        ()=> deleteQuestion(btn.parentElement.parentElement, questionCount, headerText)
    )
})
const id_question = document.querySelectorAll(".idQuestion");
const id_questions = document.querySelector(".inputQuestions");

id_question.forEach( (id)=>{
    id_questions.value += id.value + " ";
})

btnAdd.addEventListener("click", () => {
    popup.style.display = "flex";
    questionInput.value = "";
    answersInputs.forEach(input => input.value = "");
    correctAnswerSelect.value = "1";
});

cancel_button.addEventListener("click", (e) => {
    popup.style.display = "none";
});

let isEditing = false;
let currentEditingQuestion = null;

btnAdd.addEventListener("click", () => {
    popup.style.display = "flex";
    resetPopup();
    isEditing = false;
});

cancel_button.addEventListener("click", () => {
    popup.style.display = "none";
    resetPopup();
});

function addQuestion() {
    const questionText = questionInput.value.trim();
    const answers = answersInputs.map(input => input.value.trim());
    const correctAnswer = correctAnswerSelect.value;

    if (!questionText || answers.some(answer => !answer)) {
        alert("Vui lòng nhập đầy đủ câu hỏi và các câu trả lời!");
        return;
    }

    if (isEditing && currentEditingQuestion) {

        const questionTitle = currentEditingQuestion.querySelector("h4");
        const answerList = currentEditingQuestion.querySelector("ul");
        const hiddenInputEdit = currentEditingQuestion.querySelector(".postInput")
        questionTitle.textContent = `. ${questionText}`;

        answers.forEach((answer, index) => {
            const answerItem = answerList.children[index];
            answerItem.textContent = `${index + 1}. ${answer}`;
            if (correctAnswer == index + 1) {
                answerItem.style.fontWeight = "bold";
                answerItem.style.color = "green";
            } else {
                answerItem.style.fontWeight = "";
                answerItem.style.color = "";
            }
        });

        hiddenInputEdit.innerHTML = `
            <input type="hidden" name="question" value="${questionText}" />
            ${answers.map((answer, index) => {
            if (correctAnswer == index + 1) {
                return `
                        <input type="hidden" name="answer_${questionCount}_correct" value="${answer}" />`;
            } else {
                return `<input type="hidden" name="answer_${questionCount}_incorrect" value="${answer}" />`;
            }
        }).join("")}`;

        popup.style.display = "none";
        resetPopup();
        isEditing = false;
        currentEditingQuestion = null;
    } else {

        const questionDiv = document.createElement("div");
        questionDiv.style.marginBottom = "20px";

        const questionTitle = document.createElement("h4");
        const tilteDiv = document.createElement("div");
        tilteDiv.style = "display: flex";
        const number = document.createElement("span");
        number.className = "num";
        number.textContent = `${++questionCount}`;
        questionTitle.textContent = `. ${questionText}`;
        tilteDiv.appendChild(number);
        tilteDiv.appendChild(questionTitle);
        questionDiv.appendChild(tilteDiv);

        const answerList = document.createElement("ul");
        answers.forEach((answer, index) => {
            const answerItem = document.createElement("li");
            answerItem.textContent = `${index + 1}. ${answer}`;
            if (correctAnswer == index + 1) {
                answerItem.style.fontWeight = "bold";
                answerItem.style.color = "green";
            }
            answerList.appendChild(answerItem);
        });
        questionDiv.appendChild(answerList);


        const hiddenInput = document.createElement("div");
        hiddenInput.className = "postInput"
        hiddenInput.innerHTML = `
                    <input type="hidden" name="question" value="${questionText}" />
                    ${answers.map((answer, index) => {
            if (correctAnswer == index + 1) {
                return `
                        <input type="hidden" name="answer_${questionCount}_correct" value="${answer}" />`;
            } else {
                return `<input type="hidden" name="answer_${questionCount}_incorrect" value="${answer}" />`;
            }
        }).join("")}`

        questionDiv.appendChild(hiddenInput);
        const buttonContainer = document.createElement("div");
        buttonContainer.classList.add("button_container");

        const editButton = document.createElement("button");
        editButton.type = "button";
        editButton.textContent = "Sửa";
        editButton.addEventListener("click", () => {

            const questionText = questionTitle.textContent.slice(2).trim();
            const answersText = Array.from(answerList.children).map(li => li.textContent.slice(3).trim());
            const correctIndex = answers.findIndex((_, index) => answerList.children[index].style.fontWeight === "bold") + 1;

            questionInput.value = questionText;
            answersInputs.forEach((input, index) => {
                input.value = answersText[index];
            });
            correctAnswerSelect.value = correctIndex;

            popup.style.display = "flex";
            isEditing = true;
            currentEditingQuestion = questionDiv;
            addQuestionBtn.textContent = "Cập nhật câu hỏi";
        });
        buttonContainer.appendChild(editButton);

        const deleteButton = document.createElement("button");
        deleteButton.type = "button";
        deleteButton.textContent = "Xoá";
        deleteButton.addEventListener("click",
            ()=>deleteQuestion(questionDiv,questionCount, headerText)
        )
        buttonContainer.appendChild(deleteButton);

        questionDiv.appendChild(buttonContainer);
        listQuestion.appendChild(questionDiv);
        headerText.textContent = `${questionCount} câu hỏi`;
        popup.style.display = "none";
        resetPopup();
    }
}


function deleteQuestion(questionDiv){
    questionDiv.remove();
    questionCount--;
    console.log(questionCount);
    headerText.textContent = `${questionCount} câu hỏi`;
    reNumber();
}
function resetPopup() {
    questionInput.value = "";
    answersInputs.forEach(input => input.value = "");
    correctAnswerSelect.value = "1";
    addQuestionBtn.textContent = "Thêm câu hỏi";
}

function reNumber() {
    const num = document.querySelectorAll(".num");
    num.forEach((n, index) => {
        n.textContent = index + 1;
    });
}
edit_Button.forEach((btn) => {
    btn.addEventListener("click", () => {
        const questionDiv = btn.parentElement.parentElement;
        console.log(questionDiv);
        const questionTitle = questionDiv.querySelector("h4");
        const answerList = questionDiv.querySelector("ul").children;

        const questionText = questionTitle.textContent.slice(2).trim();
        const answersText = Array.from(answerList).map(li => li.textContent.slice(3).trim());
        const correctIndex = Array.from(answerList).findIndex(li => li.style.fontWeight === "bold") + 1;

        questionInput.value = questionText;
        answersInputs.forEach((input, i) => input.value = answersText[i]);
        correctAnswerSelect.value = correctIndex;

        popup.style.display = "flex";
        isEditing = true;
        currentEditingQuestion = questionDiv;

        addQuestionBtn.textContent = "Cập nhật câu hỏi";
    });
});

addQuestionBtn.onclick = addQuestion;