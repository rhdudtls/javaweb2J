package change;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangeReplyDeleteCommand implements ChangeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int replyIdx = request.getParameter("replyIdx")==null ? 0 : Integer.parseInt(request.getParameter("replyIdx"));
	    
		ChangeDAO dao = new ChangeDAO();
		String res = dao.setReplyDeleteOk(replyIdx);
		response.getWriter().write(res);
				
	}

}
