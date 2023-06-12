package change;

public class ChangeReplyVO {
	private int idx;
	private int changeIdx;
	private String mid;
	private String nickName;
	private String wDate;
	private String content;
	private String secret;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getChangeIdx() {
		return changeIdx;
	}
	public void setChangeIdx(int changeIdx) {
		this.changeIdx = changeIdx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	@Override
	public String toString() {
		return "ChangeReplyVO [idx=" + idx + ", changeIdx=" + changeIdx + ", mid=" + mid + ", nickName=" + nickName
				+ ", wDate=" + wDate + ", content=" + content + ", secret=" + secret + "]";
	}
}
