package com.techelevator.model;

public interface UserDAO {

	public void saveUser(String userName, String password);

	public boolean searchForUsernameAndPassword(String userName, String password);

	public void updatePassword(String userName, String password, String newPassword);

	public Object getUserByUserName(String userName);

	public String getRoleByUserName(String userName);

	void updateRole(String userName, String role);

}
