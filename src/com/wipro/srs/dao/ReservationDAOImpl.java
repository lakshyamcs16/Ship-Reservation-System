package com.wipro.srs.dao;

import java.sql.SQLException;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.wipro.srs.bean.ReservationBean;
import com.wipro.srs.util.DBUtil;

public class ReservationDAOImpl implements ReservationDAO{

	static Session session;
	static {
		session = DBUtil.getSessionFactory().openSession();
	}
	@Override
	public ReservationBean findByID(String reservationId) {
		if (reservationId != null) {
			Transaction transaction= null;

			try {
				session.clear();
				transaction = session.beginTransaction();
				ReservationBean reservation = (ReservationBean) session.get(ReservationBean.class, reservationId);
				transaction.commit();

				return reservation;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		} else {
			return null;
		}

	}
	
	@SuppressWarnings("unchecked")
	public String generateReservationId(String source, String destination){
		try {
			session.clear();
			
			HibernateTemplate hibernateTemplate = new HibernateTemplate(DBUtil.getSessionFactory());
			@SuppressWarnings("rawtypes")
			Long id = (Long) hibernateTemplate.execute(new HibernateCallback()
			{
				@Override
				public Object doInHibernate(org.hibernate.Session arg0)
						throws HibernateException, SQLException {
					return session.createSQLQuery("select srs_seq_reservation_id.NEXTVAL as id from dual").addScalar("id", Hibernate.LONG).uniqueResult(); 
				}
			});
			String initialSource =  source.substring(0,2).toUpperCase();
			String initialDestination = destination.substring(0, 2).toUpperCase();
			String name = initialSource.concat(initialDestination).concat(String.valueOf(id));
			return name;
		}catch(Exception exception) {
			exception.printStackTrace();
			return "FAIL";
		}
	}
}
