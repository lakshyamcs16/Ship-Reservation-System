package com.wipro.srs.service;

//import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.wipro.srs.bean.CredentialsBean;
import com.wipro.srs.bean.CreditCardBean;
import com.wipro.srs.bean.PassengerBean;
import com.wipro.srs.bean.ProfileBean;
import com.wipro.srs.bean.ReservationBean;
import com.wipro.srs.bean.RouteBean;
import com.wipro.srs.bean.ScheduleBean;
import com.wipro.srs.bean.ShipBean;
import com.wipro.srs.util.DBUtil;

public class CreateTables {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		SessionFactory factory = DBUtil.getSessionFactory();
		Session session = factory.openSession();

		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			CredentialsBean credentialsBean = new CredentialsBean();
			CreditCardBean creditCardBean = new CreditCardBean();
			PassengerBean passengerBean =  new PassengerBean();
			ProfileBean profileBean = new ProfileBean();
			ReservationBean reservationBean = new ReservationBean();
			RouteBean routeBean = new RouteBean();
			ScheduleBean scheduleBean = new ScheduleBean();
			ShipBean shipBean = new ShipBean();
			
			
			
			/*credentialsBean.setUserID("1");
			credentialsBean.setPassword("1");
			credentialsBean.setLoginStatus(1);*/
			session.delete(credentialsBean);
			
			/*shipBean.setShipID("1");
			shipBean.setReservationCapacity(1);
			shipBean.setSeatingCapacity(1);
			shipBean.setShipName("1");*/
			session.delete(shipBean);
			
		/*	routeBean.setRouteID("1");
			routeBean.setDestination("1");
			routeBean.setFare(1);
			routeBean.setSource("1");
			routeBean.setTravelDuration("1");*/
			session.delete(routeBean);
			
			
			/*creditCardBean.setCreditCardNumber("1");
			creditCardBean.setUserID("1");
			creditCardBean.setValidFrom("1");
			creditCardBean.setValidTo("1");
			creditCardBean.setBalance(1);*/
			session.delete(creditCardBean);
			
			/*scheduleBean.setRouteID("1");
			scheduleBean.setScheduleID("1");
			scheduleBean.setShipID("1");
			scheduleBean.setStartDate(new Date());*/
			session.delete(scheduleBean);
			
			
			/*reservationBean.setUserID("1");
			reservationBean.setReservationID("1");
			reservationBean.setScheduleID("1");
			reservationBean.setBookingDate(new Date());
			reservationBean.setBookingStatus("1");
			reservationBean.setJourneyDate(new Date());
			reservationBean.setNoOfSeats(1);
			reservationBean.setTotalFare(1);*/
			session.delete(reservationBean);
			
			
			
			
			
			/*profileBean.setUserID("1");
			profileBean.setCity("1");
			profileBean.setEmailID("1");
			profileBean.setFirstName("1");
			profileBean.setGender("1");
			profileBean.setLastName("1");
			profileBean.setLocation("1");
			profileBean.setMobileNo("1");
			profileBean.setPassword("1");
			profileBean.setState("1");
			profileBean.setStreet("1");
			profileBean.setDateOfBirth(new Date());*/
			session.delete(profileBean);
			
		/*	passengerBean.setScheduleID("1");
			passengerBean.setReservationID("1");
			passengerBean.setGender("1");
			passengerBean.setName("1");
			passengerBean.setAge(1);*/
			session.delete(passengerBean);
			
			
			
			
			
			
			
			
			
			tx.commit();
			System.out.println("Insertion complete");
		} catch (HibernateException e) {
			System.out.println("exception in main" + e);
			
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	
}
