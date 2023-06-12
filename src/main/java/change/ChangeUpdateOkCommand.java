package change;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChangeUpdateOkCommand implements ChangeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		String nickName = (String)session.getAttribute("sNickName");
		String title = request.getParameter("title")==null? "" : request.getParameter("title");
		String contentInfo = request.getParameter("date")==null? "" : request.getParameter("date");
		String wantSeat = request.getParameter("wantSeat")==null? "" : request.getParameter("wantSeat");
		String openSw = request.getParameter("openSw")==null? "" : request.getParameter("openSw");
		contentInfo = contentInfo.replace("🌻", "/");
		
		ChangeVO vo = new ChangeVO();
		vo.setNickName(nickName);
		vo.setTitle(title);
		vo.setOpenSw(openSw);
		vo.setContentInfo(contentInfo);
		vo.setWantSeat(wantSeat);
		ChangeDAO dao = new ChangeDAO();
		int res = dao.setChangeUpdate(vo, idx);
		
		if(res == 1) {
			request.setAttribute("msg", "교환글이 수정되었습니다.");
		}
		else {
			request.setAttribute("msg", "교환글 수정실패~~");
		}
		request.setAttribute("url", request.getContextPath()+"/ChangeInfo.ch?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
	}

}
