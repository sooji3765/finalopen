package com.project.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.alarm.Alarm;
import com.project.alarm.AlarmService;

@Controller
@RequestMapping("/alarm")
public class AlarmController {

	@Autowired
	private AlarmService alarmService;
	
	@RequestMapping(value = "/mainAlarm.do")
	public ModelAndView mainAlarm(HttpSession session) {
		ModelAndView view = new ModelAndView();
		String id = (String)session.getAttribute("memId");
		List<Alarm> alarm = alarmService.selectAll(id);
		
		view.setViewName("/alarm/mainAlarm");
		view.addObject("alarm", alarm);

		
		return view;
	}
	
	
	@RequestMapping(value ="/count.do")
	public @ResponseBody String count(HttpSession session, String view) {
		String id = (String)session.getAttribute("memId");
		int count = alarmService.selectCount(id);
		
		return String.valueOf(count);
	}
	
	@RequestMapping(value="/alarmUpdate.do")
	public String alarmUpdate(HttpSession session, String[] alarm) {
		String id = (String)session.getAttribute("memId");
		HashMap<String, Object> alNum = new HashMap<String, Object>();
		alNum.put("id", id);
		Alarm al = new Alarm();
		for(int i=0; i<alarm.length;i++) {
			alNum.put("al_num", alarm[i]);
			alarmService.updateAlarm(alNum);			
		}		
		
		return "redirect:/alarm/mainAlarm.do";
	}
	
	@RequestMapping(value="/alarmCheck.do")
	public String alarmCheck(HttpSession session, String num) {
		String id = (String)session.getAttribute("memId");
		String al_num = num; 
		HashMap<String, Object> alNum = new HashMap<String, Object>();
		alNum.put("id", id);
		Alarm al = new Alarm();
		alNum.put("al_num", al_num);
		alarmService.updateAlarm(alNum);			
		
		return "redirect:/myPage/myPageMain.do";
	}
	
	@RequestMapping(value="/alarmDelete.do")
	public String alarmDelete(HttpSession session, String[] alarm) {
		String id = (String)session.getAttribute("memId");
		HashMap<String, Object> alNum = new HashMap<String, Object>();
		alNum.put("id", id);
		Alarm al = new Alarm();
		for(int i=0; i<alarm.length;i++) {
			alNum.put("al_num", alarm[i]);
			alarmService.deleteAlarm(alNum);			
		}		
		
		return "redirect:/alarm/mainAlarm.do";
	}
	
	@RequestMapping(value="/alarmDeleteOne.do")
	public String alarmDeleteOne(HttpSession session, String num) {
		String id = (String)session.getAttribute("memId");
		String al_num = num; 
		HashMap<String, Object> alNum = new HashMap<String, Object>();
		alNum.put("id", id);
		Alarm al = new Alarm();
		alNum.put("al_num", al_num);
		alarmService.deleteAlarm(alNum);			
		
		return "redirect:/alarm/mainAlarm.do";
	}
	
}
