package Model.DAO;

import Model.Bean.Teacher;
import Model.Bean.Test;
import Model.Bean.TestDetail;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class AdminDAO {
//    DAO dao = new DAO();

    public List<Teacher> getAllTeacher() throws SQLException, ClassNotFoundException {
        List<Teacher> result = new ArrayList<>();
        ResultSet rs = null;
        DAO daoTeacher = new DAO();

        String query = " SELECT \n" +
                "    account.idAccount, \n" +
                "    account.name, \n" +
                "    account.username, \n" +
                "    COUNT(test.idTest) AS numberOfTests\n" +
                "FROM account LEFT JOIN test \n" +
                "ON account.idAccount = test.idTeacher\n" +
                "WHERE account.role = 'teacher'\n" +
                "GROUP BY account.idAccount, account.name, account.username; ";
        rs = daoTeacher.Query(query);
        while(rs.next()){
            int idTeacher = rs.getInt("idAccount");
            String usernameTeacher = rs.getString("username");
            String nameTeacher = rs.getString("name");
            int numberOfTests = rs.getInt("numberOfTests");

            Teacher itemTeacher = new Teacher(idTeacher,usernameTeacher,nameTeacher,numberOfTests);
            result.add(itemTeacher);
        }
        return result;
    }

    public List<TestDetail> getListOfTests(int idgv) throws SQLException, ClassNotFoundException {
        List<TestDetail> result = new ArrayList<>();
        ResultSet rs = null;
        DAO daoTeacher = new DAO();

        String query =" select idTest,nameTest,subject.nameSubject,typeTest,time from test \n" +
                "join subject on test.idSubject = subject.idSubject\n" +
                "where idTeacher = ?; ";

        rs = daoTeacher.Query(query,idgv);
        while (rs.next()){

            int idTestDetail = rs.getInt("idTest");
            String nameTestDetail = rs.getString("nameTest");
             String nameSubjectDetail = rs.getString("nameSubject");
            String typeTestDetail = rs.getBoolean("typeTest") == true ? "private":"public";
             int idTeacherDetail = idgv;
            int timeDetail = rs.getInt("time");
            TestDetail testDetail = new TestDetail(idTestDetail,nameTestDetail,nameSubjectDetail,typeTestDetail,idTeacherDetail,timeDetail);
            result.add(testDetail);
        }

        return result;
    }

    public String getNameTeacherDAO(int idgv) throws SQLException, ClassNotFoundException {
        String result = "";
        ResultSet rs = null;
        DAO daoTeacher = new DAO();

        String query = "SELECT * FROM ACCOUNT WHERE role='teacher' and idAccount = ?;";
        rs = daoTeacher.Query(query,idgv);

        while(rs.next()){
            result = rs.getString("name");
            break;
        }
        return result;
    }

    public boolean updateNameTeacher(int idgv,String nameGV) throws SQLException {
        DAO daoTeacher = new DAO();
        String query = " UPDATE  ACCOUNT\n" +
                "SET name = ?\n" +
                "where idAccount = ?; ";
        int count = daoTeacher.Update(query,nameGV,idgv);
        if(count >0) return true;
        return false;
    }
    public boolean resetPassword(int IDGV) throws SQLException {
        DAO daoTeacher = new DAO();
        String query = " UPDATE ACCOUNT\n" +
                "SET password = '123456'\n" +
                "where role ='teacher' and idAccount = ?; ";
        int count = daoTeacher.Update(query,IDGV);
        if(count > 0) return true;
        else return false;
    }

    public boolean addTeacherDAO(String name,String username) throws SQLException {
        DAO daoTeacher = new DAO();
        String query = " INSERT INTO ACCOUNT(name,username,password,role) \n" +
                "VALUES (?,?,'123456','teacher'); ";
        int count = daoTeacher.Update(query,name,username);
        if(count > 0) return true;
        else return false;
    }

    public boolean deleteTeacher(int idgv) throws SQLException {
        DAO dao = new DAO();
        Connection connection = null;


        try{
            connection = DatabaseConnection.getConnection();
            connection.setAutoCommit(false);
            //Xóa trong questions

            String deleteQuestions = " DELETE FROM QUESTION WHERE idTest  IN " +
                    " ( SELECT idTest FROM test WHERE idTeacher = ? ); ";
            dao.Update(deleteQuestions, idgv);

            //Xóa trong historyTest
            String deleteHistory = " DELETE FROM HISTORYTEST WHERE idTest IN  " +
                    " ( SELECT idTest FROM test WHERE idTeacher = ? ); ";
            dao.Update(deleteHistory, idgv);

            //Xóa trong testtaking
            String deleteTestTaking = " DELETE FROM testtaking WHERE idTest IN " +
                    " ( SELECT idTest FROM test WHERE idTeacher = ? ); ";
            dao.Update(deleteTestTaking,idgv);

            //Xóa trong Test

            String deleteTests = " DELETE FROM TEST WHERE idTeacher = ? ; ";
            dao.Update(deleteTests,idgv);


            //Xóa trong account
            String deleteAccount = " DELETE FROM ACCOUNT WHERE idAccount = ? AND ROLE = 'teacher' ;";
            int rowsDeleted = dao.Update(deleteAccount,idgv);

            if(rowsDeleted ==0){
                connection.rollback();
                return false;
            }

            connection.commit();
            connection.setAutoCommit(true);
            return true;

        } catch (SQLException e) {
            if (connection != null) {
                connection.rollback();  // Rollback nếu có lỗi
            }
            throw new SQLException("Lỗi khi xóa giáo viên.", e);
        }
        finally {
            if (connection != null) {
                connection.setAutoCommit(true); // Đảm bảo luôn đặt lại AutoCommit
            }
        }


    }
}
