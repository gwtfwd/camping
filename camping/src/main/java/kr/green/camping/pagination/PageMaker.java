package kr.green.camping.pagination;

public class PageMaker {

	private int totalCount;						// �˻��� �� �Խñ��� ��
	private int startPage, endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10 ;			// �ѹ��� ������ �������� �� = 10��
	Criteria criteria;
	
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calc();										// totalCount�� ������ �� �Ŀ� calc ȣ��
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		
		if(startPage <= 0)
			this.startPage = 1;
		else
			this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	// page�� ���� �ּ� 5�� �̻����� �Ϸ��� �� ��
	public void setDisplayPageNum(int displayPageNum) {
		
		if(displayPageNum <= 5)
			this.displayPageNum = 5;
		else
			this.displayPageNum = displayPageNum;
	}
	public Criteria getCriteria() {
		return criteria;
	}
	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}
	
	/* endPage, startPage, prev, next �� ��� */
	void calc() {
		
		// ���������� : 11, ���������� ���̴� �Խñ� : 10
		// ����������Ŀ�� �����ִ� ������ �� : 10
		// totalCount(�˻��� �� �Խñ��� ��) = 181
		// endPage = (int) (Math.ceil(11/10.0) * displayPageNum); = (Math.ceil(1.1) * displayPageNum);
		// = (2 * 10); = 20
		endPage = (int) (Math.ceil(criteria.getPage()/(double) displayPageNum)*displayPageNum);
		
		
		// startPage = (20 - 10) + 1; = 11
		startPage = (endPage - displayPageNum)+1;
		
		
		/* �� ������ ������ �̿��Ͽ� ������ ������ ��ȣ�� ��� */
		// int tempEndPage = (int)(Math.ceil(181/10.0); = (Math.ceil(18.1); = 19 
		int tempEndPage = (int)(Math.ceil(totalCount/(double)criteria.getPerPageNum()));
		
		if( endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		
		/* ���� ����������Ŀ�� ������������ 11�̸� prev�� �־�� �ϹǷ� true */
		prev = startPage == 1 ? false : true; 
		
		
		/* ���� ����������Ŀ�� ������ �������� �������� �������� ���ԵǾ� ������ next�� ����� �� */
		next = endPage * criteria.getPerPageNum() >= totalCount ? false:true;
		
	}
	
	
	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", criteria=" + criteria + "]";
	}
	
	
	
	
	
	
}









