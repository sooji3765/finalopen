package com.project.recipe;

public class Recipe {
	private String foodimg;	//섬네일
	private String foodlink; //원본링크
	private String foodtitle; //제목
	private String by;	//작성자
	public String getFoodimg() {
		return foodimg;
	}
	public void setFoodimg(String foodimg) {
		this.foodimg = foodimg;
	}
	public String getFoodlink() {
		return foodlink;
	}
	public void setFoodlink(String foodlink) {
		this.foodlink = foodlink;
	}
	public String getFoodtitle() {
		return foodtitle;
	}
	public void setFoodtitle(String foodtitle) {
		this.foodtitle = foodtitle;
	}
	public String getBy() {
		return by;
	}
	public void setBy(String by) {
		this.by = by;
	}

	
}