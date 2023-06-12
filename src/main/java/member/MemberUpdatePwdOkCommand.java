package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemberUpdatePwdOkCommand implements MemberInterface {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		String pwd = request.getParameter("pwd")==null? "" : request.getParameter("pwd");
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		pwd = vo.getSalt() + pwd; 
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		if(pwd.equals(vo.getPwd())) {
			request.setAttribute("msg", "NO");
			request.setAttribute("url", request.getContextPath()+"/MemberUpdate.mem");
		}
		else {
			request.setAttribute("msg", "비밀번호가 틀렸습니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberMypage.mem");
		}
	}

}
