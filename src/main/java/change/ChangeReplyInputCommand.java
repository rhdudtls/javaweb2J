package change;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangeReplyInputCommand implements ChangeInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int changeIdx = request.getParameter("changeIdx")==null ? 0 : Integer.parseInt(request.getParameter("changeIdx"));
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String secret = request.getParameter("secret")==null ? "" : request.getParameter("secret");
		
		
		ChangeReplyVO replyVo = new ChangeReplyVO();
		
		replyVo.setChangeIdx(changeIdx);
		replyVo.setMid(mid);
		replyVo.setNickName(nickName);
		replyVo.setContent(content);
		replyVo.setSecret(secret);
		
		ChangeDAO dao = new ChangeDAO();
		
		String res = dao.setReplyInputOk(replyVo);
		
		response.getWriter().write(res);
	}

}
