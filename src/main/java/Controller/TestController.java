package Controller;

import Model.BO.QuestionBO;
import Model.BO.TestBO;
import Model.Bean.Question;
import Model.Bean.Test;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/test")
public class TestController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    TestBO tbo = new TestBO();
    QuestionBO qbo = new QuestionBO();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action.equalsIgnoreCase("add")){
            String [] questions = req.getParameterValues("question");
            String nameTest = req.getParameter("nameTest");
            tbo.insertTest(new Test(nameTest, false, 2, 20 ));
            int idTest = tbo.getMaxIdTest();
            for(int i = 0; i < questions.length; i++){
                String trueAnswer = req.getParameter("answer_"+(i+1)+"_correct");
                String [] wrongAnswers = req.getParameterValues("answer_"+(i+1)+"_incorrect");
                qbo.insertQuestion(new Question(idTest, questions[i], trueAnswer,
                        wrongAnswers[0],
                        wrongAnswers[1],
                        wrongAnswers[2]));
            }
        }
        else if(action.equalsIgnoreCase("getQuestion")){
            int idTest = Integer.parseInt(req.getParameter("idTest"));
            System.out.println(idTest);
            Test test = tbo.getTestById(idTest);
            req.setAttribute("test", test);
            List<Question> questions = qbo.getAllQuestionByIDTest(idTest);
            req.setAttribute("questions", questions);
            req.getRequestDispatcher("/DoingTest/doing_test.jsp").forward(req, resp);
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action.equals("getQuestion")){
            //int idTest = Integer.parseInt(req.getParameter("idTest"));
            //Test test = tbo.getTestById(idTest);
           // req.setAttribute("test", test);
            List<Question> questions = qbo.getAllQuestionByIDTest(3);
            req.setAttribute("questions", questions);
            req.getRequestDispatcher("/DoingTest/doing_test.jsp").forward(req, resp);
        }
    }
}
