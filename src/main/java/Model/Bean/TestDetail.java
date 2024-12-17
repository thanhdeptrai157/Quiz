package Model.Bean;

public class TestDetail {

    private int idTestDetail;
    private String nameTestDetail;
    private String nameSubjectDetail;
    private String typeTestDetail;
    private int idTeacherDetail;
    private int timeDetail;


    public TestDetail(int idTestDetail, String nameTestDetail, String nameSubjectDetail, String typeTestDetail, int idTeacherDetail, int timeDetail) {
        this.idTestDetail = idTestDetail;
        this.nameTestDetail = nameTestDetail;
        this.nameSubjectDetail = nameSubjectDetail;
        this.typeTestDetail = typeTestDetail;
        this.idTeacherDetail = idTeacherDetail;
        this.timeDetail = timeDetail;
    }

    public int getIdTestDetail() {
        return idTestDetail;
    }

    public void setIdTestDetail(int idTestDetail) {
        this.idTestDetail = idTestDetail;
    }

    public String getNameTestDetail() {
        return nameTestDetail;
    }

    public void setNameTestDetail(String nameTestDetail) {
        this.nameTestDetail = nameTestDetail;
    }

    public String getNameSubjectDetail() {
        return nameSubjectDetail;
    }

    public void setNameSubjectDetail(String nameSubjectDetail) {
        this.nameSubjectDetail = nameSubjectDetail;
    }

    public String getTypeTestDetail() {
        return typeTestDetail;
    }

    public void setTypeTestDetail(String typeTestDetail) {
        this.typeTestDetail = typeTestDetail;
    }

    public int getIdTeacherDetail() {
        return idTeacherDetail;
    }

    public void setIdTeacherDetail(int idTeacherDetail) {
        this.idTeacherDetail = idTeacherDetail;
    }

    public int getTimeDetail() {
        return timeDetail;
    }

    public void setTimeDetail(int timeDetail) {
        this.timeDetail = timeDetail;
    }
}
