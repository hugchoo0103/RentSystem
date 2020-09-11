package pojo;

import java.io.Serializable;

public class rentPerson implements Serializable {
    private int userID;
    private String rentPersonNo;
    private String userName;
    private String sex;
    private String phone;
    private String homePhone;
    private String email;
    private String qq;
    private String cardID;
    private int houseID;
    private String recordDate;

    @Override
    public String toString() {
        return "rentPerson{" +
                "userID=" + userID +
                ", rentPersonNo='" + rentPersonNo + '\'' +
                ", userName='" + userName + '\'' +
                ", sex='" + sex + '\'' +
                ", phone='" + phone + '\'' +
                ", homePhone='" + homePhone + '\'' +
                ", email='" + email + '\'' +
                ", qq='" + qq + '\'' +
                ", cardID='" + cardID + '\'' +
                ", houseID=" + houseID +
                ", recordDate='" + recordDate + '\'' +
                '}';
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getRentPersonNo() {
        return rentPersonNo;
    }

    public void setRentPersonNo(String rentPersonNo) {
        this.rentPersonNo = rentPersonNo;
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

    public String getHomePhone() {
        return homePhone;
    }

    public void setHomePhone(String homePhone) {
        this.homePhone = homePhone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getCardID() {
        return cardID;
    }

    public void setCardID(String cardID) {
        this.cardID = cardID;
    }

    public int getHouseID() {
        return houseID;
    }

    public void setHouseID(int houseID) {
        this.houseID = houseID;
    }

    public String getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(String recordDate) {
        this.recordDate = recordDate;
    }
}
