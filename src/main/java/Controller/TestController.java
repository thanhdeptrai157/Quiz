package Controller;

import Model.BO.QuestionBO;
import Model.BO.TestBO;
import Model.Bean.Account;
import Model.Bean.Question;
import Model.Bean.Subject;
import Model.Bean.Test;
import com.mysql.cj.conf.ConnectionUrlParser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLOutput;
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
            int idSubject = Integer.parseInt(req.getParameter("idSubject"));
            int timeTest = Integer.parseInt(req.getParameter("timeTest"));
            boolean typeTest = Integer.parseInt(req.getParameter("option")) == 1;
            int idTeacher = ((Account)req.getSession().getAttribute("account")).getId();
            System.out.println(nameTest+ " " + typeTest+" "+ timeTest);
            tbo.insertTest(new Test(nameTest, idSubject, typeTest, idTeacher, timeTest ));

            int idTest = tbo.getMaxIdTest();
            for(int i = 0; i < questions.length; i++){
                String trueAnswer = req.getParameter("answer_"+(i+1)+"_correct");
                String [] wrongAnswers = req.getParameterValues("answer_"+(i+1)+"_incorrect");
                qbo.insertQuestion(new Question(idTest, questions[i], trueAnswer,
                        wrongAnswers[0],
                        wrongAnswers[1],
                        wrongAnswers[2]));
            }
            System.out.println(idSubject);
            System.out.println("ok");
            resp.sendRedirect("history?action=listHistoryTest&idTeacher="+idTeacher);
        }
        else if(action.equalsIgnoreCase("edit")){
            String [] ids = ((String) req.getParameter("inputQuestions")).split(" ");

            for(String id : ids){
                int idTest = Integer.parseInt(id);
                qbo.deleteQuestion(idTest);
            }

            String [] questions = req.getParameterValues("question");
            String nameTest = req.getParameter("nameTest");
            int idTest = Integer.parseInt(req.getParameter("idTest"));
            int idSubject = Integer.parseInt(req.getParameter("idSubject"));
            int timeTest = Integer.parseInt(req.getParameter("timeTest"));
            boolean typeTest = Integer.parseInt(req.getParameter("option")) == 1;
            int idTeacher = ((Account)req.getSession().getAttribute("account")).getId();
            System.out.println(nameTest+ " " + typeTest+" "+ timeTest  + " "+ idSubject);
            tbo.updateTest(new Test(idTest, idSubject, nameTest, typeTest, idTeacher, timeTest ));

            for(int i = 0; i < questions.length; i++){
                String trueAnswer = req.getParameter("answer_"+(i+1)+"_correct");
                String [] wrongAnswers = req.getParameterValues("answer_"+(i+1)+"_incorrect");
                qbo.insertQuestion(new Question(idTest, questions[i], trueAnswer,
                        wrongAnswers[0],
                        wrongAnswers[1],
                        wrongAnswers[2]));
            }
            System.out.println(idSubject);
            System.out.println("ok");
            resp.sendRedirect("history?action=listHistoryTest&idTeacher="+idTeacher);
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
            String code = tbo.AddTestTaking(idTest, timeStart, timeEnd);
            if(code != null){
                req.setAttribute("code", code);
                req.getRequestDispatcher("/Teacher/code.jsp").forward(req, resp);
            }
            else{
                System.out.println("Tao code that bai");
            }
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
                    resp.sendRedirect("Student/home.jsp");
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
        }else if(action.equalsIgnoreCase("getTestEdit")){
            int idTest = Integer.parseInt(req.getParameter("idTest"));
            Test test = tbo.getTestById(idTest);
            req.setAttribute("test", test);
            List<Question> questions = qbo.getAllQuestionByIDTest(idTest);
            req.setAttribute("questions", questions);
            List<Subject> subjects = tbo.getAllSubject();
            req.setAttribute("listSubject", subjects);
            req.getRequestDispatcher("/NewTest/new_test.jsp").forward(req, resp);

        }
        else if(action.equalsIgnoreCase("getSubject")){
            List<Subject> subjects = tbo.getAllSubject();
            req.setAttribute("listSubject", subjects);
            req.getRequestDispatcher("NewTest/new_test.jsp").forward(req, resp);
        }
        else if(action.equalsIgnoreCase("getTestByIdSubject")){
            int idSubject = Integer.parseInt(req.getParameter("idSubject"));
            List<Test> listTest = tbo.getTestByIDSubject(idSubject);
            req.setAttribute("listTest", listTest);
        }
    }
}
