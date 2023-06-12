package ticket;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.ti")
public class TicketController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TicketInterface command = null;
		String viewPage = "/WEB-INF/ticket";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		
		if(level > 1) {	// 비회원인경우는 로그인화면으로 보내버린다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/MemberLogin.mem");
			dispatcher.forward(request, response);
			return;
		}
		else if(com.equals("/TicketReserve")) {
			command = new TicketReserveCommand();
			command.execute(request, response);
			viewPage += "/ticketReserve.jsp";
		}
		else if(com.equals("/TicketReserveDate")) {
			command = new TicketReserveDateCommand();
			command.execute(request, response);
			viewPage += "/ticketReserveDate.jsp";
		}
		else if(com.equals("/TicketReserveSeat")) {
			command = new TicketReserveSeatCommand();
			command.execute(request, response);
			viewPage += "/ticketReserveSeat.jsp";
		}
		else if(com.equals("/TicketReserveCheck")) {
			command = new TicketReserveCheckCommand();
			command.execute(request, response);
			viewPage += "/ticketReserveCheck.jsp";
		}
		else if(com.equals("/TicketReserveOk")) {
			command = new TicketReserveOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/TicketList")) {
			command = new TicketListCommand();
			command.execute(request, response);
			viewPage += "/ticketList.jsp";
		}
		else if(com.equals("/TicketInfo")) {
			command = new TicketInfoCommand();
			command.execute(request, response);
			viewPage += "/ticketInfo.jsp";
		}
		else if(com.equals("/TicketDelete")) {
			command = new TicketDeleteCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
