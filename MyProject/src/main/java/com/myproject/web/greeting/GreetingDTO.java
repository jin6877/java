package com.myproject.web.greeting;

public class GreetingDTO {
	private int idx;
	private String text;
	
	@Override
	public String toString() {
		return "GreetingDTO [idx=" + idx + ", text=" + text + "]";
	}
	
	public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
	}


	public String getText() {
		return text;
	}


	public void setText(String text) {
		this.text = text;
	}
	
}
