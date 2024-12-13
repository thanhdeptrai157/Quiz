package Model.BO;

import Model.Bean.Teacher;
import Model.Bean.Test;
import Model.Bean.TestDetail;
import Model.DAO.AdminDAO;

import java.sql.SQLException;
import java.util.*;


public class AdminBO {
    AdminDAO adminDAO = new AdminDAO();

    public List<Teacher> getListTeacherBO() throws SQLException, ClassNotFoundException {
        return adminDAO.getAllTeacher();
    }

    public List<TestDetail> getListOfTestsBO(int idgv) throws SQLException, ClassNotFoundException {
        return  adminDAO.getListOfTests(idgv);
    }
}
