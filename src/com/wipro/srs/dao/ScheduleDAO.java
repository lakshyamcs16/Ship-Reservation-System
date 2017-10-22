package com.wipro.srs.dao;

import java.util.ArrayList;

import com.wipro.srs.bean.ScheduleBean;

public interface ScheduleDAO {
	String createShipSchedule(ScheduleBean schedulebean);
	int deleteShipSchedule(ArrayList<String> ScheduleID);
	boolean updateShipSchedule(ScheduleBean schedulebean);
	ScheduleBean findByIDSchedule(String scheduleID);
	ArrayList<ScheduleBean> findAllSchedule();

}
