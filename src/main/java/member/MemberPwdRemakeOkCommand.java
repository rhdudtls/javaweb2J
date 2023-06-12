package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemberPwdRemakeOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null? "" : request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		pwd = vo.getSalt() + pwd;
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);

		int res = dao.setPwdRemake(mid, pwd);
		
		if(res == 1) {
			request.setAttribute("msg", "비밀번호 변경 완료! 새비밀번호로 로그인하세요!");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
		}
		else {
			request.setAttribute("msg", "비밀번호 변경 실패! 다시 시도하세요");
			request.setAttribute("url", request.getContextPath()+"/MemberPwdSearch.mem");
			
		}
		HttpSession session = request.getSession();
		session.invalidate();
	}

}
