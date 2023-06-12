package content;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContentDeleteCommand implements ContentInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		
		ContentDAO dao = new ContentDAO();
		
		int res = dao.contentDelete(idx);
		
		if(res == 1) {
			request.setAttribute("msg", "게시물 삭제 완료!");
			request.setAttribute("url", request.getContextPath()+"/ContentList.co?");
		}
		else {
			request.setAttribute("msg", "게시물 삭제 실패~");
			request.setAttribute("url", request.getContextPath()+"/ContentInfo.co?idx="+idx);
			
		}
		
	}

}
