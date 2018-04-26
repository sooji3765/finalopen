package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.bookmark.BookService;
import com.project.bookmark.Bookmark;

import com.project.recipe.Recipe;
import com.project.recipe.RecipeR;
import com.project.refri.Refri;
import com.project.refri.RefriService;
import com.project.user.User;
import com.project.user.UserService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RserveException;

@Controller
public class RecipeController {
	@Autowired
	private BookService bookService;
	@Autowired
	private RefriService refriService;
	@Autowired
	private UserService userService;

	@RequestMapping("search.do")
	public String wordrecipe(Model model, String word, HttpSession session)
			throws REXPMismatchException, RserveException {
		String id = (String) session.getAttribute("memId");
		User user = userService.selectUser(id);
		String refri_num = user.getM_ref();

		List<Refri> refri = refriService.selectAll(refri_num);
		model.addAttribute("refri", refri);

		RecipeR r = new RecipeR();
		String[] foodimg = r.foodimg(word);
		String[] foodlink = r.foodlink(word);
		String[] foodtitle = r.foodtitle(word);
		String[] by = r.foodby(word);
		List<Recipe> Recipe = new ArrayList<Recipe>();
		for (int i = 0; i < foodimg.length; i++) {
			Recipe dto = new Recipe();
			dto.setFoodimg(foodimg[i]);
			dto.setFoodlink(foodlink[i]);
			dto.setFoodtitle(foodtitle[i]);
			dto.setBy(by[i]);
			Recipe.add(dto);
		}

		model.addAttribute("list", Recipe);
		model.addAttribute("total", foodimg.length);

		return "search";
	}

	@RequestMapping(value = "recipe.do", method = RequestMethod.GET)
	public String recipe(Model model, String url, String img, HttpSession session)
			throws REXPMismatchException, RserveException {
		String id = (String) session.getAttribute("memId");
		int count = 0;

		User user = userService.selectUser(id);
		String refri_num = user.getM_ref();

		List<Refri> refri = refriService.selectAll(refri_num);
		model.addAttribute("refri", refri);
		RecipeR r = new RecipeR();
		String link = r.inrecipe(url);
		model.addAttribute("link", link);
		String[] sauce = r.sauce();
		model.addAttribute("sauce", sauce);
		String sumimg = r.sumimg();
		model.addAttribute("sumimg", sumimg);
		String title = r.rtitle();
		model.addAttribute("title", title);
		String people = r.people();
		model.addAttribute("people", people);
		String time = r.time();
		model.addAttribute("time", time);
		String level = r.level();
		model.addAttribute("level", level);
		model.addAttribute("url", url);
		model.addAttribute("img", img);

		HashMap<String, Object> bMap = new HashMap<String, Object>();
		bMap.put("id", id);
		bMap.put("url", url);

		count = bookService.selectBook(bMap);

		model.addAttribute("count", count);
		return "recipe";
	}
}