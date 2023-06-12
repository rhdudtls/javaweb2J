package content;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.co")
public class ContentController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ContentInterface command = null;
		String viewPage = "/WEB-INF/content";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		
		if(com.equals("/ContentList")) {
			command = new ContentListCommand();
			command.execute(request, response);
			viewPage += "/contentList.jsp";
		}
		else if(com.equals("/ContentInfo")) {
			command = new ContentInfoCommand();
			command.execute(request, response);
			viewPage += "/contentInfo.jsp";
		}
		else if(com.equals("/ContentlikeCheck")) {
			command = new ContentlikeCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ContentMyLike")) {
			command = new ContentMyLikeCommand();
			command.execute(request, response);
			viewPage += "/contentMyLike.jsp";
		}
		else if(level != 0) {	// 관리자가 아니면 초기화면으로 보낸다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
			return;
		}
		else if(com.equals("/ContentInput")) {
			viewPage += "/contentInput.jsp";
		}
		else if(com.equals("/ContentInputOk")) {
			command = new ContentInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/ContentDelete")) {
			command = new ContentDeleteCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/ContentUpdate")) {
			command = new ContentUpdateCommand();
			command.execute(request, response);
			viewPage += "/contentUpdate.jsp";
		}
		else if(com.equals("/ContentUpdateOk")) {
			command = new ContentUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
