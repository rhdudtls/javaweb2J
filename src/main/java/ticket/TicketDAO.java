package ticket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class TicketDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	TicketVO vo = null;

	public int SetTicketInput(TicketVO tvo) {
		int res = 0;
		try {
			sql = "insert into tc_ticket values(default,?,?,?,?,?,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tvo.getMemMid());
			pstmt.setInt(2, tvo.getConIdx());
			pstmt.setString(3, tvo.getTicketDate());
			pstmt.setString(4, tvo.getTicketTime());
			pstmt.setString(5, tvo.getTicketSeat());
			pstmt.setInt(6, tvo.getTotalPrice());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	public ArrayList<TicketVO> getTicketList(String mid, int startIndexNo, int pageSize) {
		ArrayList<TicketVO> vos = new ArrayList<>();
		try {
			sql = "select t.*,c.title from tc_ticket t, tc_content c where t.memMid = ? and c.idx = t.conIdx order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, startIndexNo);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TicketVO vo = new TicketVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setConIdx(rs.getInt("conIdx"));
				vo.setBuyTicketTime(rs.getString("buyTicketTime"));
				vo.setMemMid(rs.getString("memMid"));
				vo.setTicketDate(rs.getString("ticketDate"));
				vo.setTicketSeat(rs.getString("ticketSeat"));
				vo.setTicketTime(rs.getString("ticketTime"));
				vo.setTotalPrice(rs.getInt("totalPrice"));
				vo.setTitle(rs.getString("title"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	public int getTotRecCnt(String mid) {
		int totRecCnt = 0;
		try {
			sql = "select count(idx) as cnt from tc_ticket where memMid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
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

	public TicketVO getTicketInfo(int idx) {
		try {
			sql = "select * from tc_ticket where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			vo = new TicketVO();
			vo.setIdx(rs.getInt("idx"));
			vo.setConIdx(rs.getInt("conIdx"));
			vo.setBuyTicketTime(rs.getString("buyTicketTime"));
			vo.setMemMid(rs.getString("memMid"));
			vo.setTicketDate(rs.getString("ticketDate"));
			vo.setTicketSeat(rs.getString("ticketSeat"));
			vo.setTicketTime(rs.getString("ticketTime"));
			vo.setTotalPrice(rs.getInt("totalPrice"));
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	public ArrayList<TicketVO> getChangeTicketList(String mid) {
		ArrayList<TicketVO> vos = new ArrayList<>();
		try {
			sql = "select distinct conIdx from tc_ticket where memMid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new TicketVO();
				vo.setConIdx(rs.getInt("conIdx"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	public ArrayList<TicketVO> getMyReserveList(String mid) {
		ArrayList<TicketVO> vos = new ArrayList<>();
		try {
			sql = "select distinct c.title, t.ticketDate, t.ticketTime, t.ticketSeat from tc_ticket t, tc_content c where t.memMid = ? and t.conIdx = c.idx";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			String content = "";
			while(rs.next()) {
				TicketVO vo = new TicketVO();
				content = rs.getString("title")+ "🌻" + rs.getString("ticketDate")+ "🌻" + rs.getString("ticketTime")+ "🌻" +rs.getString("ticketSeat");
				vo.setContent(content);
				vos.add(vo);
			}
					
		} catch (SQLException e) {
			System.out.println("sql 오류: " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	public int setTicketDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from tc_ticket where idx = ?";
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

}
