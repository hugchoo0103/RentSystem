package pojo;

import java.io.Serializable;
import java.util.Date;

public class rentInfo implements Serializable {
    private int rentInfoId;
    private String rentInfoNo;
    private String empName;
    private int houseId;
    private int rentId;
    private String rentName;
    private String rentPhone;
    private int hireId;
    private String hireName;
    private String hirePhone;
    private float payMoney;
    private int rentTime;
    private Date rentStartDate;
    private Date rentEndDate;
    private Date payDate;
    private String remark;

    @Override
    public String toString() {
        return "rentInfo{" +
                "rentInfoId=" + rentInfoId +
                ", rentInfoNo='" + rentInfoNo + '\'' +
                ", empName='" + empName + '\'' +
                ", houseId=" + houseId +
                ", rentId=" + rentId +
                ", rentName='" + rentName + '\'' +
                ", rentPhone='" + rentPhone + '\'' +
                ", hireId=" + hireId +
                ", hireName='" + hireName + '\'' +
                ", hirePhone='" + hirePhone + '\'' +
                ", payMoney=" + payMoney +
                ", rentTime=" + rentTime +
                ", rentStartDate=" + rentStartDate +
                ", rentEndDate=" + rentEndDate +
                ", payDate=" + payDate +
                ", remark='" + remark + '\'' +
                '}';
    }

    public int getRentInfoId() {
        return rentInfoId;
    }

    public void setRentInfoId(int rentInfoId) {
        this.rentInfoId = rentInfoId;
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

    public int getHouseId() {
        return houseId;
    }

    public void setHouseId(int houseId) {
        this.houseId = houseId;
    }

    public int getRentId() {
        return rentId;
    }

    public void setRentId(int rentId) {
        this.rentId = rentId;
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

    public int getHireId() {
        return hireId;
    }

    public void setHireId(int hireId) {
        this.hireId = hireId;
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

    public Date getRentStartDate() {
        return rentStartDate;
    }

    public void setRentStartDate(Date rentStartDate) {
        this.rentStartDate = rentStartDate;
    }

    public Date getRentEndDate() {
        return rentEndDate;
    }

    public void setRentEndDate(Date rentEndDate) {
        this.rentEndDate = rentEndDate;
    }

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
