package board;

public class Column {
	private String id, writer, pwd, title, content, wdate, hit, memocount;

	public String getMemocount() {
		return memocount;
	}

	public void setMemocount(String memocount) {
		this.memocount = memocount;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}
	
	@Override
	public String toString() {
		return "Column[id="+id+", writer="+writer+", pwd="+pwd+", title="+title+", content="+content+", wdate="+wdate+", hit="+hit+"]";
	}
}
