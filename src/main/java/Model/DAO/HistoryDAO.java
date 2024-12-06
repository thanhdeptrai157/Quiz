package Model.DAO;

import Model.Bean.History;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HistoryDAO {
    DAO dao = new DAO();


    public boolean add(History history) {
        try {
            DAO dao = new DAO();
            int count = dao.Update(
                    "INSERT INTO historyTest (idStudent, idTest, numberOfQuestion, numberOfCorrectQuestion, timeFinish) VALUES (?, ?, ?, ?, ?);",
                    history.getIdStudent(),
                    history.getIdTest(),
                    history.getNumOfQuestion(),
                    history.getNumOfCorrectAnswer(),
                    history.getTimeFinish());
            if (count > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public List<History> getListHistoryByIDTest(int idTest){
        List<History> listHistory = new ArrayList<>();
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
                Date timeFinish = rs.getDate("timeFinish");
                History history = new History(idHistory, idStudent, nameStudent, idTest, numOfQuestion, numOfCorrectAnswer, timeFinish);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public static void main(String[] args) {
        Date date =  Date.valueOf("2024-10-10");
        History history = new History(1, 1, "giap", 1, 10, 9, date);
    }
}
