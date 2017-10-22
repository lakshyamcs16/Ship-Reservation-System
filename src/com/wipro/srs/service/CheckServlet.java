package com.wipro.srs.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wipro.srs.bean.RouteBean;
import com.wipro.srs.bean.ShipBean;

/**
 * Servlet implementation class CheckServlet
 */
public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String submit = request.getParameter("submit");
		
		PrintWriter out = response.getWriter();
		AdministratorImpl administratorImpl = new AdministratorImpl();
		
		if("shipid".equals(submit)){
			ShipBean shipBean = new ShipBean();
			String shipid = request.getParameter("shipid");
			shipBean = administratorImpl.viewByShipId(shipid);
			if(shipBean==null){
				out.print("<font color='red'>Ship ID doesn't exist.</font>");
			}
		}
		
		if("routeid".equals(submit)){
			RouteBean routeBean = new RouteBean();
			String routeid = request.getParameter("routeid");
			System.out.println(routeid);
			routeBean = administratorImpl.viewByRouteId(routeid);
			if(routeBean==null){
				out.print("<font color='red'>Route ID doesn't exist.</font>");
			}
		}
	}

}
