package Controller;

import Model.BO.QuestionBO;
import Model.BO.TestBO;
import Model.Bean.Question;
import Model.Bean.Subject;
import Model.Bean.Test;
import com.mysql.cj.conf.ConnectionUrlParser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
            req.getRequestDispatcher("/Teacher/test_manager.jsp").forward(req, resp);
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

        else if(action.equalsIgnoreCase("addTestTaking")){
            int idTest = Integer.parseInt(req.getParameter("idTest"));
            String timeStart = req.getParameter("timeStart");
            String timeEnd = req.getParameter("timeEnd");
            boolean set = tbo.AddTestTaking(idTest, timeStart, timeEnd);

            req.getRequestDispatcher("/Teacher/test_manager.jsp").forward(req, resp);
        }

        else if(action.equalsIgnoreCase("getIdTestTaking")){
            String idTestTaking = req.getParameter("idTestTaking");
            int idTest = tbo.GetIDTestByIDTestTaking(idTestTaking);
            System.out.println(idTest);
            if(idTest != -1){
                Test test = tbo.getTestById(idTest);

                if(req.getSession().getAttribute("account") == null && test.isTypeTest())
                    resp.sendRedirect("index.jsp");

                else{
                    req.setAttribute("test", test);
                    List<Question> questions = qbo.getAllQuestionByIDTest(idTest);
                    req.setAttribute("questions", questions);
                    req.getRequestDispatcher("/DoingTest/doing_test.jsp").forward(req, resp);

                }
            }
            else{
                if(req.getSession().getAttribute("account") != null)
                    req.getRequestDispatcher("/Student/home.jsp").forward(req, resp);
                else
                    resp.sendRedirect("index.jsp");
            }
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if(action.equalsIgnoreCase("getTest")) {
            TestBO tbo = new TestBO();
            req.getSession().setAttribute("testList", tbo.getPublicTestList());

            List<Subject> listSubject = tbo.getAllSubject();
            Map<Subject, List<Test>> mapTest = new HashMap<>();

            for(Subject s : listSubject){
                System.out.println(s.getNameSubject());
                List<Test> tests = tbo.getTestByIDSubject(s.getIdSubject());
                mapTest.put(s, tests);
            }
            req.getSession().setAttribute("mapTest", mapTest);

            resp.sendRedirect("Student/home.jsp");
        }
        else if(action.equalsIgnoreCase("getSubject")){
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
