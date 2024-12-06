package Model.BO;

import Model.Bean.Question;
import Model.DAO.QuestionDAO;

import java.util.List;

public class QuestionBO {
    public void insertQuestion(Question question){
        QuestionDAO questionDAO = new QuestionDAO();
        questionDAO.insertQuestion(question);
    }

    public List<Question> getAllQuestionByIDTest(int idTest){
        QuestionDAO questionDAO = new QuestionDAO();
        return questionDAO.selectAllQuestionByIDTest(idTest);
    }
}
