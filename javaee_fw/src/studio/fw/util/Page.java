package studio.fw.util;

public class Page {
	int start = 0;
	int count = 6;
	int countadd = 6;
	int last = 0;
	
	public int getCountadd() {
		countadd = 6;
		if (this.start == 0) {
			countadd = 0;
		}
		return countadd;
	}

	public void setCountadd(int countadd) {
		this.countadd = countadd;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}

	public void caculateLast(int total) {
		// 假设总数是50，是能够被5整除的，那么最后一页的开始就是45
		if (0 == total % count)
			last = total - count;
		// 假设总数是51，不能够被5整除的，那么最后一页的开始就是50
		else
			last = total - total % count;
	}
}
