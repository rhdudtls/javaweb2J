package content;

public class LikeVO {
	private int idx;
	private String memMid;
	private int conIdx;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMemMid() {
		return memMid;
	}
	public void setMemMid(String memMid) {
		this.memMid = memMid;
	}
	public int getConIdx() {
		return conIdx;
	}
	public void setConIdx(int conIdx) {
		this.conIdx = conIdx;
	}
	
	@Override
	public String toString() {
		return "LikeVO [idx=" + idx + ", memMid=" + memMid + ", conIdx=" + conIdx + "]";
	}
}
