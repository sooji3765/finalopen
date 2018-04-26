package com.project.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.ingre.IngreService;
import com.project.ingre.Ingredients;
import com.project.refri.Refri;
import com.project.refri.RefriService;
import com.project.user.UserService;

@Controller
public class RefController {
	@Autowired
	private IngreService ingreService;
	@Autowired
	private RefriService refriService;
	@Autowired
	private UserService userService;

	@RequestMapping("/ref/mainRef.do")
	public String mainRef() {
		return "/ref/mainRef";
	}

	@RequestMapping("/ref/newRef.do")
	public String newRef() {
		return "/ref/newRef";
	}

	@RequestMapping("/ref/result.do")
	public ModelAndView result(String[] ingre, HttpSession session) {
		ModelAndView view = new ModelAndView();
		view.setViewName("/ref/result");
		view.addObject("ingre", ingre);
		return view;
	}

	@RequestMapping(value="/ref/insertIngre.do", method=RequestMethod.POST )
	public String insertIngre(String[] ingre, int[] r_item_amount, String[] r_item_unit, String[] r_item_space,
			HttpSession session) {
		String id = (String) session.getAttribute("memId");
		String ref_id = userService.checkRef(id);

		HashMap<String, Object> map= new HashMap();;

		for (int i = 0; i < ingre.length; i++) {
			
			Ingredients ingredients = ingreService.selectOne(ingre[i]);

			Refri refri = new Refri();
			refri.setR_item(ingre[i]);
			refri.setR_item_amount(r_item_amount[i]);
			refri.setR_item_unit(r_item_unit[i]);
			refri.setR_item_space(r_item_space[i]);
			refri.setR_item_time(0);
			refri.setType_id(ingredients.getType_id());
			refri.setIngredients_id(ingredients.getIngredients_id());

			map.put("ref_id", ref_id);
			map.put("refri", refri);

			refriService.insertIngre(map);
		}

		return "redirect:/main.do";
	}

	@RequestMapping("/ref/searchRef.do")
	public String searchRef() {
		return "/ref/searchRef";
	}

}
