package board;

public class Paging {
	private int page = 1; // 현재 페이지
	private int totalCount; // 전체 row 갯수
	private int beginPage;
	private int endPage;
	private int displayRow = 10;
	private int displayPage = 10;
	boolean prev;
	boolean next;
	
	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		paging();
	}
	
	public int getDisplayRow() {
		return displayRow;
	}
	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}
	
	public int getDisplayPage() {
		return displayPage;
	}
	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}
	public int getStart() {
		int start = (page - 1) * displayRow;
		return start;
	}
	
	private void paging() {
		endPage = ((int)Math.ceil(page/(double)displayPage))*displayPage;
		beginPage = endPage - (displayPage - 1);
		
		int totalPage = (int)Math.ceil(totalCount/(double)displayRow);
		if(totalPage<endPage) {
			endPage = totalPage;
			next = false;
		}else {
			next = true;
		}
		prev = (beginPage == 1)? false:true;
	}
}
