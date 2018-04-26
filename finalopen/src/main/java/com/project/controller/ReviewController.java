package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.alarm.AlarmService;
import com.project.comment.Comment;
import com.project.comment.CommentService;
import com.project.review.Review;
import com.project.review.ReviewService;
import com.project.user.User;
import com.project.user.UserService;



@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private UserService UserService;

	//리뷰 목록
	@RequestMapping(value="/reviewMain.do")
	public ModelAndView reviewMain(HttpSession session) {
		List<Review> review = (List<Review>) reviewService.selectAll();
		String id = (String)session.getAttribute("memId");
		System.out.println(id);
		ModelAndView view = new ModelAndView();
		view.setViewName("/review/reviewMain");
		view.addObject("review",review);
		view.addObject("id", id);

		return view;
	}
	

	@RequestMapping(value="/reviewForm.do",method = RequestMethod.GET)
	public String reviewForm(String url, Model model) {
		
		if(url!=null) {
			model.addAttribute("url",url);
		}else {
			model.addAttribute("url","http://");
		}
		return "/review/reviewForm";
	}
	
	
	@RequestMapping(value="/reviewPro.do",method = RequestMethod.POST)
	public String reviewPro(HttpSession session, MultipartHttpServletRequest request) {
		
		Review review = new Review();
		String id = (String) session.getAttribute("memId");
		
		// 파일 업로드
		MultipartFile mf = request.getFile("uploadFile");
		String fileName = mf.getOriginalFilename();
		String path=request.getRealPath("/resources/save/");
		System.out.println(path);
		String ext = fileName.substring(fileName.lastIndexOf(".")); // 원본 확장자
		File uploadFile = new File(path+"//"+fileName);
		try {
			mf.transferTo(uploadFile);
		}catch(IllegalStateException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		
		review.setM_id(id);
		review.setRe_title(request.getParameter("title"));
		review.setRe_content(request.getParameter("content"));
		review.setRe_image(fileName);
		review.setRe_blog_url(request.getParameter("url"));
		review.setRe_password(request.getParameter("pass"));
		
		reviewService.insertReview(review);
		
		
		return "redirect:/review/reviewMain.do";
	}
	
	@RequestMapping(value="/reviewCheckPw.do")
	public String reviewCheckPw() {
		return "/review/reviewChekPw";
	}
	
	
	
	@RequestMapping(value="/commentInsert.do")
	public @ResponseBody String commentInsert(String bno, String content, HttpSession session) {
		String id = (String)session.getAttribute("memId");
		
		User user = UserService.selectUser(id);
		System.out.println("=================게시번호>"+bno);
		System.out.println("=================게시내용>"+content);
		Comment comment = new Comment();
		
		comment.setContent(content);
		comment.setBno(bno);
		comment.setWriter(id);
		comment.setNickname(user.getM_nickname());
		commentService.commentInsert(comment);
		
		return "1";
	}
	
	@RequestMapping(value="/commentList.do", method=RequestMethod.GET)
	public ModelAndView commentList(String bno, HttpSession session) {
		String id = (String) session.getAttribute("memId");
		List<Comment> comment = commentService.commentList(bno);
		ModelAndView mv = new ModelAndView();
		mv.addObject("comment",comment);
		mv.addObject("id", id);
		mv.setViewName("/review/commentList");
		
		return mv;
	}
	

	@RequestMapping(value="/reviewModify.do")
	public @ResponseBody String reviewModify(String renum) {
		
		reviewService.delete(renum);
		return "1";
		
	}
	
	@RequestMapping(value="/commentdelete.do")
	public @ResponseBody String commentdelete(String cno) {
		
		commentService.delete(cno);
		return "1";
		
	}
	
	@RequestMapping(value="/commentModify.do")
	public @ResponseBody String commentModify(String cno, String content) {

		HashMap<String, Object> map = new HashMap();
		map.put("cno", cno);
		map.put("content",content);
		commentService.update(map);
		return "1";
		
	}
	
	
	
}
