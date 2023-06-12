package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null? "" : request.getParameter("pwd");
		String idSave = request.getParameter("idSave")==null? "" : request.getParameter("idSave");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		if(vo.getSalt() == null || vo.getMemberDel().equals("YES")) {
			request.setAttribute("msg", "회원정보가 없습니다. \\n다시 입력하세요.");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			return;
		}
		
		String salt = vo.getSalt();
		pwd = salt + pwd;
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		if(!pwd.equals(vo.getPwd())) {
			request.setAttribute("msg", "비밀번호를 확인하세요.");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			return;
		}
		
		dao.setVisitDateUpdate(mid);
		
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		session.setAttribute("sNickName", vo.getNickName());
		session.setAttribute("sLevel", vo.getLevel());
		
		Cookie cMid = new Cookie("cMid", mid);
		if(idSave.equals("on")) {
			cMid.setMaxAge(60*60*24*30);
		}
		else {
			cMid.setMaxAge(0);
		}
		response.addCookie(cMid);
		
		request.setAttribute("msg", vo.getNickName()+"님 로그인!");
		request.setAttribute("url", request.getContextPath()+"/");
		
	}

}
