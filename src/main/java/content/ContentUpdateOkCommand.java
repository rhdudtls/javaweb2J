package content;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.MemberVO;

public class ContentUpdateOkCommand implements ContentInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String realPath = request.getServletContext().getRealPath("/assets/img/content");
		int maxSize = 1024 * 1024 * 10;	// 서버에 저장할 최대용량을 10MByte로 제한한다.(1회저장용량)
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String originalFileName = multipartRequest.getOriginalFileName("photo");
		String filesystemName = multipartRequest.getFilesystemName("photo");
		
		System.out.println("원본 파일명 : " + originalFileName);
		System.out.println("서버에 저장경로 : " + realPath);
		System.out.println("서버에 저장된 파일명 : " + filesystemName);
		
		int idx = multipartRequest.getParameter("idx")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("idx"));
		String place = multipartRequest.getParameter("place")==null ? "" : multipartRequest.getParameter("place");
		String startDate = multipartRequest.getParameter("startDate")==null ? "" : multipartRequest.getParameter("startDate");
		String lastDate = multipartRequest.getParameter("lastDate")==null ? "" : multipartRequest.getParameter("lastDate");
		int runTime = multipartRequest.getParameter("runTime")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("runTime"));
		int price = multipartRequest.getParameter("price")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("price"));
		String age = multipartRequest.getParameter("age")==null ? "" : multipartRequest.getParameter("age");
		String startTime = multipartRequest.getParameter("startTime")==null ? "" : multipartRequest.getParameter("startTime");
		String content = multipartRequest.getParameter("content")==null ? "" : multipartRequest.getParameter("content");
		String kind = multipartRequest.getParameter("kind")==null ? "" : multipartRequest.getParameter("kind");
		String rsv_type = multipartRequest.getParameter("rsv_type")==null ? "" : multipartRequest.getParameter("rsv_type");
		ContentDAO dao = new ContentDAO();
		
		ContentVO vo2 = dao.getContentInfo(idx);
		
		ContentVO vo = new ContentVO();
		vo.setIdx(idx);
		vo.setPlace(place);
		vo.setStartDate(startDate);
		vo.setStartTime(startTime);
		vo.setLastDate(lastDate);
		vo.setRunTime(runTime);
		vo.setAge(age);
		vo.setContent(content);
		vo.setKind(kind);
		vo.setRsv_type(rsv_type);
		vo.setPrice(price);
		if(filesystemName == null) {
			vo.setPhoto(vo2.getPhoto());
		}
		else {
			vo.setPhoto(filesystemName);
		}
		
		if(filesystemName != null) {
			File file = new File(realPath+"/"+vo2.getPhoto());
			if(file.exists()) {
				file.delete();
			}
		}
		int res = dao.setContentUpdate(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "게시물 수정 완료!");
		}
		else {
			request.setAttribute("msg", "게시물 수정 실패~");
		}
		
		request.setAttribute("url", request.getContextPath()+"/ContentInfo.co?idx="+idx);
	}

}
