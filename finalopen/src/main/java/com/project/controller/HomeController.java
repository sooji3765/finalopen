package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.alarm.Alarm;
import com.project.alarm.AlarmService;
import com.project.bookmark.BookService;
import com.project.comment.Comment;
import com.project.comment.CommentService;
import com.project.ingre.IngreService;
import com.project.memo.MemoService;
import com.project.refri.Refri;
import com.project.refri.RefriService;
import com.project.review.Review;
import com.project.review.ReviewService;
import com.project.review.ReviewServiceImple;
import com.project.user.User;
import com.project.user.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private UserService userService;

	@Autowired
	private RefriService refriService;

	@Autowired
	private IngreService ingreService;

	@Autowired
	private AlarmService alarmService;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@Autowired
	private CommentService commentService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private BookService bookService;

	@Autowired
	private MemoService memoService;

	// 로그인
	@RequestMapping(value = "/login.do")
	public String login() {

		return "login";
	}

	// 로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:/login.do";

	}

	// 회원가입
	@RequestMapping(value = "/join.do")
	public String join() {

		return "join";
	}

	// 아이디 비밀번호 찾기
	@RequestMapping(value = "/searchId.do")
	public String searchId() {

		return "searchId";

	}

	// 아이디중복체크
	@RequestMapping(value = "/checkNick.do")
	public @ResponseBody String checkNick(String nickname) {
		int count = userService.countNick(nickname);

		return String.valueOf(count);
	}

	// 아이디중복체크
	@RequestMapping(value = "/checkid.do")
	public @ResponseBody String checkid(String id) {
		int count = userService.count(id);

		return String.valueOf(count);
	}

	// 아이디찾기
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/searchNick.do", produces = "application/json; charset=utf8")
	public @ResponseBody ResponseEntity searchNick(String nickname) throws UnsupportedEncodingException {
		String nick = userService.searchNick(nickname);
		if (nick == null || nick.equals("")) {
			nick = "존재하지 않는 닉네임 입니다.";
		}
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		return new ResponseEntity(nick, responseHeaders, HttpStatus.CREATED);

	}

	@RequestMapping(value ="/searchPass.do")
	public @ResponseBody String searchPass(String id, String nickname) {
		
	
		int count;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("nickname", nickname);

		count = userService.searchPass(map);
		return String.valueOf(count);

	}
	
	//비밀번호 변경
	@RequestMapping(value ="/changePass.do")
	public String changePass(String idchange , String passwd1) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", idchange);
		map.put("pass", passwd1);
		
		userService.changePass(map);

		return "redirect:/login.do";
		

	}

	// 회원가입 ==> main
	@RequestMapping(value = "/joinPro.do", method = RequestMethod.POST)
	public String joinPro(String id, String nickname, String pass, MultipartHttpServletRequest request) {
		User user = new User();

		MultipartFile mf = request.getFile("uploadFile");
		String fileName = mf.getOriginalFilename();
		String path = request.getRealPath("/resources/save/");

		String ext = fileName.substring(fileName.lastIndexOf(".")); // 원본 확장자

		File uploadFile = new File(path + "//" + fileName);
		try {
			mf.transferTo(uploadFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		user.setM_id(id);
		user.setM_logintype("local");
		user.setM_nickname(nickname);
		user.setM_profile("/resources/save/" + fileName);
		user.setM_ref(id);
		user.setM_passwd(pass);

		userService.insert(user);

		// 냉장고 테이블
		refriService.create(id);
		refriService.create_seq(id);

		// 알람 테이블
		alarmService.create(id);
		alarmService.create_seq(id);

		// 북마크 테이블
		bookService.create(id);
		bookService.create_seq(id);

		// 메모 테이블
		memoService.create(id);
		memoService.create_seq(id);

		return "redirect:/login.do";
	}

	// 이메일 부분 
	@RequestMapping(value = "/mail.do", method = RequestMethod.POST)
	public @ResponseBody String mail(String name, String phone, String email, String message) {

		String setTo = "0711hsj@gmail.com";

		System.out.println("=================>Name" + name);
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(mail, true, "UTF-8");

			messageHelper.setFrom(email);
			messageHelper.setTo(setTo);
			messageHelper.setSubject(name + "님 께서 이메일을 보냈습니다.");
			messageHelper.setText(message);

			mailSender.send(mail);

		} catch (Exception e) {
			System.out.println(e);
		}
		return "mail";

	}

	@RequestMapping(value = "/main.do")
	public String main(HttpSession session, Model model) {
		String id = (String) session.getAttribute("memId");
		User user = userService.selectUser(id);
		String refri_num = user.getM_ref();

		List<Refri> refri = refriService.selectAll(refri_num);
		model.addAttribute("refri", refri);

		return "main";

	}

	// 로그인 하기전 체크
	@RequestMapping(value = "/logincheck.do")
	public String logincheck(String id, String nickname, String type, String image, HttpSession session, String pass)
			throws Exception {
		String redirectURI = "";
		String defaultImage = "/resource/img/profile.png";
		String ref_id = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		session.setAttribute("memId", id);
		session.setAttribute("image", image);
		session.setAttribute("nickname", nickname);
		User user = new User();

		HashMap<String, Object> check = new HashMap();
		check.put("id", id);
		check.put("pass", pass);

		// DB에 저장된 USER 이면 main으로
		if (userService.checkUser(check) == 1) {

			user = userService.selectUser(id);
			ref_id = user.getM_ref();// 냉장고 id
			List<Refri> refrige = (List<Refri>) refriService.selectAll((String) user.getM_ref());
			List<Review> review = (List<Review>) reviewService.selectmyAll(id);
			// 보관일 계산
			String reg_date = null;

			Date now = new Date();
			String today = sdf.format(now);
			long diff = 0;
			int count = 0;
			int expiry = 0;
			int result = 0;
			int alarmCount = 0;

			// 로그인시 r_item_time update
			for (int i = 0; i < refrige.size(); i++) {
				// 냉장고에 넣은지 지난 일 계산
				reg_date = sdf.format(refrige.get(i).getR_date());
				try {
					Date dateToday = sdf.parse(today);
					Date dateReg_date = sdf.parse(reg_date);
					diff = (dateToday.getTime() - dateReg_date.getTime()) / (1000 * 60 * 60 * 24);
				} catch (java.text.ParseException e) {
					e.printStackTrace();
				}
				count = (int) diff;
				refrige.get(i).setR_item_time(count);
				HashMap<String, Object> map = new HashMap<String, Object>();

				map.put("id", ref_id);
				map.put("r_num", refrige.get(i).getR_num());
				map.put("r_item_time", refrige.get(i).getR_item_time());

				// 유통기한 - 현재 보관일 해서 남은 기간에 따라 신선도 수정
				expiry = ingreService.selectExpiry(refrige.get(i).getR_item());// 권장 유통기한 불러와서
				result = expiry - count; // 유통기한 - 현재 보관일
				if (result <= 1) {// 1일 이하면 위험
					map.put("r_item_state", "'위험'");
				} else if (result < 3) { // 2~3일 보통
					map.put("r_item_state", "'보통'");
				} else {// 나머지 신선
					map.put("r_item_state", "'신선'");
				}
				// DB 저장
				refriService.updateTime(map);

				// 알람table insert ===> 냉장고 신선도 체크 에서
				HashMap<String, Object> alCheck = new HashMap<String, Object>();
				alCheck.put("id", id);
				alCheck.put("al_title", refrige.get(i).getR_item());
				alarmCount = alarmService.checkAlarm(alCheck);
				if (result <= 1 && alarmCount == 0) {
					HashMap<String, Object> alMap = new HashMap<String, Object>();
					alMap.put("id", id);
					alMap.put("al_title", refrige.get(i).getR_item());
					alMap.put("al_content", refrige.get(i).getR_item() + "의 상태를 확인해주세요.");
					alMap.put("al_check", "0");
					alMap.put("al_content_url", "/myPage/myRef.do");

					alarmService.insertAlarm(alMap);
				}

				count = 0;
				expiry = 0;
				alarmCount = -1;
			}

			// 알람 리뷰 추가
			for (int i = 0; i < review.size(); i++) {
				String review_num = review.get(i).getRe_num();

				// 리뷰 num과 같은 댓글 이 존재하는지 확인
				int count_comm = commentService.commentCount(review_num);

				// 존재하면
				if (count_comm > 0) {
					List<Comment> comments = (List<Comment>) commentService.selectBno(review_num);

					String last_login = sdf.format(user.getM_regdate());// 마지막 로그인
					Date last = sdf.parse(last_login);

					for (int j = 0; j < comments.size(); j++) {
						String comm_reg = sdf.format(comments.get(j).getRegdate());
						Date comm_update = sdf.parse(comm_reg);

						long diff_date = (comm_update.getTime() - last.getTime()) / (1000 * 60 * 60 * 24);

						if (diff_date > 0) {
							HashMap<String, Object> alCheck = new HashMap<String, Object>();
							alCheck.put("id", id);
							alCheck.put("al_title", "리뷰");
							alCheck.put("al_content", review.get(i).getRe_title() + "에 댓글이 달렸습니다.");
							alCheck.put("al_check", "0");
							alCheck.put("al_content_url", "/myPage/myReview.do");

							alarmService.insertAlarm(alCheck);
						}

					}
				}

			}

			userService.regUpdate(user);
			redirectURI = "redirect:/main.do";

			// 신규회원 kakao
		} else if ((userService.checkUser(check) == 0) && (type.equals("kakao"))) {
			// DB에 새로운 회원 insert
			user.setM_id(id);

			if (image.equals("undefined")) {
				user.setM_profile(defaultImage);
			} else {
				user.setM_profile(image);
			}

			user.setM_nickname(nickname);
			user.setM_logintype(type);
			userService.insert(user);

			// 냉장고 테이블
			refriService.create(id);
			refriService.create_seq(id);

			// 알람 테이블
			alarmService.create(id);
			alarmService.create_seq(id);

			// 북마크 테이블
			bookService.create(id);
			bookService.create_seq(id);

			// 메모 테이블
			memoService.create(id);
			memoService.create_seq(id);

			redirectURI = "redirect:/ref/mainRef.do";
		} else { // 로그인 다시
			redirectURI = "redirect:/login.do";
		}
		return redirectURI;

	}
}
