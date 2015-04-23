package com.wanggang.service.mail;

public class Page {
	private int size = 15;//每页显示记录数
	private int index = 1;// 当前页号
	private int totalPageCount = 1;// 总页数
	private int totalCount = 0;// 记录总数

	/**
	 * 得到开始记录数
	 * @return
	 */
	public int getStartRow() {

		return (index - 1) * size;
	}

	/**
	 * 得到结束记录数
	 * @return
	 */
	public int getEndRow() {
		
		return index * size;
	}

	/**
	 * @return Returns the size.
	 */
	public int getSize() {
		if(this.size==0){
			this.size = 15;
		}
		
		return size;
	}

	/**
	 * @param size
	 * The size to set.
	 */
	public void setSize(int size) {
		if (size > 0) {
			this.size = size;
		}
	}
	/**
	 * @return Returns the currentPageNo.
	 */
	public int getIndex() {
		if (totalPageCount == 0) {
			
			return 0;
		}
		
		return index;
	}

	/**
	 * @param currentPageNo
	 * The currentPageNo to set.
	 */
	public void setIndex(int index) {
		if (index > 0) {
			this.index = index;
		}
	}

	/**
	 * @return Returns the totalCount.
	 */
	public int getTotalCount() {
		return totalCount;
	}

	/**
	 * @param totalCount
	 *  The totalCount to set.
	 */
	public void setTotalCount(int totalCount) {
		if (totalCount >= 0) {
			this.totalCount = totalCount;
			//根据总记录数计算总页数
			setTotalPageCountByRs();
		}
	}

	
	public int getTotalPageCount() {
		return this.totalPageCount;
	}

	/**
	 * 根据总记录数计算总页数
	 */
	private void setTotalPageCountByRs() {
		if (this.size > 0 && this.totalCount > 0 && this.totalCount % this.size == 0) {
			this.totalPageCount = this.totalCount / this.size;
		} else if (this.size > 0 && this.totalCount > 0 && this.totalCount % this.size > 0) {
			this.totalPageCount = (this.totalCount / this.size) + 1;
		} else {
			this.totalPageCount = 0;
		}
		
	}


}
