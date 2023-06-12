package content;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContentUpdateCommand implements ContentInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		
		ContentDAO dao = new ContentDAO();
		
		ContentVO vo = dao.getContentInfo(idx);
		
		String[] startTime = vo.getStartTime().split("/");
		
		request.setAttribute("startDate", vo.getStartDate().substring(0,10));
		request.setAttribute("lastDate", vo.getLastDate().substring(0,10));
		request.setAttribute("vo", vo);
		request.setAttribute("startTime", startTime);
	
	}

}
