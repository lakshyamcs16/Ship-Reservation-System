package com.wipro.srs.util;


import com.wipro.srs.dao.LoginDAOImpl;
import com.wipro.srs.bean.CredentialsBean;

public class AuthenticationImpl implements Authentication {

	@Override
	public boolean authenticate(CredentialsBean credentialsBean) {
		LoginDAOImpl impl=new LoginDAOImpl();
		try{
		CredentialsBean newcredentialsBean=impl.findByID(credentialsBean.getUserID());
		if (newcredentialsBean.getPassword().equals(credentialsBean
						.getPassword())) {
			return true;
		} else {
			return false;
		}
		} catch (NullPointerException eNPExc) {
			return false;
		}
	}

	@Override
	public String authorize(String userId)throws NullPointerException  {
		CredentialsBean credentialsBean;
		if(userId!=null){
		LoginDAOImpl loginDAOImpl=new LoginDAOImpl();
		try{
			credentialsBean=loginDAOImpl.findByID(userId);
		} catch (NullPointerException eNPExc) {
			return "false";
		}
		if(credentialsBean!=null){
			return "";
		} else {
			return "";
		}
		} else {

		return "";
		}
	
		
	}

	@Override
	public boolean changeLoginStatus(CredentialsBean credentialsBean,
			int loginStatus) {
		try{
		if(credentialsBean!=null){
		LoginDAOImpl impl=new LoginDAOImpl();
		credentialsBean.setLoginStatus(loginStatus);
		
		return impl.updateCredential(credentialsBean);
		}else{

		return false;
		}
		} catch (NullPointerException eNPExc) {
			return false;
		}
	}
	
	@Override
	public boolean forgotPassword(String userID, String newPassword) {
		if (userID != null) {

			LoginDAOImpl loginDAOImpl = new LoginDAOImpl();
			CredentialsBean credentialsBean = loginDAOImpl.findByID(userID);

			if(credentialsBean!=null){
				credentialsBean.setPassword(newPassword);
			}else{
				return false;
			}

			return loginDAOImpl.updateCredential(credentialsBean);
		}
		return false;
	}

}
