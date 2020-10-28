package org.bmj.guestbook.vo;

public class PageVO {
	
		private int start, end;

		public int getStart() {
			return start;
		}

		public void setStart(int start) {
			this.start = start;
		}

		public int getEnd() {
			return end;
		}

		public void setEnd(int end) {
			this.end = end;
		}
		public PageVO() {
			// TODO Auto-generated constructor stub
		}

		public PageVO(int pageNo, int numPage) {
			this.end=pageNo*numPage;
			this.start=end+1-numPage;
			
		}
	
}
