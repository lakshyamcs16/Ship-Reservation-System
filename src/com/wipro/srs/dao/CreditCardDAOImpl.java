package com.wipro.srs.dao;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;

import com.wipro.srs.bean.CreditCardBean;
import com.wipro.srs.util.DBUtil;

public class CreditCardDAOImpl implements CreditCardDAO{

	static Session session;
	static {
		session = DBUtil.getSessionFactory().openSession();
	}
	
		
	
	@Override
	public CreditCardBean findByIDCreditCardNumber(String creditCardNumber) {
		if (creditCardNumber != null) {
			Transaction transaction = null;

			try {
				session.clear();
				transaction = session.beginTransaction();
				CreditCardBean creditCardBean = (CreditCardBean) session.get(CreditCardBean.class,"20");
				transaction.commit();
				return creditCardBean;
			} catch (Exception e) {
				e.printStackTrace();
				transaction.rollback();
				return null;
			}
		} else {
			return null;
		
	}

}
}
