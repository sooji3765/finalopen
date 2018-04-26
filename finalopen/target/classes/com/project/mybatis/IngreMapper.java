package com.project.mybatis;

import java.util.List;

import com.project.ingre.Ingredients;

public interface IngreMapper {
	
	public List<Ingredients> selectIngre(String type_id); // type_id에 따른 재료 목록 가져오기
	public Ingredients selectOne(String title);
	public int selectExpiry(String title);

}
