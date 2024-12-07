package Controller;

import Model.BO.QuestionBO;
import Model.BO.TestBO;
import Model.Bean.Question;
import Model.Bean.Subject;
import Model.Bean.Test;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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

        if(action.equalsIgnoreCase("getSubject")){
            List<Subject> subjects = tbo.getAllSubject();
            req.setAttribute("subjects", subjects);
        }

        else if(action.equalsIgnoreCase("getTestByIdSubject")){
            int idSubject = Integer.parseInt(req.getParameter("idSubject"));
            List<Test> listTest = tbo.getTestByIDSubject(idSubject);
            req.setAttribute("listTest", listTest);
        }
    }
}
