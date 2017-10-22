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
import com.wipro.srs.util.DBUtil;

public class RouteDAOImpl implements RouteDAO {
	static Session session;
	static {
		session = DBUtil.getSessionFactory().openSession();
	}
	@Override
	public String createShipRoute(RouteBean routebean) {
		Transaction transaction = null;

		try {
			if (routebean != null) {
				session.clear();
				transaction = session.beginTransaction();
				String routeID = generateRouteId(routebean.getSource(),routebean.getDestination());
				routebean.setRouteID(routeID);
				session.save(routebean);
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
	public int deleteShipRoute(ArrayList<String> routeID) {
		int index = 0;
		try {
			session.clear();
			Transaction transaction = session.beginTransaction();
			RouteBean routebean = new RouteBean();
			for (index = 0; index < routeID.size(); index++) {
				System.out.println(routeID.get(index));
				routebean.setRouteID(routeID.get(index));
				session.delete(routebean );
				transaction.commit();
				System.out.println("Route  deleted succesfully");

			}

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return index + 1;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<RouteBean> findAllRoute() {
		try {
			session.clear();
			Transaction transaction = session.beginTransaction();
			Query query = session.createQuery("from RouteBean");
			Iterator<RouteBean> iterator = query.iterate();

			transaction.commit();
			ArrayList<RouteBean> shipRoute = new ArrayList<RouteBean>();
			System.out.println(iterator);
			if (iterator != null) {
				while (iterator.hasNext()) {
					RouteBean shipRo = (RouteBean) iterator.next();
					shipRoute.add(shipRo);
					System.out.println(shipRo.getRouteID());
					System.out.println(shipRo.getSource());
					System.out.println(shipRo.getDestination());
					System.out.println(shipRo.getTravelDuration());
					System.out.println(shipRo.getFare());
					
					
				}
				return shipRoute;

			}
			return null;
		} catch (Exception e) {
			return null;
		}
		
	}

	@Override
	public RouteBean findByIDRoute(String routeID) {
		if (routeID != null) {
			Transaction transaction = null;

			try {
				session.clear();
				transaction = session.beginTransaction();
				RouteBean shipRo = (RouteBean) session.get(RouteBean.class,routeID);
				transaction.commit();

				System.out.println(shipRo.getRouteID());
				System.out.println(shipRo.getDestination());
				System.out.println(shipRo.getSource());
				System.out.println(shipRo.getTravelDuration());
				System.out.println(shipRo.getFare());
				return shipRo;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		} else {
			return null;
		}
		
		
	}

	@Override
	public boolean updateShipRoute(RouteBean routebean) {
		try {
			session.clear();
			System.out.println("Modify ShipSchedule details");
			Transaction transaction = session.beginTransaction();
			session.update(routebean);
			System.out.println("Modify ShipSchedule details");
			

			transaction.commit();
			return true;
		} catch (Exception exception) {

			exception.printStackTrace();
			return false;
		
			}
		}

	
	@SuppressWarnings("unchecked")
	public String generateRouteId(String source,String destination){
		try {
			session.clear();
			
			HibernateTemplate hibernateTemplate = new HibernateTemplate(DBUtil.getSessionFactory());
			@SuppressWarnings("rawtypes")
			Long id = (Long) hibernateTemplate.execute(new HibernateCallback()
			{
				@Override
				public Object doInHibernate(org.hibernate.Session arg0)
						throws HibernateException, SQLException {
					return session.createSQLQuery("select srs_seq_route_id.NEXTVAL as id from dual").addScalar("id", Hibernate.LONG).uniqueResult(); 
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
