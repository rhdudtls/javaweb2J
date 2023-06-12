package ticket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TicketReserveOkCommand implements TicketInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		int yy = request.getParameter("yy")==null? 0 : Integer.parseInt(request.getParameter("yy"));
		int mm = request.getParameter("mm")==null? 0 : Integer.parseInt(request.getParameter("mm"));
		int dd = request.getParameter("dd")==null? 0 : Integer.parseInt(request.getParameter("dd"));
		int totalPrice = request.getParameter("totalPrice")==null? 0 : Integer.parseInt(request.getParameter("totalPrice"));
		String weekDay = request.getParameter("weekDay")==null? "" : request.getParameter("weekDay");
		String startTime = request.getParameter("startTime")==null? "" : request.getParameter("startTime");
		String fullSeat = request.getParameter("fullSeat")==null? "" : request.getParameter("fullSeat");
		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		String ticketDate = yy+"-"+mm+"-"+dd+" "+weekDay;
		String tDate = yy+"-"+mm+"-"+dd;
		
		SeatDAO sdao = new SeatDAO();
		SeatVO svo = new SeatVO();
		svo.setConIdx(idx);
		svo.setMid(mid);
		svo.setStartTime(startTime);
		svo.setTicketDate(tDate);
		String[] seats = fullSeat.split("/");
		for(String seat : seats) {
			svo.setSeatInfo(seat);
			sdao.setSeatList(svo);
		}
		
		TicketDAO tdao = new TicketDAO();
		TicketVO tvo = new TicketVO();
		tvo.setConIdx(idx);
		tvo.setTicketTime(startTime);
		tvo.setTicketSeat(fullSeat);
		tvo.setTicketDate(ticketDate);
		tvo.setMemMid(mid);
		tvo.setTotalPrice(totalPrice);
		int res = tdao.SetTicketInput(tvo);
		
		if(res == 1) {
			request.setAttribute("msg", "예매 완료! 마이페이지에서 예매내역을 확인하실 수 있습니다.");
			request.setAttribute("url", request.getContextPath()+"/ContentList.co");
		}
		else {
			request.setAttribute("msg", "예매 실패!");
			request.setAttribute("url", request.getContextPath()+"/ContentInfo.co?idx="+idx);
			
		}
	}

}
