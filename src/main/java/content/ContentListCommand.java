package content;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ContentListCommand implements ContentInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String kind = request.getParameter("kind")==null ? "전체" : request.getParameter("kind");
		int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		ContentDAO dao = new ContentDAO();
		
		ArrayList<ContentVO> vos = dao.getContentList(kind);
		
		String[] week = {"월","화","수","목","금","토","일"};
		
		for(int i=0; i<vos.size(); i++) {
			String realTime = "";
			String[] startTimes = vos.get(i).getStartTime().split("/");
			for(int j=0; j<7; j++) {
				if(startTimes[j].equals("04:00:00") || startTimes[j].equals("04:00")) {
					startTimes[j] = "";
				}
				else {
					startTimes[j] = week[j]+ "요일 : " + startTimes[j];
					realTime += (startTimes[j]+"<br/>");
				}
			}
			vos.get(i).setStartTime(realTime);
		}
		
		request.setAttribute("vos", vos);
		request.setAttribute("kind", kind);
		
	}

}
