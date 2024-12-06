package Model.BO;

import Model.Bean.Test;
import Model.DAO.TestDAO;

public class TestBO {
    public void insertTest(Test test){
        TestDAO testDAO = new TestDAO();
        testDAO.insertTest(test);
    }
    public int getMaxIdTest(){
        TestDAO testDAO = new TestDAO();
        return testDAO.getMaxIdTest();
    }

    public Test getTestById(int id){
        TestDAO testDAO = new TestDAO();
        return testDAO.GetTestById(id);
    }

}
