package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberPwdSearchOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberPwdSearch(mid, email);
		
		if(vo == null) {
			request.setAttribute("msg", "아이디와 이메일 정보가 올바르지 않습니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberPwdSearch.mem");
		}
		else {
			session.setAttribute("imsiId", mid);
			request.setAttribute("msg", "NO");
			request.setAttribute("url", request.getContextPath()+"/MemberPwdRemake.mem");
		}
	}

}
