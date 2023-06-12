package content;

public class ContentVO {
	private int idx;
	private String title;
	private String place;
	private String startDate;
	private String lastDate;
	private String startTime;
	private int runTime;
	private String age;
	private String photo;
	private String content;
	private String kind;
	private String rsv_type;
	private int price;
	
	private int day_diff;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public int getRunTime() {
		return runTime;
	}
	public void setRunTime(int runTime) {
		this.runTime = runTime;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getRsv_type() {
		return rsv_type;
	}
	public void setRsv_type(String rsv_type) {
		this.rsv_type = rsv_type;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDay_diff() {
		return day_diff;
	}
	public void setDay_diff(int day_diff) {
		this.day_diff = day_diff;
	}
	@Override
	public String toString() {
		return "ContentVO [idx=" + idx + ", title=" + title + ", place=" + place + ", startDate=" + startDate
				+ ", lastDate=" + lastDate + ", startTime=" + startTime + ", runTime=" + runTime + ", age=" + age
				+ ", photo=" + photo + ", content=" + content + ", kind=" + kind + ", rsv_type=" + rsv_type + ", price="
				+ price + ", day_diff=" + day_diff + "]";
	}
}
