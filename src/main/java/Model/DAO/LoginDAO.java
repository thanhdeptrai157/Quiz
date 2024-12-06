package Model.DAO;

import java.sql.ResultSet;

public class LoginDAO {
    public boolean CheckLogin(String username, String password) {

        ResultSet rs = null;
        try {
            DAO dao = new DAO();
            rs = dao.Query("SELECT * FROM account WHERE username = ? AND password = ? ;", username, password);
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
