package ticket;

import java.io.IOException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import content.ContentDAO;
import content.ContentVO;

public class TicketReserveSeatCommand implements TicketInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		int yy = request.getParameter("yy")==null? 0 : Integer.parseInt(request.getParameter("yy"));
		int mm = request.getParameter("mm")==null? 0 : Integer.parseInt(request.getParameter("mm"));
		int dd = request.getParameter("dd")==null? 0 : Integer.parseInt(request.getParameter("dd"));
		
		String tDate = yy+"-"+mm+"-"+dd;
		ContentDAO dao = new ContentDAO();
		ContentVO vo = dao.getContentInfo(idx);
		
		LocalDate date = LocalDate.of(yy, mm, dd);
		
		DayOfWeek dayOfWeek = date.getDayOfWeek();
		
		
		
		int week = dayOfWeek.getValue();
		String weekDay = "", realTime = "";
		String[] startTime = vo.getStartTime().split("/");
		
		for(int i=0; i<7; i++) {
			if(startTime[i].equals("04:00:00") || startTime[i].equals("04:00")) {
				startTime[i] = "";
			}
		}
		
		switch (week) {
			case 1:
				weekDay = "월요일";
				realTime = startTime[0];
				break;
			case 2:
				weekDay = "화요일";
				realTime = startTime[1];
				break;
			case 3:
				weekDay = "수요일";
				realTime = startTime[2];
				break;
			case 4:
				weekDay = "목요일";
				realTime = startTime[3];
				break;
			case 5:
				weekDay = "금요일";
				realTime = startTime[4];
				break;
			case 6:
				weekDay = "토요일";
				realTime = startTime[5];
				break;
			case 7:
				weekDay = "일요일";
				realTime = startTime[6];
				break;
			default :
				weekDay = "";
				realTime = "";
		}
		
		SeatDAO sdao = new SeatDAO();
		ArrayList<SeatVO> vos = sdao.getSeatList(idx, tDate, realTime);
		String reservSeat = "";
		for(int i=0; i<vos.size(); i++) {
			reservSeat += vos.get(i).getSeatInfo();
		}
		request.setAttribute("reservSeat", reservSeat);
		request.setAttribute("realTime", realTime);
		request.setAttribute("weekDay", weekDay);
		request.setAttribute("vo", vo);
		request.setAttribute("idx", idx);
		request.setAttribute("yy", yy);
		request.setAttribute("mm", mm);
		request.setAttribute("dd", dd);
	}

}
