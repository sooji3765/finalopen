package com.project.ingre;

import java.util.List;

public interface IngreService {
	public List<Ingredients> selectIngre(String type_id); //type_id에 따른 재료 목록 가져오기
	public Ingredients selectOne(String title);
	public int selectExpiry(String title);
}
