package ticket;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import content.ContentDAO;
import content.ContentVO;

public class TicketReserveCommand implements TicketInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ContentDAO dao = new ContentDAO();
		ArrayList<ContentVO> vos = dao.getContentListAll();
		
		request.setAttribute("vos", vos);
	}

}
