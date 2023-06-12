package change;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChangeInfoCommand implements ChangeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		String flag = request.getParameter("flag")==null ? "" : request.getParameter("flag");
		String search = request.getParameter("search")==null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");
		
		ChangeDAO dao = new ChangeDAO();
		// 글 조회수 1회 증가시키기(조회수 중복방지처리 - 세션사용 : "'board'+고유번호" 값을 객체배열(ArrayList)에 추가시킨다.)
		HttpSession session = request.getSession();
		ArrayList<String> changeInfoIdx = (ArrayList) session.getAttribute("sChangeInfoIdx");
		if(changeInfoIdx == null) {
			changeInfoIdx = new ArrayList<String>();
		}
		String imsiChangeInfoIdx = "changeInfo" + idx;
		if(!changeInfoIdx.contains(imsiChangeInfoIdx)) {
			dao.setReadNumUpdate(idx);
			changeInfoIdx.add(imsiChangeInfoIdx);
		}
		session.setAttribute("sChangeInfoIdx", changeInfoIdx);
		
		// 현재 선택된 게시글(idx)의 전체내용물을 가져오기
		ChangeVO vo = dao.getChangeInfo(idx);
		
		//댓글 가져오기
		ArrayList<ChangeReplyVO> replyVos = dao.getChangeReply(idx);
		
		request.setAttribute("replyVos", replyVos);
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("flag", flag);
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
		
	}

}
