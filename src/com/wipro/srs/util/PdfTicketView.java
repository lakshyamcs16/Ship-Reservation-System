package com.wipro.srs.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.wipro.srs.bean.PassengerBean;
import com.wipro.srs.bean.ReservationBean;


public  class PdfTicketView extends AbstractITextPdfView {
	@SuppressWarnings("rawtypes")
	@Override
	protected void buildPdfDocument(Map<String,Object>model,Document document,
	PdfWriter writer,HttpServletRequest request,
	HttpServletResponse response) throws Exception
	{
		Font font = new Font();
		font.setSize(24);
		font.setStyle(Font.BOLD);
		font.setFamily("HELVETICA");
		Paragraph header = new Paragraph("SHIP RESERVATION SYSTEM",font);

		header.setFont(font);
		header.setAlignment(Element.ALIGN_CENTER);
		
		
        Image image1 = Image.getInstance("D:/ship_logo.png");
        image1.setAlignment(Element.ALIGN_CENTER);
        image1.setTransparency(new int[]{ 0x00, 0x10 });
        
        document.add(image1);
        document.add(header);
		Paragraph details = new Paragraph("Ticket Details");
		details.setAlignment(Element.ALIGN_CENTER);
		document.add(details);
		
		Paragraph date = new Paragraph(String.valueOf(new Date()));
		date.setAlignment(Element.ALIGN_RIGHT);
		document.add(date);
		
		document.add(new Paragraph("                    "));
		HttpSession session;
		session = request.getSession();
		@SuppressWarnings("unchecked")
		Map<ReservationBean,ArrayList<PassengerBean>> map=(Map<ReservationBean,ArrayList<PassengerBean>>)session.getAttribute("map");
		PdfPTable pTable=new PdfPTable(5);
		
		pTable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
	    pTable.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
		
		pTable.addCell("Reservation ID");
		pTable.addCell("Booking Status");
		pTable.addCell("Number of seats");
		pTable.addCell("Total Fare");
		pTable.addCell("Journey Date");
		
		String reservationId = "";
		PdfPTable table = new PdfPTable(3);
		table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
	    table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
		int flag = 0;
		if(map!=null){
			
			Set<?> set = map.entrySet();
			Iterator<?> itr = set.iterator();
			
			Map.Entry m;
			while(itr.hasNext()){
			    m = (Map.Entry) itr.next();
			    ReservationBean reservationBean = (ReservationBean)m.getKey();
			    reservationId = reservationBean.getReservationID();
			    pTable.addCell(reservationId);
			    pTable.addCell(reservationBean.getBookingStatus());
			    pTable.addCell(String.valueOf(reservationBean.getNoOfSeats()));
			    pTable.addCell("$ "+String.valueOf(reservationBean.getTotalFare()));
			    pTable.addCell(String.valueOf(reservationBean.getJourneyDate()));
			    
			    
			    
			    
			    if(flag==0){
			    	document.add(new Paragraph("                        "));
			    	table.addCell("Name");
				    table.addCell("Age");
				    table.addCell("Gender");
				    flag = 1;
			    }
			    ArrayList<?> arrayList = (ArrayList<?>)m.getValue();
			    System.out.print("ARRAY"+arrayList.toString());

			    for(int i=0; i<arrayList.size(); i++){
			    	PassengerBean passengerBean = (PassengerBean)arrayList.get(i);
			    	table.addCell(passengerBean.getName());
				    table.addCell(passengerBean.getAge());
				    table.addCell(passengerBean.getGender());
				   
			    }
			    }
			    }
		
		Font reservationFont = new Font();
		reservationFont.setSize(14);
		reservationFont.setStyle(Font.BOLD);
		reservationFont.setFamily("HELVETICA");
		Paragraph reservation = new Paragraph("Please save reservation id for future references: "+reservationId,reservationFont);

		reservation.setFont(reservationFont);
		reservation.setAlignment(Element.ALIGN_CENTER);
		document.add(reservation);
		document.add(Chunk.NEWLINE);
		document.add(pTable);
		document.add(table);
	}

}
