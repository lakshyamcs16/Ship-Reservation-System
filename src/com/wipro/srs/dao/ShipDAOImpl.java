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

import com.wipro.srs.bean.PassengerBean;
import com.wipro.srs.bean.ShipBean;
import com.wipro.srs.util.DBUtil;

public class ShipDAOImpl implements ShipDAO {
	static Session session;
	static {
		session = DBUtil.getSessionFactory().openSession();
	}

	@Override
	public String createShip(ShipBean shipbean) {
		Transaction transaction = null;

		try {
			if (shipbean != null) {
				session.clear();
				transaction = session.beginTransaction();
				String shipID = generateShipId(shipbean.getShipName());
				shipbean.setShipID(shipID);
				session.save(shipbean);
				transaction.commit();
				return "SUCCESS";
			} else {
				return "FAIL";
			}
		}

		catch (Exception e) {
			e.printStackTrace();
			return "ERROR";
		}

	}

	@Override
	public int deleteShip(ArrayList<String> ShipId) {
		int index = 0;
		try {
			session.clear();
			Transaction transaction = session.beginTransaction();
			ShipBean shipbean = new ShipBean();
			for (index = 0; index < ShipId.size(); index++) {
				shipbean.setShipID(ShipId.get(index));
				session.delete(shipbean);
				transaction.commit();

			}

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return index + 1;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<ShipBean> findAll() {
		try {
			session.clear();
			Transaction transaction = session.beginTransaction();
			Query query = session.createQuery("from ShipBean");
			Iterator<ShipBean> iterator = query.iterate();

			transaction.commit();
			ArrayList<ShipBean> shipbean = new ArrayList<ShipBean>();
			System.out.println(iterator);
			if (iterator != null) {
				while (iterator.hasNext()) {
					ShipBean ship = (ShipBean) iterator.next();
					shipbean.add(ship);
					System.out.println(ship.getReservationCapacity());
					System.out.println(ship.getSeatingCapacity());
					System.out.println(ship.getShipID());
					System.out.println(ship.getShipName());

				}
				return shipbean;
			}
			return null;
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public ShipBean findByID(String ShipId ) {
		if (ShipId != null) {
			Transaction transaction= null;

			try {
				session.clear();
				transaction = session.beginTransaction();
				ShipBean ship = (ShipBean) session.get(ShipBean.class, ShipId);
				transaction.commit();

				System.out.println(ship.getReservationCapacity());
				System.out.println(ship.getSeatingCapacity());
				System.out.println(ship.getShipID());
				System.out.println(ship.getShipName());
				return ship;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		} else {
			return null;
		}

	}

	@Override
	public boolean updateShip(ShipBean Shipbean) {
		try {
			session.clear();
			System.out.println("Modify ship details");
			Transaction transaction = session.beginTransaction();
			
			session.update(Shipbean);
			System.out.println("Modify ship details");

			transaction.commit();
			return true;
		} catch (Exception exception) {

			exception.printStackTrace();
			return false;
		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<PassengerBean> findPasengersByShip(String scheduleId) {
		try {
			session.clear();
			
			Transaction transaction=null;
			transaction = session.beginTransaction();
			System.out.println(scheduleId);
			
	
			Query query1 = session.createQuery("from PassengerBean where scheduleID=?");
			query1.setString(0, scheduleId);
			
			Iterator<PassengerBean> iterator1=query1.iterate();
			ArrayList<PassengerBean> arrayList = new ArrayList<PassengerBean>();
			
			while(iterator1.hasNext()){
				PassengerBean passengerBean=new PassengerBean();
				
				passengerBean=(PassengerBean)iterator1.next();
				
				arrayList.add(passengerBean);
	
			}
		transaction.commit();
		return arrayList;
		
	
		
		} 
		catch (Exception exception) {

			exception.printStackTrace();
			return null;
		
			}
	}
	
	@SuppressWarnings("unchecked")
	public String generateShipId(String shipName){
		try {
			session.clear();
			
			HibernateTemplate hibernateTemplate = new HibernateTemplate(DBUtil.getSessionFactory());
			@SuppressWarnings("rawtypes")
			Long id = (Long) hibernateTemplate.execute(new HibernateCallback()
			{
				@Override
				public Object doInHibernate(org.hibernate.Session arg0)
						throws HibernateException, SQLException {
					return session.createSQLQuery("select srs_seq_ship_id.NEXTVAL as id from dual").addScalar("id", Hibernate.LONG).uniqueResult(); 
				}
			});
			 
			String name = shipName.substring(0,2).toUpperCase().concat(String.valueOf(id));
			return name;
		}catch(Exception exception) {
			exception.printStackTrace();
			return "FAIL";
		}
	}
	

	
}