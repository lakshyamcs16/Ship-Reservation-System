package com.wipro.srs.service;

import java.util.ArrayList;




import com.wipro.srs.bean.CreditCardBean;
import com.wipro.srs.bean.PassengerBean;
import com.wipro.srs.bean.ReservationBean;
import com.wipro.srs.bean.RouteBean;
import com.wipro.srs.bean.ScheduleBean;
import com.wipro.srs.bean.ShipBean;
import com.wipro.srs.dao.CreditCardDAOImpl;
import com.wipro.srs.dao.ReservationDAOImpl;
import com.wipro.srs.dao.RouteDAOImpl;
import com.wipro.srs.dao.ScheduleDAOImpl;
import com.wipro.srs.dao.ShipDAOImpl;


public class AdministratorImpl implements Administrator {
	ShipDAOImpl shipDao=new ShipDAOImpl();
	ScheduleDAOImpl scheduleDao=new ScheduleDAOImpl();
	RouteDAOImpl routeDao=new RouteDAOImpl();

	@Override
	public String addShip(ShipBean shipbean) {
		return shipDao.createShip(shipbean);
	}

	@Override
	public boolean modifyShip(ShipBean Shipbean) {
		return shipDao.updateShip(Shipbean);
		
	}

	@Override
	public int removeShip(ArrayList<String> ShipId) {
		return shipDao.deleteShip(ShipId);
	}

	@Override
	public ArrayList<ShipBean> viewByAllShips() {
		return shipDao.findAll();
		
	}

	@Override
	public ShipBean viewByShipId(String ShipId) {
		return shipDao.findByID(ShipId);
		
	}
	
	

	@Override
	public String addSchedule(ScheduleBean schedulebean) {
		return scheduleDao.createShipSchedule(schedulebean);
	}

	@Override
	public boolean modifySchedule(ScheduleBean schedulebean) {
		return scheduleDao.updateShipSchedule(schedulebean);
	}

	@Override
	public int removeSchedule(ArrayList<String> scheduleid) {
		
		return scheduleDao.deleteShipSchedule(scheduleid);
	}

	@Override
	public ArrayList<ScheduleBean> viewByAllSchedule() {
		
		return scheduleDao.findAllSchedule();
	}

	@Override
	public ScheduleBean viewByScheduleId(String scheduleid) {
		
		return scheduleDao.findByIDSchedule(scheduleid);
	}
	
	

	@Override
	public String addRoute(RouteBean routebean) {
		
		return routeDao.createShipRoute(routebean);
	}

	@Override
	public boolean modifyRoute(RouteBean routebean) {
		
		return routeDao.updateShipRoute(routebean);
	}

	

	@Override
	public ArrayList<RouteBean> viewByAllRoute() {
		return routeDao.findAllRoute();
	}

	@Override
	public RouteBean viewByRouteId(String routeId) {
		return routeDao.findByIDRoute(routeId);
	}

	@Override
	public int removeRoute(ArrayList<String> routeId) {
		return routeDao.deleteShipRoute(routeId);
	}

	@Override
	public ArrayList<PassengerBean> viewPasengersByShip(String scheduleId) {
		ShipDAOImpl shipDAOImpl=new ShipDAOImpl();
		return shipDAOImpl.findPasengersByShip(scheduleId);
	}

	@Override
	public ReservationBean viewByReservationId(String reservationId) {
		ReservationDAOImpl reservationDAOImpl = new ReservationDAOImpl();
		return reservationDAOImpl.findByID(reservationId);
	}
	
	@Override
	public CreditCardBean viewByCreditCardNumber(String creditCardNumber) {
		CreditCardDAOImpl creditCardDAOImpl=new CreditCardDAOImpl();
		return creditCardDAOImpl.findByIDCreditCardNumber(creditCardNumber);
	}
}
