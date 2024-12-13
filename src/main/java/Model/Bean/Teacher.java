package Model.Bean;

public class Teacher {
    private int idGV;
    private String usernameGV;
    private String nameGV;
    private int numberOfTests;

    public Teacher(int idGV, String usernameGV, String nameGV, int numberOfTests) {
        this.idGV = idGV;
        this.usernameGV = usernameGV;
        this.nameGV = nameGV;
        this.numberOfTests = numberOfTests;
    }

    public int getIdGV() {
        return idGV;
    }

    public void setIdGV(int idGV) {
        this.idGV = idGV;
    }

    public String getUsernameGV() {
        return usernameGV;
    }

    public void setUsernameGV(String usernameGV) {
        this.usernameGV = usernameGV;
    }

    public String getNameGV() {
        return nameGV;
    }

    public void setNameGV(String nameGV) {
        this.nameGV = nameGV;
    }

    public int getNumberOfTests() {
        return numberOfTests;
    }

    public void setNumberOfTests(int numberOfTests) {
        this.numberOfTests = numberOfTests;
    }
}
