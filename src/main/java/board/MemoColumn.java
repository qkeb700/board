package board;

public class MemoColumn {
	private String id, bbs_id, writer, pwd, content, wdate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBbs_id() {
		return bbs_id;
	}

	public void setBbs_id(String bbs_id) {
		this.bbs_id = bbs_id;
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
	
	@Override
	public String toString() {
		return "Column[id="+ id + ", bbsid="+bbs_id+", writer="+writer+", content="+content+", wdate="+wdate;	
	}
}
