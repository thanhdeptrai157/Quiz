package Model.BO;

import Model.Bean.Subject;
import Model.Bean.Test;
import Model.Bean.TestTaking;
import Model.DAO.TestDAO;

import java.util.List;
import java.sql.Timestamp;
import java.util.List;
import java.util.Random;


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
        return testDAO.getTestById(id);
    }
    public List<Test> getPublicTestList(){
        TestDAO testDAO = new TestDAO();
        return testDAO.getPublicTest();
    }

    public List<Subject> getAllSubject(){
        TestDAO testDAO = new TestDAO();
        return testDAO.getAllSubject();
    }

    public List<Test> getTestByIDSubject(int idSubject){
        TestDAO testDAO = new TestDAO();
        return testDAO.getTestByIDSubject(idSubject);
    }

    public int GetIDTestByIDTestTaking(String TestTaking){
        TestDAO testDAO = new TestDAO();
        return testDAO.getIdTestByIDTestTaking(TestTaking);
    }

    public boolean AddTestTaking(int idTest, String timeStart, String timeEnd){
        TestDAO testDAO = new TestDAO();
        String id = generateRandomString(10);

        String formattedDateTimeStart = timeStart.replace("T", " ") + ":00";
        Timestamp timestampStart = Timestamp.valueOf(formattedDateTimeStart);

        String formattedDateTimeEnd = timeEnd.replace("T", " ") + ":00";
        Timestamp timestampEnd = Timestamp.valueOf(formattedDateTimeEnd);

        TestTaking testTaking = new TestTaking(id, idTest, timestampStart, timestampEnd);
        return testDAO.AddTestTaking(testTaking);
    }

    public static String generateRandomString(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuilder result = new StringBuilder();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            result.append(characters.charAt(index));
        }
        return result.toString();
    }

}
