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
import java.util.ArrayList;
import java.util.List;

@WebServlet (urlPatterns = "/history")
public class HistoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private HistoryBO historyBO = new HistoryBO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if(action.equals("listHistoryTest")){
            int idTeacher = Integer.parseInt(req.getParameter("idTeacher"));
            List<HistoryTest> listHistoryTest = historyBO.GetHistoryTest(idTeacher);

        }
        else if(action.equals("getHistoryStudent")){
            int idTest = Integer.parseInt(req.getParameter("idTest"));
            List<HistoryStudent> listHistoryStudent = historyBO.GetHistoryStudent(idTest);
        }
        else if(action.equals("addHistoryStudent")){
            int idStudent = Integer.parseInt(req.getParameter("idStudent"));
            String nameStudent = req.getParameter("nameStudent");
            int idTest = Integer.parseInt(req.getParameter("idTest"));
            int numberOfQuestion = Integer.parseInt(req.getParameter("numberOfQuestion"));
            int numberOfCorrectAnswer = Integer.parseInt(req.getParameter("numberOfCorrectAnswer"));
            Date date = Date.valueOf(req.getParameter("date"));

            HistoryStudent historyStudent = new HistoryStudent(1, idStudent, nameStudent, idTest, numberOfQuestion, numberOfCorrectAnswer, date);
            historyBO.AddHistory(historyStudent);
        }
    }
}
