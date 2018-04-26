package com.project.bookmark;

import java.util.HashMap;
import java.util.List;

import com.project.bookmark.Bookmark;
import com.project.recipe.*;

public interface BookService {
	public void create(String id);
	public void create_seq(String id);
	public void insertBook(HashMap<String, Object> bMap);
	public List<Bookmark> selectAll(String id);
	public void deleteBook(HashMap<String, Object> bMap);
	
	public int selectBook(HashMap<String, Object> bMap);
}
