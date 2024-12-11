package Model.BO;

import Model.Bean.Account;
import Model.DAO.LoginDAO;

public class LoginBO {
    LoginDAO loginDAO = new LoginDAO();

    public Account login(String username, String password) {
        return loginDAO.CheckLogin(username, password);
    }

    public boolean SignUP(String name, String username, String password, String role) {
        return loginDAO.SignUp(name, username, password, role);
    }
}
