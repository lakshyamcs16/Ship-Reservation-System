package com.wipro.srs.dao;

import java.util.ArrayList;

import com.wipro.srs.bean.RouteBean;

public interface RouteDAO {
	String createShipRoute(RouteBean routebean);
	int deleteShipRoute(ArrayList<String> routeID);
	boolean updateShipRoute(RouteBean routebean);
	RouteBean findByIDRoute(String routeID);
	ArrayList<RouteBean> findAllRoute();

}
