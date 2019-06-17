package com.myproject.web.posts;

public class ThirtyDTO {

	private int idx;
	private String title;
	private String text;
	private String write_date;
	private int views_cnt;
	
	@Override
	public String toString() {
		return "ThirtyDTO [idx=" + idx + ", title=" + title + ", text=" + text + ", write_date=" + write_date
				+ ", views_cnt=" + views_cnt + "]";
	}
	
	public int getViews_cnt() {
		return views_cnt;
	}

	public void setViews_cnt(int views_cnt) {
		this.views_cnt = views_cnt;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
}
