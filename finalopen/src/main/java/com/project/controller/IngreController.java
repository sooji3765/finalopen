package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.ingre.IngreService;
import com.project.ingre.Ingredients;
import com.project.refri.Refri;
import com.project.refri.RefriService;
import com.project.user.User;
import com.project.user.UserService;

@Controller
public class IngreController {
	@Autowired
	private IngreService ingreService;
	@Autowired
	private RefriService refriService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("/ref/selectRef.do")
	public String selectRef(Model model, HttpSession session) {
		/*
		 * 모든 재료 가져오기
		 * 1	양념류		-	54 개
		 * 2	곡류			-	41
		 * 3	빵류			-	6
		 * 4	유제품/치즈류	-	9
		 * 5	면/만두		-	15
		 * 6	감자/고구마류	-	11
		 * 7	햄/소시지		-	5
		 * 8	초콜렛/사탕		-	5
		 * 9	콩/견과류		-	32
		 * 10	채소류		-	79
		 * 11	버섯류		-	10
		 * 12	과일류		-	46
		 * 13	고기류		-	7
		 * 14	어패류		-	63
		 * 15	해초류		-	7
		 * 16	계란류		-	3
		*/
		
		List<Ingredients> ings1 = (List<Ingredients>) ingreService.selectIngre("1");
		List<Ingredients> ings2 = (List<Ingredients>) ingreService.selectIngre("2");
		List<Ingredients> ings3 = (List<Ingredients>) ingreService.selectIngre("3");
		List<Ingredients> ings4 = (List<Ingredients>) ingreService.selectIngre("4");
		List<Ingredients> ings5 = (List<Ingredients>) ingreService.selectIngre("5");
		List<Ingredients> ings6 = (List<Ingredients>) ingreService.selectIngre("6");
		List<Ingredients> ings7 = (List<Ingredients>) ingreService.selectIngre("7");
		List<Ingredients> ings8 = (List<Ingredients>) ingreService.selectIngre("8");
		List<Ingredients> ings9 = (List<Ingredients>) ingreService.selectIngre("9");
		List<Ingredients> ings10 = (List<Ingredients>) ingreService.selectIngre("10");
		List<Ingredients> ings11 = (List<Ingredients>) ingreService.selectIngre("11");
		List<Ingredients> ings12 = (List<Ingredients>) ingreService.selectIngre("12");
		List<Ingredients> ings13 = (List<Ingredients>) ingreService.selectIngre("13");
		List<Ingredients> ings14 = (List<Ingredients>) ingreService.selectIngre("14");
		List<Ingredients> ings15 = (List<Ingredients>) ingreService.selectIngre("15");
		List<Ingredients> ings16 = (List<Ingredients>) ingreService.selectIngre("16");
				
		model.addAttribute("ings1",ings1);
		model.addAttribute("ings2",ings2);
		model.addAttribute("ings3",ings3);
		model.addAttribute("ings4",ings4);
		model.addAttribute("ings5",ings5);
		model.addAttribute("ings6",ings6);
		model.addAttribute("ings7",ings7);
		model.addAttribute("ings8",ings8);
		model.addAttribute("ings9",ings9);
		model.addAttribute("ings10",ings10);
		model.addAttribute("ings11",ings11);
		model.addAttribute("ings12",ings12);
		model.addAttribute("ings13",ings13);
		model.addAttribute("ings14",ings14);
		model.addAttribute("ings15",ings15);
		model.addAttribute("ings16",ings16);
		
		User user = new User();
		String m_id = (String)session.getAttribute("memId");
		user = userService.selectUser(m_id);
		
		List<Refri> refri = (List<Refri>) refriService.selectAll(user.getM_ref());
		
		model.addAttribute("refri",refri);
		
		return "/ref/selectRef";
	}

}
