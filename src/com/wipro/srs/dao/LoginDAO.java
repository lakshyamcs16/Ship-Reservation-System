package com.wipro.srs.dao;

//import java.util.ArrayList;

import com.wipro.srs.bean.CredentialsBean;
import com.wipro.srs.bean.ProfileBean;

public interface LoginDAO {

	
	String createCustomer(ProfileBean profileBean);
	//int deleteXYZ(ArrayList<String>);
	boolean updateCredential(CredentialsBean credentialsBean);
	CredentialsBean findByID(String userID);
	//ArrayList<BeanObject> findAll();
}
