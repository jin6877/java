package com.myproject.web.greeting;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myproject.web.picture_diary.love.LoveDTO;
import com.myproject.web.posts.ThirtyDTO;

@Controller
public class GreetingController {
	private static final Logger logger = LoggerFactory.getLogger(GreetingController.class);
	
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/greeting")
	public String greeting(Model model, HttpSession session) {
		GreetingDTO dto = sqlsession.selectOne("greeting.greetingselectText");
		model.addAttribute("GreetingText", dto);
		System.out.println("dto =" + dto);
		return "greeting/greeting";
	}
	
	@RequestMapping(value = "/greeting/update")
	public String greeting_update(Model model, HttpSession session) {
		GreetingDTO dto = sqlsession.selectOne("greeting.greetingselectText");
		model.addAttribute("GreetingText", dto);
		System.out.println("dto =" + dto);
		return "greeting/update";
	}
	
	@RequestMapping(value = "/greeting/updateProc")
	public String greeting_updateProc(Model model, HttpSession session, GreetingDTO udto) {
		System.out.println(udto);
		int temp = sqlsession.update("greeting.greetingupdate",udto);
		 if( temp == 1 ) {
			session.setAttribute("db_ud", udto);
			GreetingDTO dto = sqlsession.selectOne("greeting.greetingselectText");
			model.addAttribute("GreetingText", dto);
			return "greeting/greeting";
		}else {
			model.addAttribute("joininfo","피치못할사정에 insert실패했어요..");
			return "redirect:/greeting/greeting";
		}
		}
	
}








