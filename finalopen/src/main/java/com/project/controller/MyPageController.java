package com.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.alarm.AlarmService;
import com.project.ingre.IngreService;
import com.project.memo.Memo;
import com.project.memo.MemoService;
import com.project.refri.Refri;
import com.project.refri.RefriService;
import com.project.review.Review;
import com.project.review.ReviewService;
import com.project.user.User;
import com.project.user.UserService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private RefriService refriService;
	
	@Autowired
	private AlarmService alarmService;
	
	@Autowired
	private IngreService IngreService;
	
	@Autowired
	private MemoService memoService;
	
	@RequestMapping(value="/myPageMain.do")
	public ModelAndView myPageMain(HttpSession session) {
		ModelAndView view = new ModelAndView();
		User user = new User();
		view.setViewName("/myPage/myPageMain");
		String id = (String) session.getAttribute("memId");
		user = userService.selectUser(id);
		int count = alarmService.selectCount(id);
		
		view.addObject("count", count);
		view.addObject(user);
		
		return view;
	}
	
	// 회원관리
	@RequestMapping(value="/userInfo.do")
	public ModelAndView userInfo(HttpSession session) {
		ModelAndView view = new ModelAndView();
		User user = new User();
		view.setViewName("/myPage/userInfo");
		String id = (String) session.getAttribute("memId");
		user = userService.selectUser(id);
		view.addObject(user);
		
		return view;
	}
	
	// 내 리뷰
	@RequestMapping(value="/myReview.do")
	public ModelAndView myReview(HttpSession session) {
		String id = (String)session.getAttribute("memId");
		List<Review> review = (List<Review>) reviewService.selectmyAll(id);
		ModelAndView view = new ModelAndView();
		view.setViewName("/myPage/myReview");
		view.addObject("review",review);
		view.addObject("id", id);
		return view;
	}
	
	// 냉장고 id 수정
	@RequestMapping(value="/modify.do")
	public String modify(String rnum) {
		
		return "/myPage/modify";
	}
	
	
	@RequestMapping(value="/modifyPro.do" , method = RequestMethod.POST)
	public @ResponseBody String modifyPro(HttpServletRequest request, HttpSession session) {
		HashMap<String, Object> map = new HashMap();
		String ref_id = request.getParameter("id");
		String id = (String)session.getAttribute("memId");
		
		
		map.put("ref_id", ref_id);
		map.put("id", id);
		
		
		userService.modifyRef(map);
		
		return null;
	}
	
	// 내 냉장고 안 
	@RequestMapping(value="/myRef.do")
	public ModelAndView myRef(HttpSession session) {
		User user = new User();
		String id = (String)session.getAttribute("memId");
		user = userService.selectUser(id);
		
		List<Refri> refrige = (List<Refri>) refriService.selectAll((String)user.getM_ref());
		ModelAndView view = new ModelAndView();
		view.setViewName("/myPage/myRef");
		view.addObject("refrige",refrige);
		return view;
		
	}
	
	
	@RequestMapping(value="/refCheck.do")
	public @ResponseBody String refCheck(HttpServletRequest request) {		
		String id = request.getParameter("id");
		int result = userService.selectRefId(id);
		System.out.println(""+result);
		return String.valueOf(result);
	}
	
	
	@RequestMapping(value="/deleteIngre.do",method = RequestMethod.GET)
	public String deleteIngre(String r_num, String r_item , Model model) {
		model.addAttribute("num",r_num);
		model.addAttribute("item",r_item);
		
		return "/myPage/deleteIngre";
	}
	
	@RequestMapping(value="/deletePro.do",method = RequestMethod.POST)
	public @ResponseBody String deletePro(HttpServletRequest request, HttpSession session) {	
		
		String num = request.getParameter("num");
		String id = (String)session.getAttribute("memId");
		User user = userService.selectUser(id);
		
		String r_id = user.getM_ref();
		
		System.out.println("==========>"+num);
		System.out.println("==========>"+r_id);
		HashMap<String, Object> map = new HashMap();
		map.put("r_num",num);
		map.put("r_id", r_id);
		refriService.deleteItem(map);
		
		return "redirect:/main.do";
	}
	
	@RequestMapping(value="/deletePro2.do",method = RequestMethod.POST)
	public String deletePro2(HttpServletRequest request, HttpSession session) {	
		
		String num = request.getParameter("num");
		String id = (String)session.getAttribute("memId");
		User user = userService.selectUser(id);
		
		String r_id = user.getM_ref();
		
		HashMap<String, Object> map = new HashMap();
		map.put("r_num",num);
		map.put("r_id", r_id);
		refriService.deleteItem(map);
		
		return "redirect:/main.do";
	}
	
	@RequestMapping(value="/editIngre.do",method = RequestMethod.GET)
	public String editIngre(String r_num , Model model, HttpSession session) {
		String id = (String)session.getAttribute("memId");
		User user = userService.selectUser(id);
		String ref_id = user.getM_ref();
		
		HashMap<String, Object> map = new HashMap();
		map.put("r_id", ref_id);
		map.put("r_num", r_num);
		
		Refri refri= refriService.selectOneRef(map);
		model.addAttribute("refri",refri);
		
		return "/myPage/editIngre";
	}
	
	@RequestMapping(value="/editPro.do",method = RequestMethod.POST)
	public @ResponseBody String editPro(String r_num, HttpSession session, 
			String r_item_amount, String r_item_space, String r_item_state, String r_item_time) {
		String id = (String)session.getAttribute("memId");
		User user = userService.selectUser(id);
		String ref_id = user.getM_ref();
		DateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		long diff=0;
	
		Date now = new Date();
		String today = simpleDateFormat.format(now);
		try {
			date = (Date)simpleDateFormat.parse(r_item_time);
			Date dateToday = simpleDateFormat.parse(today);
			
			diff= (dateToday.getTime()-date.getTime())/(1000*60*60*24);
			System.out.println(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Timestamp time = new Timestamp(date.getTime());
		HashMap<String, Object> map = new HashMap();
		
		System.out.println(time);
		map.put("r_id", ref_id);
		map.put("r_num", r_num);
		
		
		Refri refri = refriService.selectOneRef(map);
		
		refri.setR_num(r_num);
		refri.setR_item_amount(Integer.parseInt(r_item_amount));
		refri.setR_item_space(r_item_space);
		refri.setR_item_state(r_item_state);
		refri.setR_item_time((int)diff);
		refri.setR_date(time);
		
		map.put("refri", refri);
		refriService.updateRef(map);
		
		return "0";
	}
	
	@RequestMapping(value="/editPro2.do",method = RequestMethod.POST)
	public String editPro2(String r_num, HttpSession session, 
			String r_item_amount, String r_item_space, String r_item_state, String r_date) {
		
		String id = (String)session.getAttribute("memId");
		User user = userService.selectUser(id);
		
		System.out.println("===========>"+r_date);
		String ref_id = user.getM_ref();
		DateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		long diff=0;
		Date now = new Date();
		String today = simpleDateFormat.format(now);
		
		HashMap<String, Object> map = new HashMap();
		
		map.put("r_id", ref_id);
		map.put("r_num", r_num);
		
		//냉장고 item 정보 가져오기
		Refri refri = refriService.selectOneRef(map);
		
		
		if(r_date=="") {
			refri.setR_date(refri.getR_date());
		
		}else{
			//string ----> timestamp
			try {
				date = (Date)simpleDateFormat.parse(r_date);
				Date dateToday = simpleDateFormat.parse(today);
				
				diff= (dateToday.getTime()-date.getTime())/(1000*60*60*24);
				System.out.println(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Timestamp time = new Timestamp(date.getTime());
			
			refri.setR_date(time);
			
		}
			
		refri.setR_num(r_num);
		refri.setR_item_amount(Integer.parseInt(r_item_amount));
		refri.setR_item_space(r_item_space);
		refri.setR_item_state(r_item_state);
		refri.setR_item_time((int)diff);
		
		
		map.put("refri", refri);
		refriService.updateRef(map);
		
		return "redirect:/main.do";
	}
	
	
	@RequestMapping(value="/memo.do")
	public String memo(HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("memId");
		User user = userService.selectUser(id);
		String refId = user.getM_ref();
		System.out.println(refId);
		//총 이 냉장고 아이디를 사용하는 유저 수
		int count = userService.countRef(refId);
		List<User> sharUser = (List<User>) userService.selectAllRef(refId);
		List<Memo> memo = (List<Memo>) memoService.selectAll(refId);
		
		model.addAttribute("count", count);
		model.addAttribute("user", sharUser);
		model.addAttribute("memo", memo);
		
		
		return "/myPage/memo";
	}
	
	@RequestMapping(value="/memoInsert.do",method = RequestMethod.POST)
	public String memoInsert(HttpSession session, String content) {
		
		String id = (String)session.getAttribute("memId");
		User user = userService.selectUser(id);
		Memo memo = new Memo();
		HashMap<String, Object> map = new HashMap();
		memo.setNickname(user.getM_nickname());
		memo.setProfile(user.getM_profile());
		memo.setContent(content);
		
		map.put("memo", memo);
		map.put("refId",user.getM_ref());
		memoService.insert(map);
		return "redirect:/myPage/myPageMain.do";
	}
	
	

}
