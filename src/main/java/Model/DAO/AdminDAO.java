package Model.DAO;

import Model.Bean.Teacher;
import Model.Bean.Test;
import Model.Bean.TestDetail;

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
            String typeTestDetail = rs.getBoolean("typeTest") == true ? "public":"private";
             int idTeacherDetail = idgv;
            int timeDetail = rs.getInt("time");
            TestDetail testDetail = new TestDetail(idTestDetail,nameTestDetail,nameSubjectDetail,typeTestDetail,idTeacherDetail,timeDetail);
            result.add(testDetail);
        }

        return result;
    }
}
