package com.wipro.srs.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wipro.srs.bean.CredentialsBean;
import com.wipro.srs.bean.PassengerBean;
import com.wipro.srs.bean.RouteBean;
import com.wipro.srs.bean.ScheduleBean;
import com.wipro.srs.bean.ShipBean;
import com.wipro.srs.service.AdministratorImpl;


@Controller
public class AdminController {

	AdministratorImpl administratorImpl = new AdministratorImpl();
	
	@RequestMapping(value="/viewDetails" , method = RequestMethod.GET)
	public ModelAndView viewDetails(ModelMap model,HttpSession session,HttpServletRequest request) {
		CredentialsBean credentialsBean ;
		session = request.getSession();
		if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null && credentialsBean.getUserType().equals("A")){
			if(credentialsBean.getLoginStatus()==1){
				ArrayList<ShipBean> arrayList = new ArrayList<ShipBean>();
				arrayList = administratorImpl.viewByAllShips();
				session.setAttribute("list", arrayList);
				return new ModelAndView("viewDetails", "command", new ShipBean());
			}else{
				return new ModelAndView("login", "command", new CredentialsBean());

			}
		}
			
				return new ModelAndView("CustomerHome", "command", new CredentialsBean());
				
	   }
	
	
	@RequestMapping(value="/viewShipScheduleDetails" , method = RequestMethod.GET)
	public ModelAndView viewShipScheduleDetails(ModelMap model,HttpSession session,HttpServletRequest request) {
		CredentialsBean credentialsBean ;
		session = request.getSession();
		if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null && credentialsBean.getUserType().equals("A")){
			if(credentialsBean.getLoginStatus()==1){
				ArrayList<ScheduleBean> arrayList = new ArrayList<ScheduleBean>();
				arrayList = administratorImpl.viewByAllSchedule();
				session.setAttribute("scheduleList", arrayList);
				return new ModelAndView("viewShipScheduleDetails", "command", new ScheduleBean());
			}else{
				return new ModelAndView("login", "command", new CredentialsBean());

			}
		}
			return new ModelAndView("CustomerHome", "command", new CredentialsBean());
	   }
	
	@RequestMapping(value="/viewRouteDetails" , method = RequestMethod.GET)
	public ModelAndView viewRouteDetails(ModelMap model,HttpSession session,HttpServletRequest request) {
		CredentialsBean credentialsBean ;
		session = request.getSession();
		if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null && credentialsBean.getUserType().equals("A")){
			if(credentialsBean.getLoginStatus()==1){
				ArrayList<RouteBean> arrayList = new ArrayList<RouteBean>();
			
				arrayList = administratorImpl.viewByAllRoute();
				
				session.setAttribute("routeList", arrayList);
				return new ModelAndView("viewRouteDetails", "command", new RouteBean());
			}else{
				return new ModelAndView("login", "command", new CredentialsBean());

			}
		}
			return new ModelAndView("CustomerHome", "command", new CredentialsBean());
	   }
	
	@RequestMapping(value="/addShipDetails" , method = RequestMethod.POST)
	public ModelAndView addShipDetails(ModelMap model,HttpSession session,HttpServletRequest request, @ModelAttribute("command")ShipBean shipbean) {
				if("SUCCESS".equals(administratorImpl.addShip(shipbean))){
					session = request.getSession();
					session.setAttribute("shipBean", shipbean);
					return new ModelAndView("viewAddedDetails","command",shipbean);
				}else{
					model.addAttribute("failed", "Ship could not be added.");
					return new ModelAndView("addShip","command",new ShipBean());
				}
					
	   }
	
	@RequestMapping(value="/addRouteDetails" , method = RequestMethod.POST)
	public ModelAndView addRouteDetails(ModelMap model,HttpSession session,HttpServletRequest request, @ModelAttribute("command")RouteBean routeBean) {
				if("SUCCESS".equals(administratorImpl.addRoute(routeBean))){
					session = request.getSession();
					session.setAttribute("routeBean", routeBean);
					return new ModelAndView("viewAddedRouteDetails","command",routeBean);
				}
					return null;
	   }
	
	@RequestMapping(value="/addScheduleDetails" , method = RequestMethod.POST)
	public ModelAndView addScheduleDetails(ModelMap model,HttpSession session,HttpServletRequest request, @ModelAttribute("command")ScheduleBean scheduleBean) {
		session = request.getSession();
		String schedulestatus = administratorImpl.addSchedule(scheduleBean);
		System.out.println("STATUS "+schedulestatus);
			if("SUCCESS".equals(schedulestatus)){
				session.setAttribute("status", "Successfully added");
					session.setAttribute("scheduleBean", scheduleBean);
					return new ModelAndView("viewAddedScheduleDetails","command",scheduleBean);
				}
					return new ModelAndView("viewAddedScheduleDetails","command",scheduleBean);

	}
	
	
	@RequestMapping(value="/viewPassengerDetails" , method = RequestMethod.POST)
	public ModelAndView viewPassengers(ModelMap model,HttpSession session,HttpServletRequest request, @ModelAttribute("command")ScheduleBean scheduleBean) {
		session = request.getSession();
		ArrayList<PassengerBean> arrayList = administratorImpl.viewPasengersByShip(scheduleBean.getScheduleID());
		System.out.println(arrayList.size());
		if(arrayList.size()>0){
					session.setAttribute("passengerList", arrayList);
					return new ModelAndView("viewPassengerDetails","command",new PassengerBean());
				}
					model.addAttribute("scheduleresult", "No passenger exist for this ID");
					return new ModelAndView("viewPassenger","command",new PassengerBean());

	}
	
	
	@RequestMapping(value="/viewAddedDetails" , method = RequestMethod.GET)
	public ModelAndView viewAddedDetails(ModelMap model,HttpSession session,HttpServletRequest request) {
		CredentialsBean credentialsBean ;
		session = request.getSession();
		if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null && credentialsBean.getUserType().equals("A")){
			if(credentialsBean.getLoginStatus()==1){
			return new ModelAndView("viewAddedDetails", "command", new ShipBean());
			}else{
				return new ModelAndView("login", "command", new CredentialsBean());

			}
		}
			
				return new ModelAndView("CustomerHome", "command", new CredentialsBean());
	   }
	
	@RequestMapping(value="/viewPassenger" , method = RequestMethod.GET)
	public ModelAndView viewPassenger(ModelMap model,HttpSession session,HttpServletRequest request) {
		CredentialsBean credentialsBean ;
		session = request.getSession();
		if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null && credentialsBean.getUserType().equals("A")){
			if(credentialsBean.getLoginStatus()==1){
			return new ModelAndView("viewPassenger", "command", new ScheduleBean());
			}else{
				return new ModelAndView("login", "command", new CredentialsBean());

			}
		}
			return new ModelAndView("CustomerHome", "command", new CredentialsBean());
	   }
	
	@RequestMapping(value="/viewAddedRouteDetails" , method = RequestMethod.GET)
	public ModelAndView viewAddedRouteDetails(ModelMap model,HttpSession session,HttpServletRequest request) {
		CredentialsBean credentialsBean ;
		session = request.getSession();
		if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null && credentialsBean.getUserType().equals("A")){
			if(credentialsBean.getLoginStatus()==1){
			return new ModelAndView("viewAddedRouteDetails", "command", new RouteBean());
			}else{
				return new ModelAndView("login", "command", new CredentialsBean());

			}
		}
			
				return new ModelAndView("CustomerHome", "command", new CredentialsBean());
	   }
	
	@RequestMapping(value="/viewAddedScheduleDetails" , method = RequestMethod.GET)
	public ModelAndView viewAddedScheduleDetails(ModelMap model,HttpSession session,HttpServletRequest request) {
		CredentialsBean credentialsBean ;
		session = request.getSession();
		if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null && credentialsBean.getUserType().equals("A")){
			if(credentialsBean.getLoginStatus()==1){
			return new ModelAndView("viewAddedScheduleDetails", "command", new ScheduleBean());
			}else{
				return new ModelAndView("login", "command", new CredentialsBean());

			}
		}
			
				return new ModelAndView("CustomerHome", "command", new CredentialsBean());
	   }
}
