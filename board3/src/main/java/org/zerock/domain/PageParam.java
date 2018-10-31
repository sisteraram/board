package org.zerock.domain;

import lombok.Data;

@Data
public class PageParam {
	
	private int start, end, page, display, total;
	private boolean prev, next;
	private String type, keyword;
	private String[] types;
	
	public PageParam(){
		this.page = 1;
		this.display = 10;
	}
	
	public void setType(String type) {
		this.type = type;
		this.types = this.type.split("");
	}
	
	public void setTotal(int total) {
		this.total = total;
		
		this.end = (int) Math.ceil(this.page / 10.0) * 10;
		this.start = this.end - 9;
		if (this.end * this.display > this.total) {
			this.end = (int) (Math.ceil(this.total / (double)this.display));
			this.next = false;
		}else {
			this.next = true;
		}
		
		this.prev = this.start != 1;
	}
	
	public int getSkip() {
		return (this.page - 1) * this.display;
	}
}
