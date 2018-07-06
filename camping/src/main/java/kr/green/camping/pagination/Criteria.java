package kr.green.camping.pagination;

public class Criteria {

	private int page;				// ���� ������ 
	private int perPageNum;			// �� �������� ������ �Խñ��� ��
	
	
	// ������
	public Criteria() {
		page = 1;
		perPageNum = 10;
	}
	
	public Criteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}

	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		//���� ������ ��ȣ�� ������ �����Ϸ� �� ��

		if(page <= 0) {
			this.page = 1;
		}
		else
			this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		
		if(perPageNum <=0 || perPageNum > 100) {
			this.perPageNum = 10;
		}
		else
			this.perPageNum = perPageNum;
	}
	
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}

	
	// ���� limit 0, 10 ���� 0�� �ش��ϴ� �޼ҵ� getPageStart(������) -> 0���� 10��
	// limit n, 10 -> n = (page-1)*perPageNum
	public int getPageStart() {
		
		return (page-1)*perPageNum;
	}
	
}









