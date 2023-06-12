package change;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ticket.TicketReserveCommand;

@SuppressWarnings("serial")
@WebServlet("*.ch")
public class ChangeController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ChangeInterface command = null;
		String viewPage = "/WEB-INF/change";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		
//		if(level > 1) {	// 비회원인경우는 로그인화면으로 보내버린다.
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/MemberLogin.mem");
//			dispatcher.forward(request, response);
//			return;
//		}
		if(com.equals("/ChangeList")) {
			command = new ChangeListCommand();
			command.execute(request, response);
			viewPage += "/changeList.jsp";
		}
		else if(com.equals("/ChangeInput")) {
			command = new ChangeInputCommand();
			command.execute(request, response);
			viewPage += "/changeInput.jsp";
		}
		else if(com.equals("/ChangeInputOk")) {
			command = new ChangeInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/ChangeSearch")) {
			command = new ChangeSearchCommand();
			command.execute(request, response);
			viewPage += "/changeSearch.jsp";
		}
		else if(com.equals("/ChangeInfo")) {
			command = new ChangeInfoCommand();
			command.execute(request, response);
			viewPage += "/changeInfo.jsp";
		}
		else if(com.equals("/ChangeDelete")) {
			command = new ChangeDeleteCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/ChangeReplyInput")) {
			command = new ChangeReplyInputCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ChangeReplyDelete")) {
			command = new ChangeReplyDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ChangeUpdate")) {
			command = new ChangeUpdateCommand();
			command.execute(request, response);
			viewPage += "/changeUpdate.jsp";
		}
		else if(com.equals("/ChangeUpdateOk")) {
			command = new ChangeUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/ChangeMyList")) {
			command = new ChangeMyListCommand();
			command.execute(request, response);
			viewPage += "/changeMyList.jsp";
		}
		else if(com.equals("/ChangeMyReplyList")) {
			command = new ChangeMyReplyListCommand();
			command.execute(request, response);
			viewPage += "/changeMyReplyList.jsp";
		}
		else if(com.equals("/ChangeWriteTimeUpdate")) {
			command = new ChangeWriteTimeUpdateCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
