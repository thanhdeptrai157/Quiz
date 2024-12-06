package Model.BO;

import Model.DAO.LoginDAO;

public class LoginBO {
    LoginDAO loginDAO = new LoginDAO();

    public boolean login(String username, String password) {
        return loginDAO.CheckLogin(username, password);
    }
}
