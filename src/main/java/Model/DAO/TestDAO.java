package Model.DAO;

import Model.Bean.Subject;
import Model.Bean.Test;
import Model.Bean.TestTaking;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class TestDAO {
    public void insertTest(Test test) {
        try{
            DAO dao = new DAO();
            String sql = "INSERT INTO test(nameTest, idSubject, typeTest, idTeacher, time) VALUES(?,?,?,?,?)";
            dao.Update(sql, test.getNameTest(), test.getIdSubject(), test.isTypeTest(), test.getIdTeacher(), test.getTime());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int getMaxIdTest() {
        DAO dao = new DAO();
        String sql = "SELECT MAX(idTest) FROM test";

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

    public Test getTestById(int id) {
        DAO dao = new DAO();
        String sql = "SELECT * FROM test WHERE idTest = ? ;";

        try {
            ResultSet rs = dao.Query(sql, id);
            rs.next();

            int idTest = rs.getInt("idTest");
            String nameTest = rs.getString("nameTest");
            boolean typeTest = rs.getBoolean("typeTest");
            int idTeacher = rs.getInt("idTeacher");
            int time = rs.getInt("time");

            Test test = new Test(idTest, nameTest, typeTest, idTeacher, time);

            return test;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Test> getTestByIdTeacher(int idTeacher) {
        DAO dao = new DAO();
        String sql = "SELECT * FROM test WHERE idTest = ? ;";
        List<Test> listTest = new ArrayList<>();
        try {
            ResultSet rs = dao.Query(sql, idTeacher);
            while(rs.next()){
                int idTest = rs.getInt("idTest");
                String nameTest = rs.getString("nameTest");
                boolean typeTest = rs.getBoolean("typeTest");
                int time = rs.getInt("time");

                listTest.add(new Test(idTest, nameTest, typeTest, idTeacher, time));
            }

            return listTest;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Test> getAllTest() {
        DAO dao = new DAO();
        String sql = "SELECT * FROM test ;";
        List<Test> listTest = new ArrayList<>();
        try {
            ResultSet rs = dao.Query(sql);
            while(rs.next()){
                int idTest = rs.getInt("idTest");
                String nameTest = rs.getString("nameTest");
                boolean typeTest = rs.getBoolean("typeTest");
                int idTeacher = rs.getInt("idTeacher");
                int time = rs.getInt("time");

                listTest.add(new Test(idTest, nameTest, typeTest, idTeacher, time));
            }

            return listTest;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
 
   

    public boolean AddTestTaking(TestTaking testTaking){
        try{
            DAO dao = new DAO();
            String sql = "INSERT INTO testTaking VALUES(?,?,?,?)";
            int count = dao.Update(sql,
                    testTaking.getId(),
                    testTaking.getIdTest(),
                    testTaking.getTimeStart(),
                    testTaking.getTimeEnd());
            if(count > 0) return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
    public int getIdTestByIDTestTaking(String idTestTaking){
        DAO dao = new DAO();
        String sql = "SELECT * FROM testTaking WHERE id = ?  AND NOW() BETWEEN timeStart AND timeEnd;";
        try {
            ResultSet rs = dao.Query(sql, idTestTaking);
            rs.next();
            int idTest = rs.getInt("idTest");

            return idTest;
        } catch (SQLException | ClassNotFoundException e) {
            return -1;
        }
    }
    public List<Subject> getAllSubject(){
        DAO dao = new DAO();
        List<Subject> listSubject = new ArrayList<>();
        String sql = "SELECT * FROM subject;";

        try {
            ResultSet rs = dao.Query(sql);
            while(rs.next()){
                int idSubject = rs.getInt("idSubject");
                String nameSubject = rs.getString("nameSubject");
                listSubject.add(new Subject(idSubject, nameSubject));
            }
            return listSubject;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }
 public List<Test> getPublicTest(){
        DAO dao = new DAO();
        String sql = "SELECT * FROM test WHERE typeTest = 0 ;";
        List<Test> listTest = new ArrayList<>();
        try {
            ResultSet rs = dao.Query(sql);
            while(rs.next()){
                int idTest = rs.getInt("idTest");
                String nameTest = rs.getString("nameTest");
                boolean typeTest = rs.getBoolean("typeTest");
                int time = rs.getInt("time");
                int idTeacher = rs.getInt("idTeacher");
                listTest.add(new Test(idTest, nameTest, typeTest, idTeacher, time));
            }

            return listTest;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    public List<Test> getTestByIDSubject(int idSubject){
        DAO dao = new DAO();
        String sql = "SELECT * FROM test WHERE idSubject = ? AND typeTest = 0 ;";
        List<Test> listTest = new ArrayList<>();
        try {
            ResultSet rs = dao.Query(sql, idSubject);
            while(rs.next()){
                int idTest = rs.getInt("idTest");
                String nameTest = rs.getString("nameTest");
                boolean typeTest = rs.getBoolean("typeTest");
                int idTeacher = rs.getInt("idTeacher");
                int time = rs.getInt("time");
                listTest.add(new Test(idTest, nameTest, typeTest, idTeacher, time));
            }
            return listTest;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
