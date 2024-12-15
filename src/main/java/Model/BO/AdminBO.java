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

    public String getNameTeacherByIdBO(int idgv) throws SQLException, ClassNotFoundException {
        return adminDAO.getNameTeacherDAO(idgv);
    }
    public boolean editNameTeacherBO(int idgv,String nameTeacher) throws SQLException {
        return adminDAO.updateNameTeacher(idgv,nameTeacher);
    }

    public boolean resetPasswordBO(int idGV) throws SQLException, ClassNotFoundException {
        return adminDAO.resetPassword(idGV);
    }
    public boolean addTeacherBO(String name,String username) throws SQLException {
        return adminDAO.addTeacherDAO(name,username);
    }
    public boolean deleteTeacherBO(int idgv) throws SQLException {
        return adminDAO.deleteTeacher(idgv);
    }
}
