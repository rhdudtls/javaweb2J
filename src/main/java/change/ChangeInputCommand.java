package change;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import content.ContentDAO;
import content.ContentVO;
import ticket.TicketDAO;
import ticket.TicketVO;

public class ChangeInputCommand implements ChangeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		
		TicketDAO dao = new TicketDAO();
		ArrayList<TicketVO> vos = dao.getMyReserveList(mid);
		
		request.setAttribute("vos", vos);
	}

}
