package com.project.ingre;

public class Ingredients {
	private String ingredients_id;
	private String ingredients_title;
	private String type_id;
	private int expiry;
	
	public String getIngredients_id() {
		return ingredients_id;
	}
	public void setIngredients_id(String ingredients_id) {
		this.ingredients_id = ingredients_id;
	}
	public String getIngredients_title() {
		return ingredients_title;
	}
	public void setIngredients_title(String ingredients_title) {
		this.ingredients_title = ingredients_title;
	}
	public String getType_id() {
		return type_id;
	}
	public void setType_id(String type_id) {
		this.type_id = type_id;
	}
	public int getExpiry() {
		return expiry;
	}
	public void setExpiry(int expiry) {
		this.expiry = expiry;
	}
	
}
