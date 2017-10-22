package com.wipro.srs.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.wipro.srs.bean.RouteBean;
import com.wipro.srs.bean.ScheduleBean;
import com.wipro.srs.util.DBUtil;

public class ScheduleDAOImpl implements ScheduleDAO {
	static Session session;
	static {
		session = DBUtil.getSessionFactory().openSession();
	}
	@Override
	public String createShipSchedule(ScheduleBean schedulebean) {
		Transaction transaction = null;

		try {
			if (schedulebean != null) {
				
				session.clear();
				transaction = session.beginTransaction();
				RouteDAOImpl routeDAOImpl = new RouteDAOImpl();
				RouteBean routeBean = routeDAOImpl.findByIDRoute(schedulebean.getRouteID());
				String scheduleID = generateScheduleId(routeBean.getSource(),routeBean.getDestination());
				schedulebean.setScheduleID(scheduleID);
				session.save(schedulebean);
				transaction.commit();
				return "SUCCESS";
			} else {
				return "FAIL";
			}
		}

		catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			return "ERROR";
		}

		
	}

	@Override
	public int deleteShipSchedule(ArrayList<String> ScheduleID) {
		int i = 0;
		try {
			session.clear();
			Transaction transaction = session.beginTransaction();
			ScheduleBean schedulebean = new ScheduleBean();
			for (i = 0; i < ScheduleID.size(); i++) {
				System.out.println(ScheduleID.get(i));
				schedulebean.setScheduleID(ScheduleID.get(i));
				session.delete(schedulebean);
				transaction.commit();
				System.out.println("Schedule deleted succesfully");

			}

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return i + 1;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<ScheduleBean> findAllSchedule() {
		try {
			session.clear();
			Transaction transaction = session.beginTransaction();
			Query query = session.createQuery("from ScheduleBean");
			Iterator<ScheduleBean> iterator = query.iterate();

			transaction.commit();
			ArrayList<ScheduleBean> shipSc = new ArrayList<ScheduleBean>();
			System.out.println(iterator);
			if (iterator != null) {
				while (iterator.hasNext()) {
					ScheduleBean shipSchedule = (ScheduleBean) iterator.next();
					shipSc.add(shipSchedule);
					System.out.println(shipSchedule.getRouteID());
					System.out.println(shipSchedule.getScheduleID());
					System.out.println(shipSchedule.getShipID());
					System.out.println(shipSchedule.getStartDate());
					
				}
				return shipSc;

			}
			return null;
		} catch (Exception e) {
			return null;
		}
		
	}

	@Override
	public ScheduleBean findByIDSchedule(String scheduleID) {
		if (scheduleID != null) {
			Transaction transaction = null;

			try {
				session.clear();
				transaction = session.beginTransaction();
				ScheduleBean shipSc = (ScheduleBean) session.get(ScheduleBean.class,scheduleID);
				transaction.commit();

				System.out.println(shipSc.getRouteID());
				System.out.println(shipSc.getScheduleID());
				System.out.println(shipSc.getShipID());
				System.out.println(shipSc.getStartDate());
				return shipSc;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		} else {
			return null;
		}
		
	}

	@Override
	public boolean updateShipSchedule(ScheduleBean schedulebean) {
		try {
			session.clear();
			System.out.println("Modify ShipSchedule details");
			Transaction transaction = session.beginTransaction();
			session.update(schedulebean);
			System.out.println("Modify ShipSchedule details");
			

			transaction.commit();
			return true;
		} catch (Exception exception) {

			exception.printStackTrace();
			return false;
		}

		
	}

	@SuppressWarnings("unchecked")
	public String generateScheduleId(String source, String destination){
		try {
			session.clear();
			
			HibernateTemplate hibernateTemplate = new HibernateTemplate(DBUtil.getSessionFactory());
			@SuppressWarnings("rawtypes")
			Long id = (Long) hibernateTemplate.execute(new HibernateCallback()
			{
				@Override
				public Object doInHibernate(org.hibernate.Session arg0)
						throws HibernateException, SQLException {
					return session.createSQLQuery("select srs_seq_schedule_id.NEXTVAL as id from dual").addScalar("id", Hibernate.LONG).uniqueResult(); 
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
