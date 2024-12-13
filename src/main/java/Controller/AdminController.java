package Controller;

import Model.BO.AdminBO;
import Model.Bean.Teacher;
import Model.Bean.TestDetail;

import java.sql.SQLException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin")
public class AdminController extends HttpServlet {
    AdminBO adminBO = new AdminBO();
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doPost(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action.equals("viewList")){
            try {
                viewListTeacher(req,resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

        }
        else if(action.equals("viewDetail")){
            int idGV = Integer.parseInt(req.getParameter("idgv").toString());
            try {
                viewListOfTests(req,resp,idGV);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public void viewListTeacher(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        List<Teacher> listTeacher = adminBO.getListTeacherBO();
        request.setAttribute("listTeacher",listTeacher);
        request.getRequestDispatcher("/Admin/listTeacher.jsp").forward(request,response);
    }

    public void viewListOfTests(HttpServletRequest request, HttpServletResponse response,int IDGV) throws SQLException, ClassNotFoundException, ServletException, IOException {
        List<TestDetail> listTest = adminBO.getListOfTestsBO(IDGV);
        request.setAttribute("listTestDetail",listTest);
        request.getRequestDispatcher("/Teacher/listTest.jsp").forward(request,response);
    }
}
