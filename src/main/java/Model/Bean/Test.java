package Model.Bean;

public class Test {
    private int idTest;
    private String nameTest;
    private boolean typeTest;
    private int idTeacher;
    private int time;

    public Test(int idTest, String nameTest, boolean typeTest, int idTeacher, int time) {
        this.idTest = idTest;
        this.nameTest = nameTest;
        this.typeTest = typeTest;
        this.idTeacher = idTeacher;
        this.time = time;
    }
    public Test(String nameTest, boolean typeTest, int idTeacher, int time) {
        this.nameTest = nameTest;
        this.typeTest = typeTest;
        this.idTeacher = idTeacher;
        this.time = time;
    }

    public int getIdTest() {
        return idTest;
    }

    public String getNameTest() {
        return nameTest;
    }

    public boolean isTypeTest() {
        return typeTest;
    }

    public int getIdTeacher() {
        return idTeacher;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public void setNameTest(String nameTest) {
        this.nameTest = nameTest;
    }

    public void setTypeTest(boolean typeTest) {
        this.typeTest = typeTest;
    }
}
