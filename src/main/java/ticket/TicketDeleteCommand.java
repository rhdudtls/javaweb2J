package ticket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TicketDeleteCommand implements TicketInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		
		TicketDAO dao = new TicketDAO();
		TicketVO vo = dao.getTicketInfo(idx);
		
		SeatDAO sdao = new SeatDAO();
		SeatVO svo = new SeatVO();
		svo.setConIdx(vo.getConIdx());
		svo.setMid(vo.getMemMid());
		svo.setStartTime(vo.getTicketTime());
		svo.setTicketDate(vo.getTicketDate().substring(0,9));
		String[] seat = vo.getTicketSeat().split("/");
		for(int i=0; i<seat.length; i++) {
			svo.setSeatInfo(seat[i]);
			sdao.setSeatDelete(svo);
		}
		
		int res = dao.setTicketDelete(idx);
		
		if(res == 1) {
			request.setAttribute("msg", "예매가 취소되었습니다.");
			request.setAttribute("url", request.getContextPath()+"/TicketList.ti?pag="+pag+"&pageSize="+pageSize);
		}
		else {
			request.setAttribute("msg", "예매 취소 실패~~");
			request.setAttribute("url", request.getContextPath()+"/TicketInfo.ti?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
			
		}
		
	}

}
