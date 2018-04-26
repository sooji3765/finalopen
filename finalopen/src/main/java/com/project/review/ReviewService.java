package com.project.review;

import java.util.List;

public interface ReviewService {
	public void insertReview(Review review);
	public Review checkPw(String password);
	public List<Review> selectAll();
	public Review selectOne(String renum);
	public List<Review> selectmyAll(String id);
	public void delete(String renum);
}

