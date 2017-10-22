package com.wipro.srs.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wipro.srs.bean.CredentialsBean;
import com.wipro.srs.bean.ProfileBean;
import com.wipro.srs.bean.ShipBean;
import com.wipro.srs.dao.CustomerDAOImpl;
import com.wipro.srs.service.CustomerServiceImpl;
import com.wipro.srs.util.AuthenticationImpl;
import com.wipro.srs.util.UserImpl;

@Controller
public class LoginController {
	
	
	UserImpl userImpl = new UserImpl();
	AuthenticationImpl authenticationImpl = new AuthenticationImpl();
	CredentialsBean bean = new CredentialsBean();
	HttpSession session;
	
	@RequestMapping(value="/registerUser" , method = RequestMethod.POST)
	public ModelAndView registerUser(ModelMap model,@ModelAttribute("register")ProfileBean profileBean,HttpSession session,HttpServletRequest request)  {
			
			userImpl.register(profileBean);
			model.addAttribute("success", "You have been registered with userid<br />"+profileBean.getUserID());
			
			return new ModelAndView("login", "command", new CredentialsBean());
	  }
	
	
	
	@RequestMapping(value="/loginuser" , method = RequestMethod.POST)
	public ModelAndView loginUser(ModelMap model,@ModelAttribute("loginuser")CredentialsBean credentialsBean, HttpServletRequest request) {
		String userType;
		bean = credentialsBean;
		
		if(authenticationImpl.authenticate(credentialsBean)){
			 userType = userImpl.login(credentialsBean);
			 credentialsBean.setUserType(userType);
			 	if(authenticationImpl.changeLoginStatus(credentialsBean, 1)){
			 		if("A".equals(userType)){
			 			session = request.getSession();
			 			session.setAttribute("userid", credentialsBean.getUserID());
			 			session.setAttribute("credentialsBean", credentialsBean);
			 			CustomerServiceImpl customerServiceImpl = new CustomerServiceImpl();
			 			if((customerServiceImpl.findProfileByUserID(credentialsBean.getUserID()))==null){
			 				session.setAttribute("firstLogin", "FIRST");
				 			return new ModelAndView("changePassword", "command", new ShipBean());

			 			}
			 			session.removeAttribute("firstLogin");
			 			return new ModelAndView("AdminHome", "command", new ShipBean());
			 		}else if("C".equals(userType)){
			 			session = request.getSession();
			 			session.setAttribute("userid", credentialsBean.getUserID());
			 			session.setAttribute("credentialsBean", credentialsBean);
			 			return new ModelAndView("CustomerHome","command",new ProfileBean());
			 		}else{
			 			session = request.getSession();
			 			session.setAttribute("userid", credentialsBean.getUserID());
			 			session.setAttribute("credentialsBean", credentialsBean);
			 			return new ModelAndView("AdminHome", "command", new ShipBean());
			 		}
			 	}else{
			 		model.addAttribute("invalid", "Already logged in");
					return new ModelAndView("login","command",new CredentialsBean());

			 	}
		}			
		else{
			model.addAttribute("invalid", "Incorrect username/password");
			return new ModelAndView("login","command",new CredentialsBean());
		}
					
	}
	
	@RequestMapping(value="/logout" , method = RequestMethod.GET)
	public ModelAndView logout(ModelMap model,HttpServletRequest request,@ModelAttribute("logout")ProfileBean profileBean) {
		@SuppressWarnings("unused")
		CredentialsBean credentialsBean ;
		session = request.getSession();
		if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null){	
			if(userImpl.logout(bean.getUserID())){
				session.invalidate();
				return new ModelAndView("login", "command", new CredentialsBean());
			}else{
				return new ModelAndView("AdminHome","command",new ShipBean());
			}
		}else{
			return new ModelAndView("login", "command", new CredentialsBean());
		}
	  }
	
	@RequestMapping(value="/changePassword" , method = RequestMethod.GET)
	public ModelAndView changePassword(HttpSession session, HttpServletRequest request) {
		@SuppressWarnings("unused")
		CredentialsBean credentialsBean ;
		session = request.getSession();
		
		if((credentialsBean=(CredentialsBean)session.getAttribute("credentialsBean"))!=null){
			return new ModelAndView("changePassword", "command", new CredentialsBean());
		}else{
			return new ModelAndView("login", "command", new CredentialsBean());
		}
	  }
	
	@RequestMapping(value="/changePasswordDetails" , method = RequestMethod.POST)
	public ModelAndView changePasswordDetails(ModelMap model,HttpSession session, HttpServletRequest request,@RequestParam("opass")String opass,@RequestParam("npass")String npass) {
		CredentialsBean credentialsBean = (CredentialsBean)session.getAttribute("credentialsBean");
		credentialsBean.setPassword(opass);
		System.out.println(authenticationImpl.authenticate(credentialsBean));
		if(authenticationImpl.authenticate(credentialsBean)){
			@SuppressWarnings("unused")
			String firstLogin = "";
			if((firstLogin=((String)session.getAttribute("firstLogin")))!=null){
				CustomerDAOImpl customerDAOImpl = new CustomerDAOImpl();
				if("SUCCESS".equals(userImpl.changePassword(credentialsBean, npass))){
					customerDAOImpl.register(credentialsBean);
					model.addAttribute("changed", "Password has been changed successfully.<br/> Please Login again.");
					return new ModelAndView("login", "command", new CredentialsBean());
				}else{
					model.addAttribute("failed", "Password could not be changed. Try again.");
					return new ModelAndView("changePassword", "command", new CredentialsBean());
				}
			}else{
				if("SUCCESS".equals(userImpl.changePassword(credentialsBean, npass))){
					model.addAttribute("changed", "Password has been changed successfully.<br/> Please Login again.");
					return new ModelAndView("changePassword", "command", new CredentialsBean());
				}else{
					model.addAttribute("failed", "Password could not be changed. Try again.");
					return new ModelAndView("changePassword", "command", new CredentialsBean());
				}
			}
			
		}else{
			model.addAttribute("failed", "Old password is incorrect");
			return new ModelAndView("changePassword", "command", new CredentialsBean());
		}
	  }
	
	@RequestMapping(value="/forgotPassword" , method = RequestMethod.GET)
	public ModelAndView forgotPassword() {
			return new ModelAndView("forgotPassword", "command", new CredentialsBean());
	  }
	
	@RequestMapping(value="/forgotPasswordDetails" , method = RequestMethod.POST)
	public ModelAndView forgotPasswordDetails(ModelMap model,@RequestParam("userid")String userid,@RequestParam("cpass")String changedPassword) {
		
			if(authenticationImpl.forgotPassword(userid, changedPassword)){
				model.addAttribute("changed", "Password has been changed successfully.<br/> Please Login again.");
				return new ModelAndView("login", "command", new CredentialsBean());

			}else{
				model.addAttribute("failed", "Password could not be changed. Try again.");
				return new ModelAndView("forgotPassword", "command", new CredentialsBean());
			}

	  }
}
