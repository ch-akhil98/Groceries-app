package com.app.service;

import com.app.beans.UserBean;

public interface UserService {

	public String registerUser(String userName, Long mobileNo, String emailId, String address, int pinCode,
			String password);

	public String registerUser(UserBean user);

	public boolean isRegistered(String emailId);

	public String isValidCredential(String emailId, String password);

	public UserBean getUserDetails(String emailId, String password);

}
