package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberIdSearchOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberMidSearch(name, email);
		
		String res = "";
		if(vo == null) {
			res = "아이디가 존재하지 않습니다. 회원가입을 해주세요.";
		}
		else {
			res = "찾으시는 아이디는 "+vo.getMid()+"입니다.";
		}
		
		response.getWriter().write(res);
	}

}
