package change;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChangeDeleteCommand implements ChangeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sNickName = (String) session.getAttribute("sNickName");
		int sLevel = (int) session.getAttribute("sLevel");
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		
		if(sLevel != 0) {
			if(!sNickName.equals(nickName)) {
				request.setAttribute("msg", "잘못된 접근입니다.");
				request.setAttribute("url", request.getContextPath()+"/");
				return;
			}
		}
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		
		ChangeDAO dao = new ChangeDAO();
		
		ArrayList<ChangeReplyVO> vos = dao.getChangeReply(idx);
		if(vos.size() != 0) {
			request.setAttribute("msg", "현 게시글에 댓글이 존재합니다.\\n댓글을 먼저 삭제해 주세요.");
			request.setAttribute("url", request.getContextPath()+"/ChangeInfo.ch?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
			return;
		}
		
		int res = dao.setChangeDelete(idx);
		
		if(res == 1) {
			request.setAttribute("msg", "게시글이 삭제되었습니다.");
			request.setAttribute("url", request.getContextPath()+"/ChangeList.ch?pag="+pag+"&pageSize="+pageSize);
		}
		else {
			request.setAttribute("msg", "게시글 삭제실패~~");
			request.setAttribute("url", request.getContextPath()+"/ChangeInfo.ch?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		}
		
	}

}
