package ticket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import content.ContentDAO;
import content.ContentVO;

public class TicketReserveCheckCommand implements TicketInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		int yy = request.getParameter("yy")==null? 0 : Integer.parseInt(request.getParameter("yy"));
		int mm = request.getParameter("mm")==null? 0 : Integer.parseInt(request.getParameter("mm"));
		int dd = request.getParameter("dd")==null? 0 : Integer.parseInt(request.getParameter("dd"));
		String weekDay = request.getParameter("weekDay")==null? "" : request.getParameter("weekDay");
		String startTime = request.getParameter("startTime")==null? "" : request.getParameter("startTime");
		int totalPrice = request.getParameter("totalPrice")==null? 0 : Integer.parseInt(request.getParameter("totalPrice"));
		String[] seats = request.getParameterValues("seat");
		
		ContentDAO dao = new ContentDAO();
		ContentVO vo = dao.getContentInfo(idx);
		
		String fullSeat = "";
		if(seats.length != 0) {
			for(String seat : seats) {
				fullSeat += seat + "/";
			}
		}
		fullSeat = fullSeat.substring(0,fullSeat.lastIndexOf("/"));
		
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("fullSeat", fullSeat);
		request.setAttribute("idx", idx);
		request.setAttribute("vo", vo);
		request.setAttribute("yy", yy);
		request.setAttribute("mm", mm);
		request.setAttribute("dd", dd);
		request.setAttribute("weekDay", weekDay);
		request.setAttribute("startTime", startTime);
	}

}
