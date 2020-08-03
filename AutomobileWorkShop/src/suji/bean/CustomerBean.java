package suji.bean;

public class CustomerBean {
	String ticketnumber,ticketstatus,customername,customerid,vehicletype ,companyname ,vehiclemodel ,registernumber ,area ,pincode ,shopid ,dealerid ,mechanicid,fault,amount,deliverystatus,sparesreplaced;

	@Override
	public String toString() {
		return "CustomerBean [ticketnumber=" + ticketnumber + ", ticketstatus=" + ticketstatus + ", customername="
				+ customername + ", customerid=" + customerid + ", vehicletype=" + vehicletype + ", companyname="
				+ companyname + ", vehiclemodel=" + vehiclemodel + ", registernumber=" + registernumber + ", area="
				+ area + ", pincode=" + pincode + ", shopid=" + shopid + ", dealerid=" + dealerid + ", mechanicid="
				+ mechanicid + ", fault=" + fault + ", amount=" + amount + ", deliverystatus=" + deliverystatus
				+ ", sparesreplaced=" + sparesreplaced + "]";
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getCustomerid() {
		return customerid;
	}

	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}


	public String getTicketnumber() {
		return ticketnumber;
	}

	public void setTicketnumber(String ticketnumber) {
		this.ticketnumber = ticketnumber;
	}

	public String getTicketstatus() {
		return ticketstatus;
	}

	public void setTicketstatus(String ticketstatus) {
		this.ticketstatus = ticketstatus;
	}

	public String getVehicletype() {
		return vehicletype;
	}

	public void setVehicletype(String vehicletype) {
		this.vehicletype = vehicletype;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getVehiclemodel() {
		return vehiclemodel;
	}

	public void setVehiclemodel(String vehiclemodel) {
		this.vehiclemodel = vehiclemodel;
	}

	public String getRegisternumber() {
		return registernumber;
	}

	public void setRegisternumber(String registernumber) {
		this.registernumber = registernumber;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getShopid() {
		return shopid;
	}

	public void setShopid(String shopid) {
		this.shopid = shopid;
	}

	public String getDealerid() {
		return dealerid;
	}

	public void setDealerid(String dealerid) {
		this.dealerid = dealerid;
	}

	public String getMechanicid() {
		return mechanicid;
	}

	public void setMechanicid(String mechanicid) {
		this.mechanicid = mechanicid;
	}

	public String getFault() {
		return fault;
	}

	public void setFault(String fault) {
		this.fault = fault;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getDeliverystatus() {
		return deliverystatus;
	}

	public void setDeliverystatus(String deliverystatus) {
		this.deliverystatus = deliverystatus;
	}

	public String getSparesreplaced() {
		return sparesreplaced;
	}

	public void setSparesreplaced(String sparesreplaced) {
		this.sparesreplaced = sparesreplaced;
	}
}