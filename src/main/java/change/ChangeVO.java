package change;

public class ChangeVO {
	private int idx;
	private String nickName;
	private String title;
	private String contentInfo;
	private String wantSeat;
	private String openSw;
	private String writeTime;
	private int readNum;
	
	private int day_diff;
	private int hour_diff;
	private int replyCount;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContentInfo() {
		return contentInfo;
	}
	public void setContentInfo(String contentInfo) {
		this.contentInfo = contentInfo;
	}
	public String getWantSeat() {
		return wantSeat;
	}
	public void setWantSeat(String wantSeat) {
		this.wantSeat = wantSeat;
	}
	public String getOpenSw() {
		return openSw;
	}
	public void setOpenSw(String openSw) {
		this.openSw = openSw;
	}
	public String getWriteTime() {
		return writeTime;
	}
	public void setWriteTime(String writeTime) {
		this.writeTime = writeTime;
	}
	public int getReadNum() {
		return readNum;
	}
	public void setReadNum(int readNum) {
		this.readNum = readNum;
	}
	public int getDay_diff() {
		return day_diff;
	}
	public void setDay_diff(int day_diff) {
		this.day_diff = day_diff;
	}
	public int getHour_diff() {
		return hour_diff;
	}
	public void setHour_diff(int hour_diff) {
		this.hour_diff = hour_diff;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	@Override
	public String toString() {
		return "ChangeVO [idx=" + idx + ", nickName=" + nickName + ", title=" + title + ", contentInfo=" + contentInfo
				+ ", wantSeat=" + wantSeat + ", openSw=" + openSw + ", writeTime=" + writeTime + ", readNum=" + readNum
				+ ", day_diff=" + day_diff + ", hour_diff=" + hour_diff + ", replyCount=" + replyCount + "]";
	}
}
