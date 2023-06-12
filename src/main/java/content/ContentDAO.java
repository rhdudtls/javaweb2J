package content;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;
import ticket.TicketVO;

public class ContentDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	ContentVO vo = null;

	public ArrayList<ContentVO> getContentList(String kind) {
		ArrayList<ContentVO> vos = new ArrayList<>();
		try {
				if(kind.equals("전체")) {
					sql = "select *, datediff(startDate, now()) as day_diff from tc_content order by idx desc";
					pstmt = conn.prepareStatement(sql);
				}
				else {
					sql = "select *, datediff(startDate, now()) as day_diff from tc_content where kind = ? order by idx desc";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, kind);
				}
				rs = pstmt.executeQuery();
				while(rs.next()) {
				vo = new ContentVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setPlace(rs.getString("place"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setStartTime(rs.getString("startTime"));
				vo.setRunTime(rs.getInt("runTime"));
				vo.setAge(rs.getString("age"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setKind(rs.getString("kind"));
				vo.setRsv_type(rs.getString("rsv_type"));
				vo.setPrice(rs.getInt("price"));
				vo.setDay_diff(rs.getInt("day_diff"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류: " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	public int setContentInput(ContentVO vo) {
		int res = 0;
		try {
			sql = "insert into tc_content values(default,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getPlace());
			pstmt.setString(3, vo.getStartDate());
			pstmt.setString(4, vo.getLastDate());
			pstmt.setString(5, vo.getStartTime());
			pstmt.setInt(6, vo.getRunTime());
			pstmt.setString(7, vo.getAge());
			pstmt.setString(8, vo.getPhoto());
			pstmt.setString(9, vo.getContent());
			pstmt.setString(10, vo.getKind());
			pstmt.setString(11, vo.getRsv_type());
			pstmt.setInt(12, vo.getPrice());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("sql 오류: " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public ContentVO getContentInfo(int idx) {
		try {
			sql = "select * from tc_content where idx = ? order by idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			vo = new ContentVO();
			vo.setIdx(rs.getInt("idx"));
			vo.setTitle(rs.getString("title"));
			vo.setPlace(rs.getString("place"));
			vo.setStartDate(rs.getString("startDate"));
			vo.setLastDate(rs.getString("lastDate"));
			vo.setStartTime(rs.getString("startTime"));
			vo.setRunTime(rs.getInt("runTime"));
			vo.setAge(rs.getString("age"));
			vo.setPhoto(rs.getString("photo"));
			vo.setContent(rs.getString("content"));
			vo.setKind(rs.getString("kind"));
			vo.setRsv_type(rs.getString("rsv_type"));
			vo.setPrice(rs.getInt("price"));
		} catch (SQLException e) {
			System.out.println("sql 오류: " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	public int contentDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from tc_content where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("sql 오류: " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public ContentVO getContentTitleCheck(String title) {
		try {
			sql = "select * from tc_content where title = ? order by idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new ContentVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setPlace(rs.getString("place"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setStartTime(rs.getString("startTime"));
				vo.setRunTime(rs.getInt("runTime"));
				vo.setAge(rs.getString("age"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setKind(rs.getString("kind"));
				vo.setRsv_type(rs.getString("rsv_type"));
				vo.setPrice(rs.getInt("price"));
			}
		} catch (SQLException e) {
			System.out.println("sql 오류: " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	public int setContentUpdate(ContentVO vo) {
		int res = 0;
		try {
			sql = "update tc_content set place=?,startDate=?,lastDate=?,startTime=?,runTime=?,age=?,photo=?,content=?,kind=?,rsv_type=?,price=? where idx=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPlace());
			pstmt.setString(2, vo.getStartDate());
			pstmt.setString(3, vo.getLastDate());
			pstmt.setString(4, vo.getStartTime());
			pstmt.setInt(5, vo.getRunTime());
			pstmt.setString(6, vo.getAge());
			pstmt.setString(7, vo.getPhoto());
			pstmt.setString(8, vo.getContent());
			pstmt.setString(9, vo.getKind());
			pstmt.setString(10, vo.getRsv_type());
			pstmt.setInt(11, vo.getPrice());
			pstmt.setInt(12, vo.getIdx());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("sql 오류: " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public ArrayList<ContentVO> getReservationList(String mid, int startIndexNo, int pageSize) {
		ArrayList<ContentVO> vos = new ArrayList<>();
		try {
			sql = "select tc_content.idx, tc_content.title, tc_content.place, tc_content.runTime, tc_content.age, tc_content.kind, tc_content.photo from tc_content,tc_ticket where tc_ticket.memMid = ? and tc_ticket.conIdx = tc_content.idx order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, startIndexNo);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new ContentVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setPlace(rs.getString("place"));
				vo.setRunTime(rs.getInt("runTime"));
				vo.setAge(rs.getString("age"));
				vo.setKind(rs.getString("kind"));
				vo.setPhoto(rs.getString("photo"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류: " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	public ArrayList<LikeVO> getLikeList(String mid) {
		ArrayList<LikeVO> vos = new ArrayList<>();
		try {
			sql = "select * from tc_like where memMid = ? order by idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LikeVO vo = new LikeVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMemMid(rs.getString("memMid"));
				vo.setConIdx(rs.getInt("conIdx"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류: " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	public void setLikeDelete(String mid, int idx) {
		try {
			sql = "delete from tc_like where memMid = ? and conIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류: " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	public void setLikeInsert(String mid, int idx) {
		try {
			sql = "insert into tc_like values(default,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류: " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	public ArrayList<ContentVO> getContentListAll() {
		ArrayList<ContentVO> vos = new ArrayList<>();
		try {
			sql = "select *, datediff(startDate, now()) as day_diff from tc_content order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
			vo = new ContentVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setPlace(rs.getString("place"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setStartTime(rs.getString("startTime"));
				vo.setRunTime(rs.getInt("runTime"));
				vo.setAge(rs.getString("age"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setKind(rs.getString("kind"));
				vo.setRsv_type(rs.getString("rsv_type"));
				vo.setPrice(rs.getInt("price"));
				vo.setDay_diff(rs.getInt("day_diff"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류: " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

}
