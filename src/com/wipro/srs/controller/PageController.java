package com.wipro.srs.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wipro.srs.bean.CredentialsBean;
import com.wipro.srs.bean.ProfileBean;
import com.wipro.srs.bean.RouteBean;
import com.wipro.srs.bean.ScheduleBean;
import com.wipro.srs.bean.ShipBean;
import com.wipro.srs.service.AdministratorImpl;

@Controller
public class PageController {

	
	AdministratorImpl administratorImpl = new AdministratorImpl();
	@RequestMapping(value="/login" , method = RequestMethod.GET)
	public ModelAndView login(ModelMap model,HttpSession session,HttpServletRequest request) {
		CredentialsBean credentialsBean ;
		session = request.getSession();
		if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null){
			if(credentialsBean.getUserType().equals("A")){
			if(credentialsBean.getLoginStatus()==1){
				return new ModelAndView("AdminHome", "command", new ProfileBean());
			}else{
				return new ModelAndView("login", "command", new CredentialsBean());
			}
		}else{
			return new ModelAndView("CustomerHome", "command", new CredentialsBean());
		}
		}else{
			return new ModelAndView("login", "command", new CredentialsBean());
		}
	  }
	
	@RequestMapping(value="/reservation" , method = RequestMethod.GET)
	public ModelAndView reservation(ModelMap model,HttpSession session,HttpServletRequest request) {
		CredentialsBean credentialsBean ;
		session = request.getSession();
		if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null && credentialsBean.getUserType().equals("C")){
			return new ModelAndView("reservation", "command", null);
		}
			return new ModelAndView("login", "command", new CredentialsBean());
	  }
	
	@RequestMapping(value="/registerCustomer" , method = RequestMethod.GET)
	public ModelAndView registerCustomer(ModelMap model,HttpSession session) {
				return new ModelAndView("registerCustomer", "command", new ProfileBean());
	  }
	
		@RequestMapping(value="/addShip" , method = RequestMethod.GET)
	public ModelAndView addShip(ModelMap model,HttpSession session,HttpServletRequest request) {
			CredentialsBean credentialsBean ;
			session = request.getSession();
			if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null && credentialsBean.getUserType().equals("A")){
				return new ModelAndView("addShip", "command", new ShipBean());
			}
				return new ModelAndView("login", "command", new CredentialsBean());

	  }
		
		@RequestMapping(value="/addRoute" , method = RequestMethod.GET)
		public ModelAndView addRoute(ModelMap model,HttpSession session,HttpServletRequest request) {
			CredentialsBean credentialsBean ;
			session = request.getSession();
			if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null && credentialsBean.getUserType().equals("A")){
				if(credentialsBean.getLoginStatus()==1){
					return new ModelAndView("addRoute", "command", new RouteBean());
				}else{
					return new ModelAndView("login", "command", new CredentialsBean());

				}
			}
					return new ModelAndView("CustomerHome", "command", new CredentialsBean());
		  }
		
		@RequestMapping(value="/addSchedule" , method = RequestMethod.GET)
		public ModelAndView addSchedule(ModelMap model,HttpSession session,HttpServletRequest request) {
			CredentialsBean credentialsBean ;
			session = request.getSession();
			if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null && credentialsBean.getUserType().equals("A")){
				return new ModelAndView("addSchedule", "command", new ScheduleBean());
			}
				return new ModelAndView("login", "command", new CredentialsBean());

		  }
		@RequestMapping(value="/AdminHome" , method = RequestMethod.GET)
		public ModelAndView AdminHome(ModelMap model,HttpSession session,HttpServletRequest request) {
			CredentialsBean credentialsBean ;
			session = request.getSession();
			if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null){
				if(credentialsBean.getUserType().equals("A")){
				if(credentialsBean.getLoginStatus()==1){
					return new ModelAndView("AdminHome", "command", new ProfileBean());
				}else{
					return new ModelAndView("login", "command", new CredentialsBean());
				}
			}else{
				return new ModelAndView("CustomerHome", "command", new CredentialsBean());
			}
			}else{
				return new ModelAndView("login", "command", new CredentialsBean());
			}
		  }
		
		@RequestMapping(value="/CustomerHome" , method = RequestMethod.GET)
		public ModelAndView CustomerHome(ModelMap model,HttpSession session,HttpServletRequest request) {
			CredentialsBean credentialsBean ;
			session = request.getSession();
			if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null){
				if(credentialsBean.getUserType().equals("C")){
				if(credentialsBean.getLoginStatus()==1){
					return new ModelAndView("CustomerHome", "command", new ProfileBean());
				}else{
					return new ModelAndView("login", "command", new CredentialsBean());
				}
			}else{
				return new ModelAndView("AdminHome", "command", new CredentialsBean());
			}
			}else{
				return new ModelAndView("login", "command", new CredentialsBean());
			}
		  }
		
		
		@RequestMapping(value="/abc" , method = RequestMethod.GET)
		public ModelAndView abc(ModelMap model,HttpSession session,HttpServletRequest request) {
			@SuppressWarnings("unused")
			CredentialsBean credentialsBean ;
			session = request.getSession();
			if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null){
					return new ModelAndView("abc", "command", new ProfileBean());
			}
				return new ModelAndView("login", "command", new CredentialsBean());
		  }
		
		@RequestMapping(value="/printTicketPdf" , method = RequestMethod.GET)
		public ModelAndView printTicketPdf(ModelMap model,HttpSession session,HttpServletRequest request) {
			CredentialsBean credentialsBean ;
			session = request.getSession();
			if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null && credentialsBean.getUserType().equals("C")){
					return new ModelAndView("printTicketPdf", "command", new CredentialsBean());
			}
				return new ModelAndView("login", "command", new CredentialsBean());
		  }
		@RequestMapping(value="/pdf" , method = RequestMethod.POST)
		public ModelAndView pdf(ModelMap model,HttpSession session,HttpServletRequest request) {
			CredentialsBean credentialsBean ;
			session = request.getSession();
			if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null && credentialsBean.getUserType().equals("C")){
					return new ModelAndView("PdfTicketSummary", "command", new CredentialsBean());
			}
				return new ModelAndView("login", "command", new CredentialsBean());
		  }
	
}
