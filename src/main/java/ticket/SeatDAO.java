package ticket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class SeatDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	SeatVO vo = null;

	public void setSeatList(SeatVO svo) {
		try {
			sql = "insert into tc_seat values(default,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, svo.getConIdx());
			pstmt.setString(2, svo.getSeatInfo());
			pstmt.setString(3, svo.getMid());
			pstmt.setString(4, svo.getStartTime());
			pstmt.setString(5, svo.getTicketDate());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	public ArrayList<SeatVO> getSeatList(int idx, String tDate, String realTime) {
		ArrayList<SeatVO> vos = new ArrayList<>();
		try {
			sql = "select * from tc_seat where conIdx = ? and ticketDate = ? and startTime= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, tDate);
			pstmt.setString(3, realTime);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SeatVO vo = new SeatVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setConIdx(rs.getInt("conIdx"));
				vo.setMid(rs.getString("memMid"));
				vo.setSeatInfo(rs.getString("seatInfo"));
				vo.setStartTime(rs.getString("startTime"));
				vo.setTicketDate(rs.getString("ticketDate"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	public void setSeatDelete(SeatVO svo) {
		try {
			sql = "delete from tc_seat where conIdx=? and seatInfo=? and memMid=? and startTime=? and ticketDate=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, svo.getConIdx());
			pstmt.setString(2, svo.getSeatInfo());
			pstmt.setString(3, svo.getMid());
			pstmt.setString(4,svo.getStartTime());
			pstmt.setString(5, svo.getTicketDate());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}

	
}
