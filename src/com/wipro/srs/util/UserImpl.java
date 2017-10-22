package com.wipro.srs.util;


import com.wipro.srs.bean.CredentialsBean;
import com.wipro.srs.bean.ProfileBean;
import com.wipro.srs.dao.LoginDAOImpl;

public class UserImpl implements User {

	@Override
	public String changePassword(CredentialsBean credentialsBean,
			String newPassword) {
		if(credentialsBean!=null && newPassword!=null){
		LoginDAOImpl loginDAO_Impl=new LoginDAOImpl();
		credentialsBean.setPassword(newPassword);
		boolean value=loginDAO_Impl.updateCredential(credentialsBean);
		if(value){
			return "SUCCESS";
		} else {
			return "FAIL";
		}
		}else{
		return "INVALID";
		}
	}

	@Override
	public String login(CredentialsBean credentialsBean) {
		if(credentialsBean!=null){
			LoginDAOImpl impl=new LoginDAOImpl();
			CredentialsBean newcredentialsBean=impl.findByID(credentialsBean.getUserID());
			return newcredentialsBean.getUserType();
			} else {
				return "INVALID";
			}
		
	}

	@Override
	public boolean logout(String userId) {
		if(userId!=null) {
		AuthenticationImpl authenticationImpl=new AuthenticationImpl();
		LoginDAOImpl impl=new LoginDAOImpl();
		CredentialsBean newcredentialsBean=impl.findByID(userId);
		 return authenticationImpl.changeLoginStatus(newcredentialsBean, 0);
		} else {
		return false;
		}
	}

	@Override
	public String register(ProfileBean profileBean) {
	if(profileBean!=null) {
		LoginDAOImpl impl=new LoginDAOImpl();
		System.out.println("s");
		return impl.createCustomer(profileBean);
	} else {
		System.out.println("f");

	return "FAIL";
	}
}
	
}
