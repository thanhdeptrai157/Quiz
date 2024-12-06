package Model.DAO;

import Model.Bean.Test;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TestDAO {
    public void insertTest(Test test) {
        try{
            DAO dao = new DAO();
            String sql = "INSERT INTO test(nameTest, typeTest, idTeacher, time) VALUES(?,?,?,?)";
            dao.Update(sql, test.getNameTest(), test.isTypeTest(), test.getIdTeacher(), test.getTime());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int getMaxIdTest() {
        DAO dao = new DAO();
        String sql = "SELECT MAX(idTest) FROM Test";

        try {
            ResultSet rs = dao.Query(sql);
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
