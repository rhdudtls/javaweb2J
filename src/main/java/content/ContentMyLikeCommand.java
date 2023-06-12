package content;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ticket.TicketVO;

public class ContentMyLikeCommand implements ContentInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		ContentDAO dao = new ContentDAO();
		ArrayList<LikeVO> vos = dao.getLikeList(mid);
		ArrayList<ContentVO> vos2 = new ArrayList<>();
		
		for(int i=0; i<vos.size(); i++) {
			ContentVO vo = dao.getContentInfo(vos.get(i).getConIdx());
			vos2.add(vo);
		}
		
		request.setAttribute("vos", vos2);
	}
}
