package pojo;

import java.io.Serializable;

public class house implements Serializable {
    private int houseId;
    private String houseType;
    private int houseStatus;
    private float rentPrice;
    private String houseRemark;

    public int getHouseId() {
        return houseId;
    }

    public void setHouseId(int houseId) {
        this.houseId = houseId;
    }

    public String getHouseType() {
        return houseType;
    }

    public void setHouseType(String houseType) {
        this.houseType = houseType;
    }

    public int getHouseStatus() {
        return houseStatus;
    }

    public void setHouseStatus(int houseStatus) {
        this.houseStatus = houseStatus;
    }

    public float getRentPrice() {
        return rentPrice;
    }

    public void setRentPrice(float rentPrice) {
        this.rentPrice = rentPrice;
    }

    public String getHousRemark() {
        return houseRemark;
    }

    public void setHousRemark(String housRemark) {
        this.houseRemark = housRemark;
    }

    @Override
    public String toString() {
        return "house{" +
                "houseId=" + houseId +
                ", houseType='" + houseType + '\'' +
                ", houseStatus=" + houseStatus +
                ", rentPrice=" + rentPrice +
                ", housRemark='" + houseRemark + '\'' +
                '}';
    }
}
