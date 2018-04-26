package com.project.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mybatis.ReviewMapper;

@Service
public class ReviewServiceImple implements ReviewService{

	@Autowired
	private ReviewMapper reviewMapper;
	
	@Override
	public void insertReview(Review review) {
		
		reviewMapper.insertReview(review);
		
	}

	@Override
	public Review checkPw(String password) {
		// TODO Auto-generated method stub
		return reviewMapper.checkPw(password);
	}

	@Override
	public Review selectOne(String renum) {
		// TODO Auto-generated method stub
		return reviewMapper.selectOne(renum);
	}

	@Override
	public List<Review> selectAll() {
		// TODO Auto-generated method stub
		return reviewMapper.selectAll();
	}

	@Override
	public List<Review> selectmyAll(String id) {
		// TODO Auto-generated method stub
		return reviewMapper.selectmyAll(id);
	}

	@Override
	public void delete(String renum) {
		reviewMapper.delete(renum);
		
	}

	

}
