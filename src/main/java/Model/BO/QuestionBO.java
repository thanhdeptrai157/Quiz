package Model.BO;

import Model.Bean.Question;
import Model.DAO.QuestionDAO;

public class QuestionBO {
    public void insertQuestion(Question question){
        QuestionDAO questionDAO = new QuestionDAO();
        questionDAO.insertQuestion(question);
    }
}
