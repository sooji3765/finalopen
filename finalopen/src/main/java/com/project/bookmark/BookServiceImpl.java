package com.project.bookmark;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mybatis.BookMapper;
import com.project.bookmark.BookService;

@Service
public class BookServiceImpl implements BookService {

		@Autowired
		private BookMapper BookMapper;
		
		@Override
		public void create_seq(String id) {
			BookMapper.create_seq(id);
		}
		
		@Override
		public void create(String id) {
			BookMapper.create(id);
		}
		
		@Override
		public void insertBook(HashMap<String, Object> bMap) {
			BookMapper.insertBook(bMap);
			
		}
		@Override
		public List<Bookmark> selectAll(String id) {
			// TODO Auto-generated method stub
			return BookMapper.selectAll(id);
		}
		@Override
		public void deleteBook(HashMap<String, Object> bMap) {
			BookMapper.deleteBook(bMap);
		}

		@Override
		public int selectBook(HashMap<String, Object> bMap) {
			
			return BookMapper.selectBook(bMap);
		}

		
}