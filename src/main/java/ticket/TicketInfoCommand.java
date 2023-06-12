package ticket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import content.ContentDAO;
import content.ContentVO;

public class TicketInfoCommand implements TicketInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		
		TicketDAO tdao = new TicketDAO();
		TicketVO tvo = tdao.getTicketInfo(idx);
		ContentDAO cdao = new ContentDAO();
		ContentVO cvo = cdao.getContentInfo(tvo.getConIdx());
		
		request.setAttribute("cvo", cvo);
		request.setAttribute("tvo", tvo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		
		
	}

}
