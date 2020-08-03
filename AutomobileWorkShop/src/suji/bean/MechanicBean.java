package suji.bean;

public class MechanicBean {

	String DealerId,ShopId,MechanicId,MechanicName,PhoneNumber,MailId,Age,Address,Pincode,State;

	@Override
	public String toString() {
		return "MechanicDetails [DealerId=" + DealerId + ", ShopId=" + ShopId + ", MechanicId=" + MechanicId
				+ ", MechanicName=" + MechanicName + ", PhoneNumber=" + PhoneNumber + ", MailId=" + MailId + ", Age="
				+ Age + ", Address=" + Address + ", Pincode=" + Pincode + ", State=" + State + "]";
	}

	public String getDealerId() {
		return DealerId;
	}

	public void setDealerId(String DealerId) {
		DealerId = DealerId;
	}

	public String getShopId() {
		return ShopId;
	}

	public void setShopId(String shopId) {
		ShopId = shopId;
	}

	public String getMechanicId() {
		return MechanicId;
	}

	public void setMechanicId(String mechanicid) {
		MechanicId = mechanicid;
	}

	public String getMechanicName() {
		return MechanicName;
	}

	public void setMechanicName(String mechanicName) {
		MechanicName = mechanicName;
	}

	public String getPhoneNumber() {
		return PhoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}

	public String getMailId() {
		return MailId;
	}

	public void setMailId(String mailId) {
		MailId = mailId;
	}

	public String getAge() {
		return Age;
	}

	public void setAge(String age) {
		Age = age;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getPincode() {
		return Pincode;
	}

	public void setPincode(String pincode) {
		Pincode = pincode;
	}

	public String getState() {
		return State;
	}

	public void setState(String state) {
		State = state;
	}
}
