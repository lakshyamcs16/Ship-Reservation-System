package com.wipro.srs.service;

import java.util.ArrayList;

import com.wipro.srs.bean.CreditCardBean;
import com.wipro.srs.bean.PassengerBean;
import com.wipro.srs.bean.ReservationBean;
import com.wipro.srs.bean.RouteBean;
import com.wipro.srs.bean.ScheduleBean;
import com.wipro.srs.bean.ShipBean;

public interface Administrator {
	String addShip(ShipBean shipbean);
	boolean modifyShip(ShipBean Shipbean);
	int removeShip(ArrayList<String> ShipId);
	ShipBean viewByShipId(String ShipId);
	ArrayList<ShipBean> viewByAllShips();
	ArrayList<PassengerBean> viewPasengersByShip(String scheduleid);
	
	String addSchedule(ScheduleBean schedulebean);
	boolean modifySchedule(ScheduleBean schedulebean);
	int removeSchedule(ArrayList<String> scheduleId);
	ArrayList<ScheduleBean> viewByAllSchedule();
	ScheduleBean viewByScheduleId(String scheduleId);
	
	String addRoute(RouteBean routebean);
	boolean modifyRoute(RouteBean routebean);
	int removeRoute(ArrayList<String> routeId);
	RouteBean viewByRouteId(String routeId);
	ArrayList<RouteBean> viewByAllRoute();
	
	ReservationBean viewByReservationId(String reservationId);

	CreditCardBean viewByCreditCardNumber(String creditCardNumber);
	
}
