package Model.BO;

import Model.Bean.HistoryStudent;
import Model.Bean.HistoryTest;
import Model.DAO.HistoryDAO;

import java.util.List;

public class HistoryBO {

    HistoryDAO historyDAO = new HistoryDAO();

    public boolean AddHistory(HistoryStudent historyStudent){
        return historyDAO.add(historyStudent);
    }

    public List<HistoryStudent> GetHistoryStudent(int idTest){
        return historyDAO.getListHistoryStudentByIDTest(idTest);
    }

    public List<HistoryTest> GetHistoryTest(int idTeacher){
        return historyDAO.GetHistoryTestByIDTeacher(idTeacher);
    }
}
