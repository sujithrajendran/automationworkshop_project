package suji.bean;

public class UserBean {
	String FirstName,LastName,MobileNumber,Address,Gender,EmailID,Password,ConfirmPassword,SignupMode,SecurityQuestion,SecurityAnswer,id;
	public String getFirstName() {
		return FirstName;
	}

	public void setFirstName(String firstName) {
		FirstName = firstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String lastName) {
		LastName = lastName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "User1 [FirstName=" + FirstName + ", LastName=" + LastName + ", MobileNumber=" + MobileNumber
				+ ", Address=" + Address + ", Gender=" + Gender + ", EmailID=" + EmailID + ", Password=" + Password
				+ ", ConfirmPassword=" + ConfirmPassword + ", SignupMode=" + SignupMode + ", SecurityQuestion="
				+ SecurityQuestion + ", SecurityAnswer=" + SecurityAnswer + ", id=" + id + "]";
	}

	public String getSecurityAnswer() {
		return SecurityAnswer;
	}


	public void setSecurityAnswer(String securityAnswer) {
		SecurityAnswer = securityAnswer;
	}
	public String getMobileNumber() {
		return MobileNumber;
	}

	public void setMobileNumber(String mobilenumber) {
		MobileNumber = mobilenumber;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getGender() {
		return Gender;
	}

	public void setGender(String gender) {
		Gender = gender;
	}

	public String getEmailID() {
		return EmailID;
	}

	public void setEmailID(String emailID) {
		EmailID = emailID;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getConfirmPassword() {
		return ConfirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		ConfirmPassword = confirmPassword;
	}

	public String getSignupMode() {
		return SignupMode;
	}

	public void setSignupMode(String signupMode) {
		SignupMode = signupMode;
	}

	public String getSecurityQuestion() {
		return SecurityQuestion;
	}

	public void setSecurityQuestion(String securityQuestion) {
		SecurityQuestion = securityQuestion;
	}


	
}
