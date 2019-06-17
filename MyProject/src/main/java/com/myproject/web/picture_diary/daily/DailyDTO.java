package com.myproject.web.picture_diary.daily;

public class DailyDTO {

	private int idx;
	private String title;
	private String img;
	private String upload_date;
	private int views_cnt;
	
	@Override
	public String toString() {
		return "DailyDTO [idx=" + idx + ", title=" + title + ", img=" + img + ", upload_date=" + upload_date
				+ ", views_cnt=" + views_cnt + "]";
	}
	
	public int getViews_cnt() {
		return views_cnt;
	}

	public void setViews_cnt(int views_cnt) {
		this.views_cnt = views_cnt;
	}

	public String getupload_date() {
		return upload_date;
	}

	public void setupload_date(String upload_date) {
		this.upload_date = upload_date;
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
	public String getimg() {
		return img;
	}
	public void setimg(String img) {
		this.img = img;
	}
	
}
