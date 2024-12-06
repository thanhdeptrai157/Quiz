package Model.DAO;

import Model.Bean.Account;

import java.sql.ResultSet;

public class LoginDAO {
    public String CheckLogin(String username, String password) {

        ResultSet rs = null;
        try {
            DAO dao = new DAO();
            rs = dao.Query("SELECT * FROM account WHERE username = ? AND password = ? ;", username, password);
            if (rs.next()) {
                return rs.getString("role");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean SignUp(String name, String username, String password, String role){
        try {
            DAO dao = new DAO();
            int count = dao.Update("INSERT INTO account (name, username, password, role) VALUES (?, ?, ?, ?);", name, username, password, role);
            if (count > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean DeleteAccount(Account account){
        try {
            DAO dao = new DAO();
            int count = dao.Update(
                    "DELETE FROM account WHERE idAccount = ? ;",
                    account.getId());
            if (count > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
