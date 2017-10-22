package com.wipro.srs.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;


import com.wipro.srs.bean.CredentialsBean;
import com.wipro.srs.bean.PassengerBean;

import com.wipro.srs.bean.CreditCardBean;
import com.wipro.srs.bean.ProfileBean;
import com.wipro.srs.bean.ReservationBean;
import com.wipro.srs.bean.ScheduleBean;
import com.wipro.srs.dao.CustomerDAOImpl;


public class CustomerServiceImpl implements CustomerService{
	
	

	CustomerDAOImpl customerDAO = new CustomerDAOImpl();

    
	public String register(CredentialsBean credentialsBean) {
		
		return this.customerDAO.register(credentialsBean);

	}
	public ArrayList<ScheduleBean> viewScheduleByRoute(String source, String destination, Date date)
	{
		return this.customerDAO.viewScheduleByRoute(source, destination, date);
	}
	public String reserveTicket(ReservationBean reservationBean, ArrayList<PassengerBean> passengers)
	{
		return this.customerDAO.reserveTicket(reservationBean,passengers);
	}
 	public String generateResId(String scheduleID)
 	{
 	 	return this.customerDAO.generateResId(scheduleID);
 	}
 	public int[] getDisFare(String routeID)
 	{
 		return this.customerDAO.getDisFare(routeID);
 	}
 	public int getReserSeat(String flightID)
 	{
 		return this.customerDAO.getReserSeat(flightID);
 	}
 	
 	public boolean findByCardNumber(String userid, String cardnumber)
 	{
 		return this.customerDAO.findByCardNumber(userid, cardnumber);
 	}
	public String process(CreditCardBean payment,double totalFare)
	{
		return this.customerDAO.process(payment,totalFare);
	}
	public Map<ReservationBean,ArrayList<PassengerBean>> viewTicket(String reservationID)
	{
			return this.customerDAO.viewTicket(reservationID);
	}
	public boolean cancelTicket(String reservationID)
	{
		return this.customerDAO.cancelTicket(reservationID);
	}
	public int setCapacity(String flightID,int seatingCapacity)
	{
		return this.customerDAO.setCapacity(flightID, seatingCapacity);
	}
	public Map<ReservationBean,ArrayList<PassengerBean>> printTicket(String reservationID)
	{
		return this.customerDAO.printTicket(reservationID);
	}
	
	public ArrayList<ReservationBean> viewByAllReservations(String uid)
	{
		return this.customerDAO.viewByAllReservations(uid);
	}
 	
	@Override
	public ArrayList<ReservationBean> findByUserID(String userID) {
		return customerDAO.findByUserID(userID);
	}
	@Override
	public ProfileBean findProfileByUserID(String userID) {
		return customerDAO.findCustomerByUserID(userID);
	}

	
}
