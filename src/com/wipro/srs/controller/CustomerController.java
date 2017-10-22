package com.wipro.srs.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wipro.srs.bean.CredentialsBean;
import com.wipro.srs.bean.CreditCardBean;
import com.wipro.srs.bean.PassengerBean;
import com.wipro.srs.bean.ReservationBean;
import com.wipro.srs.bean.RouteBean;
import com.wipro.srs.bean.ScheduleBean;
import com.wipro.srs.bean.ShipBean;
import com.wipro.srs.dao.CustomerDAOImpl;
import com.wipro.srs.dao.ReservationDAOImpl;
import com.wipro.srs.service.AdministratorImpl;
import com.wipro.srs.service.CustomerServiceImpl;

@Controller
public class CustomerController {

	AdministratorImpl administratorImpl = new AdministratorImpl();
	CustomerServiceImpl customerServiceImpl = new CustomerServiceImpl();
	@RequestMapping(value="/viewTicketDetails" , method = RequestMethod.POST)
	public ModelAndView viewTicketDetails(ModelMap model,HttpSession session,HttpServletRequest request, @ModelAttribute("command")ReservationBean reservationBean) {
				Map<ReservationBean,ArrayList<PassengerBean>> map= customerServiceImpl.viewTicket(reservationBean.getReservationID());
				session.setAttribute("map", map);
				if(map!=null){
					model.addAttribute("map",map);
					return new ModelAndView("viewTicketById", "command", new ShipBean());
				}else{
					model.addAttribute("error", "Reservation ID doesn't exist");
					return new ModelAndView("viewTicket", "command", new ReservationBean());

				}
	   }
	
	@RequestMapping(value="/viewTicket" , method = RequestMethod.GET)
	public ModelAndView viewTicket(ModelMap model,HttpSession session,HttpServletRequest request) {
		CredentialsBean credentialsBean ;
		session = request.getSession();
		if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null && credentialsBean.getUserType().equals("C")){
			if(credentialsBean.getLoginStatus()==1){
				return new ModelAndView("viewTicket", "command", new ReservationBean());
			}else{
					return new ModelAndView("login", "command", new CredentialsBean());

				}
			}
				
					return new ModelAndView("AdminHome", "command", new CredentialsBean());
	   }
	
	@RequestMapping(value="/viewShipSchedule" , method = RequestMethod.GET)
	public ModelAndView viewShipSchedule(ModelMap model,HttpSession session,HttpServletRequest request) {
		CredentialsBean credentialsBean ;
		session = request.getSession();
		if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null && credentialsBean.getUserType().equals("C")){
			if(credentialsBean.getLoginStatus()==1){
				return new ModelAndView("viewShipSchedule", "command", null);
			}else{
				return new ModelAndView("login", "command", new CredentialsBean());

			}
		}
		
			return new ModelAndView("AdminHome", "command", new CredentialsBean());
	   }
	
	@RequestMapping(value="/ViewShipScheduleDetails" , method = RequestMethod.POST)
	public ModelAndView ViewShipScheduleDetails(ModelMap model,HttpSession session,HttpServletRequest request) throws ParseException {
		String source = request.getParameter("source");
		System.out.println(source);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-'W'ww");

        simpleDateFormat.getCalendar().setFirstDayOfWeek(Calendar.MONDAY);
		String dest = request.getParameter("dest");
		Date date = simpleDateFormat.parse((request.getParameter("date")));
		System.out.println(date);
				ArrayList<ScheduleBean> arrayList = customerServiceImpl.viewScheduleByRoute(source, dest, date);
				System.out.println(arrayList);
				if(arrayList!=null){
					session.setAttribute("scheduleBeans", arrayList);
					return new ModelAndView("viewShipScheduleCustomer", "command", new ScheduleBean());
				}else{
					model.addAttribute("error","No Ship/Schedule Exist");
					return new ModelAndView("viewShipSchedule", "command", new ScheduleBean());

				}
	   }
	
	
	@RequestMapping(value="/reserveTicket" , method = RequestMethod.POST)
	public ModelAndView reserveTicket(ModelMap model,HttpSession session,HttpServletRequest request) throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

      
        Date date = simpleDateFormat.parse((request.getParameter("date")));
        
               
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		int seats = Integer.parseInt(request.getParameter("seats"));
		
		session.setAttribute("source", source);
		session.setAttribute("destination", destination);
		session.setAttribute("journeydate", date);
		session.setAttribute("seats", seats);
		
			ArrayList<ScheduleBean> scheduleBeans = customerServiceImpl.viewScheduleByRoute(source, destination, date);
			session.setAttribute("schedulebeans", scheduleBeans);
			return new ModelAndView("reserveTicketDetails", "command", new ScheduleBean());

	   }
	

	@RequestMapping(value="/generateticket" , method = RequestMethod.POST)
	public ModelAndView generateticket(ModelMap model,HttpSession session,HttpServletRequest request,@ModelAttribute("payment")CreditCardBean CardBean) throws ParseException {
		
		
		
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = dateFormat.parse((request.getParameter("date")));
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		int seats = Integer.parseInt(request.getParameter("seats"));
		
		session.setAttribute("source", source);
		session.setAttribute("destination", destination);
		session.setAttribute("date", date);
		session.setAttribute("seats", seats);
		
			ArrayList<ScheduleBean> scheduleBeans = customerServiceImpl.viewScheduleByRoute(source, destination, date);
			session.setAttribute("schedulebeans", scheduleBeans);
			return new ModelAndView("reserveTicketDetails", "command", new ScheduleBean());

	   }
	
	@RequestMapping(value="/pay" , method = RequestMethod.POST)
	public ModelAndView pay(ModelMap model,HttpSession session,HttpServletRequest request,@ModelAttribute("dskjfnkfnsdf")CreditCardBean creditCardBean) throws ParseException {
	
		
		String userid = (String)session.getAttribute("userid");
		if(userid==null){
			model.addAttribute("loginagain","Please login for reservation");
			return new ModelAndView("login","command",new CreditCardBean());
		}
		String scheduleid = (String)session.getAttribute("scheduleid");
		int seats = (Integer)session.getAttribute("seats");
		String source = (String)session.getAttribute("source");
		String destination = (String)session.getAttribute("destination");
	
		creditCardBean.setUserID(userid);
		boolean status = customerServiceImpl.findByCardNumber(userid, creditCardBean.getCreditCardNumber());
		double totfare = (Double)session.getAttribute("totalfare");
		Date journeyDate = (Date)session.getAttribute("journeydate");
		String validations = "";
		if(status){
			System.out.println(totfare);
			System.out.println("BBBBBBBBB:::::::::"+customerServiceImpl.process(creditCardBean, totfare).equals("SUCCESS"));
			if((validations=customerServiceImpl.process(creditCardBean, totfare)).equals("SUCCESS")){
				String shipid = administratorImpl.viewByScheduleId(scheduleid).getShipID();
				int reservation_seats = customerServiceImpl.getReserSeat(shipid);
				reservation_seats -= seats;
				ShipBean shipBean = administratorImpl.viewByShipId(shipid);
				shipBean.setReservationCapacity(reservation_seats);
				administratorImpl.modifyShip(shipBean);
				
				
				ReservationDAOImpl daoImpl = new ReservationDAOImpl();
				
				String reservationid = daoImpl.generateReservationId(source,destination);
				
				Date bookingDate = new Date();
				String bookingStatus = "BOOKED";
				ReservationBean reservationBean = new ReservationBean();
				reservationBean.setReservationID(reservationid);
				reservationBean.setScheduleID(scheduleid);
				reservationBean.setUserID(userid);
				reservationBean.setBookingDate(bookingDate);
				reservationBean.setJourneyDate(journeyDate);
				reservationBean.setNoOfSeats(seats);
				reservationBean.setTotalFare(totfare);
				reservationBean.setBookingStatus(bookingStatus);
				
				
				ArrayList<PassengerBean> passengerBeans = new ArrayList<PassengerBean>();
				String names[] = (String[])session.getAttribute("names");
				String ages[] =  (String[])session.getAttribute("ages");
				String genders[] = (String[])session.getAttribute("genders");
				PassengerBean passengerBean;
				CustomerDAOImpl customerDAOImpl = new CustomerDAOImpl();
				int max = 0;
				
				max=customerDAOImpl.getSeatNo();
				System.out.println("MAX::::::::::"+max);
				
				for(int i=0; i<names.length;i++){
					passengerBean = new PassengerBean();
					passengerBean.setScheduleID(scheduleid);
					passengerBean.setReservationID(reservationid);
					System.out.println("SCH:::"+scheduleid);
					System.out.println("RES:::"+reservationid);
					passengerBean.setName(names[i]);
					passengerBean.setAge(ages[i]);
					passengerBean.setGender(genders[i]);
					passengerBean.setSeats(max+(i+1));
					passengerBeans.add(passengerBean);
				}
				
				if(customerServiceImpl.reserveTicket(reservationBean, passengerBeans).equals("SUCCESS")){
					Map<ReservationBean,ArrayList<PassengerBean>> map= customerServiceImpl.viewTicket(reservationid);
					session.setAttribute("map", map);
					return new ModelAndView("PdfTicketSummary","command",new CreditCardBean());
				}else{
					model.addAttribute("failed", "Could not reserve. Sorry for inconvinience");
					return new ModelAndView("proceedtopayment","command",new CreditCardBean());
				}
				
			}else{
				model.addAttribute("failed", validations);
			}
		}else{
			model.addAttribute("failed","Invalid Card Number");
			return new ModelAndView("proceedtopayment","command",new CreditCardBean());
		}
		return new ModelAndView("proceedtopayment","command",new CreditCardBean());
		
}
	
	@RequestMapping(value="/getpassengerdetails" , method = RequestMethod.GET)
	public ModelAndView getpassengerdetails(ModelMap model,HttpSession session,HttpServletRequest request,@ModelAttribute("info")PassengerBean passengerBean) {
			String scheduleID = request.getParameter("book");
			System.out.println(scheduleID);
			session.setAttribute("scheduleid", scheduleID);
			RouteBean routeBean = administratorImpl.viewByRouteId(administratorImpl.viewByScheduleId(scheduleID).getRouteID());
			session.setAttribute("routeforrate", routeBean);
			return new ModelAndView("getpassengerdetails", "command", new PassengerBean());

	   }
	
	@RequestMapping(value="/proceedtopayment" , method = RequestMethod.POST)
	public ModelAndView proceedtopayment(ModelMap model,HttpSession session,HttpServletRequest request,@ModelAttribute("asd")PassengerBean passengerBean) {
			
			String names[] = passengerBean.getName().split(",");
			String ages[] = passengerBean.getAge().split(",");
			String genders[] = passengerBean.getGender().split(",");
			session.setAttribute("names", names);
			session.setAttribute("ages", ages);
			session.setAttribute("genders", genders);
			
			return new ModelAndView("proceedtopayment", "command", new CreditCardBean());

	   }
	
	@RequestMapping(value="/cancelTicketById" , method = RequestMethod.GET)
	public ModelAndView cancelTicketById(HttpSession session,HttpServletRequest request,@ModelAttribute("cancelTicket")ReservationBean reservationBean) {
		CredentialsBean credentialsBean ;
		session = request.getSession();
		if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null && credentialsBean.getUserType().equals("C")){
			if(credentialsBean.getLoginStatus()==1){
				return new ModelAndView("cancelTicketById", "command", new ReservationBean());
			}else{
				return new ModelAndView("login", "command", new CredentialsBean());

			}
		}
			return new ModelAndView("AdminHome", "command", new CredentialsBean());

	   }
	
	@RequestMapping(value="/cancelTicket" , method = RequestMethod.POST)
	public ModelAndView cancelTicket(ModelMap model, HttpSession session,HttpServletRequest request,@ModelAttribute("cancel")ReservationBean reservationBean) {
			System.out.println("USERRRRRRRRRRRRRRRRRRR"+reservationBean.getReservationID());
			Map<ReservationBean,ArrayList<PassengerBean>> map= customerServiceImpl.viewTicket(reservationBean.getReservationID());
			session.setAttribute("map", map);
		
			if(map!=null){
				return new ModelAndView("cancelTicket", "command", new ReservationBean());
			}else{
				model.addAttribute("error", "Reservation ID doesn't exist");
				return new ModelAndView("cancelTicketById", "command", new ReservationBean());

			}

	   }
	
	
	@RequestMapping(value="/cancelTicketDetails" , method = RequestMethod.POST)
	public ModelAndView cancelTicketDetails(ModelMap model,HttpSession session,HttpServletRequest request) {
			String userid = (String)session.getAttribute("userid");
			ArrayList<ReservationBean> arrayList = customerServiceImpl.findByUserID(userid);
			for(int i=0; i<arrayList.size(); i++){
				if(customerServiceImpl.cancelTicket(arrayList.get(i).getReservationID())){
					model.addAttribute("success","Your tickets have been cancelled successfully.");
				}else{
					model.addAttribute("failed","Your tickets could not be cancelled.");

				}
			}
			
			return new ModelAndView("cancelTicketDetails", "command", new ReservationBean());

	   }
}
