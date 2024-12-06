package Model.DAO;

import java.sql.ResultSet;

public class StudentDAO {
    public boolean CheckLogin(String username, String password) {
        
        ResultSet rs = null;
        try {
            DAO dao = new DAO();
            rs = dao.Query("SELECT * FROM student WHERE username = ? AND password = ? ;", username, password);
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public static void main(String[] args) {
        StudentDAO studentDAO = new StudentDAO();
        System.out.println(studentDAO.CheckLogin("giapwibu", "giapwibu"));
    }
}
