package Model.DAO;

import Model.Bean.HistoryStudent;
import Model.Bean.HistoryTest;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class HistoryDAO {
    DAO dao = new DAO();


    public boolean add(HistoryStudent historyStudent) {
        try {
            DAO dao = new DAO();
            int count = dao.Update(
                    "INSERT INTO historyTest (idStudent, idTest, numberOfQuestion, numberOfCorrectAnswer, timeFinish) VALUES (?, ?, ?, ?, ?);",
                    historyStudent.getIdStudent(),
                    historyStudent.getIdTest(),
                    historyStudent.getNumOfQuestion(),
                    historyStudent.getNumOfCorrectAnswer(),
                    historyStudent.getTimeFinish());
            if (count > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public List<HistoryStudent> getListHistoryStudentByIDTest(int idTest){
        List<HistoryStudent> listHistoryStudent = new ArrayList<>();
        ResultSet rs = null;
        try {
            DAO dao = new DAO();
            String sql = "SELECT * FROM historyTest \n" +
                    "INNER JOIN account ON account.idAccount = historyTest.idStudent\n" +
                    "WHERE idTest = ?;";
            rs = dao.Query(sql, idTest);
            while (rs.next()) {
                int idHistory = rs.getInt("idHistory");
                int idStudent = rs.getInt("idStudent");
                String nameStudent = rs.getString("name");
                int numOfQuestion = rs.getInt("numberOfQuestion");
                int numOfCorrectAnswer = rs.getInt("numberOfCorrectAnswer");
                Timestamp timeFinish = rs.getTimestamp("timeFinish");
                HistoryStudent historyStudent = new HistoryStudent(idHistory, idStudent, nameStudent, idTest, numOfQuestion, numOfCorrectAnswer, timeFinish);
                listHistoryStudent.add(historyStudent);
            }

            return listHistoryStudent;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<HistoryStudent> getListHistoryStudentByIDStudent(int idStuident){
        List<HistoryStudent> listHistoryStudent = new ArrayList<>();
        ResultSet rs = null;
        try {
            DAO dao = new DAO();
            String sql = "SELECT * FROM historyTest \n" +
                    "INNER JOIN account ON account.idAccount = historyTest.idStudent\n" +
                    "INNER JOIN test ON test.idTest = historyTest.idTest\n" +
                    "WHERE idStudent = ?;";
            rs = dao.Query(sql, idStuident);
            while (rs.next()) {
                int idTest = rs.getInt("idTest");
                int idHistory = rs.getInt("idHistory");
                int idStudent = rs.getInt("idStudent");
                String nameStudent = rs.getString("name");
                String nameTest = rs.getString("nameTest");
                int numOfQuestion = rs.getInt("numberOfQuestion");
                int numOfCorrectAnswer = rs.getInt("numberOfCorrectAnswer");
                Timestamp timeFinish = rs.getTimestamp("timeFinish");
                HistoryStudent historyStudent = new HistoryStudent(idHistory, idStudent, nameStudent, nameTest, idTest, numOfQuestion, numOfCorrectAnswer, timeFinish);
                listHistoryStudent.add(historyStudent);
            }

            return listHistoryStudent;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<HistoryTest> GetHistoryTestByIDTeacher(int idTeacher){
        List<HistoryTest> listHistoryTest = new ArrayList<>();
        ResultSet rs = null;
        try {
            DAO dao = new DAO();
            String sql = "SELECT * FROM test INNER JOIN (SELECT question.idTest, COUNT(question.idQuestion) AS numberOfQuestions FROM `question` GROUP BY idTest) AS count_question\n" +
                    "ON test.idTest = count_question.idTest\n" +
                    "LEFT JOIN (SELECT idTest, COUNT(idStudent) AS numberOfContestants FROM historyTest GROUP BY idTest) AS count_contestant\n" +
                    "ON test.idTest = count_contestant.idTest\n" +
                    "WHERE test.idTeacher = ? ;\n";
            rs = dao.Query(sql, idTeacher);
            while (rs.next()) {
                int idTest = rs.getInt("idTest");
                String nameTest = rs.getString("nameTest");
                int numberOfQuestions = rs.getInt("numberOfQuestions");
                int numberOfContestants = rs.getInt("numberOfContestants");
                HistoryTest historyTest = new HistoryTest(idTest, nameTest, numberOfQuestions, numberOfContestants);
                listHistoryTest.add(historyTest);
            }

            return listHistoryTest;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
