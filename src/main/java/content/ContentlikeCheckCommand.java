package content;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ContentlikeCheckCommand implements ContentInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		int likeSw = request.getParameter("likeSw")==null? 0 : Integer.parseInt(request.getParameter("likeSw"));
		ContentDAO dao = new ContentDAO();
		
		
		if(likeSw == 1) {
			dao.setLikeDelete(mid, idx);
		}
		else {
			dao.setLikeInsert(mid, idx);
		}
	}
}
