package Model.Bean;

import java.sql.Date;

public class History {
    private int idHistory;
    private int idStudent;
    private String nameStudent;
    private int idTest;
    private int numOfQuestion;
    private int numOfCorrectAnswer;
    private Date timeFinish;

    public History(int idHistory, int idStudent, String nameStudent, int idTest, int numOfQuestion, int numOfCorrectAnswer, Date timeFinish) {
        this.idHistory = idHistory;
        this.idStudent = idStudent;
        this.nameStudent = nameStudent;
        this.idTest = idTest;
        this.numOfQuestion = numOfQuestion;
        this.numOfCorrectAnswer = numOfCorrectAnswer;
        this.timeFinish = timeFinish;
    }

    public int getIdHistory() {
        return idHistory;
    }

    public void setIdHistory(int idHistory) {
        this.idHistory = idHistory;
    }

    public int getIdStudent() {
        return idStudent;
    }

    public void setIdStudent(int idStudent) {
        this.idStudent = idStudent;
    }

    public int getIdTest() {
        return idTest;
    }

    public void setIdTest(int idTest) {
        this.idTest = idTest;
    }

    public int getNumOfQuestion() {
        return numOfQuestion;
    }

    public void setNumOfQuestion(int numOfQuestion) {
        this.numOfQuestion = numOfQuestion;
    }

    public int getNumOfCorrectAnswer() {
        return numOfCorrectAnswer;
    }

    public void setNumOfCorrectAnswer(int numOfCorrectAnswer) {
        this.numOfCorrectAnswer = numOfCorrectAnswer;
    }

    public Date getTimeFinish() {
        return timeFinish;
    }

    public void setTimeFinish(Date timeFinish) {
        this.timeFinish = timeFinish;
    }

    public String getNameStudent() {
        return nameStudent;
    }

    public void setNameStudent(String nameStudent) {
        this.nameStudent = nameStudent;
    }
}
