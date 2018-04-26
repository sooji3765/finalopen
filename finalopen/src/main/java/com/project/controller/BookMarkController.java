package com.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.bookmark.BookService;
import com.project.bookmark.Bookmark;


@Controller
@RequestMapping("/bookmark")
public class BookMarkController {
	@Autowired
	private BookService bookService;
	

	@RequestMapping(value = "/bookmarkMain.do")
	public ModelAndView bookMain(HttpSession session) {
		ModelAndView view = new ModelAndView();
		String id = (String)session.getAttribute("memId");
		List<Bookmark> book = (List<Bookmark>) bookService.selectAll(id);
		
		view.setViewName("/bookmark/bookmarkMain");
		view.addObject("book",book);
		
		return view;
	}
	
	@RequestMapping(value = "/bookmarkcheck.do")
	public String bookmarkcheck(String title,String url, String img, String check,HttpSession session) {
		String id = (String)session.getAttribute("memId");
		HashMap<String, Object> bMap = new HashMap<String, Object>();
		Bookmark book = new Bookmark();
		book.setTitle(title);
		book.setCheck(check);
		book.setImg(img);
		book.setUrl(url);
		
		bMap.put("id",id);
		bMap.put("book", book);
		
		bookService.insertBook(bMap);
		
		return "redirect:/bookmark/bookmarkMain.do";
	}
	
	@RequestMapping(value = "/bookmarkdelete.do")
	public String bookmardelete(String title, String url, String img, String check,HttpSession session) {
		String id = (String)session.getAttribute("memId");
		HashMap<String, Object> bMap = new HashMap<String, Object>();
		Bookmark book = new Bookmark();
		book.setTitle(title);
		book.setCheck(check);
		book.setImg(img);
		book.setUrl(url);
		
		bMap.put("id", id);
		bMap.put("book", book);

		bookService.deleteBook(bMap);
		
		return "redirect:/bookmark/bookmarkMain.do";
	}

}
