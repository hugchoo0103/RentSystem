package pojo;

import java.io.Serializable;
import java.io.StringReader;

public class rentInfo implements Serializable {
    private int rentInfoID;
    private String rentInfoNo;
    private String empName;
    private int houseID;
    private int rentID;
    private String rentName;
    private String rentPhone;
    private int hireID;
    private String hireName;
    private String hirePhone;
    private float payMoney;
    private int rentTime;
    private String rentStartDate;
    private String rentEndDate;
    private String payDate;
    private String remark;

    @Override
    public String toString() {
        return "rentInfo{" +
                "rentInfoID=" + rentInfoID +
                ", rentInfoNo='" + rentInfoNo + '\'' +
                ", empName='" + empName + '\'' +
                ", houseID=" + houseID +
                ", rentID=" + rentID +
                ", rentName='" + rentName + '\'' +
                ", rentPhone='" + rentPhone + '\'' +
                ", hireID=" + hireID +
                ", hireName='" + hireName + '\'' +
                ", hirePhone='" + hirePhone + '\'' +
                ", payMoney=" + payMoney +
                ", rentTime=" + rentTime +
                ", rentStartDate='" + rentStartDate + '\'' +
                ", rentEndDate='" + rentEndDate + '\'' +
                ", payDate='" + payDate + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }

    public int getRentInfoID() {
        return rentInfoID;
    }

    public void setRentInfoID(int rentInfoID) {
        this.rentInfoID = rentInfoID;
    }

    public String getRentInfoNo() {
        return rentInfoNo;
    }

    public void setRentInfoNo(String rentInfoNo) {
        this.rentInfoNo = rentInfoNo;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public int getHouseID() {
        return houseID;
    }

    public void setHouseID(int houseID) {
        this.houseID = houseID;
    }

    public int getRentID() {
        return rentID;
    }

    public void setRentID(int rentID) {
        this.rentID = rentID;
    }

    public String getRentName() {
        return rentName;
    }

    public void setRentName(String rentName) {
        this.rentName = rentName;
    }

    public String getRentPhone() {
        return rentPhone;
    }

    public void setRentPhone(String rentPhone) {
        this.rentPhone = rentPhone;
    }

    public int getHireID() {
        return hireID;
    }

    public void setHireID(int hireID) {
        this.hireID = hireID;
    }

    public String getHireName() {
        return hireName;
    }

    public void setHireName(String hireName) {
        this.hireName = hireName;
    }

    public String getHirePhone() {
        return hirePhone;
    }

    public void setHirePhone(String hirePhone) {
        this.hirePhone = hirePhone;
    }

    public float getPayMoney() {
        return payMoney;
    }

    public void setPayMoney(float payMoney) {
        this.payMoney = payMoney;
    }

    public int getRentTime() {
        return rentTime;
    }

    public void setRentTime(int rentTime) {
        this.rentTime = rentTime;
    }

    public String getRentStartDate() {
        return rentStartDate;
    }

    public void setRentStartDate(String rentStartDate) {
        this.rentStartDate = rentStartDate;
    }

    public String getRentEndDate() {
        return rentEndDate;
    }

    public void setRentEndDate(String rentEndDate) {
        this.rentEndDate = rentEndDate;
    }

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
