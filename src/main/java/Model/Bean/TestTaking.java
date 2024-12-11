package Model.Bean;

import java.sql.Date;
import java.sql.Timestamp;

public class TestTaking {
    private String id;
    private int idTest;
    private Timestamp timeStart;
    private Timestamp timeEnd;

    public TestTaking(String id, int idTest, Timestamp timeStart, Timestamp timeEnd) {
        this.id = id;
        this.idTest = idTest;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getIdTest() {
        return idTest;
    }

    public void setIdTest(int idTest) {
        this.idTest = idTest;
    }

    public Timestamp getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(Timestamp timeStart) {
        this.timeStart = timeStart;
    }

    public Timestamp getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(Timestamp timeEnd) {
        this.timeEnd = timeEnd;
    }
}
