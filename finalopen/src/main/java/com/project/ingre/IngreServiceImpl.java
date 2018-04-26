package com.project.ingre;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mybatis.IngreMapper;
import com.project.refri.RefriService;

@Service
public class IngreServiceImpl implements IngreService{
	@Autowired
	private IngreMapper ingMapper;
	
	@Override
	public List<Ingredients> selectIngre(String type_id){
		return ingMapper.selectIngre(type_id);
	}

	@Override
	public Ingredients selectOne(String title) {
		return ingMapper.selectOne(title);
	}
	
	@Override
	public int selectExpiry(String title) {
		return ingMapper.selectExpiry(title);
	}

}
