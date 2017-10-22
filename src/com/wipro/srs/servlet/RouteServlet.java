package com.wipro.srs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wipro.srs.bean.RouteBean;
import com.wipro.srs.service.AdministratorImpl;

/**
 * Servlet implementation class RouteServlet
 */
public class RouteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	HttpSession session;
    public RouteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String routeid = request.getParameter("routeid");
		String submit = request.getParameter("submit");
		
		AdministratorImpl administratorImpl = new AdministratorImpl();
		
		PrintWriter out = response.getWriter();
		
		RouteBean routeBean = new RouteBean();
		if("delete".equals(submit)){
		ArrayList<String> arrayList = new ArrayList<String>();
		arrayList.add(routeid);
		session = request.getSession();
		
		int status = administratorImpl.removeRoute(arrayList);
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
			System.out.println(routeid);
			routeBean = administratorImpl.viewByRouteId(routeid);
			out.print("<td><input type='text' value='"+routeBean.getRouteID()+"' size='"+routeBean.getRouteID().length()+"' readonly/></td><td><input type='text' value='"+routeBean.getSource()+"' id='"+routeBean.getRouteID()+"SOURCE' size='"+routeBean.getSource().length()+"'readonly/></td><td><input type='text' value='"+routeBean.getDestination()+"' id='"+routeBean.getRouteID()+"DEST' size='"+routeBean.getDestination().length()+"' readonly/></td><td><input type='text' value='"+routeBean.getTravelDuration()+"' id='"+routeBean.getRouteID()+"DURATION' size='"+routeBean.getTravelDuration().length()+"'/></td><td><input type='text' value='"+routeBean.getFare()+"' id='"+routeBean.getRouteID()+"FARE' size='"+String.valueOf(routeBean.getFare()).length()+"'/></td><td><button id='modifydetails' onclick='return modifyRoutedetails(this.value)' value='"+routeBean.getRouteID()+"'>Modify</button></td>");
		}
		
		if("modifydetails".equals(submit)){
			routeBean = administratorImpl.viewByRouteId(routeid);
			
			String source = request.getParameter("source");
			String destination = request.getParameter("dest");
			String travelDuration = request.getParameter("duration");
			double fare = Double.parseDouble(request.getParameter("fare"));
			
			routeBean.setSource(source);
			routeBean.setDestination(destination);
			routeBean.setTravelDuration(travelDuration);
			routeBean.setFare(fare);
			
			if(administratorImpl.modifyRoute(routeBean)){
				System.out.println("Details MODIFIED");
				out.print("Details modified for Schedule"+routeBean.getRouteID());
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
