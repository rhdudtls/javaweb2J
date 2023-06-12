package content;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ContentInfoCommand implements ContentInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String kind = request.getParameter("kind")==null ? "전체" : request.getParameter("kind");
		String flag = request.getParameter("flag")==null? "" : request.getParameter("flag");
		ContentDAO dao = new ContentDAO();
		ContentVO vo = dao.getContentInfo(idx);
		
		String[] startTime = vo.getStartTime().split("/");
		String realTime="";
		String[] week = {"월","화","수","목","금","토","일"};
		for(int j=0; j<7; j++) {
			if(startTime[j].equals("04:00:00") || startTime[j].equals("04:00")) {
				startTime[j] = "";
			}
			else {
				startTime[j] = week[j]+ "요일 : " + startTime[j];
				realTime += (startTime[j]+"<br/>");
			}
		}
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		int likeSw = 0;
		ArrayList<LikeVO> vos = dao.getLikeList(mid);
		for(int i=0; i<vos.size(); i++) {
			if(vos.get(i).getConIdx() == idx) {
				likeSw = 1;
			}
		}
		
		request.setAttribute("realTime", realTime);
		request.setAttribute("vo", vo);
		request.setAttribute("kind", kind);
		request.setAttribute("likeSw", likeSw);
		request.setAttribute("flag", flag);
	}

}
