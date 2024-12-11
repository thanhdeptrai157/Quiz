package Model.DAO;

import Model.Bean.Question;
import Model.Bean.Test;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {
    public void insertQuestion(Question question) {
        DAO dao = new DAO();
        String sql = "insert into question(idTest, question, answer1, answer2, answer3, answer4) values(?,?,?,?,?,?)";
        try {
            dao.Update(sql, question.getIdTest(),
                    question.getQuestion(),
                    question.getAnswer1(),
                    question.getAnswer2(),
                    question.getAnswer3(),
                    question.getAnswer4());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Question> selectAllQuestionByIDTest(int idTest) {
        DAO dao = new DAO();
        String sql = "SELECT * FROM question WHERE idTest = ? ;";
        List<Question> listQuestion = new ArrayList<>();
        try {
            ResultSet rs = dao.Query(sql, idTest);
            while(rs.next()){
                int idQuestion = rs.getInt("idQuestion");
                String question = rs.getString("question");
                String answer1 = rs.getString("answer1");
                String answer2 = rs.getString("answer2");
                String answer3 = rs.getString("answer3");
                String answer4 = rs.getString("answer4");
                listQuestion.add(new Question(idQuestion, idTest, question, answer1, answer2, answer3, answer4));
            }
            return listQuestion;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean deleteQuestion(int idQuestion){
        try{
            DAO dao = new DAO();
            String sql = "DELETE FROM question WHERE idQuestion = ? ;";
            int count = dao.Update(sql, idQuestion);
            if(count > 0) return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
}
