package ticket;

public class SeatVO {
	private int idx;
	private int conIdx;
	private String seatInfo;
	private String mid;
	private String startTime;
	private String ticketDate;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getConIdx() {
		return conIdx;
	}
	public void setConIdx(int conIdx) {
		this.conIdx = conIdx;
	}
	public String getSeatInfo() {
		return seatInfo;
	}
	public void setSeatInfo(String seatInfo) {
		this.seatInfo = seatInfo;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getTicketDate() {
		return ticketDate;
	}
	public void setTicketDate(String ticketDate) {
		this.ticketDate = ticketDate;
	}
	@Override
	public String toString() {
		return "SeatVO [idx=" + idx + ", conIdx=" + conIdx + ", seatInfo=" + seatInfo + ", mid=" + mid + ", startTime="
				+ startTime + ", ticketDate=" + ticketDate + "]";
	}
}
