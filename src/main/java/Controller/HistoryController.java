package Controller;

import Model.BO.HistoryBO;
import Model.Bean.HistoryStudent;
import Model.Bean.HistoryTest;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/history")
public class HistoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private HistoryBO historyBO = new HistoryBO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
            if (action.equals("addHistoryStudent")) {
            int idStudent = Integer.parseInt(req.getParameter("idStudent"));
            String nameStudent = req.getParameter("nameStudent");
            int idTest = Integer.parseInt(req.getParameter("idTest"));
            int numberOfQuestion = Integer.parseInt(req.getParameter("numberOfQuestion"));
            int numberOfCorrectAnswer = Integer.parseInt(req.getParameter("numberOfCorrectAnswer"));
            Timestamp date = new Timestamp(System.currentTimeMillis());
            HistoryStudent historyStudent = new HistoryStudent(1, idStudent, nameStudent, idTest, numberOfQuestion, numberOfCorrectAnswer, date);
            historyBO.AddHistory(historyStudent);
            req.setAttribute("historyStudent", historyStudent);
            req.getRequestDispatcher("DoingTest/result.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        System.out.println(action);
        if (action.equals("listHistoryTest")) {
            int idTeacher = Integer.parseInt(req.getParameter("idTeacher"));
            List<HistoryTest> listHistoryTest = historyBO.GetHistoryTest(idTeacher);
            req.getSession().setAttribute("listHistoryTest", listHistoryTest);
            resp.sendRedirect("Teacher/test_manager.jsp");
        } else if (action.equals("getHistoryStudent")) {
            int idTest = Integer.parseInt(req.getParameter("idTest"));
            System.out.println("idTest: "+ idTest);
            List<HistoryStudent> listHistoryStudent = historyBO.GetHistoryStudent(idTest);
            req.setAttribute("listHistoryStudent", listHistoryStudent);
            req.getRequestDispatcher("Teacher/history_student.jsp").forward(req, resp);
        }
        else if(action.equals("addHistoryStudent")){
            int idStudent = Integer.parseInt(req.getParameter("idStudent"));
            String nameStudent = req.getParameter("nameStudent");
            int idTest = Integer.parseInt(req.getParameter("idTest"));
            int numberOfQuestion = Integer.parseInt(req.getParameter("numberOfQuestion"));
            int numberOfCorrectAnswer = Integer.parseInt(req.getParameter("numberOfCorrectAnswer"));
            Timestamp date = new Timestamp(System.currentTimeMillis());
        }
    }
}
