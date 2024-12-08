package Model.Bean;

import java.sql.Date;
import java.sql.Timestamp;

public class HistoryStudent {
    private int idHistory;
    private int idStudent;
    private String nameStudent;
    private int idTest;
    private String nameTest;
    private int numOfQuestion;
    private int numOfCorrectAnswer;
    private Timestamp timeFinish;

    public HistoryStudent(int idHistory, int idStudent, String nameStudent, String nameTest, int idTest, int numOfQuestion, int numOfCorrectAnswer, Timestamp timeFinish) {
        this.idHistory = idHistory;
        this.idStudent = idStudent;
        this.nameStudent = nameStudent;
        this.idTest = idTest;
        this.nameTest = nameTest;
        this.numOfQuestion = numOfQuestion;
        this.numOfCorrectAnswer = numOfCorrectAnswer;
        this.timeFinish = timeFinish;
    }

    public HistoryStudent(int idHistory, int idStudent, String nameStudent, int idTest, int numOfQuestion, int numOfCorrectAnswer, Timestamp timeFinish) {
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

    public Timestamp getTimeFinish() {
        return timeFinish;
    }

    public void setTimeFinish(Timestamp timeFinish) {
        this.timeFinish = timeFinish;
    }

    public String getNameStudent() {
        return nameStudent;
    }

    public void setNameStudent(String nameStudent) {
        this.nameStudent = nameStudent;
    }

    public String getNameTest() {
        return nameTest;
    }

    public void setNameTest(String nameTest) {
        this.nameTest = nameTest;
    }
}
