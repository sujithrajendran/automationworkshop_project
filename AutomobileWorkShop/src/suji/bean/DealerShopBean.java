package suji.bean;

public class DealerShopBean {
String  ShopName, OwnerName, ShopAddress, Pincode,Area, City, State,ShopContactNumber, ShopEmailId, RepairVehicleType,Dealerid,Shopid,DealerId,ShopId;

public String getArea() {
	return Area;
}

public void setArea(String area) {
	Area = area;
}

public String getDealerId() {
	return DealerId;
}

public void setDealerId(String dealerId) {
	DealerId = dealerId;
}

public String getShopId() {
	return ShopId;
}

public void setShopId(String shopId) {
	ShopId = shopId;
}

public String getDealerid() {
	return Dealerid;
}

public void setDealerid(String dealerid) {
	Dealerid = dealerid;
}

public String getShopid() {
	return Shopid;
}

public void setShopid(String shopid) {
	Shopid = shopid;
}

@Override
public String toString() {
	return "Dealer [ShopName=" + ShopName + ", OwnerName=" + OwnerName + ", ShopAddress=" + ShopAddress + ", Pincode="
			+ Pincode + ", City=" + City + ", State=" + State + ", ShopContactNumber=" + ShopContactNumber
			+ ", ShopEmailId=" + ShopEmailId + ", RepairVehicleType=" + RepairVehicleType + ", Dealerid=" + Dealerid
			+ ", Shopid=" + Shopid + ", DealerId=" + DealerId + ", ShopId=" + ShopId + "]";
}

public String getShopName() {
	return ShopName;
}

public void setShopName(String shopName) {
	ShopName = shopName;
}

public String getOwnerName() {
	return OwnerName;
}

public void setOwnerName(String ownerName) {
	OwnerName = ownerName;
}

public String getShopAddress() {
	return ShopAddress;
}

public void setShopAddress(String shopAddress) {
	ShopAddress = shopAddress;
}

public String getPincode() {
	return Pincode;
}

public void setPincode(String pincode) {
	Pincode = pincode;
}

public String getCity() {
	return City;
}

public void setCity(String city) {
	City = city;
}

public String getState() {
	return State;
}

public void setState(String state) {
	State = state;
}

public String getShopContactNumber() {
	return ShopContactNumber;
}

public void setShopContactNumber(String shopContactNumber) {
	ShopContactNumber = shopContactNumber;
}

public String getShopEmailId() {
	return ShopEmailId;
}

public void setShopEmailId(String shopEmailId) {
	ShopEmailId = shopEmailId;
}

public String getRepairVehicleType() {
	return RepairVehicleType;
}

public void setRepairVehicleType(String RepairVehicleType) {
	this.RepairVehicleType = RepairVehicleType;
}
}
