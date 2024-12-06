package Model.DAO;

import Model.Bean.Question;

import java.sql.SQLException;

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
}
