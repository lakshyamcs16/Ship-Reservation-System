package com.wipro.srs.bean;

import java.util.Date;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="SRS_TBL_Schedule")
public class ScheduleBean {

@Id
@Column(length=8)
private String scheduleID;

private String shipID;

private String routeID;
@Temporal(TemporalType.DATE)
@Column
private Date startDate;

public String getScheduleID() {
	return scheduleID;
}
public void setScheduleID(String scheduleID) {
	this.scheduleID = scheduleID;
}
public String getShipID() {
	return shipID;
}
public void setShipID(String shipID) {
	this.shipID = shipID;
}
public String getRouteID() {
	return routeID;
}
public void setRouteID(String routeID) {
	this.routeID = routeID;
}
public Date getStartDate() {
	return startDate;
}
public void setStartDate(Date startDate) {
	this.startDate = startDate;
}


}
