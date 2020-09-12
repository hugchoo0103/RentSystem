package pojo;

public class house {
    private int houseId;
    private String houseType;
    private int houseStatus;
    private float rentPrice;
    private String housRemark;

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

    public int getHouseState() {
        return houseStatus;
    }

    public void setHouseState(int houseStatus) {
        this.houseStatus = houseStatus;
    }

    public float getRentPrice() {
        return rentPrice;
    }

    public void setRentPrice(float rentPrice) {
        this.rentPrice = rentPrice;
    }

    public String getHousRemark() {
        return housRemark;
    }

    public void setHousRemark(String housRemark) {
        this.housRemark = housRemark;
    }

    @Override
    public String toString() {
        return "house{" +
                "houseId=" + houseId +
                ", houseType='" + houseType + '\'' +
                ", houseStatus=" + houseStatus +
                ", rentPrice=" + rentPrice +
                ", housRemark='" + housRemark + '\'' +
                '}';
    }
}
