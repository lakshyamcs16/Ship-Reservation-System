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

public interface CustomerService {

	public String register(CredentialsBean credentialsBean);
	public ArrayList<ScheduleBean> viewScheduleByRoute(String source, String destination, Date date);
	public String reserveTicket(ReservationBean reservationBean, ArrayList<PassengerBean> passengers);
 	public String generateResId(String scheduleID);
 	public int[] getDisFare(String routeID);
 	public int getReserSeat(String flightID);
 	public boolean findByCardNumber(String userid, String cardnumber);
	public String process(CreditCardBean payment,double totalFare);
	
	public Map<ReservationBean,ArrayList<PassengerBean>> viewTicket(String reservationID);
	public boolean cancelTicket(String reservationId);
	public int setCapacity(String flightID,int seatingCapacity);
	public Map<ReservationBean,ArrayList<PassengerBean>> printTicket(String reservationID);
	public ArrayList<ReservationBean> viewByAllReservations(String uid);
	
	public ArrayList<ReservationBean> findByUserID (String userID);
	public ProfileBean findProfileByUserID(String userID);
	
}
