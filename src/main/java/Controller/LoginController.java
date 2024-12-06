package Controller;

import Model.BO.LoginBO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = "/author")
public class LoginController extends HttpServlet {
    LoginBO loginBO = new LoginBO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mod = req.getParameter("mod");

        if(mod.equals("login")){
            login(req, resp);
        }
        else if(mod.equals("signup")){
            SignUp(req, resp);
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    private void login(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        System.out.println(username);
        System.out.println(password);
        String role = loginBO.login(username, password);
        if(role.equals("admin")){
            System.out.println("admin");
            req.getSession().setAttribute("role", role);
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        else if(role.equals("student")){
            System.out.println("student");
            req.getSession().setAttribute("role", role);
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
        else if(role.equals("teacher")) {
            System.out.println("teacher");
            req.getSession().setAttribute("role", role);
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }

    public void SignUp(HttpServletRequest req, HttpServletResponse resp){
        String name = req.getParameter("name");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        loginBO.SignUP(name, username, password, role);
    }
}
