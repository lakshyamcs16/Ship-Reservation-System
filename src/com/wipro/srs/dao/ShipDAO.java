package com.wipro.srs.dao;

import java.util.ArrayList;

import com.wipro.srs.bean.PassengerBean;
import com.wipro.srs.bean.ShipBean;

public interface ShipDAO {
	String createShip(ShipBean shipbean);
	int deleteShip(ArrayList<String> ShipId);
	boolean updateShip(ShipBean shipbean);
	ShipBean findByID(String ShipId);
	ArrayList<ShipBean> findAll();
	ArrayList<PassengerBean> findPasengersByShip(String scheduleid);


	
	
	
	

}
