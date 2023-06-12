package change;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangeWriteTimeUpdateCommand implements ChangeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		
		ChangeDAO dao = new ChangeDAO();
		int res = dao.setWriteTimeUpdate(idx);
		
		if(res == 1) {
			request.setAttribute("msg", "끌어올리기 성공!");
			request.setAttribute("url", request.getContextPath()+"/ChangeList.ch");
		}
		else {
			request.setAttribute("msg", "끌어올리기 실패!");
			request.setAttribute("url", request.getContextPath()+"/ChangeInfo.ch?idx="+idx);
		}
	}

}
