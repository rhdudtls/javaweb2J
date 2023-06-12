package change;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChangeInputOkCommand implements ChangeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String nickName = (String)session.getAttribute("sNickName");
		String title = request.getParameter("title")==null? "" : request.getParameter("title");
		String contentInfo = request.getParameter("date")==null? "" : request.getParameter("date");
		String wantSeat = request.getParameter("wantSeat")==null? "" : request.getParameter("wantSeat");
		String openSw = request.getParameter("openSw")==null? "" : request.getParameter("openSw");
		contentInfo = contentInfo.replace("🌻", "!");
		
		ChangeVO vo = new ChangeVO();
		vo.setNickName(nickName);
		vo.setTitle(title);
		vo.setOpenSw(openSw);
		vo.setContentInfo(contentInfo);
		vo.setWantSeat(wantSeat);
		ChangeDAO dao = new ChangeDAO();
		
		ChangeVO vo2 = dao.getSameCheck(contentInfo);
		
		if(vo2 != null) {
			request.setAttribute("msg", "같은 공연정보를 가진 교환글이 이미 존재합니다. 삭제 후 재작성하시거나 끌어올리기를 해주세요!");
			request.setAttribute("url", request.getContextPath()+"/ChangeList.ch");
			return;
		}
		
		
		int res = dao.setChangeInput(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "교환글이 등록되셨습니다.");
			request.setAttribute("url", request.getContextPath()+"/ChangeList.ch");
		}
		else {
			request.setAttribute("msg", "교환글 등록실패~~");
			request.setAttribute("url", request.getContextPath()+"/ChangeInput.ch");
		}
	}

}
