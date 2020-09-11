package pojo;

import java.io.Serializable;

public class rentPerson implements Serializable {
    private int userId;
    //private String rentPersonNo;
    private String userName;
    private String sex;
    private String phone;
    //private String homePhone;
    private String email;
    //private String qq;
    //private String cardId;
    //private int houseId;
    //private String recordDate;


    @Override
    public String toString() {
        return "rentPerson{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", sex='" + sex + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

    public int getUserId() {
        return userId;
    }

    public void setUserID(int userID) {
        this.userId = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
