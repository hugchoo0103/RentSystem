package pojo;

public class hirePerson {
    private int hireId;
    private String userName;
    private String sex;
    private String phone;
    private String email;

    public int getHireId() {
        return hireId;
    }

    public String getUserName() {
        return userName;
    }

    public String getSex() {
        return sex;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public void setHireId(int hireId) {
        this.hireId = hireId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "hirePerson{" +
                "hireId=" + hireId +
                ", userName='" + userName + '\'' +
                ", sex='" + sex + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
