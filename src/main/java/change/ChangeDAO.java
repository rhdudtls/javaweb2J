package change;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class ChangeDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	ChangeVO vo = null;

	public int setChangeInput(ChangeVO vo) {
		int res = 0;
		try {
			sql = "insert into tc_change values(default,?,?,?,?,?,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContentInfo());
			pstmt.setString(4, vo.getWantSeat());
			pstmt.setString(5, vo.getOpenSw());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public ArrayList<ChangeVO> getChangeList(int startIndexNo, int pageSize) {
		ArrayList<ChangeVO> vos = new ArrayList<ChangeVO>();
		try {
			sql = "select *,datediff(writeTime, now()) as day_diff, timestampdiff(hour, writeTime, now()) as hour_diff,"
					+ "(select count(*) from tc_changeReply where changeIdx=tc_change.idx) as replyCount from tc_change order by writeTime desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new ChangeVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setWantSeat(rs.getString("wantSeat"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setContentInfo(rs.getString("contentInfo"));
				vo.setWriteTime(rs.getString("writeTime"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDay_diff(rs.getInt("day_diff"));
				vo.setReplyCount(rs.getInt("replyCount"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(idx) as cnt from tc_change";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}

	public ArrayList<ChangeVO> getChangeSearch(String search, String searchString) {
		ArrayList<ChangeVO> vos = new ArrayList<>();
		try {
			if(search.equals("content")) {
				sql = "select * from tc_change where contentInfo like ? or wantSeat like ? order by writeTime desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchString+"%");
				pstmt.setString(2, "%"+searchString+"%");
			}
			else {
				sql = "select * from tc_change where "+search+" like ? order by writeTime desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchString+"%");
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new ChangeVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setWantSeat(rs.getString("wantSeat"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setContentInfo(rs.getString("contentInfo"));
				vo.setWriteTime(rs.getString("writeTime"));
				vo.setReadNum(rs.getInt("readNum"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	public ChangeVO getChangeInfo(int idx) {
		try {
			sql = "select *,datediff(writeTime, now()) as day_diff from tc_change where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			vo = new ChangeVO();
			vo.setIdx(rs.getInt("idx"));
			vo.setNickName(rs.getString("nickName"));
			vo.setTitle(rs.getString("title"));
			vo.setWantSeat(rs.getString("wantSeat"));
			vo.setOpenSw(rs.getString("openSw"));
			vo.setContentInfo(rs.getString("contentInfo").replace("!", "🌻"));
			vo.setWriteTime(rs.getString("writeTime"));
			vo.setReadNum(rs.getInt("readNum"));
			vo.setDay_diff(rs.getInt("day_diff"));
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	public void setReadNumUpdate(int idx) {
		try {
			sql = "update tc_change set readNum = readNum + 1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}

	public ArrayList<ChangeReplyVO> getChangeReply(int idx) {
		ArrayList<ChangeReplyVO> ReplyVos = new ArrayList<>();
		try {
			sql = "select * from tc_changeReply where changeIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ChangeReplyVO vo = new ChangeReplyVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setChangeIdx(rs.getInt("changeIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setwDate(rs.getString("wDate"));
				vo.setContent(rs.getString("content"));
				vo.setSecret(rs.getString("secret"));
				ReplyVos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return ReplyVos;
	}

	public int setChangeDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from tc_change where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public String setReplyInputOk(ChangeReplyVO replyVo) {
		String res = "0";
		try {
			sql = "insert into tc_changeReply values(default,?,?,?,default,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyVo.getChangeIdx());
			pstmt.setString(2, replyVo.getMid());
			pstmt.setString(3, replyVo.getNickName());
			pstmt.setString(4, replyVo.getContent());
			pstmt.setString(5, replyVo.getSecret());
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public String setReplyDeleteOk(int replyIdx) {
		String res = "0";
		try {
			sql = "delete from tc_changeReply where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyIdx);
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public int setChangeUpdate(ChangeVO vo, int idx) {
		int res = 0;
		try {
			sql = "update tc_change set title=?,wantSeat=?,openSw=? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWantSeat());
			pstmt.setString(3, vo.getOpenSw());
			pstmt.setInt(4, idx);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public ArrayList<ChangeVO> getChangeMyList(String nickName, int startIndexNo, int pageSize) {
		ArrayList<ChangeVO> vos = new ArrayList<>();
		try {
			sql = "select *,datediff(writeTime, now()) as day_diff, timestampdiff(hour, writeTime, now()) as hour_diff,"
					+ "(select count(*) from tc_changeReply where changeIdx=tc_change.idx) as replyCount from tc_change where nickName = ? order by writeTime desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			pstmt.setInt(2, startIndexNo);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new ChangeVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setWantSeat(rs.getString("wantSeat"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setContentInfo(rs.getString("contentInfo").replace("/", "🌻"));
				vo.setWriteTime(rs.getString("writeTime"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDay_diff(rs.getInt("day_diff"));
				vo.setReplyCount(rs.getInt("replyCount"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	public int getTotMyRecCnt(String nickName) {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from tc_change where nickName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}
	public int getTotMyReplyRecCnt(String nickName) {
		int totRecCnt = 0;
		try {
			sql = "select count(distinct c.idx) as cnt from tc_change c, tc_changeReply r where r.nickName = ? and c.idx = r.changeIdx";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}

	public ArrayList<ChangeVO> getChangeMyReplyList(String nickName, int startIndexNo, int pageSize) {
		ArrayList<ChangeVO> vos = new ArrayList<>();
		try {
			sql = "select c.*, datediff(c.writeTime, now()) as day_diff, timestampdiff(hour, c.writeTime, now()) as hour_diff,(select count(*) "
					+ "from tc_changeReply where changeIdx=c.idx) as replyCount from tc_change c, tc_changeReply r "
					+ "where r.nickName = ? and c.idx = r.changeIdx group by c.idx order by c.writeTime desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			pstmt.setInt(2, startIndexNo);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new ChangeVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setWantSeat(rs.getString("wantSeat"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setContentInfo(rs.getString("contentInfo").replace("/", "🌻"));
				vo.setWriteTime(rs.getString("writeTime"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDay_diff(rs.getInt("day_diff"));
				vo.setReplyCount(rs.getInt("replyCount"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	public ChangeVO getSameCheck(String contentInfo) {
		try {
			sql = "select * from tc_change where contentInfo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, contentInfo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new ChangeVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setWantSeat(rs.getString("wantSeat"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setContentInfo(rs.getString("contentInfo"));
				vo.setWriteTime(rs.getString("writeTime"));
				vo.setReadNum(rs.getInt("readNum"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	public int setWriteTimeUpdate(int idx) {
		int res = 0;
		try {
			sql = "update tc_change set writeTime = now() where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
}
