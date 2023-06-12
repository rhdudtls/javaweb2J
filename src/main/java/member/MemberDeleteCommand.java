package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberDeleteCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		
		dao.setDeleteYes(mid);
		
		session.invalidate();
		
		request.setAttribute("msg", "회원 탈퇴 완료! 30일간 같은 아이디로 재가입 할 수 없습니다.");
		request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
	}

}
