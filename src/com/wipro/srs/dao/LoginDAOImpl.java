package com.wipro.srs.dao;



import java.sql.SQLException;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.wipro.srs.bean.CredentialsBean;
import com.wipro.srs.bean.ProfileBean;
import com.wipro.srs.util.DBUtil;

public class LoginDAOImpl implements LoginDAO {

	
	static Session session;
	static {
		session = DBUtil.getSessionFactory().openSession();
	}
	
	@Override
	public CredentialsBean findByID(String userID) {
		try{
		if (userID != null) {

			session.clear();
			Transaction tx = session.beginTransaction();
			CredentialsBean newcredentialsBean = (CredentialsBean) session.get(
					CredentialsBean.class, userID);
			tx.commit();
		return newcredentialsBean;
		} else {
			return null;

		}
		}catch (NullPointerException eNPExc){
			return null;
		}
	}

	@Override
	public boolean updateCredential(CredentialsBean credentialsBean) {
		try{
		if(credentialsBean!=null){
			session.clear();
			Transaction tx = session.beginTransaction();
			session.saveOrUpdate(credentialsBean);
			tx.commit();
		return true;
		
		} else {
		
		
		return false;
		}
		}catch (NullPointerException eNPExc){
			return false;
		}
	}

	@Override
	public String createCustomer(ProfileBean profileBean) {

		try{
		if (profileBean != null) {

			session.clear();
			Transaction tx = session.beginTransaction();
			String customerID = generateCustomerId(profileBean.getFirstName());
			profileBean.setUserID(customerID);
			
			CredentialsBean credentialsBean = new CredentialsBean();
			credentialsBean.setUserID(profileBean.getUserID());
			credentialsBean.setLoginStatus(0);
			credentialsBean.setPassword(profileBean.getPassword());
			credentialsBean.setUserType("C");
			
			session.saveOrUpdate(credentialsBean);
			session.saveOrUpdate(profileBean);
			tx.commit();
			
		return profileBean.getUserID();
		} else {
			return "FAIL";

		}
		}catch (NullPointerException eNPExc){
			return "FAIL";
		}
		
	}
	
	
	@SuppressWarnings("unchecked")
	public String generateCustomerId(String customerName){
		try {
			session.clear();
			
			HibernateTemplate hibernateTemplate = new HibernateTemplate(DBUtil.getSessionFactory());
			@SuppressWarnings("rawtypes")
			Long id = (Long) hibernateTemplate.execute(new HibernateCallback()
			{
				@Override
				public Object doInHibernate(org.hibernate.Session arg0)
						throws HibernateException, SQLException {
					return session.createSQLQuery("select srs_seq_user_id.NEXTVAL as id from dual").addScalar("id", Hibernate.LONG).uniqueResult(); 
				}
			});
			 
			String name = customerName.substring(0,2).toUpperCase().concat(String.valueOf(id));
			return name;
		}catch(Exception exception) {
			exception.printStackTrace();
			return "FAIL";
		}
	}

}
