package com.wipro.srs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wipro.srs.bean.ScheduleBean;
import com.wipro.srs.service.AdministratorImpl;

/**
 * Servlet implementation class ScheduleServlet
 */
public class ScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	HttpSession session;
    public ScheduleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("deprecation")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String scheduleid = request.getParameter("scheduleid");
		String submit = request.getParameter("submit");
		
		AdministratorImpl administratorImpl = new AdministratorImpl();
		
		PrintWriter out = response.getWriter();
		
		ScheduleBean scheduleBean = new ScheduleBean();
		if("delete".equals(submit)){
		ArrayList<String> arrayList = new ArrayList<String>();
		arrayList.add(scheduleid);
		session = request.getSession();
		
		int status = administratorImpl.removeSchedule(arrayList);
		System.out.println("STATUS"+status);
		if(status>0){
			out.print("1");
			session.setAttribute("remove", "SUCCESS");
		}else{
			out.print("0");
			session.setAttribute("remove", "COULD NOT REMOVE");
		}
		}
		
		if("modify".equals(submit)){
			System.out.println("modify");
			scheduleBean = administratorImpl.viewByScheduleId(scheduleid);
			out.print("<td><input type='text' value='"+scheduleBean.getScheduleID()+"' readonly/></td><td><input type='text' value='"+scheduleBean.getShipID()+"' id='"+scheduleBean.getScheduleID()+"SHIP' readonly/></td><td><input type='text' value='"+scheduleBean.getRouteID()+"' id='"+scheduleBean.getScheduleID()+"ROUTE' readonly/></td><td><input type='text' value='"+scheduleBean.getStartDate()+"' id='"+scheduleBean.getScheduleID()+"DATE' placeholder='dd-mmm-yyyy'/></td><td><button id='modifydetails' onclick='modifydetails(this.value)' value='"+scheduleBean.getScheduleID()+"'>Modify</button></td>");
		}
		
		if("modifydetails".equals(submit)){
			scheduleBean = administratorImpl.viewByScheduleId(scheduleid);
			
			String date = request.getParameter("date");
			scheduleBean.setStartDate(new Date(date));
			
			if(administratorImpl.modifySchedule(scheduleBean)){
				System.out.println("Details MODIFIED");
				out.print("Details modified for Schedule"+scheduleBean.getScheduleID());
			}
		}
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}

}
