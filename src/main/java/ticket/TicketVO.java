package ticket;

public class TicketVO {
	private int idx;
	private int conIdx;
	private String memMid;
	private String ticketDate;
	private String ticketTime;
	private String ticketSeat;
	private String buyTicketTime;
	private int totalPrice;
	
	private String content;
	private String title;
	
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
	public String getTicketDate() {
		return ticketDate;
	}
	public void setTicketDate(String ticketDate) {
		this.ticketDate = ticketDate;
	}
	public String getTicketTime() {
		return ticketTime;
	}
	public void setTicketTime(String ticketTime) {
		this.ticketTime = ticketTime;
	}
	public String getTicketSeat() {
		return ticketSeat;
	}
	public void setTicketSeat(String ticketSeat) {
		this.ticketSeat = ticketSeat;
	}
	public String getBuyTicketTime() {
		return buyTicketTime;
	}
	public void setBuyTicketTime(String buyTicketTime) {
		this.buyTicketTime = buyTicketTime;
	}
	public String getMemMid() {
		return memMid;
	}
	public void setMemMid(String memMid) {
		this.memMid = memMid;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Override
	public String toString() {
		return "TicketVO [idx=" + idx + ", conIdx=" + conIdx + ", memMid=" + memMid + ", ticketDate=" + ticketDate
				+ ", ticketTime=" + ticketTime + ", ticketSeat=" + ticketSeat + ", buyTicketTime=" + buyTicketTime
				+ ", totalPrice=" + totalPrice + ", content=" + content + ", title=" + title + "]";
	}
}
